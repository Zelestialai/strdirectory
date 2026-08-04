"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState, useEffect, useRef } from "react";
import { createClient } from "@/lib/supabase/client";
import { NotificationBell } from "@/components/NotificationBell";
import { MarketSwitcher } from "@/components/MarketSwitcher";
import { Menu, X, Building2, ChevronDown, MapPin } from "lucide-react";
import type { User } from "@supabase/supabase-js";
import type { Category } from "@/types";

const ALL_CATEGORIES = [
  { name: "Cleaning & Turnover",          slug: "cleaning-turnover" },
  { name: "Photography & Design",         slug: "photography-design" },
  { name: "Maintenance & Repairs",        slug: "maintenance-repairs" },
  { name: "Property Management",          slug: "property-management" },
  { name: "Real Estate & Property Finders", slug: "real-estate" },
  { name: "Interior Design & Staging",   slug: "interior-design" },
  { name: "Renovation & Construction",   slug: "renovation" },
  { name: "Accounting & Tax",            slug: "accounting-tax" },
  { name: "Insurance",                   slug: "insurance" },
  { name: "Furniture & Supplies",        slug: "furniture-supplies" },
  { name: "Smart Home & Technology",     slug: "smart-home-tech" },
  { name: "Legal & Regulations",         slug: "legal-regulations" },
];

interface MarketBrief {
  name: string;
  slug: string;
  state: string;
}

