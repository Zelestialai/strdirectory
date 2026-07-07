import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { VendorCard } from "@/components/VendorCard";
import type { Market, Vendor, Category } from "@/types";
import { MapPin, ChevronRight, Users, Star, LayoutGrid } from "lucide-react";
import Link from "next/link";

// Revalidate every hour so new vendors appear without a full rebuild
export const revalidate = 3600;

interface PageProps {
  params: { slug: string };
  searchParams: { category?: string };
}

// Pre-render all active market slugs at build time
export async function generateStaticParams() {
  // Use service-role client — no request scope available at build time
  const { data } = await supabaseAdmin
    .from("markets")
    .select("slug")
    .eq("is_active", true);
  return (data ?? []).map((m) => ({ slug: m.slug }));
}

export async function generateMetadata({ params }: PageProps) {
  const supabase = createClient();
  const { data: market } = await supabase
    .from("markets")
    .select("name, state, tagline, description, cities")
    .eq("slug", params.slug)
    .single();

  if (!market) return { title: "Market Not Found" };

  const title = `${market.name} STR Service Providers — StrVend`;
  const description =
    market.description ||
    market.tagline ||
    `Find trusted cleaners, photographers, property managers, and more for your short-term rental in ${market.name}, ${market.state}.`;

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? "";
  const ogImage = `${siteUrl}/og/market/${params.slug}`;
  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: "website",
      images: [{ url: ogImage, width: 1200, height: 630, alt: title }],
    },
    twitter: {
      card: "summary_large_image",
      title,
      description,
      images: [ogImage],
    },
    alternates: {
      canonical: `/markets/${params.slug}`,
    },
  };
}

