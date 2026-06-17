import { createClient } from "@/lib/supabase/server";
import { AdminReviewsTable } from "@/components/admin/AdminReviewsTable";

export const metadata = { title: "Manage Reviews" };

interface SearchParams { page?: string; vendor?: string; }

export default async function AdminReviewsPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const PER_PAGE = 25;
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const from = (page - 1) * PER_PAGE;

  let query = supabase
    .from("reviews")
    .select("*, vendor:vendors(business_name, slug), reviewer:profiles(full_name)", { count: "exact" });

  if (searchParams.vendor) query = query.eq("vendor_id", searchParams.vendor);

  const { data: reviews, count } = await query
    .order("created_at", { ascending: false })
    .range(from, from + PER_PAGE - 1);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Reviews</h1>
        <span className="text-sm text-gray-500">{count ?? 0} total</span>
      </div>

      <AdminReviewsTable reviews={reviews ?? []} />

      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2">
          {page > 1 && (
            <a href={`/admin/reviews?page=${page - 1}`} className="btn-secondary px-3 py-1.5 text-xs">← Prev</a>
          )}
          <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
          {page < totalPages && (
            <a href={`/admin/reviews?page=${page + 1}`} className="btn-secondary px-3 py-1.5 text-xs">Next →</a>
          )}
        </div>
      )}
    </div>
  );
}
