import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

// POST — soft-deactivate the current user's account.
// This does NOT hard-delete data. It marks the account deactivated, hides any
// vendor listing from public view, and signs the user out. Reactivation and
// permanent deletion are handled by support (support@strvend.com).
export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  // Require an explicit confirmation string so this can't fire accidentally
  if (body.confirm !== "DEACTIVATE") {
    return NextResponse.json(
      { error: "Confirmation required" },
      { status: 400 }
    );
  }

  const now = new Date().toISOString();

  // Mark the profile deactivated
  const { error: profileError } = await supabase
    .from("profiles")
    .update({ deactivated_at: now, updated_at: now })
    .eq("id", user.id);

  if (profileError) {
    return NextResponse.json({ error: profileError.message }, { status: 500 });
  }

  // Hide any vendor listing this user owns from public search
  await supabase
    .from("vendors")
    .update({ is_active: false })
    .eq("user_id", user.id);

  // Sign the user out
  await supabase.auth.signOut();

  return NextResponse.json({ ok: true });
}
