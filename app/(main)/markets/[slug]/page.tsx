import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
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
  const supabase = createClient();
  const { data } = await supabase
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
            <MapPin className="h-5 w-5 text-b