export function Navbar({
  currentMarket = null,
  markets = [],
}: {
  currentMarket?: MarketBrief | null;
  markets?: MarketBrief[];
}) {
  const [user, setUser] = useState<User | null>(null);
  const [menuOpen, setMenuOpen] = useState(false);
  const [userMenuOpen, setUserMenuOpen] = useState(false);
  const [catMenuOpen, setCatMenuOpen] = useState(false);
  const [mktMenuOpen, setMktMenuOpen] = useState(false);
  const catRef = useRef<HTMLDivElement>(null);
  const mktRef = useRef<HTMLDivElement>(null);
  const supabase = createClient();
  const router = useRouter();

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => setUser(data.user));
    const { data: listener } = supabase.auth.onAuthStateChange((_e, session) =>
      setUser(session?.user ?? null)
    );
    return () => listener.subscription.unsubscribe();
  }, []);

  // Close dropdowns on outside click
  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (catRef.current && !catRef.current.contains(e.target as Node)) setCatMenuOpen(false);
      if (mktRef.current && !mktRef.current.contains(e.target as Node)) setMktMenuOpen(false);
    }
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  const signOut = async () => {
    await supabase.auth.signOut();
    router.push("/");
  };

  return (
    <header className="sticky top-0 z-50 border-b bg-white/90 backdrop-blur">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3 sm:px-6 lg:px-8">
        {/* Logo + market switcher (switcher shown on all breakpoints) */}
        <div className="flex items-center gap-2 sm:gap-3 min-w-0">
          <Link href="/" className="flex items-center gap-2 text-brand-700 font-bold text-lg shrink-0">
            <Building2 className="h-5 w-5" />
            <span className="hidden sm:inline">StrVend</span>
          </Link>
          <MarketSwitcher current={currentMarket} markets={markets} />
        </div>

        {/* Desktop nav */}
        <nav className="hidden md:flex items-center gap-6 text-sm text-gray-600">
          <Link href="/vendors" className="hover:text-brand-700 transition">All Vendors</Link>
          <Link href="/blog" className="hover:text-brand-700 transition">Blog</Link>

          {/* Markets dropdown */}
          <div ref={mktRef} className="relative">
            <button
              onClick={() => { setMktMenuOpen(!mktMenuOpen); setCatMenuOpen(false); }}
              className="flex items-center gap-1 hover:text-brand-700 transition"
            >
              <MapPin className="h-3 w-3" />
              Markets <ChevronDown className={`h-3 w-3 transition-transform ${mktMenuOpen ? "rotate-180" : ""}`} />
            </button>
            {mktMenuOpen && (
              <div className="absolute left-0 mt-2 w-[48rem] rounded-xl border bg-white shadow-xl py-2 z-50 max-h-[70vh] overflow-y-auto">
                <Link
                  href="/markets"
                  onClick={() => setMktMenuOpen(false)}
                  className="block px-4 py-2 text-sm font-medium text-brand-700 hover:bg-brand-50 transition border-b border-gray-100 mb-1"
                >
                  All Markets →
                </Link>
                <div className="grid grid-cols-4">
                  {markets.map((m) => (
                    <Link
                      key={m.slug}
                      href={`/markets/${m.slug}`}
                      onClick={() => setMktMenuOpen(false)}
                      className="flex items-center justify-between px-4 py-1.5 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-700 transition"
                    >
                      <span>{m.name}</span>
                      <span className="text-xs text-gray-400 ml-1">{m.state}</span>
                    </Link>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Categories dropdown */}
          <div ref={catRef} className="relative">
            <button
              onClick={() => setCatMenuOpen(!catMenuOpen)}
              className="flex items-center gap-1 hover:text-brand-700 transition"
            >
              Categories <ChevronDown className={`h-3 w-3 transition-transform ${catMenuOpen ? "rotate-180" : ""}`} />
            </button>
            {catMenuOpen && (
              <div className="absolute left-0 mt-2 w-64 rounded-xl border bg-white shadow-xl py-2 z-50">
                {ALL_CATEGORIES.map((cat) => (
                  <Link
                    key={cat.slug}
                    href={`/vendors?category=${cat.slug}`}
                    onClick={() => setCatMenuOpen(false)}
                    className="block px-4 py-2 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-700 transition"
                  >
                    {cat.name}
                  </Link>
                ))}
              </div>
            )}
          </div>
        </nav>

        {/* Auth actions */}
        <div className="hidden md:flex items-center gap-3">
          {user ? (
            <>
            <NotificationBell />
            <div className="relative">
              <button
                onClick={() => setUserMenuOpen(!userMenuOpen)}
                className="flex items-center gap-1 rounded-lg border px-3 py-1.5 text-sm hover:bg-gray-50"
              >
                {user.email?.split("@")[0]} <ChevronDown className="h-3 w-3" />
              </button>
              {userMenuOpen && (
                <div className="absolute right-0 mt-2 w-44 rounded-xl border bg-white shadow-lg py-1 z-50">
                  <Link href="/dashboard" onClick={() => setUserMenuOpen(false)} className="block px-4 py-2 text-sm hover:bg-gray-50">My Dashboard</Link>
                  <Link href="/dashboard/profile" onClick={() => setUserMenuOpen(false)} className="block px-4 py-2 text-sm hover:bg-gray-50">Edit Profile</Link>
                  <hr className="my-1" />
                  <button onClick={signOut} className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50">Sign Out</button>
                </div>
              )}
            </div>
            </>
          ) : (
            <>
              <Link href="/login" className="btn-secondary py-1.5">Sign In</Link>
              <Link href="/register" className="btn-primary py-1.5">List Your Business</Link>
            </>
          )}
        </div>

        {/* Mobile toggle */}
        <button className="md:hidden" onClick={() => setMenuOpen(!menuOpen)}>
          {menuOpen ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
        </button>
      </div>

      {/* Mobile menu */}
      {menuOpen && (
        <div className="md:hidden border-t bg-white px-4 py-4 space-y-1 text-sm max-h-[80vh] overflow-y-auto">
          <Link href="/vendors" className="block py-2 font-medium text-brand-700" onClick={() => setMenuOpen(false)}>
            All Vendors
          </Link>
          <Link href="/blog" className="block py-2 font-medium text-gray-700 hover:text-brand-700" onClick={() => setMenuOpen(false)}>
            Blog
          </Link>
          <Link href="/markets" className="block py-2 font-medium text-gray-700 hover:text-brand-700" onClick={() => setMenuOpen(false)}>
            Browse all markets
          </Link>
          <p className="pt-2 pb-1 text-xs font-semibold uppercase tracking-wider text-gray-400">Categories</p>
          {ALL_CATEGORIES.map((cat) => (
            <Link
              key={cat.slug}
              href={`/vendors?category=${cat.slug}`}
              className="block py-1.5 text-gray-600 hover:text-brand-700"
              onClick={() => setMenuOpen(false)}
            >
              {cat.name}
            </Link>
          ))}
          <hr className="my-2" />
          {user ? (
            <>
              <Link href="/dashboard" className="block py-1.5" onClick={() => setMenuOpen(false)}>My Dashboard</Link>
              <button onClick={signOut} className="text-red-600 py-1.5">Sign Out</button>
            </>
          ) : (
            <div className="flex gap-2 pt-2">
              <Link href="/login" className="btn-secondary flex-1 justify-center">Sign In</Link>
              <Link href="/register" className="btn-primary flex-1 justify-center">List Business</Link>
            </div>
          )}
        </div>
      )}
    </header>
  );
}
