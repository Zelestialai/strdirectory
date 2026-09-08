import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { notifyAdminsOfSignup } from "@/lib/admin-notify";

export const runtime = "nodejs";

/**
 * Notify admins that the signed-in user's vendor listing is pending approval.
 * Fully server-validated: only fires for the caller's own unverified vendor row.
 */
export async function POST() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ ok: false }, { status: 401 });

  const { data: vendor } = await supabaseAdmin
    .from("vendors")
    .select("business_name, is_verified, category:categories(name), markets")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!vendor || vendor.is_verified) return NextResponse.json({ ok: false });

  await notifyAdminsOfSignup({
    kind: "vendor",
    email: user.email ?? null,
    businessName: vendor.business_name,
    categoryName: (vendor.category as { name: string } | null)?.name ?? null,
    market: Array.isArray(vendor.markets) ? vendor.markets[0] ?? null : null,
  });

  return NextResponse.json({ ok: true });
}
