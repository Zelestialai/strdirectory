import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { createClient } from "@/lib/supabase/server";
import { MARKET_COOKIE } from "@/lib/market";

// POST — set the active market. Body: { slug }
// Sets a 1-year cookie and, if the user is logged in, saves it to their profile.
export async function POST(req: NextRequest) {
  const { slug } = await req.json().catch(() => ({ slug: null }));
  if (!slug || typeof slug !== "string") {
    return NextResponse.json({ error: "slug is required" }, { status: 400 });
  }

  const supabase = createClient();

  // Validate the market exists and is active
  const { data: market } = await supabase
    .from("markets")
    .select("slug, name")
    .eq("slug", slug)
    .eq("is_active", true)
    .maybeSingle();

  if (!market) {
    return NextResponse.json({ error: "Unknown market" }, { status: 404 });
  }

  // Persist as a cookie (readable, not httpOnly-critical; 1 year)
  cookies().set(MARKET_COOKIE, slug, {
    maxAge: 60 * 60 * 24 * 365,
    path: "/",
    sameSite: "lax",
  });

  // If logged in, remember on the profile too (cross-device)
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (user) {
    await supabase.from("profiles").update({ preferred_market: slug }).eq("id", user.id);
  }

  return NextResponse.json({ ok: true, market });
}
