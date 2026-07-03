import { createClient } from "@/lib/supabase/server";
import { AdminVendorTable } from "@/components/admin/AdminVendorTable";

export const metadata = { title: "Manage Vendors" };

interface SearchParams { filter?: string; search?: string; page?: string; }

export default async function AdminVendorsPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const PER_PAGE = 20;
  const from = (page - 1) * PER_PAGE;

  let query = supabase
    .from("vendors")
    .select("*, category:categories(name,slug)", { count: "exact" });

  if (searchParams.filter === "pending")  query = query.eq("is_verified", false).eq("is_active", true);
  if (searchParams.filter === "verified") query = query.eq("is_verified", true);
  if (searchParams.filter === "inactive") query = query.eq("is_active", false);
  if (searchParams.filter === "featured") query = query.eq("is_featured", true);
  if (searchParams.search) query = query.ilike("business_name", `%${searchParams.search}%`);

  const { data: vendors, count } = await query
    .order("created_at", { ascending: false })
    .range(from, from + PER_PAGE - 1);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Vendors</h1>
        <span className="text-sm text-gray-500">{count ?? 0} total</span>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap gap-2">
        {[
          { label: "All",      value: "" },
          { label: "Pending",  value: "pending" },
          { label: "Verified", value: "verified" },
          { label: "Featured", value: "featured" },
          { label: "Inactive", value: "inactive" },
        ].map(({ label, value }) => (
          <a
            key={value}
            href={`/admin/vendors${value ? `?filter=${value}` : ""}`}
            className={`rounded-full border px-3 py-1 text-xs font-medium transition ${
              (searchParams.filter ?? "") === value
                ? "bg-brand-600 text-white border-brand-600"
                : "bg-white text-gray-600 hover:border-brand-400 hover:text-brand-700"
            }`}
          >
            {label}
          </a>
        ))}

        {/* Search */}
        <form method="GET" action="/admin/vendors" className="ml-auto">
          <input
            name="search"
            defaultValue={searchParams.search}
            className="input py-1 text-xs w-48"
            placeholder="Search by name…"
          />
        </form>
      </div>

      <AdminVendorTable vendors={vendors ?? []} />

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2">
          {page > 1 && (
            <a
              href={`/admin/vendors?${new URLSearchParams({ ...(searchParams.filter ? { filter: searchParams.filter } : {}), ...(searchParams.search ? { search: searchParams.search } : {}), page: String(page - 1) })}`}
              className="btn-secondary px-3 py-1.5 text-xs"
            >← Prev</a>
          )}
          <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
          {page < totalPages && (
            <a
              href={`/admin/vendors?${new URLSearchParams({ ...(searchPara