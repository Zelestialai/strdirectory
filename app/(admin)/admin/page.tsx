import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import {
  Store, Users, Star, MessageSquare, Clock, CheckCircle2,
  MapPin, Tag, DollarSign, ShieldAlert, Plus, Home,
} from "lucide-react";

export const metadata = { title: "Admin Overview" };

export default async function AdminOverviewPage() {
  const supabase = createClient();

  const [
    { count: totalVendors },
    { count: pendingVendors },
    { count: verifiedVendors },
    { count: totalUsers },
    { count: totalHosts },
    { count: totalReviews },
    { count: totalInquiries },
    { count: totalMarkets },
    { count: totalCategories },
    { count: pendingClaims },
  ] = await Promise.all([
    supabase.from("vendors").select("*", { count: "exact", head: true }),
    supabase.from("vendors").select("*", { count: "exact", head: true }).eq("is_verified", false).eq("is_active", true),
    supabase.from("vendors").select("*", { count: "exact", head: true }).eq("is_verified", true),
    supabase.from("profiles").select("*", { count: "exact", head: true }),
    supabase.from("profiles").select("*", { count: "exact", head: true }).eq("role", "host"),
    supabase.from("reviews").select("*", { count: "exact", head: true }),
    supabase.from("inquiries").select("*", { count: "exact", head: true }),
    supabase.from("markets").select("*", { count: "exact", head: true }),
    supabase.from("categories").select("*", { count: "exact", head: true }),
    supabase.from("claim_requests").select("*", { count: "exact", head: true }).eq("status", "pending"),
  ]);

  const stats = [
    { label: "Total Vendors",    value: totalVendors ?? 0,    icon: Store,         color: "text-brand-600",  bg: "bg-brand-50",  href: "/admin/vendors" },
    { label: "Pending Approval", value: pendingVendors ?? 0,  icon: Clock,         color: "text-amber-600",  bg: "bg-amber-50",  href: "/admin/vendors?filter=pending" },
    { label: "Verified Vendors", value: verifiedVendors ?? 0, icon: CheckCircle2,  color: "text-green-600",  bg: "bg-green-50",  href: "/admin/vendors?filter=verified" },
    { label: "Hosts",            value: totalHosts ?? 0,      icon: Home,          color: "text-teal-600",   bg: "bg-teal-50",   href: "/admin/users" },
    { label: "Total Users",      value: totalUsers ?? 0,      icon: Users,         color: "text-violet-600", bg: "bg-violet-50", href: "/admin/users" },
    { label: "Markets",          value: totalMarkets ?? 0,    icon: MapPin,        color: "text-rose-600",   bg: "bg-rose-50",   href: "/admin/markets" },
    { label: "Categories",       value: totalCategories ?? 0, icon: Tag,           color: "text-indigo-600", bg: "bg-indigo-50", href: "/admin/categories" },
    { label: "Reviews",          value: totalReviews ?? 0,    icon: Star,          color: "text-orange-600", bg: "bg-orange-50", href: "/admin/reviews" },
    { label: "Inquiries",        value: totalInquiries ?? 0,  icon: MessageSquare, color: "text-sky-600",    bg: "bg-sky-50",    href: "/admin/inquiries" },
  ];

  const quickActions = [
    { label: "Add Vendor",   href: "/admin/vendors",    icon: Store },
    { label: "Add Market",   href: "/admin/markets",    icon: MapPin },
    { label: "Add Category", href: "/admin/categories", icon: Tag },
    { label: "Revenue",      href: "/admin/revenue",    icon: DollarSign },
    { label: "Moderation",   href: "/admin/reviews/moderation", icon: ShieldAlert },
  ];

  const { data: recentVendors } = await supabase
    .from("vendors")
    .select("id, business_name, city, state, is_verified, is_active, created_at, category:categories(name)")
    .order("created_at", { ascending: false })
    .limit(6);

  const { data: oldestPending } = await supabase
    .from("vendors")
    .select("created_at")
    .eq("is_verified", false)
    .eq("is_active", true)
    .order("created_at", { ascending: true })
    .limit(1)
    .maybeSingle();

  const oldestPendingLabel = oldestPending?.created_at
    ? new Date(oldestPending.created_at).toLocaleDateString(undefined, { month: "short", day: "numeric", year: "numeric" })
    : null;

  return (
    <div className="space-y-8">
      <h1 className="text-2xl font-bold text-gray-900">Overview</h1>

      {/* Quick actions */}
      <div className="flex flex-wrap gap-2">
        {quickActions.map(({ label, href, icon: Icon }) => (
          <Link key={label} href={href}
            className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm font-medium text-gray-700 hover:border-brand-300 hover:text-brand-700 transition">
            <Plus className="h-3.5 w-3.5 text-brand-500" /> <Icon className="h-4 w-4" /> {label}
          </Link>
        ))}
      </div>

      {/* Stats grid */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3">
        {stats.map(({ label, value, icon: Icon, color, bg, href }) => (
          <Link key={label} href={href} className="card p-5 flex items-center gap-4 hover:shadow-md transition-shadow">
            <span className={`flex h-10 w-10 items-center justify-center rounded-full ${bg}`}>
              <Icon className={`h-5 w-5 ${color}`} />
            </span>
            <div>
              <p className="text-2xl font-bold text-gray-900">{value}</p>
              <p className="text-xs text-gray-500">{label}</p>
            </div>
          </Link>
        ))}
      </div>

      {/* Attention alerts */}
      {((pendingVendors ?? 0) > 0 || (pendingClaims ?? 0) > 0) && (
        <div className="space-y-2">
          {(pendingVendors ?? 0) > 0 && (
            <div className="rounded-xl border border-amber-200 bg-amber-50 p-4 flex items-center justify-between">
              <div className="flex items-center gap-2 text-amber-800">
                <Clock className="h-5 w-5 text-amber-500" />
                <span className="font-medium">
                  {pendingVendors} vendor{pendingVendors !== 1 ? "s" : ""} waiting for approval
                  {oldestPendingLabel && <span className="font-normal text-amber-600"> · oldest since {oldestPendingLabel}</span>}
                </span>
              </div>
              <a href="/admin/vendors?filter=pending" className="btn-primary py-1.5 text-xs">Review Now</a>
            </div>
          )}
          {(pendingClaims ?? 0) > 0 && (
            <div className="rounded-xl border border-blue-200 bg-blue-50 p-4 flex items-center justify-between">
              <div className="flex items-center gap-2 text-blue-800">
                <ShieldAlert className="h-5 w-5 text-blue-500" />
                <span className="font-medium">{pendingClaims} listing claim{pendingClaims !== 1 ? "s" : ""} awaiting review</span>
              </div>
              <a href="/admin/vendors" className="btn-secondary py-1.5 text-xs">Review</a>
            </div>
          )}
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
              <th className="px-5 py-3 text-left hidden sm:table-cell">Registered</th>
              <th className="px-5 py-3 text-left">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {recentVendors?.map((v: any) => (
              <tr key={v.id} className="hover:bg-gray-50 transition">
                <td className="px-5 py-3 font-medium text-gray-800">
                  <a href={`/admin/vendors?search=${encodeURIComponent(v.business_name)}`} className="hover:text-brand-700">{v.business_name}</a>
                </td>
                <td className="px-5 py-3 text-gray-500 hidden sm:table-cell">{v.category?.name ?? "—"}</td>
                <td className="px-5 py-3 text-gray-500 hidden md:table-cell">
                  {[v.city, v.state].filter(Boolean).join(", ") || "—"}
                </td>
                <td className="px-5 py-3 text-gray-500 hidden sm:table-cell whitespace-nowrap">
                  {v.created_at ? new Date(v.created_at).toLocaleDateString(undefined, { month: "short", day: "numeric", year: "numeric" }) : "—"}
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
