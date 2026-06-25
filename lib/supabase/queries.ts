import type { SupabaseClient } from "@supabase/supabase-js";

/**
 * Supabase's PostgREST API caps any single request at 1000 rows by default.
 * We have 3000+ active vendors, so a plain `.select("city")` silently drops
 * everything past the first 1000 — which made many markets appear to have
 * zero vendors even though real vendor rows exist for them.
 *
 * This paginates through every active vendor in batches of 1000 and returns
 * a city -> active vendor count map.
 */
export async function getVendorCityCounts(
  supabase: SupabaseClient
): Promise<Record<string, number>> {
  const cityCount: Record<string, number> = {};
  const PAGE_SIZE = 1000;
  let from = 0;

  while (true) {
    const { data, error } = await supabase
      .from("vendors")
      .select("city")
      .eq("is_active", true)
      .range(from, from + PAGE_SIZE - 1);

    if (error || !data || data.length === 0) break;

    for (const row of data as { city: string | null }[]) {
      if (row.city) cityCount[row.city] = (cityCount[row.city] ?? 0) + 1;
    }

    if (data.length < PAGE_SIZE) break; // last page
    from += PAGE_SIZE;
  }

  return cityCount;
}
