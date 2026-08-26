import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

type Role = "active_host" | "potential_host" | "vendor" | "user";

function slugify(s: string) {
  return s
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "")
    .slice(0, 60);
}

/**
 * Finalize onboarding for a user who signed up via Google (no role chosen yet).
 * Sets profiles.role + preferred_market + onboarded, and creates the matching
 * host_profile or vendor listing. Returns the destination to redirect to.
 */
export async function POST(request: Request) {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const body = await request.json().catch(() => ({}));
  const role = body.role as Role;
  if (!["active_host", "potential_host", "vendor", "user"].includes(role)) {
    return NextResponse.json({ error: "Invalid role" }, { status: 400 });
  }

  const markets: string[] = Array.isArray(body.markets) ? body.markets : [];
  const dbRole =
    role === "vendor" ? "vendor" : role === "user" ? "user" : "host";
  const preferredMarket = markets[0] ?? null;

  // Validate role-specific requirements up front.
  if (role === "active_host" && markets.length === 0) {
    return NextResponse.json({ error: "Select at least one market." }, { status: 400 });
  }
  if (role === "potential_host" && !String(body.propertyLocation || "").trim()) {
    return NextResponse.json({ error: "Enter your property location." }, { status: 400 });
  }
  if (role === "vendor") {
    if (!String(body.businessName || "").trim())
      return NextResponse.json({ error: "Enter your business name." }, { status: 400 });
    if (!String(body.categoryId || "").trim())
      return NextResponse.json({ error: "Select your service type." }, { status: 400 });
  }

  // 1. Update the base profile.
  const { error: profErr } = await supabaseAdmin
    .from("profiles")
    .update({
      role: dbRole,
      preferred_market: preferredMarket,
      onboarded: true,
      ...(body.fullName ? { full_name: String(body.fullName).trim() } : {}),
    })
    .eq("id", user.id);
  if (profErr) {
    return NextResponse.json({ error: profErr.message }, { status: 500 });
  }

  // 2. Host profile.
  if (role === "active_host" || role === "potential_host") {
    const { error: hpErr } = await supabaseAdmin.from("host_profiles").upsert(
      {
        id: user.id,
        host_type: role === "potential_host" ? "potential" : "active",
        airbnb_url: body.airbnbUrl?.trim() || null,
        direct_booking_url: body.bookingUrl?.trim() || null,
        markets,
        agent_name: body.agentName?.trim() || null,
        property_address: body.propertyAddress?.trim() || null,
        property_location: body.propertyLocation?.trim() || null,
      },
      { onConflict: "id" }
    );
    if (hpErr) return NextResponse.json({ error: hpErr.message }, { status: 500 });
    return NextResponse.json({ redirect: "/host/onboarding" });
  }

  // 3. Vendor listing.
  if (role === "vendor") {
    const base = slugify(String(body.businessName));
    const slug = `${base}-${user.id.slice(0, 6)}`;
    const { error: vErr } = await supabaseAdmin.from("vendors").upsert(
      {
        user_id: user.id,
        category_id: body.categoryId,
        business_name: String(body.businessName).trim(),
        slug,
        website: body.website?.trim() || null,
        phone: body.phone?.trim() || null,
        markets,
      },
      { onConflict: "user_id" }
    );
    if (vErr) return NextResponse.json({ error: vErr.message }, { status: 500 });
    return NextResponse.json({ redirect: "/dashboard/onboarding" });
  }

  // 4. Just browsing.
  return NextResponse.json({ redirect: "/" });
}
