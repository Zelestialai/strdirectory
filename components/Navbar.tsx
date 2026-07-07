"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState, useEffect, useRef } from "react";
import { createClient } from "@/lib/supabase/client";
import { Menu, X, ChevronDown, MapPin } from "lucide-react";
import type { User } from "@supabase/supabase-js";

const ALL_MARKETS = [
  // Tier 1
  { name: "Nashville",      slug: "nashville",      state: "TN" },
  { name: "Miami",          slug: "miami",          state: "FL" },
  { name: "Orlando",        slug: "orlando",        state: "FL" },
  { name: "Los Angeles",    slug: "los-angeles",    state: "CA" },
  { name: "Austin",         slug: "austin",         state: "TX" },
  { name: "Las Vegas",      slug: "las-vegas",      state: "NV" },
  { name: "Scottsdale",     slug: "scottsdale",     state: "AZ" },
  { name: "New York City",  slug: "new-york-city",  state: "NY" },
  // Tier 2
  { name: "Denver",          slug: "denver",          state: "CO" },
  { name: "New Orleans",     slug: "new-orleans",     state: "LA" },
  { name: "San Diego",       slug: "san-diego",       state: "CA" },
  { name: "Charleston",      slug: "charleston",      state: "SC" },
  { name: "Myrtle Beach",    slug: "myrtle-beach",    state: "SC" },
  { name: "Destin",          slug: "destin",          state: "FL" },
  { name: "Smoky Mountains", slug: "smoky-mountains", state: "TN" },
  { name: "Chicago",         slug: "chicago",         state: "IL" },
  // Tier 3
  { name: "Asheville",         slug: "asheville",         state: "NC" },
  { name: "Outer Banks",       slug: "outer-banks",       state: "NC" },
  { name: "Hilton Head",       slug: "hilton-head",       state: "SC" },
  { name: "Key West",          slug: "key-west",          state: "FL" },
  { name: "Lake Tahoe",        slug: "lake-tahoe",        state: "CA" },
  { name: "Park City",         slug: "park-city",         state: "UT" },
  { name: "Sedona",            slug: "sedona",            state: "AZ" },
  { name: "Savannah",          slug: "savannah",          state: "GA" },
  { name: "Virginia Beach",    slug: "virginia-beach",    state: "VA" },
  { name: "San Antonio",       slug: "san-antonio",       state: "TX" },
  // Tier 4 — Beach/Coastal
  { name: "Gulf Shores",       slug: "gulf-shores",       state: "AL" },
  { name: "Panama City Beach", slug: "panama-city-beach", state: "FL" },
  { name: "Naples",            slug: "naples",            state: "FL" },
  { name: "Anna Maria Island", slug: "anna-maria-island", state: "FL" },
  { name: "Cape Cod",          slug: "cape-cod",          state: "MA" },
  { name: "Hamptons",          slug: "hamptons",          state: "NY" },
  { name: "Jersey Shore",      slug: "jersey-shore",      state: "NJ" },
  { name: "Ocean City",        slug: "ocean-city",        state: "MD" },
  { name: "Galveston",         slug: "galveston",         state: "TX" },
  { name: "Rehoboth Beach",    slug: "rehoboth-beach",    state: "DE" },
  { name: "South Padre Island",slug: "south-padre-island",state: "TX" },
  { name: "30A",               slug: "thirty-a",          state: "FL" },
  // Tier 4 — Mountain/Ski
  { name: "Breckenridge",      slug: "breckenridge",      state: "CO" },
  { name: "Vail",              slug: "vail",              state: "CO" },
  { name: "Aspen",             slug: "aspen",             state: "CO" },
  { name: "Steamboat Springs", slug: "steamboat-springs", state: "CO" },
  { name: "Telluride",         slug: "telluride",         state: "CO" },
  { name: "Jackson Hole",      slug: "jackson-hole",      state: "WY" },
  { name: "Big Sky",           slug: "big-sky",           state: "MT" },
  { name: "Sun Valley",        slug: "sun-valley",        state: "ID" },
  { name: "Mammoth Lakes",     slug: "mammoth-lakes",     state: "CA" },
  { name: "Big Bear",          slug: "big-bear",          state: "CA" },
  { name: "Bend",              slug: "bend",              state: "OR" },
  { name: "Whitefish",         slug: "whitefish",         state: "MT" },
  // Tier 5 — Beach/Coastal
  { name: "Clearwater",        slug: "clearwater",        state: "FL" },
  { name: "Fort Lauderdale",   slug: "fort-lauderdale",   state: "FL" },
  { name: "Nantucket",         slug: "nantucket",         state: "MA" },
  { name: "Martha's Vineyard", slug: "marthas-vineyard",  state: "MA" },
  { name: "Bar Harbor",        slug: "bar-harbor",        state: "ME" },
  { name: "MS Gulf Coast",     slug: "mississippi-gulf-coast", state: "MS" },
  { name: "Crystal Coast",     slug: "crystal-coast",     state: "NC" },
  { name: "Newport",           slug: "newport",           state: "RI" },
  { name: "Port Aransas",      slug: "port-aransas",      state: "TX" },
  { name: "Amelia Island",     slug: "amelia-island",     state: "FL" },
  // Tier 5 — Mountain/Nature
  { name: "Blue Ridge",        slug: "blue-ridge",        state: "GA" },
  { name: "Poconos",           slug: "poconos",           state: "PA" },
  { name: "Flagstaff",         slug: "flagstaff",         state: "AZ" },
  { name: "Durango",           slug: "durango",           state: "CO" },
  { name: "Boone",             slug: "boone",             state: "NC" },
  { name: "Door County",       slug: "door-county",       state: "WI" },
  { name: "Traverse City",     slug: "traverse-city",     state: "MI" },
  { name: "Joshua Tree",       slug: "joshua-tree",       state: "CA" },
  { name: "Palm Springs",      slug: "palm-springs",      state: "CA" },
  { name: "Napa Valley",       slug: "napa-valley",       state: "CA" },
  // Tier 5 — Urban
  { name: "San Francisco",     slug: "san-francisco",     state: "CA" },
  { name: "Seattle",           slug: "seattle",           state: "WA" },
  { name: "Dallas",            slug: "dallas",            state: "TX" },
  { name: "Houston",           slug: "houston",           state: "TX" },
  { name: "Atlanta",           slug: "atlanta",           state: "GA" },
  { name: "Boston",            slug: "boston",            state: "MA" },
  { name: "Washington DC",     slug: "washington-dc",     state: "DC" },
  { name: "Philadelphia",      slug: "philadelphia",      state: "PA" },
  { name: "Tampa",             slug: "tampa",             state: "FL" },
  { name: "Portland",          slug: "portland",          state: "OR" },
  // Tier 6 — Hawaii
  { name: "Maui",              slug: "maui",              state: "HI" },
  { name: "Oahu",              slug: "oahu",              state: "HI" },
  { name: "Kauai",             slug: "kauai",             state: "HI" },
  { name: "Big Island",        slug: "big-island",        state: "HI" },
  // Tier 6 — Mountain / Nature
  { name: "Moab",              slug: "moab",              state: "UT" },
  { name: "Santa Fe",          slug: "santa-fe",          state: "NM" },
  { name: "Taos",              slug: "taos",              state: "NM" },
  { name: "Stowe",             slug: "stowe",             state: "VT" },
  { name: "Catskills",         slug: "catskills",         state: "NY" },
  { name: "Finger Lakes",      slug: "finger-lakes",      state: "NY" },
  { name: "Hudson Valley",     slug: "hudson-valley",     state: "NY" },
  { name: "Broken Bow",        slug: "broken-bow",        state: "OK" },
  { name: "Lake of the Ozarks",slug: "lake-of-the-ozarks",state: "MO" },
  { name: "Pigeon Forge",      slug: "pigeon-forge",      state: "TN" },
  // Tier 6 — Beach / Coastal
  { name: "Sarasota",          slug: "sarasota",          state: "FL" },
  { name: "St. Augustine",     slug: "st-augustine",      state: "FL" },
  { name: "Pensacola",         slug: "pensacola",         state: "FL" },
  { name: "Cannon Beach",      slug: "cannon-beach",      state: "OR" },
  { name: "Tybee Island",      slug: "tybee-island",      state: "GA" },
  { name: "Kiawah Island",     slug: "kiawah-island",     state: "SC" },
  { name: "St. Simons Island", slug: "st-simons-island",  state: "GA" },
  // Tier 6 — Urban / Emerging
  { name: "Chattanooga",       slug: "chattanooga",       state: "TN" },
  { name: "Fredericksburg TX", slug: "fredericksburg-tx", state: "TX" },
  { name: "New Braunfels",     slug: "new-braunfels",     state: "TX" },
  { name: "Coeur d'Alene",     slug: "coeur-dalene",      state: "ID" },
  { name: "Lake Geneva",       slug: "lake-geneva",       state: "WI" },
];

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

