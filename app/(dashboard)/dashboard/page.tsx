import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Star, MessageSquare, Eye, ArrowRight } from "lucide-react";
import type { Vendor } from "@/types";

export const metadata = { title: "Dashboard" };

export default async function DashboardPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: vendor } = await supabase
    .from("vendors")
    .select("*")
    .eq("user_id", user!.id)
    .single();

  const v = vendor as Vendor | null;

  if (!v) {
    return (
      <div className="card p-10 text-center">
        <h2 className="text-xl font-bold mb-2">Create Your Listing</h2>
        <p className="text-gray-500 mb-6">You haven't created a vendor profile yet. Get started and start receiving inquiries from STR hosts in your area.</p>
        <Link href="/dashboard/profile" className="btn-primary">Create My Listing</Link>
      </div>
    );
  }

  const { count: inquiryCount } = await supabase
    .from("inquiries").select("*", { count: "exact", head: true }).eq("vendor_id", v.id).eq("status", "new");

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Welcome back 👋</h1>
        <Link href={`/vendors/${v.slug}`} className="btn-secondary text-xs">
          <Eye className="h-3.5 w-3.5" /> View Public Profile
        </Link>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
        {[
          { label: "Avg Rating", value: v.avg_rating > 0 ? v.avg_rating.toFixed(1) : "—", icon: Star, color: "text-amber-500" },
          { label: "Total Reviews", value: v.review_count, icon: Star, color: "text-brand-500" },
          { label: "New Inquiries", value: inquiryCount ?? 0, icon: MessageSquare, color: "text-green-500" },
        ].map(({ label, value, icon: Icon, color }) => (
          <div key={label} className="card p-5 flex items-center gap-4">
            <span className={`flex h-10 w-10 items-center justify-center rounded-full bg-gray-50 ${color}`}>
              <Icon className="h-5 w-5" />
            </span>
            <div>
              <p className="text-2xl font-bold text-gray-900">{value}</p>
              <p className="text-xs text-gray-500">{label}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Status */}
      <div className="card p-5">
        <h3 className="font-semibold text-gray-800 mb-3">Listing Status</h3>
        <div className="flex flex-wrap gap-2 text-sm">
          <span className={`rounded-full px-3 py-1 font-medium ${v.is_active ? "bg-green-50 text-green-700" : "bg-gray-100 text-gray-500"}`}>
            {v.is_active ? "● Active" : "○ Inactive"}
          </span>
          {v.is_verified && <span className="rounded-full px-3 py-1 bg-brand-50 text-brand-700 font-medium">✓ Verified</span>}
          {v.is_featured && <span className="rounded-full px-3 py-1 bg-amber-50 text-amber-700 font-medium">★ Featured</span>}
        </div>
      </div>

      {/* Quick links */}
      <div className="card p-5 space-y-2">
        <h3 className="font-semibold text-gray-800 mb-3">Quick Actions</h3>
        {[
          { href: "/dashboard/profile", label: "Edit your listing" },
          { href: "/dashboard/inquiries", label: `View inquiries (${inquiryCount ?? 0} new)` },
          { href: "/dashboard/reviews", label: "See your reviews" },
          { href: `/vendors/${v.slug}`, label: "Preview public profile" },
        ].map(({ href, label }) => (
          <Link key={href} href={href} className="flex items-center justify-between rounded-lg p-3 text-sm text-gray-700 hover:bg-gray-50 transition">
            {label} <ArrowRight className="h-4 w-4 text-gray-400" />
          </Link>
        ))}
      </div>
    </div>
  );
}
