"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  LayoutDashboard,
  Home,
  CalendarDays,
  Globe,
  Banknote,
  Bookmark,
  MessageSquare,
  Star,
  Users,
  Settings,
  Sparkles,
  ListChecks,
} from "lucide-react";
import { cn } from "@/lib/utils";

type NavItem = {
  href: string;
  label: string;
  icon: typeof Home;
  exact?: boolean;
  highlight?: boolean;
};

type NavGroup = { title: string; items: NavItem[] };

const GROUPS: NavGroup[] = [
  {
    title: "My Rentals",
    items: [
      { href: "/host/dashboard", label: "Overview", icon: LayoutDashboard, exact: true },
      { href: "/host/dashboard/properties", label: "My Properties", icon: Home },
      { href: "/host/dashboard/calendar", label: "Calendar", icon: CalendarDays },
      { href: "/host/dashboard/turnovers", label: "Turnovers", icon: Sparkles },
      { href: "/host/dashboard/checklists", label: "Cleaning Checklists", icon: ListChecks },
      { href: "/host/dashboard/booking-sites", label: "Direct Booking", icon: Globe, highlight: true },
      { href: "/host/dashboard/payouts", label: "Payouts", icon: Banknote },
    ],
  },
  {
    title: "Vendors",
    items: [
      { href: "/host/dashboard/saved", label: "Saved Vendors", icon: Bookmark },
      { href: "/host/dashboard/inquiries", label: "My Inquiries", icon: MessageSquare },
      { href: "/host/dashboard/reviews", label: "My Reviews", icon: Star },
      { href: "/host/dashboard/team", label: "My Team", icon: Users },
    ],
  },
  {
    title: "Account",
    items: [{ href: "/host/dashboard/settings", label: "Settings", icon: Settings }],
  },
];

// Flat list for the mobile scroller
const ALL_ITEMS = GROUPS.flatMap((g) => g.items);

function isActive(pathname: string, item: NavItem) {
  return item.exact ? pathname === item.href : pathname.startsWith(item.href);
}

export function HostSidebar() {
  const pathname = usePathname();

  return (
    <>
      {/* Mobile: horizontal scrolling pills */}
      <nav className="lg:hidden -mx-4 px-4 overflow-x-auto">
        <div className="flex gap-2 pb-2 w-max">
          {ALL_ITEMS.map((item) => {
            const active = isActive(pathname, item);
            const Icon = item.icon;
            return (
              <Link
                key={item.href}
                href={item.href}
                className={cn(
                  "flex items-center gap-1.5 whitespace-nowrap rounded-full border px-3 py-1.5 text-sm transition",
                  active
                    ? "border-brand-600 bg-brand-600 text-white"
                    : item.highlight
                    ? "border-coral-300 bg-coral-50 text-coral-700"
                    : "border-gray-200 bg-white text-gray-600"
                )}
              >
                <Icon className="h-3.5 w-3.5" />
                {item.label}
              </Link>
            );
          })}
        </div>
      </nav>

      {/* Desktop: grouped vertical sidebar */}
      <aside className="hidden lg:block w-56 shrink-0">
        <div className="rounded-xl border bg-white p-4 space-y-4">
          {GROUPS.map((group) => (
            <div key={group.title}>
              <p className="px-3 pb-1.5 text-xs font-semibold uppercase tracking-wider text-gray-400">
                {group.title}
              </p>
              <div className="space-y-0.5">
                {group.items.map((item) => {
                  const active = isActive(pathname, item);
                  const Icon = item.icon;
                  return (
                    <Link
                      key={item.href}
                      href={item.href}
                      className={cn(
                        "flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm transition",
                        active
                          ? "bg-brand-50 text-brand-700 font-medium"
                          : item.highlight
                          ? "text-coral-700 hover:bg-coral-50"
                          : "text-gray-700 hover:bg-brand-50 hover:text-brand-700"
                      )}
                    >
                      <Icon
                        className={cn(
                          "h-4 w-4",
                          active
                            ? "text-brand-600"
                            : item.highlight
                            ? "text-coral-500"
                            : "text-gray-400"
                        )}
                      />
                      <span className="flex-1">{item.label}</span>
                      {item.highlight && !active && (
                        <span className="rounded-full bg-coral-100 px-1.5 py-0.5 text-[10px] font-semibold text-coral-700">
                          New
                        </span>
                      )}
                    </Link>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      </aside>
    </>
  );
}
