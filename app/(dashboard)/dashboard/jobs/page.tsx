import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { CleanerJobs } from "@/components/turnover/CleanerJobs";

export const metadata = { title: "Turnover Jobs" };

export default async function CleanerJobsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/dashboard/jobs");

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!vendor) {
    return (
      <div className="card p-10 text-center text-gray-500">
        <p>Create a vendor listing to receive turnover jobs.</p>
      </div>
    );
  }

  const today = new Date().toISOString().slice(0, 10);

  const [{ data: assigned }, { data: scheduled }, { data: open }, { data: bids }] =
    await Promise.all([
      supabase
        .from("turnover_tasks")
        .select("id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("assigned_vendor_id", vendor.id)
        .eq("status", "assigned")
        .order("scheduled_date"),
      supabase
        .from("turnover_tasks")
        .select("id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("assigned_vendor_id", vendor.id)
        .eq("status", "scheduled")
        .gte("scheduled_date", today)
        .order("scheduled_date"),
      supabase
        .from("turnover_tasks")
        .select("id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("status", "open")
        .gte("scheduled_date", today)
        .order("scheduled_date")
        .limit(50),
      supabase
        .from("turnover_bids")
        .select("task_id, price_cents")
        .eq("vendor_id", vendor.id),
    ]);

  const myBids: Record<string, number> = {};
  for (const b of bids ?? []) myBids[b.task_id] = b.price_cents;

  return (
    <CleanerJobs
      assigned={(assigned as any) ?? []}
      scheduled={(scheduled as any) ?? []}
      open={(open as any) ?? []}
      myBids={myBids}
    />
  );
}
