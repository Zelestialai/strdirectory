import { NextRequest, NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { SITE_URL } from "@/lib/email";

export async function GET(req: NextRequest) {
  const token = req.nextUrl.searchParams.get("token");
  const errorRedirect = (msg: string) =>
    NextResponse.redirect(`${SITE_URL}/claim/error?reason=${encodeURIComponent(msg)}`);

  if (!token) return errorRedirect("missing_token");

  // ── 1. Look up the claim request (service-role bypasses RLS) ────────────────
  const { data: claim, error: claimError } = await supabaseAdmin
    .from("claim_requests")
    .select("id, vendor_id, email, contact_name, status, expires_at")
    .eq("token", token)
    .single();

  if (claimError || !claim) return errorRedirect("invalid_token");
  if (claim.status !== "pending") return errorRedirect("already_used");
  if (new Date(claim.expires_at) < new Date()) {
    // Mark as expired
    await supabaseAdmin
      .from("claim_requests")
      .update({ status: "expired" })
      .eq("id", claim.id);
    return errorRedirect("expired");
  }

  // ── 2. Get vendor info ───────────────────────────────────────────────────────
  const { data: vendor } = await supabaseAdmin
    .from("vendors")
    .select("id, business_name, is_claimed, user_id")
    .eq("id", claim.vendor_id)
    .single();

  if (!vendor) return errorRedirect("vendor_not_found");
  if (vendor.is_claimed) return errorRedirect("already_claimed");

  // ── 3. Find or create the user account ──────────────────────────────────────
  let userId: string;

  // Try to find existing user by querying auth.users via admin
  const { data: { users } } = await supabaseAdmin.auth.admin.listUsers({ page: 1, perPage: 1000 });
  const existingUser = users?.find((u) => u.email?.toLowerCase() === claim.email.toLowerCase());

  if (existingUser) {
    userId = existingUser.id;
    // Make sure their profile role is vendor
    await supabaseAdmin
      .from("profiles")
      .update({ role: "vendor" })
      .eq("id", userId)
      .neq("role", "admin"); // never downgrade admins
  } else {
    // Create a new user — email already confirmed
    const { data: newUser, error: createError } = await supabaseAdmin.auth.admin.createUser({
      email: claim.email,
      email_confirm: true,
      user_metadata: { full_name: claim.contact_name },
    });

    if (createError || !newUser.user) return errorRedirect("account_creation_failed");
    userId = newUser.user.id;

    // Create their profile
    await supabaseAdmin.from("profiles").upsert({
      id:        userId,
      full_name: claim.contact_name,
      role:      "vendor",
    });
  }

  // ── 4. Claim the vendor listing ──────────────────────────────────────────────
  const { error: vendorError } = await supabaseAdmin
    .from("vendors")
    .update({ is_claimed: true, user_id: userId })
    .eq("id", vendor.id);

  if (vendorError) return errorRedirect("claim_failed");

  // ── 5. Mark claim as completed ───────────────────────────────────────────────
  await supabaseAdmin
    .from("claim_requests")
    .update({ status: "completed", completed_at: new Date().toISOString() })
    .eq("id", claim.id);

  // ── 6. Generate a magic link so the vendor is auto-signed in ─────────────────
  const { data: linkData, error: linkError } = await supabaseAdmin.auth.admin.generateLink({
    type: "magiclink",
    email: claim.email,
    options: {
      redirectTo: `${SITE_URL}/dashboard?claimed=1`,
    },
  });

  if (linkError || !linkData?.properties?.action_link) {
    // Fallback: redirect to login with success message
    return NextResponse.redirect(`${SITE_URL}/login?claimed=1&email=${encodeURIComponent(claim.email)}`);
  }

  // Redirect to the Supabase magic link — it logs them in and then sends to /dashboard
  return NextResponse.redirect(linkData.properties.action_link);
}
