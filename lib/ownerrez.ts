import { supabaseAdmin } from "@/lib/supabase/admin";
import { createTurnoverTask } from "@/lib/turnover";

const BASE = "https://api.ownerrez.com/v2";
const AUTHORIZE_URL =
  process.env.OWNERREZ_AUTHORIZE_URL || "https://app.ownerrez.com/oauth/authorize";
const TOKEN_URL =
  process.env.OWNERREZ_TOKEN_URL || "https://api.ownerrez.com/oauth/access_token";

// ── Auth ──────────────────────────────────────────────────────────────────────
export type OwnerRezAuth =
  | { type: "basic"; username: string; token: string }
  | { type: "bearer"; accessToken: string };

// Back-compat alias for the Personal Access Token path
export interface OwnerRezCreds {
  username: string;
  token: string;
}

function authHeader(auth: OwnerRezAuth): string {
  if (auth.type === "bearer") return `Bearer ${auth.accessToken}`;
  const basic = Buffer.from(`${auth.username}:${auth.token}`).toString("base64");
  return `Basic ${basic}`;
}

/** Low-level GET against the OwnerRez API. Throws on non-2xx. */
async function orGet(path: string, auth: OwnerRezAuth): Promise<any> {
  const res = await fetch(`${BASE}${path}`, {
    headers: {
      Authorization: authHeader(auth),
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
async function orGetAll(path: string, auth: OwnerRezAuth, cap = 10): Promise<any[]> {
  const items: any[] = [];
  let next: string | null = path;
  let pages = 0;
  while (next && pages < cap) {
    const page: any = await orGet(next.startsWith("http") ? next.replace(BASE, "") : next, auth);
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

/** Validate Personal Access Token credentials by making a cheap authenticated call. */
export async function verifyOwnerRez(creds: OwnerRezCreds): Promise<{ ok: boolean; error?: string }> {
  try {
    await orGet("/properties?limit=1", { type: "basic", ...creds });
    return { ok: true };
  } catch (e) {
    return { ok: false, error: e instanceof Error ? e.message : "Connection failed" };
  }
}

// ── OAuth (Authorization Code Grant) ────────────────────────────────────────────
export function ownerRezOAuthConfigured(): boolean {
  return !!(process.env.OWNERREZ_CLIENT_ID && process.env.OWNERREZ_CLIENT_SECRET);
}

export function buildOwnerRezAuthorizeUrl(redirectUri: string, state: string): string {
  const params = new URLSearchParams({
    client_id: process.env.OWNERREZ_CLIENT_ID!,
    response_type: "code",
    redirect_uri: redirectUri,
    state,
  });
  if (process.env.OWNERREZ_SCOPES) params.set("scope", process.env.OWNERREZ_SCOPES);
  return `${AUTHORIZE_URL}?${params.toString()}`;
}

interface TokenResponse {
  access_token: string;
  refresh_token?: string;
  expires_in?: number; // seconds
  token_type?: string;
}

async function tokenRequest(body: Record<string, string>): Promise<TokenResponse> {
  const basic = Buffer.from(
    `${process.env.OWNERREZ_CLIENT_ID}:${process.env.OWNERREZ_CLIENT_SECRET}`
  ).toString("base64");
  const res = await fetch(TOKEN_URL, {
    method: "POST",
    headers: {
      Authorization: `Basic ${basic}`,
      "Content-Type": "application/x-www-form-urlencoded",
      Accept: "application/json",
    },
    body: new URLSearchParams(body).toString(),
    signal: AbortSignal.timeout(15_000),
  });
  if (!res.ok) {
    const text = await res.text().catch(() => "");
    throw new Error(`OwnerRez token → HTTP ${res.status} ${text.slice(0, 200)}`);
  }
  return res.json();
}

/** Exchange an authorization code for tokens (used by the OAuth callback). */
export function exchangeOwnerRezCode(code: string, redirectUri: string) {
  return tokenRequest({
    grant_type: "authorization_code",
    code,
    redirect_uri: redirectUri,
  });
}

/** Refresh an expired OAuth access token. */
function refreshOwnerRezToken(refreshToken: string) {
  return tokenRequest({ grant_type: "refresh_token", refresh_token: refreshToken });
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
 * OwnerRez returns a property address as an object
 * ({ street1, city, state, postal_code, country, ... }) — not a string.
 * Build a clean single-line address, tolerant of missing fields and of the
 * value already being a plain string. Returns null when there's nothing usable.
 */
function formatOrAddress(raw: any): string | null {
  if (raw == null) return null;
  if (typeof raw === "string") {
    const s = raw.trim();
    // Guard against a JSON blob accidentally stored as a string
    if (!s || s.startsWith("{") || s.startsWith("[")) return s.startsWith("{") || s.startsWith("[") ? null : s || null;
    return s;
  }
  if (typeof raw !== "object") return null;

  const street = pick<string>(raw, ["street1", "street", "line1", "address1"]);
  const street2 = pick<string>(raw, ["street2", "line2", "address2"]);
  const city = pick<string>(raw, ["city", "town"]);
  const state = pick<string>(raw, ["state", "province", "region"]);
  const postal = pick<string>(raw, ["postal_code", "postalCode", "zip", "zip_code"]);
  let country = pick<string>(raw, ["country", "country_code", "countryCode"]);
  // Drop noisy default country so US addresses read cleanly
  if (country && /^(us|usa|united states)$/i.test(country.trim())) country = undefined;

  const cityLine = [city, state].filter(Boolean).join(", ");
  const parts = [street, street2, cityLine, postal, country].filter(Boolean);
  const out = parts.join(", ").replace(/\s+,/g, ",").trim();
  return out || null;
}

/** Extract a formatted address from an OwnerRez property (object, array, or string). */
function extractOrAddress(p: any): string | null {
  let a = pick<any>(p, ["address"]);
  if (a == null && Array.isArray(p?.addresses)) {
    a = p.addresses.find((x: any) => x?.is_default) ?? p.addresses[0];
  }
  if (a == null) a = pick<any>(p, ["address1", "street"]);
  return formatOrAddress(a);
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
    .select(
      "id, auth_method, api_username, api_token, access_token, refresh_token, token_expires_at, status"
    )
    .eq("host_id", hostId)
    .eq("provider", "ownerrez")
    .maybeSingle();

  if (!integration) {
    return { ok: false, properties: 0, reservations: 0, turnovers: 0, error: "Not connected" };
  }

  // Build auth for this request (refresh the OAuth token if it's expiring)
  let auth: OwnerRezAuth;
  try {
    if (integration.auth_method === "oauth") {
      let accessToken = integration.access_token as string | null;
      const expMs = integration.token_expires_at
        ? new Date(integration.token_expires_at).getTime()
        : 0;
      const nearExpiry = !accessToken || expMs - Date.now() < 60_000;
      if (nearExpiry && integration.refresh_token) {
        const t = await refreshOwnerRezToken(integration.refresh_token);
        accessToken = t.access_token;
        await db
          .from("host_integrations")
          .update({
            access_token: t.access_token,
            refresh_token: t.refresh_token ?? integration.refresh_token,
            token_expires_at: t.expires_in
              ? new Date(Date.now() + t.expires_in * 1000).toISOString()
              : null,
            updated_at: new Date().toISOString(),
          })
          .eq("id", integration.id);
      }
      if (!accessToken) {
        return { ok: false, properties: 0, reservations: 0, turnovers: 0, error: "OAuth token missing" };
      }
      auth = { type: "bearer", accessToken };
    } else {
      if (!integration.api_username || !integration.api_token) {
        return { ok: false, properties: 0, reservations: 0, turnovers: 0, error: "Not connected" };
      }
      auth = { type: "basic", username: integration.api_username, token: integration.api_token };
    }
  } catch (e) {
    const error = e instanceof Error ? e.message : "Auth failed";
    await db.from("host_integrations").update({ status: "error", last_error: error }).eq("id", integration.id);
    return { ok: false, properties: 0, reservations: 0, turnovers: 0, error };
  }

  const today = new Date().toISOString().slice(0, 10);

  try {
    // 1. Properties → upsert STRVend properties keyed by external_id
    const orProps = await orGetAll("/properties", auth);
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
      const address = extractOrAddress(p);

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
      auth
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