export default async function MarketPage({ params, searchParams }: PageProps) {
  const supabase = createClient();

  // ── Fetch market ─────────────────────────────────────────────────────────────
  const { data: market } = await supabase
    .from("markets")
    .select("*")
    .eq("slug", params.slug)
    .eq("is_active", true)
    .single();

  if (!market) notFound();
  const m = market as Market;

  // ── Fetch all categories ─────────────────────────────────────────────────────
  const { data: categories } = await supabase
    .from("categories")
    .select("*")
    .order("name");

  const allCats = (categories as Category[]) ?? [];
  const activeCategory = searchParams.category
    ? allCats.find((c) => c.slug === searchParams.category) ?? null
    : null;

  // ── Fetch all vendors in this market (one query, group in JS) ────────────────
  const { data: allVendors } = await supabase
    .from("vendors")
    .select("*, category:categories(*)")
    .eq("is_active", true)
    .in("city", m.cities)
    .order("subscription_tier", { ascending: false }) // featured first
    .order("avg_rating", { ascending: false })
    .order("review_count", { ascending: false })
    .limit(500);

  const vendors = (allVendors as Vendor[]) ?? [];

  // ── Market stats ─────────────────────────────────────────────────────────────
  const totalVendors = vendors.length;
  const totalReviews = vendors.reduce((sum, v) => sum + (v.review_count ?? 0), 0);
  const categoriesPresent = new Set(vendors.map((v) => v.category_id)).size;

  // ── Group vendors by category for spotlight sections ─────────────────────────
  const vendorsByCategory = new Map<string, Vendor[]>();
  for (const v of vendors) {
    if (!v.category_id) continue;
    if (!vendorsByCategory.has(v.category_id)) vendorsByCategory.set(v.category_id, []);
    vendorsByCategory.get(v.category_id)!.push(v);
  }

  // Sorted category sections: categories with most vendors first
  const categorySections = allCats
    .filter((c) => vendorsByCategory.has(c.id))
    .sort((a, b) => (vendorsByCategory.get(b.id)?.length ?? 0) - (vendorsByCategory.get(a.id)?.length ?? 0));

  // Filtered vendors for category view
  const filteredVendors = activeCategory
    ? vendors.filter((v) => v.category_id === activeCategory.id)
    : [];

  // ── Related markets in same state ────────────────────────────────────────────
  const { data: relatedMarkets } = await supabase
    .from("markets")
    .select("id, name, slug, state")
    .eq("state", m.state)
    .eq("is_active", true)
    .neq("slug", m.slug)
    .limit(5);

  // ── JSON-LD structured data ──────────────────────────────────────────────────
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ItemList",
    "name": `STR Service Providers in ${m.name}`,
    "description": `Find trusted short-term rental service providers in ${m.name}, ${m.state}`,
    "numberOfItems": totalVendors,
    "itemListElement": vendors.slice(0, 10).map((v, i) => ({
      "@type": "ListItem",
      "position": i + 1,
      "item": {
        "@type": "LocalBusiness",
        "name": v.business_name,
        "url": `/vendors/${v.slug}`,
        "address": { "@type": "PostalAddress", "addressLocality": v.city, "addressRegion": v.state },
        ...(v.avg_rating > 0 && {
          "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": v.avg_rating,
            "reviewCount": v.review_count,
          },
        }),
      },
    })),
  };

  return (
    <>
      {/* JSON-LD */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      {/* Hero */}
      <div className="bg-gradient-to-br from-brand-700 to-brand-900 text-white">
        <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
          <nav className="flex items-center gap-1.5 text-brand-300 text-xs mb-5">
            <Link href="/" className="hover:text-white transition">Home</Link>
            <ChevronRight className="h-3 w-3" />
            <Link href="/markets" className="hover:text-white transition">Markets</Link>
            <ChevronRight className="h-3 w-3" />
            <span className="text-white">{m.name}</span>
          </nav>

          <div className="flex items-center gap-2 mb-2">
            <MapPin className="h-5 w-5 text-brand-300" />
            <span className="text-brand-300 text-sm font-medium">{m.state}</span>
          </div>
          <h1 className="text-3xl font-bold sm:text-4xl">
            STR Service Providers in {m.name}
          </h1>
          {m.tagline && (
            <p className="mt-2 text-brand-200 text-lg max-w-2xl">{m.tagline}</p>
          )}

          {/* Cities */}
          <div className="mt-4 flex flex-wrap gap-2">
            {m.cities.map((city) => (
              <span
                key={city}
                className="rounded-full bg-white/10 border border-white/20 px-3 py-1 text-xs text-white/90"
              >
                {city}
              </span>
            ))}
          </div>

          {/* Stats bar */}
          <div className="mt-6 flex flex-wrap gap-6">
            {[
              { icon: Users, label: `${totalVendors} provider${totalVendors !== 1 ? "s" : ""}` },
              { icon: LayoutGrid, label: `${categoriesPresent} categor${categoriesPresent !== 1 ? "ies" : "y"}` },
              { icon: Star, label: `${totalReviews} review${totalReviews !== 1 ? "s" : ""}` },
            ].map(({ icon: Icon, label }) => (
              <div key={label} className="flex items-center gap-1.5 text-brand-200 text-sm">
                <Icon className="h-4 w-4 text-brand-300" />
                {label}
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-8">

          {/* Sidebar */}
          <aside className="w-full lg:w-56 shrink-0 space-y-6">
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">
                Browse by Category
              </h3>
              <div className="space-y-0.5">
                <Link
                  href={`/markets/${m.slug}`}
                  className={`block rounded-lg px-3 py-2 text-sm transition ${
                    !activeCategory
                      ? "bg-brand-50 text-brand-700 font-medium"
                      : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  All Categories
                </Link>
                {categorySections.map((cat) => {
                  const count = vendorsByCategory.get(cat.id)?.length ?? 0;
                  return (
                    <Link
                      key={cat.id}
                      href={`/markets/${m.slug}?category=${cat.slug}`}
                      className={`flex items-center justify-between rounded-lg px-3 py-2 text-sm transition ${
                        activeCategory?.id === cat.id
                          ? "bg-brand-50 text-brand-700 font-medium"
                          : "text-gray-600 hover:bg-gray-50"
                      }`}
                    >
                      <span>{cat.name}</span>
                      <span className="text-xs text-gray-400">{count}</span>
                    </Link>
                  );
                })}
              </div>
            </div>

            {/* Related markets */}
            {relatedMarkets && relatedMarkets.length > 0 && (
              <div>
                <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">
                  More in {m.state}
                </h3>
                <div className="space-y-0.5">
                  {relatedMarkets.map((rm) => (
                    <Link
                      key={rm.id}
                      href={`/markets/${rm.slug}`}
                      className="block rounded-lg px-3 py-2 text-sm text-gray-600 hover:bg-gray-50 transition"
                    >
                      {rm.name}
                    </Link>
                  ))}
                </div>
              </div>
            )}
          </aside>

          {/* Main panel */}
          <div className="flex-1 min-w-0">

            {/* ── Category-filtered view ── */}
            {activeCategory && (
              <div>
                <div className="flex items-center justify-between mb-5">
                  <h2 className="text-xl font-bold text-gray-900">
                    {activeCategory.name} in {m.name}
                  </h2>
                  <Link href={`/markets/${m.slug}`} className="text-xs text-brand-600 hover:underline">
                    ← All categories
                  </Link>
                </div>
                <p className="text-sm text-gray-500 mb-6">
                  {filteredVendors.length} provider{filteredVendors.length !== 1 ? "s" : ""}
                </p>
                {filteredVendors.length > 0 ? (
                  <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
                    {filteredVendors.map((v) => (
                      <VendorCard key={v.id} vendor={v} />
                    ))}
                  </div>
                ) : (
                  <div className="text-center py-20 text-gray-400">
                    <p className="text-lg font-medium">No providers found</p>
                    <Link href={`/markets/${m.slug}`} className="text-sm text-brand-600 mt-2 block hover:underline">
                      View all categories →
                    </Link>
                  </div>
                )}
              </div>
            )}

            {/* ── Category spotlight sections ── */}
            {!activeCategory && (
              <div className="space-y-12">
                {categorySections.map((cat) => {
                  const catVendors = vendorsByCategory.get(cat.id) ?? [];
                  const top3 = catVendors.slice(0, 3);
                  const remaining = catVendors.length - top3.length;
                  return (
                    <section key={cat.id}>
                      <div className="flex items-center justify-between mb-4">
                        <h2 className="text-lg font-bold text-gray-900">{cat.name}</h2>
                        {remaining > 0 && (
                          <Link
                            href={`/markets/${m.slug}?category=${cat.slug}`}
                            className="text-sm text-brand-600 hover:text-brand-700 font-medium transition"
                          >
                            View all {catVendors.length} →
                          </Link>
                        )}
                      </div>

                      <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
                        {top3.map((v) => (
                          <VendorCard key={v.id} vendor={v} />
                        ))}
                      </div>

                      {remaining > 0 && (
                        <div className="mt-4 text-center">
                          <Link
                            href={`/markets/${m.slug}?category=${cat.slug}`}
                            className="inline-flex items-center gap-1.5 text-sm text-brand-600 hover:text-brand-700 font-medium border border-brand-200 rounded-lg px-4 py-2 hover:bg-brand-50 transition"
                          >
                            See {remaining} more {cat.name.toLowerCase()} provider{remaining !== 1 ? "s" : ""} in {m.name}
                            <ChevronRight className="h-3.5 w-3.5" />
                          </Link>
                        </div>
                      )}
                    </section>
                  );
                })}

                {categorySections.length === 0 && (
                  <div className="text-center py-20 text-gray-400">
                    <MapPin className="mx-auto h-10 w-10 mb-3 opacity-30" />
                    <p className="text-lg font-medium">No providers yet in {m.name}</p>
                    <p className="text-sm mt-1">Check back soon — we're adding vendors regularly.</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
}
