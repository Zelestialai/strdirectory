import type { SupabaseClient } from "@supabase/supabase-js";

/**
 * Supabase's PostgREST API caps any single request at 1000 rows by default.
 * We have 3000+ active vendors, so a plain `.select("city")` silently drops
 * everything past the first 1000 — which made many markets appear to have
 * zero vendors even though real vendor rows exist for them.
 *
 * This paginates through every active vendor in batches of 1000 and returns
 * a "city|state" -> active vendor count map. The state is part of the key
 * because city names collide across states (e.g. Woodstock VA vs Woodstock NY),
 * and a market must only count vendors in its own state.
 */
export function cityStateKey(city: string, state: string | null | undefined): string {
  return `${city.trim().toLowerCase()}|${(state ?? "").trim().toLowerCase()}`;
}

export async function getVendorCityCounts(
  supabase: SupabaseClient
): Promise<Record<string, number>> {
  const cityCount: Record<string, number> = {};
  const PAGE_SIZE = 1000;
  let from = 0;

  while (true) {
    const { data, error } = await supabase
      .from("vendors")
      .select("city, state")
      .eq("is_active", true)
      .range(from, from + PAGE_SIZE - 1);

    if (error || !data || data.length === 0) break;

    for (const row of data as { city: string | null; state: string | null }[]) {
      if (row.city) {
        const key = cityStateKey(row.city, row.state);
        cityCount[key] = (cityCount[key] ?? 0) + 1;
      }
    }

    if (data.length < PAGE_SIZE) break; // last page
    from += PAGE_SIZE;
  }

  return cityCount;
}
