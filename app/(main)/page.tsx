import Link from "next/link";
import { Search, Star, Shield, Zap, MapPin, CheckCircle } from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { getVendorCityCounts } from "@/lib/supabase/queries";
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

  const cityCount = await getVendorCityCounts(supabase);
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
      {/* ── Hero ── */}
      <section className="relative bg-brand-700 text-white overflow-hidden">
        {/* Subtle background texture */}
        <div className="absolute inset-0 opacity-5">
          <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
            <defs>
              <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
                <path d="M 40 0 L 0 0 0 40" fill="none" stroke="white" strokeWidth="1"/>
              </pattern>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid)" />
          </svg>
        </div>
        {/* Decorative blobs */}
        <div className="absolute -top-20 -right-20 w-80 h-80 rounded-full bg-brand-600 opacity-40" />
        <div className="absolute -bottom-10 -left-10 w-56 h-56 rounded-full bg-brand-800 opacity-50" />

        <div className="relative mx-auto max-w-4xl px-4 pt-20 pb-16 text-center sm:px-6 lg:px-8">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 rounded-full bg-white/10 border border-white/20 px-4 py-1.5 text-sm font-medium text-brand-100 mb-8">
            <MapPin className="h-3.5 w-3.5 text-coral-400" />
            The STR Vendor Directory
          </div>

          <h1 className="text-4xl font-extrabold tracking-tight leading-tight sm:text-5xl lg:text-6xl">
            Find trusted STR<br />
            <span className="text-coral-400">service providers</span><br />
            near you
          </h1>
          <p className="mt-6 text-lg text-brand-100 max-w-2xl mx-auto leading-relaxed">
            Cleaners, photographers, property managers, and more — all vetted and reviewed by real STR hosts.
          </p>

          {/* Search bar */}
          <form action="/vendors" method="GET" className="mt-10 flex flex-col sm:flex-row gap-3 max-w-2xl mx-auto">
            <div className="relative flex-1">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
              <input
                name="q"
                className="w-full rounded-xl border-0 bg-white pl-11 pr-4 py-3.5 text-gray-900 shadow-lg focus:outline-none focus:ring-2 focus:ring-coral-400 text-sm"
                placeholder="Search by name, city, or service…"
              />
            </div>
            <button
              type="submit"
              className="rounded-xl bg-coral-500 px-7 py-3.5 font-semibold text-white shadow-lg hover:bg-coral-600 transition text-sm whitespace-nowrap"
            >
              Search
            </button>
          </form>

          {/* Stats row */}
          <div className="mt-10 flex flex-wrap items-center justify-center gap-x-8 gap-y-3">
            {[
              { value: "2,400+", label: "Verified vendors" },
              { value: "106",    label: "STR markets" },
              { value: "12",     label: "Service categories" },
            ].map(({ value, label }) => (
              <div key={label} className="flex items-center gap-2 text-sm text-brand-100">
                <span className="font-bold text-white text-base">{value}</span>
                <span>{label}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Trust pills */}
        <div className="relative border-t border-white/10 bg-brand-800/60">
          <div className="mx-auto max-w-5xl px-4 py-4 sm:px-6 flex flex-wrap items-center justify-center gap-4 sm:gap-8">
            {[
              "Verified vendor profiles",
              "STR-specific network",
              "Free to browse",
              "Real host reviews",
            ].map((t) => (
              <div key={t} className="flex items-center gap-1.5 text-xs text-brand-200">
                <CheckCircle className="h-3.5 w-3.5 text-coral-400 shrink-0" />
                {t}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Browse by Category ── */}
      <section className="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
        <div className="flex items-end justify-between mb-8">
          <div>
            <p className="text-xs font-semibold uppercase tracking-wider text-brand-600 mb-1">What are you looking for?</p>
            <h2 className="text-2xl font-bold text-gray-900">Browse by Category</h2>
          </div>
          <Link href="/vendors" className="text-sm text-brand-600 font-medium hover:text-brand-800 transition hidden sm:block">
            All vendors →
          </Link>
        </div>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {(categories as Category[] ?? []).map((cat) => (
            <CategoryCard key={cat.id} category={cat} />
          ))}
        </div>
      </section>

      {/* ── Browse by Market ── */}
      {markets && markets.length > 0 && (
        <section className="bg-gray-50 py-16">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div className="flex items-end justify-between mb-8">
              <div>
                <p className="text-xs font-semibold uppercase tracking-wider text-brand-600 mb-1">Where are your properties?</p>
                <h2 className="text-2xl font-bold text-gray-900">Browse by Market</h2>
                <p className="mt-1 text-sm text-gray-500">Covers each city and all surrounding STR hotspots.</p>
              </div>
              <Link href="/markets" className="text-sm text-brand-600 font-medium hover:text-brand-800 transition whitespace-nowrap hidden sm:block">
                All 106 markets →
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

      {/* ── Featured vendors ── */}
      {featured && featured.length > 0 && (
        <section className="py-16">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div className="flex items-end justify-between mb-8">
              <div>
                <p className="text-xs font-semibold uppercase tracking-wider text-brand-600 mb-1">Hand-picked by our team</p>
                <h2 className="text-2xl font-bold text-gray-900">Featured Vendors</h2>
              </div>
              <Link href="/vendors?featured=true" className="text-sm text-brand-600 font-medium hover:text-brand-800 transition hidden sm:block">
                View all →
              </Link>
            </div>
            <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
              {(featured as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
            </div>
          </div>
        </section>
      )}

      {/* ── Recently joined ── */}
      {recent && recent.length > 0 && (
        <section className="bg-gray-50 py-16">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div className="flex items-end justify-between mb-8">
              <div>
                <p className="text-xs font-semibold uppercase tracking-wider text-brand-600 mb-1">New on STRVend</p>
                <h2 className="text-2xl font-bold text-gray-900">Recently Joined</h2>
              </div>
              <Link href="/vendors" className="text-sm text-brand-600 font-medium hover:text-brand-800 transition hidden sm:block">
                See all vendors →
              </Link>
            </div>
            <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
              {(recent as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
            </div>
          </div>
        </section>
      )}

      {/* ── Why STRVend? ── */}
      <section className="bg-brand-700 text-white py-20">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 text-center">
          <p className="text-xs font-semibold uppercase tracking-wider text-brand-300 mb-3">Why choose us</p>
          <h2 className="text-3xl font-bold mb-12">Why STRVend?</h2>
          <div className="grid gap-10 sm:grid-cols-3">
            {[
              {
                icon: Shield,
                title: "Verified profiles",
                desc: "Every vendor is reviewed by our team before being marked as trusted.",
              },
              {
                icon: Star,
                title: "Honest reviews",
                desc: "Only verified clients can leave reviews — so every star is earned.",
              },
              {
                icon: Zap,
                title: "Fast connections",
                desc: "Send an inquiry in seconds and hear back directly from the vendor.",
              },
            ].map(({ icon: Icon, title, desc }) => (
              <div key={title} className="flex flex-col items-center gap-4">
                <span className="flex h-14 w-14 items-center justify-center rounded-2xl bg-white/10 border border-white/10">
                  <Icon className="h-6 w-6 text-coral-400" />
                </span>
                <h3 className="font-semibold text-lg">{title}</h3>
                <p className="text-sm text-brand-200 leading-relaxed">{desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Vendor CTA ── */}
      <section className="mx-auto max-w-3xl px-4 py-24 text-center sm:px-6">
        <div className="inline-flex items-center gap-2 rounded-full bg-coral-50 px-4 py-1.5 text-sm font-medium text-coral-600 mb-6">
          🏠 For service providers
        </div>
        <h2 className="text-3xl font-bold text-gray-900">Are you a service provider?</h2>
        <p className="mt-4 text-gray-500 text-lg">
          Create a free listing and start connecting with STR hosts in your area today.
        </p>
        <Link
          href="/register"
          className="inline-flex items-center gap-2 mt-8 rounded-xl bg-coral-500 px-8 py-4 text-base font-semibold text-white hover:bg-coral-600 transition shadow-lg"
        >
          List Your Business — It&apos;s Free
        </Link>
      </section>
    </div>
  );
}
