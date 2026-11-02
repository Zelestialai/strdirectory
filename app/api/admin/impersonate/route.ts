import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { ADMIN_STASH_COOKIE, IMPERSONATING_COOKIE } from "@/lib/impersonation";

export const runtime = "nodejs";

/**
 * Start an admin "view as user" session. Admin-only. Stashes the admin's own
 * session tokens in an httpOnly cookie so they can be restored on exit, then
 * mints the target user's session (replacing the auth cookies). Blocks
 * impersonating other admins and records the session in an audit log.
 */
export async function POST(req: Request) {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Not signed in" }, { status: 401 });

  const { data: me } = await supabaseAdmin
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();
  if (me?.role !== "admin") {
    return NextResponse.json({ error: "Admins only" }, { status: 403 });
  }

  const { userId } = await req.json().catch(() => ({}));
  if (!userId || typeof userId !== "string") {
    return NextResponse.json({ error: "Missing userId" }, { status: 400 });
  }
  if (userId === user.id) {
    return NextResponse.json({ error: "That's already you" }, { status: 400 });
  }

  // Don't allow an admin already viewing as someone to chain impersonations.
  const cookieStore = cookies();
  if (cookieStore.get(ADMIN_STASH_COOKIE)) {
    return NextResponse.json(
      { error: "Already impersonating — exit first" },
      { status: 409 }
    );
  }

  const { data: target } = await supabaseAdmin
    .from("profiles")
    .select("role, full_name")
    .eq("id", userId)
    .single();
  if (!target) return NextResponse.json({ error: "User not found" }, { status: 404 });
  if (target.role === "admin") {
    return NextResponse.json(
      { error: "Cannot view as another admin" },
      { status: 403 }
    );
  }

  const { data: targetAuth } = await supabaseAdmin.auth.admin.getUserById(userId);
  const email = targetAuth?.user?.email;
  if (!email) {
    return NextResponse.json({ error: "User has no email to sign in with" }, { status: 400 });
  }

  // Capture the admin's current session so we can restore it on exit.
  const {
    data: { session },
  } = await supabase.auth.getSession();
  if (!session) return NextResponse.json({ error: "No active session" }, { status: 401 });

  // Audit trail.
  await supabaseAdmin
    .from("impersonation_logs")
    .insert({ admin_id: user.id, target_id: userId });

  // Stash the admin's own tokens (httpOnly — never readable by client JS).
  cookieStore.set(
    ADMIN_STASH_COOKIE,
    JSON.stringify({ access_token: session.access_token, refresh_token: session.refresh_token }),
    { httpOnly: true, secure: true, sameSite: "lax", path: "/", maxAge: 60 * 60 * 4 }
  );
  // Readable flag so the banner can show who we're viewing as.
  cookieStore.set(IMPERSONATING_COOKIE, target.full_name || email, {
    httpOnly: false,
    secure: true,
    sameSite: "lax",
    path: "/",
    maxAge: 60 * 60 * 4,
  });

  // Mint the target user's session and write it to the auth cookies.
  const { data: link, error: linkErr } = await supabaseAdmin.auth.admin.generateLink({
    type: "magiclink",
    email,
  });
  const tokenHash = link?.properties?.hashed_token;
  if (linkErr || !tokenHash) {
    cookieStore.delete(ADMIN_STASH_COOKIE);
    cookieStore.delete(IMPERSONATING_COOKIE);
    return NextResponse.json({ error: "Could not create session for user" }, { status: 500 });
  }

  const { error: otpErr } = await supabase.auth.verifyOtp({
    type: "magiclink",
    token_hash: tokenHash,
  });
  if (otpErr) {
    cookieStore.delete(ADMIN_STASH_COOKIE);
    cookieStore.delete(IMPERSONATING_COOKIE);
    return NextResponse.json({ error: otpErr.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true, redirect: "/" });
}
