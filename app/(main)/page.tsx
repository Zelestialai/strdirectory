import Link from "next/link";
import { Search, Star, Shield, Zap } from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { VendorCard } from "@/components/VendorCard";
import { CategoryCard } from "@/components/CategoryCard";
import { MarketCard } from "@/components/MarketCard";
import type { Category, Vendor, Market } from "@/types";

export default async function HomePage() {
  const supabase = createClient();

  const { data: categories } = await supabase
    .from("categories")
    .select("*")
    .order("name");

  const { data: markets } = await supabase
    .from("markets")
    .select("*")
    .eq("is_active", true)
    .order("name")
    .limit(8);

  // Vendor counts per city for market cards
  const { data: vendorCities } = await supabase
    .from("vendors")
    .select("city")
    .eq("is_active", true);
  const cityCount: Record<string, number> = {};
  for (const v of (vendorCities ?? []) as { city: string | null }[]) {
    if (v.city) cityCount[v.city] = (cityCount[v.city] ?? 0) + 1;
  }
  function countForMarket(market: Market) {
    return market.cities.reduce((sum, city) => sum + (cityCount[city] ?? 0), 0);
  }

  const { data: featured } = await supabase
    .from("vendors")
    .select("*, category:categories(*)")
    .eq("is_active", true)
    .eq("is_featured", true)
    .order("avg_rating", { ascending: false })
    .limit(6);

  const { data: recent } = await supabase
    .from("vendors")
    .select("*, category:categories(*)")
    .eq("is_active", true)
    .order("created_at", { ascending: false })
    .limit(6);

  return (
    <div>
      {/* Hero */}
      <section className="relative bg-gradient-to-br from-brand-700 to-brand-900 text-white overflow-hidden">
        <div className="absolute inset-0 bg-[url('/grid.svg')] opacity-10" />
        <div className="relative mx-auto max-w-4xl px-4 py-24 text-center sm:px-6 lg:px-8">
          <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl">
            Find Trusted STR<br />Service Providers
          </h1>
          <p className="mt-5 text-lg text-brand-200 max-w-2xl mx-auto">
            Connect with vetted cleaners, photographers, maintenance pros, and property managers
            — all in one place.
          </p>

          {/* Search bar */}
          <form action="/vendors" method="GET" className="mt-8 flex flex-col sm:flex-row gap-3 max-w-2xl mx-auto">
            <div className="relative flex-1">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
              <input
                name="q"
                className="w-full rounded-xl border-0 bg-white pl-10 pr-4 py-3 text-gray-900 shadow-lg focus:outline-none focus:ring-2 focus:ring-brand-300 text-sm"
                placeholder="Search by name, city, or service…"
              />
            </div>
            <button type="submit" className="rounded-xl bg-amber-400 px-6 py-3 font-semibold text-gray-900 shadow-lg hover:bg-amber-300 transition text-sm whitespace-nowrap">
              Search
            </button>
          </form>
        </div>
      </section>

      {/* Categories */}
      <section className="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-8">Browse by Category</h2>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {(categories as Category[] ?? []).map((cat) => (
            <CategoryCard key={cat.id} category={cat} />
          ))}
        </div>
      </section>

      {/* Browse by Market */}
      {markets && markets.length > 0 && (
        <section className="bg-gray-50 py-16">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div className="flex items-center justify-between mb-8">
              <div>
                <h2 className="text-2xl font-bold text-gray-900">Browse by Market</h2>
                <p className="mt-1 text-sm text-gray-500">Each market covers the primary city and all surrounding STR hotspots.</p>
              </div>
              <Link href="/markets" className="text-sm text-brand-600 font-medium hover:underline whitespace-nowrap">
                All markets →
              </Link>
            </div>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
              {(markets as Market[]).map((market) => (
                <MarketCard
                  key={market.id}
                  market={market}
                  vendorCount={countForMarket(market)}
                />
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Featured vendors */}
      {featured && featured.length > 0 && (
        <section className="bg-gray-50 py-16">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div className="flex items-center justify-between mb-8">
              <h2 className="text-2xl font-bold text-gray-900">Featured Vendors</h2>
              <Link href="/vendors?featured=true" className="text-sm text-brand-600 font-medium hover:underline">
                View all →
              </Link>
            </div>
            <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
              {(featured as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
            </div>
          </div>
        </section>
      )}

      {/* Recently joined */}
      {recent && recent.length > 0 && (
        <section className="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-2xl font-bold text-gray-900">Recently Joined</h2>
            <Link href="/vendors" className="text-sm text-brand-600 font-medium hover:underline">
              See all vendors →
            </Link>
          </div>
          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {(recent as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
          </div>
        </section>
      )}

      {/* Why section */}
      <section className="bg-brand-700 text-white py-16">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-2xl font-bold mb-10">Why STR Pro Directory?</h2>
          <div className="grid gap-8 sm:grid-cols-3">
            {[
              { icon: Shield, title: "Verified Profiles", desc: "Vendors are reviewed and verified by our team before being marked trusted." },
              { icon: Star, title: "Honest Reviews", desc: "Only verified clients can leave reviews, so you know they're real." },
              { icon: Zap, title: "Fast Connections", desc: "Send an inquiry in seconds and hear back directly from the vendor." },
            ].map(({ icon: Icon, title, desc }) => (
              <div key={title} className="flex flex-col items-center gap-3">
                <span className="flex h-12 w-12 items-center justify-center rounded-full bg-white/10">
                  <Icon className="h-6 w-6" />
                </span>
                <h3 className="font-semibold">{title}</h3>
                <p className="text-sm text-brand-200">{desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="mx-auto max-w-3xl px-4 py-20 text-center sm:px-6">
        <h2 className="text-3xl font-bold text-gray-900">Are you a service provider?</h2>
        <p className="mt-3 text-gray-500">Create a free listing and start connecting with STR hosts in your area today.</p>
        <Link href="/register" className="btn-primary mt-6 px-8 py-3 text-base">
          List Your Business — It's Free
        </Link>
      </section>
    </div>
  );
}
