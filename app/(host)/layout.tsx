import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { LayoutDashboard, Bookmark, MessageSquare, Star, Home, CalendarDays, Users, Globe } from "lucide-react";

export default async function HostLayout({ children }: { children: React.ReactNode }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile && profile.role === "vendor") redirect("/dashboard");
  if (profile && profile.role === "admin") redirect("/admin");

  const navLinks = [
    { href: "/host/dashboard",                         label: "Overview",        icon: LayoutDashboard },
    { href: "/host/dashboard/properties",              label: "My Properties",   icon: Home },
    { href: "/host/dashboard/calendar",                label: "Calendar",        icon: CalendarDays },
    { href: "/host/dashboard/booking-sites",           label: "Direct Booking",  icon: Globe },
    { href: "/host/dashboard/team",                    label: "My Team",         icon: Users },
    { href: "/host/dashboard/saved",                   label: "Saved Vendors",   icon: Bookmark },
    { href: "/host/dashboard/inquiries",               label: "My Inquiries",    icon: MessageSquare },
    { href: "/host/dashboard/reviews",                 label: "My Reviews",      icon: Star },
  ];

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
      <div className="flex flex-col lg:flex-row gap-8">
        <aside className="w-full lg:w-56 shrink-0">
          <div className="rounded-xl border bg-white p-4 space-y-1">
            <p className="px-3 pb-2 text-xs font-semibold uppercase tracking-wider text-gray-400">Host Dashboard</p>
            {navLinks.map(({ href, label, icon: Icon }) => (
              <Link
                key={href}
                href={href}
                className="flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-700 transition"
              >
                <Icon className="h-4 w-4" /> {label}
              </Link>
            ))}
          </div>
        </aside>
        <div className="flex-1 min-w-0">{children}</div>
      </div>
    </div>
  );
}
