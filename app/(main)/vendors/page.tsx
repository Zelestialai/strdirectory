import { createClient } from "@/lib/supabase/server";
import { VendorCard } from "@/components/VendorCard";
import { CategoryCard } from "@/components/CategoryCard";
import type { Vendor, Category, Market } from "@/types";
import { Search, SlidersHorizontal } from "lucide-react";

interface SearchParams {
  q?: string;
  category?: string;
  city?: string;
  state?: string;
  market?: string;
  min_rating?: string;
  page?: string;
}

const PER_PAGE = 12;

export default async function VendorsPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const from = (page - 1) * PER_PAGE;

  // Categories + markets for sidebar
  const { data: categories } = await supabase.from("categories").select("*").order("name");
  const { data: markets } = await supabase.from("markets").select("*").eq("is_active", true).order("name");

  // Resolve active market (if ?market= param present)
  const activeMarket = searchParams.market
    ? (markets as Market[])?.find((m) => m.slug === searchParams.market)
    : null;

  // Build query
  let query = supabase
    .from("vendors")
    .select("*, category:categories(*)", { count: "exact" })
    .eq("is_active", true);

  if (searchParams.q) {
    query = query.textSearch("business_name", searchParams.q, { type: "websearch" });
  }
  if (searchParams.category) {
    const cat = (categories as Category[])?.find((c) => c.slug === searchParams.category);
    if (cat) query = query.eq("category_id", cat.id);
  }
  // Market filter takes precedence over manual city/state inputs
  if (activeMarket) {
    query = query.in("city", activeMarket.cities);
  } else {
    if (searchParams.city) query = query.ilike("city", `%${searchParams.city}%`);
    if (searchParams.state) query = query.ilike("state", `%${searchParams.state}%`);
  }
  if (searchParams.min_rating) query = query.gte("avg_rating", parseFloat(searchParams.min_rating));

  const { data: vendors, count } = await query
    .order("is_featured", { ascending: false })
    .order("avg_rating", { ascending: false })
    .range(from, from + PER_PAGE - 1);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);
  const activeCategory = (categories as Category[])?.find((c) => c.slug === searchParams.category);

  function buildHref(params: Record<string, string | undefined>) {
    const p = new URLSearchParams();
    const merged = {
      q: searchParams.q,
      category: searchParams.category,
      city: searchParams.city,
      state: searchParams.state,
      market: searchParams.market,
      min_rating: searchParams.min_rating,
      ...params,
    };
    Object.entries(merged).forEach(([k, v]) => { if (v) p.set(k, v); });
    return `/vendors?${p.toString()}`;
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">
        {activeCategory ? activeCategory.name : activeMarket ? `${activeMarket.name} Vendors` : "Browse All Vendors"}
      </h1>
      <p className="text-gray-500 mb-8">
        {count ?? 0} provider{count !== 1 ? "s" : ""} found
        {activeMarket ? ` in ${activeMarket.name}` : searchParams.city ? ` in ${searchParams.city}` : ""}
      </p>

      <div className="flex flex-col lg:flex-row gap-8">
        {/* ─── Sidebar ─── */}
        <aside className="w-full lg:w-64 shrink-0 space-y-6">
          {/* Search */}
          <form method="GET" action="/vendors">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
              <input
                name="q"
                defaultValue={searchParams.q}
                className="input pl-9"
                placeholder="Search vendors…"
              />
            </div>
            {searchParams.category && <input type="hidden" name="category" value={searchParams.category} />}
            {searchParams.city && <input type="hidden" name="city" value={searchParams.city} />}
          </form>

          {/* Market filter */}
          {markets && (markets as Market[]).length > 0 && (
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">Market</h3>
              <div className="space-y-1">
                <a
                  href={buildHref({ market: undefined, city: undefined, state: undefined, page: undefined })}
                  className={`block rounded-lg px-3 py-2 text-sm transition ${
                    !searchParams.market ? "bg-brand-50 text-brand-700 font-medium" : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  All Markets
                </a>
                {(markets as Market[]).map((m) => (
                  <a
                    key={m.id}
                    href={buildHref({ market: m.slug, city: undefined, state: undefined, page: undefined })}
                    className={`block rounded-lg px-3 py-2 text-sm transition ${
                      searchParams.market === m.slug
                        ? "bg-brand-50 text-brand-700 font-medium"
                        : "text-gray-600 hover:bg-gray-50"
                    }`}
                  >
                    {m.name}
                    <span className="ml-1 text-xs text-gray-400">({m.state})</span>
                  </a>
                ))}
              </div>
            </div>
          )}

          {/* Manual location filter — hidden when a market is active */}
          {!activeMarket && (
            <form method="GET" action="/vendors" className="space-y-2">
              <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 flex items-center gap-1">
                <SlidersHorizontal className="h-3 w-3" /> Custom Location
              </h3>
              <input name="city" defaultValue={searchParams.city} className="input" placeholder="City" />
              <input name="state" defaultValue={searchParams.state} className="input" placeholder="State (e.g. FL)" />
              {searchParams.q && <input type="hidden" name="q" value={searchParams.q} />}
              {searchParams.category && <input type="hidden" name="category" value={searchParams.category} />}
              <button type="submit" className="btn-secondary w-full justify-center text-xs">Apply</button>
            </form>
          )}

          {/* Rating filter */}
          <div>
            <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">Min Rating</h3>
            <div className="space-y-1">
              {[null, "4", "3", "2"].map((r) => (
                <a
                  key={r ?? "any"}
                  href={buildHref({ min_rating: r ?? undefined, page: undefined })}
                  className={`block rounded-lg px-3 py-2 text-sm transition ${
                    (searchParams.min_rating ?? null) === r
                      ? "bg-brand-50 text-brand-700 font-medium"
                      : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  {r ? `${r}★ & up` : "Any rating"}
                </a>
              ))}
            </div>
          </div>

          {/* Category filter */}
          <div>
            <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">Category</h3>
            <div className="space-y-1">
              <a
                href={buildHref({ category: undefined, page: undefined })}
                className={`block rounded-lg px-3 py-2 text-sm transition ${
                  !searchParams.category ? "bg-brand-50 text-brand-700 font-medium" : "text-gray-600 hover:bg-gray-50"
                }`}
              >
                All Categories
              </a>
              {(categories as Category[])?.map((cat) => (
                <a
                  key={cat.id}
                  href={buildHref({ category: cat.slug, page: undefined })}
                  className={`block rounded-lg px-3 py-2 text-sm transition ${
                    searchParams.category === cat.slug
                      ? "bg-brand-50 text-brand-700 font-medium"
                      : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  {cat.name}
                </a>
              ))}
            </div>
          </div>
        </aside>

        {/* ─── Results grid ─── */}
        <div className="flex-1">
          {vendors && vendors.length > 0 ? (
            <>
              <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
                {(vendors as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
              </div>

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="mt-10 flex items-center justify-center gap-2">
                  {page > 1 && (
                    <a href={buildHref({ page: String(page - 1) })} className="btn-secondary px-3 py-1.5 text-xs">← Prev</a>
                  )}
                  <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
                  {page < totalPages && (
                    <a href={buildHref({ page: String(page + 1) })} className="btn-secondary px-3 py-1.5 text-xs">Next →</a>
                  )}
                </div>
              )}
            </>
          ) : (
            <div className="text-center py-20 text-gray-400">
              <Search className="mx-auto h-10 w-10 mb-3 opacity-30" />
              <p className="text-lg font-medium">No vendors found</p>
              <p className="text-sm mt-1">Try adjusting your filters or search term.</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
