"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { LayoutDashboard, Store, Star, MessageSquare, MapPin, Tag, Users, DollarSign } from "lucide-react";
import { cn } from "@/lib/utils";

const navLinks = [
  { href: "/admin",            label: "Overview",    icon: LayoutDashboard, exact: true },
  { href: "/admin/vendors",    label: "Vendors",     icon: Store },
  { href: "/admin/reviews",    label: "Reviews",     icon: Star },
  { href: "/admin/inquiries",  label: "Inquiries",   icon: MessageSquare },
  { href: "/admin/markets",    label: "Markets",     icon: MapPin },
  { href: "/admin/categories", label: "Categories",  icon: Tag },
  { href: "/admin/users",      label: "Users",       icon: Users },
  { href: "/admin/revenue",    label: "Revenue",     icon: DollarSign },
];

export function AdminSidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-full lg:w-52 shrink-0">
      <div className="rounded-xl border bg-white p-4 space-y-1">
        <p className="px-3 pb-2 text-xs font-semibold uppercase tracking-wider text-gray-400">Admin</p>
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
