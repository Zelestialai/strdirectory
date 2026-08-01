import { cookies, headers } from "next/headers";
import { createClient } from "@/lib/supabase/server";
import type { Market } from "@/types";

export const MARKET_COOKIE = "strvend_market";
export const DEFAULT_MARKET_SLUG = "nashville";

export interface MarketBrief {
  name: string;
  slug: string;
  state: string;
}

async function marketBySlug(
  supabase: ReturnType<typeof createClient>,
  slug: string
): Promise<Market | null> {
  const { data } = await supabase
    .from("markets")
    .select("*")
    .eq("slug", slug)
    .eq("is_active", true)
    .maybeSingle();
  return (data as Market) ?? null;
}

/**
 * Resolve a market from Vercel's IP-geolocation headers.
 * Matches the detected city against each market's `cities[]`, then falls back
 * to the first market in the detected state. Returns null if nothing matches.
 */
async function resolveFromGeo(
  supabase: ReturnType<typeof createClient>
): Promise<Market | null> {
  const h = headers();
  const rawCity = h.get("x-vercel-ip-city");
  const region = h.get("x-vercel-ip-country-region"); // e.g. "TN"

  if (rawCity) {
    const city = decodeURIComponent(rawCity);
    const { data } = await supabase
      .from("markets")
      .select("*")
      .contains("cities", [city])
      .eq("is_active", true)
      .limit(1);
    if (data && data[0]) return data[0] as Market;
  }

  if (region) {
    const { data } = await supabase
      .from("markets")
      .select("*")
      .eq("state", region)
      .eq("is_active", true)
      .order("name")
      .limit(1);
    if (data && data[0]) return data[0] as Market;
  }

  return null;
}

/**
 * The market currently in effect for this request, resolved in priority order:
 *   1. explicit cookie choice
 *   2. logged-in user's saved preference
 *   3. IP geolocation (nearest market)
 *   4. default market
 */
export async function getActiveMarket(): Promise<Market | null> {
  const supabase = createClient();

  // 1. Cookie
  const cookieSlug = cookies().get(MARKET_COOKIE)?.value;
  if (cookieSlug) {
    const m = await marketBySlug(supabase, cookieSlug);
    if (m) return m;
  }

  // 2. Logged-in preference
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (user) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("preferred_market")
      .eq("id", user.id)
      .maybeSingle();
    if (profile?.preferred_market) {
      const m = await marketBySlug(supabase, profile.preferred_market);
      if (m) return m;
    }
  }

  // 3. Geo
  const geo = await resolveFromGeo(supabase);
  if (geo) return geo;

  // 4. Default
  return marketBySlug(supabase, DEFAULT_MARKET_SLUG);
}

/** All active markets (brief) for the switcher dropdown. */
export async function getAllMarkets(): Promise<MarketBrief[]> {
  const supabase = createClient();
  const { data } = await supabase
    .from("markets")
    .select("name, slug, state")
    .eq("is_active", true)
    .order("name");
  return (data as MarketBrief[]) ?? [];
}
