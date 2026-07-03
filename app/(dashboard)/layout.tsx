import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { LayoutDashboard, User, MessageSquare, Star, BarChart2, Zap } from "lucide-react";

export default async function DashboardLayout({ children }: { children: React.ReactNode }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const navLinks = [
    { href: "/dashboard", label: "Overview", icon: LayoutDashboard },
    { href: "/dashboard/profile", label: "Edit Profile", icon: User },
    { href: "/dashboard/inquiries", label: "Messages", icon: MessageSquare },
    { href: "/dashboard/reviews", label: "Reviews", icon: Star },
    { href: "/dashboard/analytics", label: "Analytics", icon: BarChart2 },
    { href: "/dashboard/upgrade", label: "Upgrade", icon: Zap },
  ];

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
      <div className="flex flex-col lg:flex-row gap-8">
        {/* Sidebar */}
        <aside className="w-full lg:w-56 shrink-0">
          <div className="rounded-xl border bg-white p-4 space-y-1">
            <p className="px-3 pb-2 text-xs font-semibold uppercase tracking-wider text-gray-400">Dashboard</p>
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
