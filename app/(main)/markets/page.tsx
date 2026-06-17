import { createClient } from "@/lib/supabase/server";
import { MarketsClientPage } from "@/components/MarketsClientPage";
import type { Market } from "@/types";
import { MapPin } from "lucide-react";

export const metadata = {
  title: "Browse All Markets — STR Pro Directory",
  description: "Find short-term rental service providers in over 100 top STR markets across the US.",
};

export default async function MarketsPage() {
  const supabase = createClient();

  // Fetch ALL active markets — no limit, ordered alphabetically
  const { data: markets } = await supabase
    .from("markets")
    .select("*")
    .eq("is_active", true)
    .order("name")
    .limit(500); // explicit ceiling well above our count

  // Build vendor counts by city
  const { data: vendorRows } = await supabase
    .from("vendors")
    .select("city")
    .eq("is_active", true);

  const cityCount: Record<string, number> = {};
  for (const v of (vendorRows ?? []) as { city: string | null }[]) {
    if (v.city) cityCount[v.city] = (cityCount[v.city] ?? 0) + 1;
  }

  function countForMarket(market: Market): number {
    return market.cities.reduce((sum, city) => sum + (cityCount[city] ?? 0), 0);
  }

  const marketsWithCounts = (markets ?? []).map((m) => ({
    ...(m as Market),
    vendorCount: countForMarket(m as Market),
  }));

  return (
    <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
      <div className="mb-10">
        <div className="flex items-center gap-2 text-brand-600 text-sm font-medium mb-2">
          <MapPin className="h-4 w-4" />
          Browse by Location
        </div>
        <h1 className="text-3xl font-bold text-gray-900">STR Markets</h1>
        <p className="mt-2 text-gray-500 max-w-xl">
          Explore service providers across {marketsWithCounts.length}+ top short-term rental markets in the US.
        </p>
      </div>

      <MarketsClientPage markets={marketsWithCounts} />
    </div>
  );
}
