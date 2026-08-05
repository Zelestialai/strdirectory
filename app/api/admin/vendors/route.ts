import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

// Verify the caller is an admin; returns true/false.
async function isAdmin() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return false;
  const { data: profile } = await supabase
    .from("profiles").select("role").eq("id", user.id).single();
  return profile?.role === "admin";
}

function slugify(s: string) {
  return s
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

// POST /api/admin/vendors — create a new vendor listing (admin only).
export async function POST(req: Request) {
  if (!(await isAdmin())) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const body = await req.json().catch(() => ({}));
  const business_name = typeof body.business_name === "string" ? body.business_name.trim() : "";
  const category_id = body.category_id || null;

  if (!business_name || !category_id) {
    return NextResponse.json({ error: "Business name and category are required." }, { status: 400 });
  }

  // Unique slug
  const base = slugify(business_name) || "vendor";
  let slug = base;
  for (let i = 2; i < 50; i++) {
    const { data: exists } = await supabaseAdmin
      .from("vendors").select("id").eq("slug", slug).maybeSingle();
    if (!exists) break;
    slug = `${base}-${i}`;
  }

  const markets = Array.isArray(body.markets) ? body.markets : [];
  const tier = ["free", "pro", "featured"].includes(body.subscription_tier) ? body.subscription_tier : "free";

  const row = {
    user_id: null,                       // unclaimed listing
    is_claimed: false,
    category_id,
    business_name,
    slug,
    tagline: body.tagline?.trim() || null,
    description: body.description?.trim() || null,
    website: body.website?.trim() || null,
    phone: body.phone?.trim() || null,
    email: body.email?.trim() || null,
    city: body.city?.trim() || null,
    state: body.state?.trim() || null,
    markets,
    subscription_tier: tier,
    is_verified: !!body.is_verified,
    is_featured: !!body.is_featured,
    is_active: body.is_active === false ? false : true,
  };

  const { data, error } = await supabaseAdmin
    .from("vendors").insert(row).select("id, slug").single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ ok: true, vendor: data }, { status: 201 });
}
