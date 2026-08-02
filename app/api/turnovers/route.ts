import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { createTurnoverTask } from "@/lib/turnover";

// POST — host creates a manual turnover task
export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const title = typeof body.title === "string" ? body.title.trim() : "";
  const scheduledDate = typeof body.scheduled_date === "string" ? body.scheduled_date : "";

  if (!title || !scheduledDate) {
    return NextResponse.json({ error: "Title and date are required" }, { status: 400 });
  }

  // Resolve the host's market for open-job discovery
  const { data: profile } = await supabase
    .from("profiles")
    .select("preferred_market")
    .eq("id", user.id)
    .maybeSingle();

  const task = await createTurnoverTask({
    hostId: user.id,
    title,
    scheduledDate,
    propertyId: body.property_id ?? null,
    notes: typeof body.notes === "string" ? body.notes : null,
    priceCents:
      typeof body.price_cents === "number" ? Math.round(body.price_cents) : null,
    marketSlug: profile?.preferred_market ?? null,
  });

  if (!task) {
    return NextResponse.json({ error: "Failed to create task" }, { status: 500 });
  }

  return NextResponse.json({ task }, { status: 201 });
}
