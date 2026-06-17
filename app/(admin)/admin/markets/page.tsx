import { createClient } from "@/lib/supabase/server";
import { AdminMarketsTable } from "@/components/admin/AdminMarketsTable";

export const metadata = { title: "Manage Markets" };

export default async function AdminMarketsPage() {
  const supabase = createClient();

  const { data: markets, count } = await supabase
    .from("markets")
    .select("*", { count: "exact" })
    .order("name");

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Markets</h1>
        <span className="text-sm text-gray-500">{count ?? 0} total</span>
      </div>

      <AdminMarketsTable markets={markets ?? []} />
    </div>
  );
}
