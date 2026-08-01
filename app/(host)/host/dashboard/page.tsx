import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Bookmark, MessageSquare, Star, ArrowRight, Search, Home, CalendarDays, Globe, Sparkles } from "lucide-react";

export const metadata = { title: "Host Dashboard" };

export default async function HostDashboardPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: profile } = await supabase
    .from("profiles")
    .select("full_name")
    .eq("id", user!.id)
    .single();

  const today = new Date().toISOString().slice(0, 10);
  const in14 = new Date(Date.now() + 14 * 86_400_000).toISOString().slice(0, 10);

  const [
    { count: savedCount },
    { count: inquiryCount },
    { count: reviewCount },
    { count: propertyCount },
    { count: upcomingCount },
    { count: bookingSiteCount },
  ] = await Promise.all([
    supabase.from("saved_vendors").select("*", { count: "exact", head: true }).eq("host_id", user!.id),
    supabase.from("inquiries").select("*", { count: "exact", head: true }).eq("sender_id", user!.id),
    supabase.from("reviews").select("*", { count: "exact", head: true }).eq("reviewer_id", user!.id),
    supabase.from("properties").select("*", { count: "exact", head: true }).eq("host_id", user!.id),
    supabase
      .from("calendar_events")
      .select("*", { count: "exact", head: true })
      .eq("host_id", user!.id)
      .gte("end_date", today)
      .lte("start_date", in14),
    supabase.from("booking_sites").select("*", { count: "exact", head: true }).eq("host_id", user!.id),
  ]);

  const firstName = profile?.full_name?.split(" ")[0] ?? "there";

  const stats = [
    { label: "Properties", value: propertyCount ?? 0, icon: Home, color: "text-teal-600", href: "/host/dashboard/properties" },
    { label: "Upcoming (14d)", value: upcomingCount ?? 0, icon: CalendarDays, color: "text-brand-500", href: "/host/dashboard/calendar" },
    { label: "Saved Vendors", value: savedCount ?? 0, icon: Bookmark, color: "text-indigo-500", href: "/host/dashboard/saved" },
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
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-5">
        {stats.map(({ label, value, icon: Icon, color, href }) => (
          <Link key={label} href={href} className="card p-4 flex flex-col items-center text-center gap-1.5 hover:shadow-md transition-shadow">
            <span className={`flex h-9 w-9 items-center justify-center rounded-full bg-gray-50 ${color}`}>
              <Icon className="h-5 w-5" />
            </span>
            <p className="text-2xl font-bold text-gray-900">{value}</p>
            <p className="text-xs text-gray-500 leading-tight">{label}</p>
          </Link>
        ))}
      </div>

      {/* Direct Booking — prominent promo */}
      <div className="relative overflow-hidden rounded-2xl bg-gradient-to-br from-coral-500 to-coral-600 text-white p-6 shadow-sm">
        <div className="absolute -top-8 -right-8 h-40 w-40 rounded-full bg-white/10" />
        <div className="absolute -bottom-10 -left-6 h-32 w-32 rounded-full bg-white/5" />
        <div className="relative flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
          <div className="max-w-lg">
            <div className="inline-flex items-center gap-1.5 rounded-full bg-white/15 px-2.5 py-0.5 text-xs font-semibold mb-3">
              <Sparkles className="h-3 w-3" /> Commission-free bookings
            </div>
            <h2 className="text-xl font-bold flex items-center gap-2">
              <Globe className="h-5 w-5" />
              {(bookingSiteCount ?? 0) > 0 ? "Your direct booking site" : "Launch your direct booking site"}
            </h2>
            <p className="mt-1.5 text-sm text-white/90 leading-relaxed">
              {(bookingSiteCount ?? 0) > 0
                ? `You have ${bookingSiteCount} booking site${bookingSiteCount !== 1 ? "s" : ""} live. Take reservations directly and keep 100% of the nightly rate.`
                : "Import your Airbnb listing and take direct reservations — no OTA commissions, paid straight to your Stripe account."}
            </p>
          </div>
          <Link
            href="/host/dashboard/booking-sites"
            className="shrink-0 inline-flex items-center gap-2 rounded-xl bg-white px-5 py-2.5 text-sm font-semibold text-coral-700 hover:bg-coral-50 transition self-start"
          >
            {(bookingSiteCount ?? 0) > 0 ? "Manage booking sites" : "Set up direct booking"}
            <ArrowRight className="h-4 w-4" />
          </Link>
        </div>
      </div>

      {/* Quick actions */}
      <div className="card p-5 space-y-1">
        <h3 className="font-semibold text-gray-800 mb-3">Quick Actions</h3>
        {[
          { href: "/host/dashboard/properties", label: "Manage properties", desc: `${propertyCount ?? 0} connected — sync iCal calendars` },
          { href: "/host/dashboard/calendar", label: "View upcoming reservations", desc: `${upcomingCount ?? 0} check-out${upcomingCount !== 1 ? "s" : ""} in the next 14 days` },
          { href: "/vendors", label: "Browse vendors", desc: "Find cleaners, maintenance & more" },
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

      {/* Onboarding checklist */}
      {((savedCount ?? 0) === 0 || (inquiryCount ?? 0) === 0 || (propertyCount ?? 0) === 0) && (
        <div className="rounded-xl border border-brand-200 bg-brand-50 p-5 space-y-4">
          <div className="flex items-center justify-between">
            <h3 className="font-semibold text-brand-800">Getting started</h3>
            <Link href="/host/onboarding" className="text-xs text-brand-600 hover:underline">
              View onboarding guide →
            </Link>
          </div>
          <div className="space-y-2">
            {[
              { done: true, label: "Create your host account" },
              { done: (propertyCount ?? 0) > 0, label: "Add your first property", href: "/host/dashboard/properties" },
              { done: (savedCount ?? 0) > 0, label: "Save your first vendor", href: "/vendors" },
              { done: (inquiryCount ?? 0) > 0, label: "Send your first inquiry", href: "/vendors" },
            ].map(({ done, label, href }) => (
              <div key={label} className="flex items-center gap-2.5">
                <div className={`h-5 w-5 rounded-full flex items-center justify-center shrink-0 text-xs ${done ? "bg-brand-600" : "bg-white border-2 border-brand-300"}`}>
                  {done && (
                    <svg viewBox="0 0 12 12" fill="none" className="h-3 w-3">
                      <path d="M2 6l3 3 5-5" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  )}
                </div>
                <span className={`text-sm ${done ? "line-through text-brand-400" : "text-brand-700 font-medium"}`}>
                  {label}
                </span>
                {!done && href && (
                  <Link href={href} className="ml-auto text-xs text-brand-600 hover:underline shrink-0">
                    Do it →
                  </Link>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
