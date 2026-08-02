import { supabaseAdmin } from "@/lib/supabase/admin";
import { createTurnoverTask } from "@/lib/turnover";

const BASE = "https://api.ownerrez.com/v2";

export interface OwnerRezCreds {
  username: string;
  token: string;
}

function authHeader({ username, token }: OwnerRezCreds) {
  const basic = Buffer.from(`${username}:${token}`).toString("base64");
  return `Basic ${basic}`;
}

/** Low-level GET against the OwnerRez API. Throws on non-2xx. */
async function orGet(path: string, creds: OwnerRezCreds): Promise<any> {
  const res = await fetch(`${BASE}${path}`, {
    headers: {
      Authorization: authHeader(creds),
      Accept: "application/json",
      "User-Agent": "STRVend/1.0 (+https://strvend.com)",
    },
    signal: AbortSignal.timeout(15_000),
  });
  if (!res.ok) {
    const text = await res.text().catch(() => "");
    throw new Error(`OwnerRez ${path} → HTTP ${res.status} ${text.slice(0, 200)}`);
  }
  return res.json();
}

/** Follow OwnerRez paged responses ({ items, nextPageUrl }). Capped for safety. */
async function orGetAll(path: string, creds: OwnerRezCreds, cap = 10): Promise<any[]> {
  const items: any[] = [];
  let next: string | null = path;
  let pages = 0;
  while (next && pages < cap) {
    const page: any = await orGet(next.startsWith("http") ? next.replace(BASE, "") : next, creds);
    if (Array.isArray(page)) {
      items.push(...page);
      break;
    }
    items.push(...(page.items ?? []));
    next = page.nextPageUrl ?? null;
    pages++;
  }
  return items;
}

/** Validate credentials by making a cheap authenticated call. */
export async function verifyOwnerRez(creds: OwnerRezCreds): Promise<{ ok: boolean; error?: string }> {
  try {
    await orGet("/properties?limit=1", creds);
    return { ok: true };
  } catch (e) {
    return { ok: false, error: e instanceof Error ? e.message : "Connection failed" };
  }
}

/** Best-effort field readers (OwnerRez field names can vary by endpoint version). */
function pick<T = any>(obj: any, keys: string[]): T | undefined {
  for (const k of keys) if (obj?.[k] != null) return obj[k];
  return undefined;
}
function toDateStr(v: any): string | null {
  if (!v) return null;
  const s = String(v);
  // Accept YYYY-MM-DD or full ISO
  return s.slice(0, 10);
}

/**
 * Sync one host's OwnerRez account: properties → STRVend properties,
 * bookings → calendar_events → auto-generated turnover tasks.
 * Returns a summary; never throws (records errors on the integration row).
 */
export async function syncOwnerRezForHost(hostId: string): Promise<{
  ok: boolean;
  properties: number;
  reservations: number;
  turnovers: number;
  error?: string;
}> {
  const db = supabaseAdmin;
  const { data: integration } = await db
    .from("host_integrations")
    .select("id, api_username, api_token, status")
    .eq("host_id", hostId)
    .eq("provider", "ownerrez")
    .maybeSingle();

  if (!integration || !integration.api_username || !integration.api_token) {
    return { ok: false, properties: 0, reservations: 0, turnovers: 0, error: "Not connected" };
  }
  const creds: OwnerRezCreds = {
    username: integration.api_username,
    token: integration.api_token,
  };

  const today = new Date().toISOString().slice(0, 10);

  try {
    // 1. Properties → upsert STRVend properties keyed by external_id
    const orProps = await orGetAll("/properties", creds);
    const propMap = new Map<string, string>(); // ownerrez id -> strvend property id

    // preferred market for open-job discovery
    const { data: profile } = await db
      .from("profiles")
      .select("preferred_market")
      .eq("id", hostId)
      .maybeSingle();
    const marketSlug = profile?.preferred_market ?? null;

    for (const p of orProps) {
      const extId = String(pick(p, ["id", "propertyId"]));
      const name = pick<string>(p, ["name", "displayName", "propertyName"]) ?? `Property ${extId}`;
      const address = pick<string>(p, ["address1", "address", "street"]) ?? null;

      // Does a mapped property already exist?
      const { data: existing } = await db
        .from("properties")
        .select("id")
        .eq("host_id", hostId)
        .eq("external_source", "ownerrez")
        .eq("external_id", extId)
        .maybeSingle();

      if (existing) {
        propMap.set(extId, existing.id);
        await db.from("properties").update({ name, address }).eq("id", existing.id);
      } else {
        const { data: created } = await db
          .from("properties")
          .insert({
            host_id: hostId,
            name,
            address,
            external_source: "ownerrez",
            external_id: extId,
          })
          .select("id")
          .single();
        if (created) propMap.set(extId, created.id);
      }
    }

    // 2. Bookings (upcoming, active) → calendar_events + turnovers
    const bookings = await orGetAll(
      `/bookings?since_utc=${today}T00:00:00Z&status=active`,
      creds
    );

    let reservations = 0;
    let turnovers = 0;

    for (const b of bookings) {
      const orPropId = String(pick(b, ["property_id", "propertyId"]));
      const propertyId = propMap.get(orPropId);
      if (!propertyId) continue;

      const arrival = toDateStr(pick(b, ["arrival", "arrivalDate", "checkIn"]));
      const departure = toDateStr(pick(b, ["departure", "departureDate", "checkOut"]));
      if (!arrival || !departure) continue;
      if (departure < today) continue;

      const bookingId = String(pick(b, ["id", "bookingId"]));
      const guest = pick<string>(b, ["guestName", "guest_name"]) ?? "Reservation";
      const eventUid = `ownerrez-${bookingId}`;

      // Upsert calendar event
      await db.from("calendar_events").upsert(
        {
          property_id: propertyId,
          host_id: hostId,
          event_uid: eventUid,
          summary: guest,
          description: "Imported from OwnerRez",
          start_date: arrival,
          end_date: departure,
        },
        { onConflict: "property_id,event_uid" }
      );
      reservations++;

      // Fetch the event id to link the turnover
      const { data: ev } = await db
        .from("calendar_events")
        .select("id")
        .eq("property_id", propertyId)
        .eq("event_uid", eventUid)
        .maybeSingle();

      if (ev) {
        const { data: propRow } = await db
          .from("properties")
          .select("name")
          .eq("id", propertyId)
          .maybeSingle();
        const created = await createTurnoverTask({
          hostId,
          title: `Turnover cleaning — ${propRow?.name ?? "Property"}`,
          scheduledDate: departure,
          propertyId,
          calendarEventId: ev.id,
          marketSlug,
        });
        if (created) turnovers++;
      }
    }

    await db
      .from("host_integrations")
      .update({
        status: "active",
        last_synced_at: new Date().toISOString(),
        last_error: null,
        updated_at: new Date().toISOString(),
      })
      .eq("id", integration.id);

    return { ok: true, properties: propMap.size, reservations, turnovers };
  } catch (e) {
    const error = e instanceof Error ? e.message : "Sync failed";
    await db
      .from("host_integrations")
      .update({ status: "error", last_error: error, updated_at: new Date().toISOString() })
      .eq("id", integration.id);
    return { ok: false, properties: 0, reservations: 0, turnovers: 0, error };
  }
}
