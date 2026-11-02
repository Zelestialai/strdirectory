import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";

export async function PATCH(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { name, address, ical_url, market_slug } = await req.json();

  const patch: Record<string, unknown> = {};
  if (name !== undefined) patch.name = name;
  if (address !== undefined) patch.address = address;
  if (ical_url !== undefined) patch.ical_url = ical_url;
  if (market_slug !== undefined) patch.market_slug = market_slug || null;

  const { data, error } = await supabase
    .from("properties")
    .update(patch)
    .eq("id", params.id)
    .eq("host_id", user.id)
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  if (!data) return NextResponse.json({ error: "Not found" }, { status: 404 });

  // Re-stamp this property's upcoming turnovers with the new market so existing
  // jobs move to the correct market board, not just future ones.
  if (market_slug !== undefined) {
    const today = new Date().toISOString().slice(0, 10);
    await supabase
      .from("turnover_tasks")
      .update({ market_slug: market_slug || null })
      .eq("property_id", params.id)
      .gte("scheduled_date", today);
  }

  return NextResponse.json({ property: data });
}

export async function DELETE(
  _req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { error } = await supabase
    .from("properties")
    .delete()
    .eq("id", params.id)
    .eq("host_id", user.id);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}
