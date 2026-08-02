import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { buildIcs, type IcsEvent } from "@/lib/ics";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function admin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

// GET — public .ics feed of a host's property reservations + turnovers.
export async function GET(
  _req: NextRequest,
  { params }: { params: { token: string } }
) {
  const token = params.token.replace(/\.ics$/i, "");
  const db = admin();

  const { data: profile } = await db
    .from("profiles")
    .select("id")
    .eq("ical_token", token)
    .maybeSingle();

  if (!profile) {
    return new NextResponse("Not found", { status: 404 });
  }

  const events: IcsEvent[] = [];

  // Reservations (synced calendar events)
  const { data: reservations } = await db
    .from("calendar_events")
    .select("id, summary, start_date, end_date, property:properties(name)")
    .eq("host_id", profile.id)
    .order("start_date");

  for (const r of reservations ?? []) {
    const prop = r.property as unknown as { name?: string } | null;
    events.push({
      uid: `reservation-${r.id}`,
      date: r.start_date,
      endDate: r.end_date,
      summary: `🏠 ${prop?.name ? prop.name + " — " : ""}${r.summary || "Reservation"}`,
      location: prop?.name || undefined,
    });
  }

  // Turnovers
  const { data: turnovers } = await db
    .from("turnover_tasks")
    .select("id, title, scheduled_date, status, property:properties(name)")
    .eq("host_id", profile.id)
    .in("status", ["open", "assigned", "scheduled"])
    .order("scheduled_date");

  for (const t of turnovers ?? []) {
    const prop = t.property as unknown as { name?: string } | null;
    events.push({
      uid: `turnover-${t.id}`,
      date: t.scheduled_date,
      summary: `🧹 ${t.title}`,
      description: `Status: ${t.status}`,
      location: prop?.name || undefined,
    });
  }

  const ics = buildIcs("STRVend Reservations", events);
  return new NextResponse(ics, {
    status: 200,
    headers: {
      "Content-Type": "text/calendar; charset=utf-8",
      "Content-Disposition": 'inline; filename="strvend-reservations.ics"',
      "Cache-Control": "public, max-age=900",
    },
  });
}
