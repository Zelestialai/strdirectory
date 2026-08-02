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

// GET — public .ics feed of a cleaner's scheduled turnover jobs.
// Auth is via the unguessable ical_token in the URL.
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

  // Resolve the cleaner's vendor listing
  const { data: vendor } = await db
    .from("vendors")
    .select("id")
    .eq("user_id", profile.id)
    .maybeSingle();

  const events: IcsEvent[] = [];

  if (vendor) {
    const { data: tasks } = await db
      .from("turnover_tasks")
      .select("id, title, notes, scheduled_date, status, price_cents, property:properties(name, address)")
      .eq("assigned_vendor_id", vendor.id)
      .in("status", ["assigned", "scheduled"])
      .order("scheduled_date");

    for (const t of tasks ?? []) {
      const prop = t.property as unknown as { name?: string; address?: string } | null;
      const priceStr = t.price_cents != null ? ` ($${(t.price_cents / 100).toFixed(0)})` : "";
      events.push({
        uid: `turnover-${t.id}`,
        date: t.scheduled_date,
        summary: `🧹 ${t.title}${priceStr}`,
        description: [t.notes, t.status === "assigned" ? "Status: awaiting your acceptance" : "Status: scheduled"]
          .filter(Boolean)
          .join("\n"),
        location: prop?.address || prop?.name || undefined,
      });
    }
  }

  const ics = buildIcs("STRVend Turnover Jobs", events);
  return new NextResponse(ics, {
    status: 200,
    headers: {
      "Content-Type": "text/calendar; charset=utf-8",
      "Content-Disposition": 'inline; filename="strvend-turnovers.ics"',
      "Cache-Control": "public, max-age=900",
    },
  });
}
