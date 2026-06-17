import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { VendorCard } from "@/components/VendorCard";
import type { Market, Vendor, Category } from "@/types";
import { MapPin, ChevronRight } from "lucide-react";
import Link from "next/link";

interface PageProps {
  params: { slug: string };
  searchParams: { category?: string; q?: string };
}

export async function generateMetadata({ params }: PageProps) {
  const supabase = createClient();
  const { data: market } = await supabase
    .from("markets")
    .select("name, tagline")
    .eq("slug", params.slug)
    .single();
  if (!market) return { title: "Market Not Found" };
  return { title: `${market.name} STR Service Providers — STR Pro Directory` };
}

export default async function MarketPage({ params, searchParams }: PageProps) {
  const supabase = createClient();

  // Fetch market
  const { data: market } = await supabase
    .from("markets")
    .select("*")
    .eq("slug", params.slug)
    .eq("is_active", true)
    .single();

  if (!market) notFound();

  const m = market as Market;

  // Fetch all categories for sidebar
  const { data: categories } = await supabase
    .from("categories")
    .select("*")
    .order("name");

  // Build vendor query — filter by all cities in this market
  let query = supabase
    .from("vendors")
    .select("*, category:categories(*)", { count: "exact" })
    .eq("is_active", true)
    .in("city", m.cities);

  if (searchParams.category) {
    const cat = (categories as Category[])?.find((c) => c.slug === searchParams.category);
    if (cat) query = query.eq("category_id", cat.id);
  }
  if (searchParams.q) {
    query = query.ilike("business_name", `%${searchParams.q}%`);
  }

  const { data: vendors, count } = await query
    .order("is_featured", { ascending: false })
    .order("avg_rating", { ascending: false });

  const activeCategory = (categories as Category[])?.find(
    (c) => c.slug === searchParams.category
  );

  function buildHref(params: Record<string, string | undefined>) {
    const p = new URLSearchParams();
    const base = { category: searchParams.category, q: searchParams.q, ...params };
    Object.entries(base).forEach(([k, v]) => { if (v) p.set(k, v); });
    const qs = p.toString();
    return `/markets/${m.slug}${qs ? `?${qs}` : ""}`;
  }

  return (
    <div>
      {/* Hero header */}
      <div className="bg-gradient-to-br from-brand-700 to-brand-900 text-white">
        <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
          {/* Breadcrumb */}
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
          <h1 className="text-3xl font-bold sm:text-4xl">{m.name}</h1>
          {m.tagline && (
            <p className="mt-2 text-brand-200 text-lg max-w-2xl">{m.tagline}</p>
          )}
          {m.description && (
            <p className="mt-3 text-brand-300 text-sm max-w-2xl leading-relaxed">{m.description}</p>
          )}

          {/* Cities covered */}
          <div className="mt-5 flex flex-wrap gap-2">
            {m.cities.map((city) => (
              <span
                key={city}
                className="rounded-full bg-white/10 border border-white/20 px-3 py-1 text-xs text-white/90"
              >
                {city}
              </span>
            ))}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Sidebar */}
          <aside className="w-full lg:w-56 shrink-0 space-y-6">
            {/* Search */}
            <form method="GET">
              <input
                name="q"
                defaultValue={searchParams.q}
                className="input"
                placeholder="Search vendors…"
              />
              {searchParams.category && (
                <input type="hidden" name="category" value={searchParams.category} />
              )}
            </form>

            {/* Category filter */}
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">
                Filter by Category
              </h3>
              <div className="space-y-0.5">
                <Link
                  href={buildHref({ category: undefined })}
                  className={`block rounded-lg px-3 py-2 text-sm transition ${
                    !searchParams.category
                      ? "bg-brand-50 text-brand-700 font-medium"
                      : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  All Categories
                </Link>
                {(categories as Category[])?.map((cat) => (
                  <Link
                    key={cat.id}
                    href={buildHref({ category: cat.slug })}
                    className={`block rounded-lg px-3 py-2 text-sm transition ${
                      searchParams.category === cat.slug
                        ? "bg-brand-50 text-brand-700 font-medium"
                        : "text-gray-600 hover:bg-gray-50"
                    }`}
                  >
                    {cat.name}
                  </Link>
                ))}
              </div>
            </div>
          </aside>

          {/* Vendor grid */}
          <div className="flex-1">
            <p className="text-sm text-gray-500 mb-6">
              <span className="font-semibold text-gray-800">{count ?? 0}</span> provider{count !== 1 ? "s" : ""} in {m.name}
              {activeCategory ? ` — ${activeCategory.name}` : ""}
            </p>

            {vendors && vendors.length > 0 ? (
              <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
                {(vendors as Vendor[]).map((v) => (
                  <VendorCard key={v.id} vendor={v} />
                ))}
              </div>
            ) : (
              <div className="text-center py-20 text-gray-400">
                <MapPin className="mx-auto h-10 w-10 mb-3 opacity-30" />
                <p className="text-lg font-medium">No vendors found</p>
                <p className="text-sm mt-1">Try removing the category filter.</p>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
