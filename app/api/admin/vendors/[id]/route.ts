import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

export async function PATCH(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();

  // Verify admin
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile?.role !== "admin") {
    return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  }

  const body = await req.json();

  const patch: Record<string, unknown> = {};

  // Boolean toggles
  for (const key of ["is_verified", "is_featured", "is_active"]) {
    if (key in body && typeof body[key] === "boolean") patch[key] = body[key];
  }
  // Editable text/id fields
  for (const key of [
    "business_name", "tagline", "description", "website", "phone", "email",
    "city", "state", "category_id",
  ]) {
    if (key in body && (typeof body[key] === "string" || body[key] === null)) {
      const v = typeof body[key] === "string" ? body[key].trim() : body[key];
      patch[key] = v === "" ? null : v;
    }
  }
  // business_name must not be blanked
  if ("business_name" in patch && !patch.business_name) delete patch.business_name;
  // markets array
  if (Array.isArray(body.markets)) patch.markets = body.markets;
  // subscription tier (validated)
  if (["free", "pro", "featured"].includes(body.subscription_tier)) {
    patch.subscription_tier = body.subscription_tier;
  }

  if (Object.keys(patch).length === 0) {
    return NextResponse.json({ error: "No valid fields to update" }, { status: 400 });
  }

  const { data, error } = await supabase
    .from("vendors")
    .update({ ...patch, updated_at: new Date().toISOString() })
    .eq("id", params.id)
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ data });
}
