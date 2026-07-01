import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Bookmark, MessageSquare, Star, ArrowRight, Search } from "lucide-react";

export const metadata = { title: "Host Dashboard" };

export default async function HostDashboardPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: profile } = await supabase
    .from("profiles")
    .select("full_name")
    .eq("id", user!.id)
    .single();

  const [
    { count: savedCount },
    { count: inquiryCount },
    { count: reviewCount },
  ] = await Promise.all([
    supabase.from("saved_vendors").select("*", { count: "exact", head: true }).eq("host_id", user!.id),
    supabase.from("inquiries").select("*", { count: "exact", head: true }).eq("sender_id", user!.id),
    supabase.from("reviews").select("*", { count: "exact", head: true }).eq("reviewer_id", user!.id),
  ]);

  const firstName = profile?.full_name?.split(" ")[0] ?? "there";

  const stats = [
    { label: "Saved Vendors", value: savedCount ?? 0, icon: Bookmark, color: "text-brand-500", href: "/host/dashboard/saved" },
    { label: "Inquiries Sent", value: inquiryCount ?? 0, icon: MessageSquare, color: "text-green-500", href: "/host/dashboard/inquiries" },
    { label: "Reviews Written", value: reviewCount ?? 0, icon: Star, color: "text-amber-500", href: "/host/dashboard/reviews" },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Welcome back, {firstName} 👋</h1>
        <Link href="/vendors" className="btn-secondary text-xs">
          <Search className="h-3.5 w-3.5" /> Find Vendors
        </Link>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
        {stats.map(({ label, value, icon: Icon, color, href }) => (
          <Link key={label} href={href} className="card p-5 flex items-center gap-4 hover:shadow-md transition-shadow">
            <span className={`flex h-10 w-10 items-center justify-center rounded-full bg-gray-50 ${color}`}>
              <Icon className="h-5 w-5" />
            </span>
            <div>
              <p className="text-2xl font-bold text-gray-900">{value}</p>
              <p className="text-xs text-gray-500">{label}</p>
            </div>
          </Link>
        ))}
      </div>

      {/* Quick actions */}
      <div className="card p-5 space-y-1">
        <h3 className="font-semibold text-gray-800 mb-3">Quick Actions</h3>
        {[
          { href: "/vendors", label: "Browse all vendors", desc: "Find service providers in your market" },
          { href: "/markets", label: "Explore markets", desc: "See top STR destinations" },
          { href: "/host/dashboard/saved", label: "View saved vendors", desc: `${savedCount ?? 0} saved so far` },
          { href: "/host/dashboard/inquiries", label: "My inquiry history", desc: "Track messages you've sent" },
        ].map(({ href, label, desc }) => (
          <Link key={href} href={href} className="flex items-center justify-between rounded-lg p-3 text-sm text-gray-700 hover:bg-gray-50 transition">
            <div>
              <p className="font-medium">{label}</p>
              <p className="text-xs text-gray-400">{desc}</p>
            </div>
            <ArrowRight className="h-4 w-4 text-gray-400 shrink-0" />
          </Link>
        ))}
      </div>

      {/* Getting started tip */}
      {(savedCount ?? 0) === 0 && (inquiryCount ?? 0) === 0 && (
        <div className="rounded-xl border-2 border-dashed border-brand-200 bg-brand-50/50 p-6 text-center">
          <Bookmark className="mx-auto h-8 w-8 text-brand-400 mb-2" />
          <h3 className="font-semibold text-brand-800 mb-1">Start building your vendor shortlist</h3>
          <p className="text-sm text-brand-600 mb-4">
            Browse vendors in your market and save your favorites to compare later.
          </p>
          <Link href="/vendors" className="btn-primary text-sm">
            Browse Vendors
          </Link>
        </div>
      )}
    </div>
  );
}