function STRVendLogo({ className = "" }: { className?: string }) {
  return (
    <div className={`flex items-center gap-2.5 ${className}`}>
      <div className="w-8 h-8 rounded-lg bg-coral-500 flex items-center justify-center shrink-0">
        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M9 1.5L0.75 8.25H3V16.5H7.5V12H10.5V16.5H15V8.25H17.25L9 1.5Z" fill="white"/>
        </svg>
      </div>
      <span className="font-bold text-lg tracking-tight leading-none">
        <span className="text-brand-600">STR</span>
        <span className="text-gray-900">Vend</span>
      </span>
    </div>
  );
}

export function Navbar() {
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
    <header className="sticky top-0 z-50 bg-white border-b border-gray-100 shadow-sm">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3 sm:px-6 lg:px-8">
        {/* Logo */}
        <Link href="/">
          <STRVendLogo />
        </Link>

        {/* Desktop nav */}
        <nav className="hidden md:flex items-center gap-6 text-sm text-gray-600">
          <Link href="/vendors" className="hover:text-brand-600 transition font-medium">All Vendors</Link>

          {/* Markets dropdown */}
          <div ref={mktRef} className="relative">
            <button
              onClick={() => { setMktMenuOpen(!mktMenuOpen); setCatMenuOpen(false); }}
              className="flex items-center gap-1 hover:text-brand-600 transition font-medium"
            >
              <MapPin className="h-3.5 w-3.5" />
              Markets
              <ChevronDown className={`h-3.5 w-3.5 transition-transform ${mktMenuOpen ? "rotate-180" : ""}`} />
            </button>
            {mktMenuOpen && (
              <div className="absolute left-0 mt-2 w-[52rem] rounded-2xl border border-gray-100 bg-white shadow-2xl py-3 z-50 max-h-[70vh] overflow-y-auto">
                <Link
                  href="/markets"
                  onClick={() => setMktMenuOpen(false)}
                  className="flex items-center justify-between mx-3 px-3 py-2 rounded-lg text-sm font-semibold text-brand-700 bg-brand-50 hover:bg-brand-100 transition mb-2"
                >
                  <span>Browse all 106 markets</span>
                  <span className="text-brand-500">→</span>
                </Link>
                <div className="grid grid-cols-4 px-1">
                  {ALL_MARKETS.map((m) => (
                    <Link
                      key={m.slug}
                      href={`/markets/${m.slug}`}
                      onClick={() => setMktMenuOpen(false)}
                      className="flex items-center justify-between px-3 py-1.5 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-700 rounded-lg transition"
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
              onClick={() => { setCatMenuOpen(!catMenuOpen); setMktMenuOpen(false); }}
              className="flex items-center gap-1 hover:text-brand-600 transition font-medium"
            >
              Categories
              <ChevronDown className={`h-3.5 w-3.5 transition-transform ${catMenuOpen ? "rotate-180" : ""}`} />
            </button>
            {catMenuOpen && (
              <div className="absolute left-0 mt-2 w-68 rounded-2xl border border-gray-100 bg-white shadow-2xl py-2 z-50">
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
            <div className="relative">
              <button
                onClick={() => setUserMenuOpen(!userMenuOpen)}
                className="flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-1.5 text-sm hover:bg-gray-50 transition"
              >
                <span className="w-6 h-6 rounded-full bg-brand-100 text-brand-700 text-xs font-semibold flex items-center justify-center">
                  {user.email?.[0]?.toUpperCase()}
                </span>
                {user.email?.split("@")[0]}
                <ChevronDown className="h-3.5 w-3.5 text-gray-400" />
              </button>
              {userMenuOpen && (
                <div className="absolute right-0 mt-2 w-48 rounded-2xl border border-gray-100 bg-white shadow-xl py-1.5 z-50">
                  <Link href="/dashboard" onClick={() => setUserMenuOpen(false)} className="block px-4 py-2 text-sm hover:bg-gray-50 transition">My Dashboard</Link>
                  <Link href="/dashboard/profile" onClick={() => setUserMenuOpen(false)} className="block px-4 py-2 text-sm hover:bg-gray-50 transition">Edit Profile</Link>
                  <hr className="my-1.5 border-gray-100" />
                  <button onClick={signOut} className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition">Sign Out</button>
                </div>
              )}
            </div>
          ) : (
            <>
              <Link href="/login" className="btn-secondary py-1.5 text-sm">Sign In</Link>
              <Link
                href="/register"
                className="rounded-lg bg-coral-500 px-4 py-2 text-sm font-semibold text-white hover:bg-coral-600 transition shadow-sm"
              >
                List Your Business
              </Link>
            </>
          )}
        </div>

        {/* Mobile toggle */}
        <button className="md:hidden p-1.5 rounded-lg hover:bg-gray-100 transition" onClick={() => setMenuOpen(!menuOpen)}>
          {menuOpen ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
        </button>
      </div>

      {/* Mobile menu */}
      {menuOpen && (
        <div className="md:hidden border-t border-gray-100 bg-white px-4 py-4 space-y-1 text-sm max-h-[80vh] overflow-y-auto">
          <Link href="/vendors" className="block py-2 font-semibold text-brand-700" onClick={() => setMenuOpen(false)}>
            All Vendors
          </Link>
          <p className="pt-3 pb-1 text-xs font-semibold uppercase tracking-wider text-gray-400">Markets</p>
          {ALL_MARKETS.map((m) => (
            <Link
              key={m.slug}
              href={`/markets/${m.slug}`}
              className="flex items-center justify-between py-1.5 text-gray-600 hover:text-brand-700 transition"
              onClick={() => setMenuOpen(false)}
            >
              <span>{m.name}</span>
              <span className="text-xs text-gray-400">{m.state}</span>
            </Link>
          ))}
          <p className="pt-3 pb-1 text-xs font-semibold uppercase tracking-wider text-gray-400">Categories</p>
          {ALL_CATEGORIES.map((cat) => (
            <Link
              key={cat.slug}
              href={`/vendors?category=${cat.slug}`}
              className="block py-1.5 text-gray-600 hover:text-brand-700 transition"
              onClick={() => setMenuOpen(false)}
            >
              {cat.name}
            </Link>
          ))}
          <hr className="my-3 border-gray-100" />
          {user ? (
            <>
              <Link href="/dashboard" className="block py-2 font-medium" onClick={() => setMenuOpen(false)}>My Dashboard</Link>
              <button onClick={signOut} className="block py-2 text-red-600">Sign Out</button>
            </>
          ) : (
            <div className="flex gap-2 pt-2">
              <Link href="/login" className="btn-secondary flex-1 justify-center text-sm">Sign In</Link>
              <Link href="/register" className="flex-1 flex justify-center items-center rounded-lg bg-coral-500 py-2 text-sm font-semibold text-white hover:bg-coral-600 transition">List Business</Link>
            </div>
          )}
        </div>
      )}
    </header>
  );
}
