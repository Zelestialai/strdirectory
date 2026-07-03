import { Suspense } from "react";
import { createClient } from "@/lib/supabase/server";
import { VendorCard } from "@/components/VendorCard";
import { VendorSearchControls } from "@/components/VendorSearchControls";
import type { Vendor, Category, Market } from "@/types";
import { Search, X } from "lucide-react";
import Link from "next/link";

interface SearchParams {
  q?: string;
  category?: string;
  city?: string;
  state?: string;
  market?: string;
  min_rating?: string;
  sort?: string;
  page?: string;
}

const PER_PAGE = 12;

export default async function VendorsPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const from = (page - 1) * PER_PAGE;
  const sort = searchParams.sort ?? "best_rated";

  // Categories + markets for sidebar/controls
  const [{ data: categories }, { data: markets }] = await Promise.all([
    supabase.from("categories").select("*").order("name"),
    supabase.from("markets").select("*").eq("is_active", true).order("name"),
  ]);

  const activeMarket = searchParams.market
    ? (markets as Market[])?.find((m) => m.slug === searchParams.market)
    : null;
  const activeCategory = (categories as Category[])?.find((c) => c.slug === searchParams.category);

  // ── Build query ──────────────────────────────────────────────────────────────
  let query = supabase
    .from("vendors")
    .select("*, category:categories(*)", { count: "exact" })
    .eq("is_active", true);

  // Multi-field keyword search: name, tagline, description
  if (searchParams.q?.trim()) {
    const q = searchParams.q.trim();
    query = query.or(
      `business_name.ilike.%${q}%,tagline.ilike.%${q}%,description.ilike.%${q}%`
    );
  }

  if (activeCategory) query = query.eq("category_id", activeCategory.id);

  if (activeMarket) {
    query = query.in("city", activeMarket.cities);
  } else {
    if (searchParams.city) query = query.ilike("city", `%${searchParams.city}%`);
    if (searchParams.state) query = query.ilike("state", `%${searchParams.state}%`);
  }

  if (searchParams.min_rating) {
    query = query.gte("avg_rating", parseFloat(searchParams.min_rating));
  }

  // ── Sorting ──────────────────────────────────────────────────────────────────
  switch (sort) {
    case "most_reviewed":
      query = query.order("review_count", { ascending: false });
      break;
    case "newest":
      query = query.order("created_at", { ascending: false });
      break;
    case "alpha":
      query = query.order("business_name", { ascending: true });
      break;
    case "featured":
      query = query
        .order("is_featured", { ascending: false })
        .order("avg_rating", { ascending: false });
      break;
    case "best_rated":
    default:
      query = query
        .order("is_featured", { ascending: false })
        .order("avg_rating", { ascending: false })
        .order("review_count", { ascending: false });
  }

  const { data: vendors, count } = await query.range(from, from + PER_PAGE - 1);
  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);

  // ── Active filter pills ───────────────────────────────────────────────────────
  function buildHref(params: Record<string, string | undefined>) {
    const p = new URLSearchParams();
    const merged: Record<string, string | undefined> = {
      q: searchParams.q,
      category: searchParams.category,
      city: searchParams.city,
      state: searchParams.state,
      market: searchParams.market,
      min_rating: searchParams.min_rating,
      sort: sort !== "best_rated" ? sort : undefined,
      ...params,
    };
    Object.entries(merged).forEach(([k, v]) => { if (v) p.set(k, v); });
    return `/vendors${p.toString() ? `?${p.toString()}` : ""}`;
  }

  type FilterPill = { label: string; href: string };
  const activeFilters: FilterPill[] = [];
  if (searchParams.q) activeFilters.push({ label: `"${searchParams.q}"`, href: buildHref({ q: undefined, page: undefined }) });
  if (activeCategory) activeFilters.push({ label: activeCategory.name, href: buildHref({ category: undefined, page: undefined }) });
  if (activeMarket) activeFilters.push({ label: activeMarket.name, href: buildHref({ market: undefined, page: undefined }) });
  if (searchParams.city) activeFilters.push({ label: searchParams.city, href: buildHref({ city: undefined, page: undefined }) });
  if (searchParams.state) activeFilters.push({ label: searchParams.state, href: buildHref({ state: undefined, page: undefined }) });
  if (searchParams.min_rating) activeFilters.push({ label: `${searchParams.min_rating}★ & up`, href: buildHref({ min_rating: undefined, page: undefined }) });
  const hasActiveFilters = activeFilters.length > 0;

  const headingText = activeCategory
    ? activeCategory.name
    : activeMarket
    ? `${activeMarket.name} Vendors`
    : "Browse Vendors";

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
      <div className="mb-6">
        <h1 className="text-3xl font-bold text-gray-900">{headingText}</h1>
        <p className="text-gray-500 mt-1">
          {count ?? 0} provider{count !== 1 ? "s" : ""} found
          {activeMarket ? ` in ${activeMarket.name}` : ""}
        </p>
      </div>

      <div className="flex flex-col lg:flex-row gap-8">
        {/* ─── Sidebar ───────────────────────────────────────────────────────── */}
        <aside className="w-full lg:w-60 shrink-0 space-y-6">
          {/* Search + market + sort (client controls — needs Suspense for useSearchParams) */}
          <Suspense fallback={<div className="h-24 rounded-xl bg-gray-100 animate-pulse" />}>
            <VendorSearchControls markets={(markets as Market[]) ?? []} />
          </Suspense>

          {/* Rating filter */}
          <div>
            <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">Min Rating</h3>
            <div className="space-y-0.5">
              {[null, "4", "3", "2"].map((r) => (
                <a
                  key={r ?? "any"}
                  href={buildHref({ min_rating: r ?? undefined, page: undefined })}
                  className={`flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm transition ${
                    (searchParams.min_rating ?? null) === r
                      ? "bg-brand-50 text-brand-700 font-medium"
                      : "text-gray-600 hover:bg-gray-50"
                  }`}
                >
                  {r ? (
                    <>
                      <span className="text-amber-400">{"★".repeat(parseInt(r))}</span>
                      <span>{r}+ stars</span>
                    </>
                  ) : "Any rating"}
                </a>
              ))}
            </div>
          </div>

          {/* Category filter */}
          <div>
            <h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mb-2">Category</h3>
            <div className="space-y-0.5">
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

        {/* ─── Results ───────────────────────────────────────────────────────── */}
        <div className="flex-1 min-w-0">
          {/* Active filter pills */}
          {hasActiveFilters && (
            <div className="flex flex-wrap items-center gap-2 mb-5">
              {activeFilters.map((f) => (
                <Link
                  key={f.label}
                  href={f.href}
                  className="inline-flex items-center gap-1.5 rounded-full border border-brand-200 bg-brand-50 px-3 py-1 text-xs font-medium text-brand-700 hover:bg-red-50 hover:border-red-200 hover:text-red-600 transition-colors"
                >
                  {f.label} <X className="h-3 w-3" />
                </Link>
              ))}
              <Link
                href="/vendors"
                className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 ml-1"
              >
                Clear all
              </Link>
            </div>
          )}

          {vendors && vendors.length > 0 ? (
            <>
              <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
                {(vendors as Vendor[]).map((v) => <VendorCard key={v.id} vendor={v} />)}
              </div>

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="mt-10 flex items-center justify-center gap-2">
                  {page > 1 && (
                    <a href={buildHref({ page: String(page - 1) })} className="btn-secondary px-4 py-2 text-sm">← Prev</a>
                  )}
                  <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
                  {page < totalPages && (
                    <a href={buildHref({ page: String(page + 1) })} className="btn-secondary px-4 py-2 text-sm">Next →</a>
                  )}
                </div>
              )}
            </>
          ) : (
            <div className="text-center py-20 text-gray-400">
              <Search className="mx-auto h-10 w-10 mb-3 opacity-30" />
              <p className="text-lg font-medium text-gray-600">No vendors found</p>
              <p className="text-sm mt-1">Try adjusting your search or filters.</p>
              {hasActiveFilters && (
                <Link href="/vendors" className="btn-s