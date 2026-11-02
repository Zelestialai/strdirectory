import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

export const runtime = "nodejs";

/**
 * Set which of the host's properties a team member (cleaner) covers.
 * Host-only, and only for their own team members. An empty list means
 * "covers all properties" (the row set is simply cleared).
 */
export async function PUT(req: NextRequest, { params }: { params: { memberId: string } }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { propertyIds } = await req.json().catch(() => ({}));
  const ids: string[] = Array.isArray(propertyIds) ? propertyIds.filter((x) => typeof x === "string") : [];

  // Verify the caller owns this team membership.
  const { data: member } = await supabase
    .from("team_members")
    .select("id, host_id, vendor_id")
    .eq("id", params.memberId)
    .maybeSingle();
  if (!member || member.host_id !== user.id) {
    return NextResponse.json({ error: "Not found" }, { status: 404 });
  }

  // Only accept properties the host actually owns.
  let valid: string[] = [];
  if (ids.length) {
    const { data: owned } = await supabase
      .from("properties")
      .select("id")
      .eq("host_id", user.id)
      .in("id", ids);
    valid = (owned ?? []).map((p) => p.id as string);
  }

  // Replace the scope.
  await supabase.from("team_member_properties").delete().eq("team_member_id", params.memberId);
  if (valid.length) {
    const { error } = await supabase
      .from("team_member_properties")
      .insert(valid.map((property_id) => ({ team_member_id: params.memberId, property_id })));
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });

    // Apply the restriction to upcoming jobs: release any future turnovers this
    // cleaner is assigned to at properties they no longer cover, back to "open".
    const today = new Date().toISOString().slice(0, 10);
    const { data: upcoming } = await supabase
      .from("turnover_tasks")
      .select("id, property_id")
      .eq("host_id", user.id)
      .eq("assigned_vendor_id", member.vendor_id)
      .in("status", ["assigned", "scheduled"])
      .gte("scheduled_date", today);
    const toRelease = (upcoming ?? [])
      .filter((t) => !t.property_id || !valid.includes(t.property_id as string))
      .map((t) => t.id as string);
    if (toRelease.length) {
      await supabase
        .from("turnover_tasks")
        .update({ status: "open", assigned_vendor_id: null })
        .in("id", toRelease);
    }
  }

  return NextResponse.json({ ok: true, propertyIds: valid });
}
