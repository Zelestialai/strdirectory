import { createClient } from "@/lib/supabase/server";
import { AdminCategoriesTable } from "@/components/admin/AdminCategoriesTable";

export const metadata = { title: "Manage Categories" };

export default async function AdminCategoriesPage() {
  const supabase = createClient();

  const { data: categories } = await supabase
    .from("categories")
    .select("*, vendor_count:vendors(count)")
    .order("name");

  // Attach vendor counts
  const enriched = (categories ?? []).map((c: any) => ({
    ...c,
    vendor_count: c.vendor_count?.[0]?.count ?? 0,
  }));

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Categories</h1>
        <span className="text-sm text-gray-500">{enriched.length} total</span>
      </div>

      <AdminCategoriesTable categories={enriched} />
    </div>
  );
}
