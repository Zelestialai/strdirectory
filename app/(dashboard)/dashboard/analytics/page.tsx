import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { BarChart2, Eye, MessageSquare, Star, TrendingUp, Users } from "lucide-react";
import { redirect } from "next/navigation";
import { ViewsChart } from "@/components/ViewsChart";

export const metadata = { title: "Analytics" };

function pct(num: number, denom: number) {
  if (!denom) return "—";
  return `${Math.round((num / denom) * 100)}%`;
}

export default async function AnalyticsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name, avg_rating, review_count")
    .eq("user_id", user.id)
    .single();

  if (!vendor) {
    return (
      <div className="card p-10 text-center text-gray-500">
        <BarChart2 className="mx-auto h-10 w-10 opacity-30 mb-3" />
        <p>Create your listing first to see analytics.</p>
      </div>
    );
  }

  // ── Fetch all data in parallel ────────────────────────────────────────────
  const now = new Date();
  const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000).toISOString();
  const sevenDaysAgo  = new Date(now.getTime() -  7 * 24 * 60 * 60 * 1000).toISOString();

  const [
    { data: allViews },
    { count: totalInquiries },
    { count: repliedInquiries },
    { count: newInquiries },
  ] = await Promise.all([
    // All views in last 30 days (for chart + 7-day stat)
    supabaseAdmin
      .from("vendor_views")
      .select("viewed_at")
      .eq("vendor_id", vendor.id)
      .gte("viewed_at", thirtyDaysAgo)
      .order("viewed_at", { ascending: true }),

    // Total inquiries ever
    supabase
      .from("inquiries")
      .select("*", { count: "exact", head: true })
      .eq("vendor_id", vendor.id),

    // Replied inquiries (for response rate)
    supabase
      .from("inquiries")
      .select("*", { count: "exact", head: true })
      .eq("vendor_id", vendor.id)
      .in("status", ["replied", "closed"]),

    // Unread inquiries
    supabase
      .from("inquiries")
      .select("*", { count: "exact", head: true })
      .eq("vendor_id", vendor.id)
      .eq("status", "new"),
  ]);

  // Aggregate views by day for chart
  const viewsByDay: Record<string, number> = {};
  // Pre-fill last 30 days with 0
  for (let i = 29; i >= 0; i--) {
    const d = new Date(now.getTime() - i * 24 * 60 * 60 * 1000);
    viewsByDay[d.toISOString().slice(0, 10)] = 0;
  }
  for (const v of allViews ?? []) {
    const day = v.viewed_at.slice(0, 10);
    if (day in viewsByDay) viewsByDay[day] = (viewsByDay[day] ?? 0) + 1;
  }
  const chartData = Object.entries(viewsByDay).map(([date, count]) => ({ date, count }));

  const views30d = allViews?.length ?? 0;
  const views7d  = allViews?.filter((v) => v.viewed_at >= sevenDaysAgo).length ?? 0;
  const totalInq = totalInquiries ?? 0;
  const repliedInq = repliedInquiries ?? 0;

  const stats = [
    {
      label: "Profile views (30d)",
      value: views30d,
      sub: `${views7d} in last 7 days`,
      icon: Eye,
      color: "text-brand-600",
      bg: "bg-brand-50",
    },
    {
      label: "Total inquiries",
      value: totalInq,
      sub: `${newInquiries ?? 0} unread`,
      icon: MessageSquare,
      color: "text-green-600",
      bg: "bg-green-50",
    },
    {
      label: "Inquiry rate",
      value: pct(totalInq, views30d),
      sub: "inquiries per profile view",
      icon: TrendingUp,
      color: "text-amber-600",
      bg: "bg-amber-50",
    },
    {
      label: "Response rate",
      value: pct(repliedInq, totalInq),
      sub: "inquiries you've replied to",
      icon: Users,
      color: "text-purple-600",
      bg: "bg-purple-50",
    },
    {
      label: "Avg rating",
      value: vendor.avg_rating > 0 ? vendor.avg_rating.toFixed(1) : "—",
      sub: `${vendor.review_count} review${vendor.review_count !== 1 ? "s" : ""}`,
      icon: Star,
      color: "text-amber-500",
      bg: "bg-amber-50",
    },
  ];

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Analytics</h1>
        <p className="text-sm text-gray-500 mt-0.5">{vendor.business_name}</p>
      </div>

      {/* Stat cards */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-5">
        {stats.map(({ label, value, sub, icon: Icon, color, bg }) => (
          <div key={label} className="card p-4 space-y-2">
            <div className={`inline-flex h-8 w-8 items-center justify-center rounded-lg ${bg}`}>
              <Icon className={`h-4 w-4 ${color}`} />
            </div>
            <p className="text-2xl font-bold text-gray-900 leading-none">{value}</p>
            <div>
              <p className="text-xs font-medium text-gray-700">{label}</p>
              <p className="text-xs text-gray-400 mt-0.5">{sub}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Views chart */}
      <div className="card p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-base font-semibold text-gray-900">Profile views</h2>
            <p className="text-xs text-gray-400 mt-0.5">Last 30 days</p>
          </div>
          <span className="text-2xl font-bold text-gray-900">{views30d}</span>
        </div>
        <ViewsChart data={chartData} />
      </div>

      {/* Tips */}
      <div className="card p-5">
        <h2 className="text-sm font-semibold text-gray-800 mb-3">Tips to improve your stats</h2>
        <ul className="space-y-2 text-sm text-gray-600">
          <li className="flex items-start gap-2">
            <span className="text-brand-500 font-bold mt-0.5">→</span>
            <span>Add a professional photo and detailed description to increase inquiry conversions.</span>
          </li>
          <li className="flex items-start gap-2">
            <span className="text-brand-500 font-bold mt-0.5">→</span>
            <span>Reply to all inquiries quickly — vendors with high response rates rank higher in search.</span>
          </li>
          <li className="flex items-start gap-2">
            <span className="text-brand-500 font-bold mt-0.5">→</span>
            <span>Ask satisfied clients to leave a review — listings with 5+ reviews get 3× more inquiries.</span>
          </li>
        </ul>
      </div>
    </div>
  );
}
