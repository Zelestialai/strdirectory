"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { LayoutDashboard, User, MessageSquare, Star, BarChart2, Zap, Users } from "lucide-react";
import { cn } from "@/lib/utils";

const navLinks = [
  { href: "/dashboard",            label: "Overview",     icon: LayoutDashboard, exact: true },
  { href: "/dashboard/profile",    label: "Edit Profile", icon: User },
  { href: "/dashboard/team",       label: "My Clients",   icon: Users },
  { href: "/dashboard/inquiries",  label: "Messages",     icon: MessageSquare },
  { href: "/dashboard/reviews",    label: "Reviews",      icon: Star },
  { href: "/dashboard/analytics",  label: "Analytics",    icon: BarChart2 },
  { href: "/dashboard/upgrade",    label: "Upgrade",      icon: Zap },
];

export function DashboardSidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-full lg:w-56 shrink-0">
      <div className="rounded-xl border bg-white p-4 space-y-1">
        <p className="px-3 pb-2 text-xs font-semibold uppercase tracking-wider text-gray-400">Dashboard</p>
        {navLinks.map(({ href, label, icon: Icon, exact }) => {
          const isActive = exact ? pathname === href : pathname.startsWith(href);
          return (
            <Link
              key={href}
              href={href}
              className={cn(
                "flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm transition",
                isActive
                  ? "bg-brand-50 text-brand-700 font-medium"
                  : "text-gray-700 hover:bg-brand-50 hover:text-brand-700"
              )}
            >
              <Icon className={cn("h-4 w-4", isActive ? "text-brand-600" : "text-gray-400")} />
              {label}
            </Link>
          );
        })}
      </div>
    </aside>
  );
}
