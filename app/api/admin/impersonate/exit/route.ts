import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { ADMIN_STASH_COOKIE, IMPERSONATING_COOKIE } from "@/lib/impersonation";

export const runtime = "nodejs";

/**
 * End a "view as user" session and restore the admin's original session from
 * the stashed (httpOnly) tokens. The stash only ever holds the admin's own
 * tokens, so restoring it is not a privilege escalation.
 */
export async function POST() {
  const cookieStore = cookies();
  const stash = cookieStore.get(ADMIN_STASH_COOKIE)?.value;
  if (!stash) {
    return NextResponse.json({ error: "Not impersonating" }, { status: 400 });
  }

  let tokens: { access_token: string; refresh_token: string };
  try {
    tokens = JSON.parse(stash);
  } catch {
    cookieStore.delete(ADMIN_STASH_COOKIE);
    cookieStore.delete(IMPERSONATING_COOKIE);
    return NextResponse.json({ error: "Corrupt session stash" }, { status: 400 });
  }

  const supabase = createClient();
  const { data, error } = await supabase.auth.setSession({
    access_token: tokens.access_token,
    refresh_token: tokens.refresh_token,
  });

  cookieStore.delete(ADMIN_STASH_COOKIE);
  cookieStore.delete(IMPERSONATING_COOKIE);

  if (error || !data.user) {
    // Could not restore (e.g. refresh token expired) — safest is a clean logout.
    await supabase.auth.signOut();
    return NextResponse.json({ ok: true, redirect: "/login" });
  }

  // Close out the most recent open audit row for this admin.
  await supabaseAdmin
    .from("impersonation_logs")
    .update({ ended_at: new Date().toISOString() })
    .eq("admin_id", data.user.id)
    .is("ended_at", null);

  return NextResponse.json({ ok: true, redirect: "/admin/users" });
}
