import { createClient } from "@/lib/supabase/server";
import { Store, Users, Star, MessageSquare, Clock, CheckCircle2 } from "lucide-react";

export const metadata = { title: "Admin Overview" };

export default async function AdminOverviewPage() {
  const supabase = createClient();

  const [
    { count: totalVendors },
    { count: pendingVendors },
    { count: verifiedVendors },
    { count: totalUsers },
    { count: totalReviews },
    { count: totalInquiries },
  ] = await Promise.all([
    supabase.from("vendors").select("*", { count: "exact", head: true }),
    supabase.from("vendors").select("*", { count: "exact", head: true }).eq("is_verified", false).eq("is_active", true),
    supabase.from("vendors").select("*", { count: "exact", head: true }).eq("is_verified", true),
    supabase.from("profiles").select("*", { count: "exact", head: true }),
    supabase.from("reviews").select("*", { count: "exact", head: true }),
    supabase.from("inquiries").select("*", { count: "exact", head: true }),
  ]);

  const stats = [
    { label: "Total Vendors",    value: totalVendors ?? 0,   icon: Store,          color: "text-brand-600",  bg: "bg-brand-50",  href: "/admin/vendors" },
    { label: "Pending Approval", value: pendingVendors ?? 0, icon: Clock,          color: "text-amber-600",  bg: "bg-amber-50",  href: "/admin/vendors?filter=pending" },
    { label: "Verified Vendors", value: verifiedVendors ?? 0,icon: CheckCircle2,   color: "text-green-600",  bg: "bg-green-50",  href: "/admin/vendors?filter=verified" },
    { label: "Total Users",      value: totalUsers ?? 0,     icon: Users,          color: "text-violet-600", bg: "bg-violet-50", href: "/admin/users" },
    { label: "Total Reviews",    value: totalReviews ?? 0,   icon: Star,           color: "text-orange-600", bg: "bg-orange-50", href: "/admin/reviews" },
    { label: "Total Inquiries",  value: totalInquiries ?? 0, icon: MessageSquare,  color: "text-teal-600",   bg: "bg-teal-50",   href: "/admin/inquiries" },
  ];

  // Recent signups
  const { data: recentVendors } = await supabase
    .from("vendors")
    .select("id, business_name, city, state, is_verified, is_active, created_at, category:categories(name)")
    .order("created_at", { ascending: false })
    .limit(5);

  return (
    <div className="space-y-8">
      <h1 className="text-2xl font-bold text-gray-900">Overview</h1>

      {/* Stats grid */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3">
        {stats.map(({ label, value, icon: Icon, color, bg, href }) => (
          <a key={label} href={href} className="card p-5 flex items-center gap-4 hover:shadow-md transition-shadow">
            <span className={`flex h-10 w-10 items-center justify-center rounded-full ${bg}`}>
              <Icon className={`h-5 w-5 ${color}`} />
            </span>
            <div>
              <p className="text-2xl font-bold text-gray-900">{value}</p>
              <p className="text-xs text-gray-500">{label}</p>
            </div>
          </a>
        ))}
      </div>

      {/* Pending approvals alert */}
      {(pendingVendors ?? 0) > 0 && (
        <div className="rounded-xl border border-amber-200 bg-amber-50 p-4 flex items-center justify-between">
          <div className="flex items-center gap-2 text-amber-800">
            <Clock className="h-5 w-5 text-amber-500" />
            <span className="font-medium">{pendingVendors} vendor{pendingVendors !== 1 ? "s" : ""} waiting for approval</span>
          </div>
          <a href="/admin/vendors?filter=pending" className="btn-primary py-1.5 text-xs">Review Now</a>
        </div>
      )}

      {/* Recent vendors */}
      <div className="card overflow-hidden">
        <div className="flex items-center justify-between px-5 py-4 border-b">
          <h2 className="font-semibold text-gray-800">Recently Registered Vendors</h2>
          <a href="/admin/vendors" className="text-xs text-brand-600 hover:underline">View all →</a>
        </div>
        <table className="w-full text-sm">
          <thead className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wider">
            <tr>
              <th className="px-5 py-3 text-left">Business</th>
              <th className="px-5 py-3 text-left hidden sm:table-cell">Category</th>
              <th className="px-5 py-3 text-left hidden md:table-cell">Location</th>
              <th className="px-5 py-3 text-left">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {recentVendors?.map((v: any) => (
              <tr key={v.id} className="hover:bg-gray-50 transition">
                <td className="px-5 py-3 font-medium text-gray-800">
                  <a href={`/admin/vendors?search=${v.business_name}`} className="hover:text-brand-700">{v.business_name}</a>
                </td>
                <td className="px-5 py-3 text-gray-500 hidden sm:table-cell">{v.category?.name ?? "—"}</td>
                <td className="px-5 py-3 text-gray-500 hidden md:table-cell">
                  {[v.city, v.state].filter(Boolean).join(", ") || "—"}
                </td>
                <td className="px-5 py-3">
                  {v.is_verified
                    ? <span className="rounded-full bg-green-50 text-green-700 border border-green-200 px-2 py-0.5 text-xs font-medium">Verified</span>
                    : <span className="rounded-full bg-amber-50 text-amber-700 border border-amber-200 px-2 py-0.5 text-xs font-medium">Pending</span>
                  }
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
