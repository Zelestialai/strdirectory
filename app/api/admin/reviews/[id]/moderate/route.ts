import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  // Verify admin
  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();
  if (profile?.role !== "admin") {
    return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  }

  const { action } = await req.json(); // "hide" | "unhide" | "dismiss"

  const updates: Record<string, unknown> = {};
  if (action === "hide") {
    updates.is_hidden = true;
    updates.hidden_by = user.id;
    updates.hidden_at = new Date().toISOString();
    updates.is_flagged = false; // clear flag once actioned
  } else if (action === "unhide") {
    updates.is_hidden = false;
    updates.hidden_by = null;
    updates.hidden_at = null;
  } else if (action === "dismiss") {
    // Keep review visible, just clear the flag
    updates.is_flagged = false;
    updates.flag_reason = null;
    updates.flagged_by = null;
    updates.flagged_at = null;
  } else {
    return NextResponse.json({ error: "Invalid action" }, { status: 400 });
  }

  const { error } = await supabaseAdmin
    .from("reviews")
    .update(updates)
    .eq("id", params.id);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
