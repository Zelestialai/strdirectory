import Link from "next/link";

const FEATURED_MARKETS = [
  { name: "Nashville",       slug: "nashville" },
  { name: "Miami",           slug: "miami" },
  { name: "Orlando",         slug: "orlando" },
  { name: "Austin",          slug: "austin" },
  { name: "Las Vegas",       slug: "las-vegas" },
  { name: "New York City",   slug: "new-york-city" },
  { name: "Chicago",         slug: "chicago" },
  { name: "Los Angeles",     slug: "los-angeles" },
  { name: "San Francisco",   slug: "san-francisco" },
  { name: "Seattle",         slug: "seattle" },

  { name: "Denver",          slug: "denver" },
  { name: "New Orleans",     slug: "new-orleans" },
  { name: "San Diego",       slug: "san-diego" },
  { name: "Charleston",      slug: "charleston" },
  { name: "Destin",          slug: "destin" },
  { name: "Smoky Mountains", slug: "smoky-mountains" },
  { name: "Scottsdale",      slug: "scottsdale" },
  { name: "Atlanta",         slug: "atlanta" },
  { name: "Dallas",          slug: "dallas" },
  { name: "Houston",         slug: "houston" },

  { name: "Asheville",       slug: "asheville" },
  { name: "Outer Banks",     slug: "outer-banks" },
  { name: "Key West",        slug: "key-west" },
  { name: "Savannah",        slug: "savannah" },
  { name: "Vail",            slug: "vail" },
  { name: "Aspen",           slug: "aspen" },
  { name: "Jackson Hole",    slug: "jackson-hole" },
  { name: "Cape Cod",        slug: "cape-cod" },
  { name: "Hamptons",        slug: "hamptons" },
  { name: "Palm Springs",    slug: "palm-springs" },
].sort((a, b) => a.name.localeCompare(b.name));

const CATEGORIES_COL1 = [
  { name: "Cleaning & Turnover",        slug: "cleaning-turnover" },
  { name: "Photography & Design",       slug: "photography-design" },
  { name: "Maintenance & Repairs",      slug: "maintenance-repairs" },
  { name: "Property Management",        slug: "property-management" },
  { name: "Real Estate & Finders",      slug: "real-estate" },
  { name: "Interior Design & Staging",  slug: "interior-design" },
];

const CATEGORIES_COL2 = [
  { name: "Renovation & Construction",  slug: "renovation" },
  { name: "Accounting & Tax",           slug: "accounting-tax" },
  { name: "Insurance",                  slug: "insurance" },
  { name: "Furniture & Supplies",       slug: "furniture-supplies" },
  { name: "Smart Home & Technology",    slug: "smart-home-tech" },
  { name: "Legal & Regulations",        slug: "legal-regulations" },
];

export function Footer() {
  return (
    <footer className="bg-brand-900 text-white mt-16">
      <div className="mx-auto max-w-7xl px-4 py-14 sm:px-6 lg:px-8">
        <div className="grid grid-cols-2 gap-8 md:grid-cols-9">
          {/* Brand */}
          <div className="col-span-2 md:col-span-1">
            <Link href="/" className="flex items-center gap-2.5 mb-4">
              <div className="w-8 h-8 rounded-lg bg-coral-500 flex items-center justify-center shrink-0">
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M9 1.5L0.75 8.25H3V16.5H7.5V12H10.5V16.5H15V8.25H17.25L9 1.5Z" fill="white"/>
                </svg>
              </div>
              <span className="font-bold text-lg tracking-tight leading-none">
                <span className="text-brand-300">STR</span>
                <span className="text-white">Vend</span>
              </span>
            </Link>
            <p className="text-sm text-brand-300 leading-relaxed">
              Connecting STR hosts with trusted local service providers across 108 markets.
            </p>
          </div>

          {/* Markets col 1 */}
          <div className="md:col-span-2">
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 mb-3">
              Markets
            </h4>
            <div className="grid grid-cols-2 gap-x-4">
              <ul className="space-y-2 text-sm text-brand-200">
                {FEATURED_MARKETS.slice(0, 10).map((m) => (
                  <li key={m.slug}>
                    <Link href={`/markets/${m.slug}`} className="hover:text-white transition">{m.name}</Link>
                  </li>
                ))}
              </ul>
              <ul className="space-y-2 text-sm text-brand-200">
                {FEATURED_MARKETS.slice(10, 20).map((m) => (
                  <li key={m.slug}>
                    <Link href={`/markets/${m.slug}`} className="hover:text-white transition">{m.name}</Link>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Markets col 3 + view all */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 invisible mb-3">More</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              {FEATURED_MARKETS.slice(20, 30).map((m) => (
                <li key={m.slug}>
                  <Link href={`/markets/${m.slug}`} className="hover:text-white transition">{m.name}</Link>
                </li>
              ))}
              <li className="pt-1">
                <Link href="/markets" className="text-coral-400 font-medium hover:text-coral-300 transition text-xs">
                  View all 108 markets →
                </Link>
              </li>
            </ul>
          </div>

          {/* Categories col 1 */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 mb-3">Categories</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              {CATEGORIES_COL1.map((c) => (
                <li key={c.slug}>
                  <Link href={`/vendors?category=${c.slug}`} className="hover:text-white transition">{c.name}</Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Categories col 2 */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 invisible mb-3">More</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              {CATEGORIES_COL2.map((c) => (
                <li key={c.slug}>
                  <Link href={`/vendors?category=${c.slug}`} className="hover:text-white transition">{c.name}</Link>
                </li>
              ))}
            </ul>
          </div>

          {/* For Vendors + Company */}
          <div className="md:col-span-2">
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 mb-3">For Vendors</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              <li><Link href="/register" className="hover:text-white transition">List Your Business</Link></li>
              <li><Link href="/dashboard" className="hover:text-white transition">Vendor Dashboard</Link></li>
            </ul>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 mt-6 mb-3">Company</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              <li><Link href="/about" className="hover:text-white transition">About</Link></li>
              <li><Link href="/contact" className="hover:text-white transition">Contact</Link></li>
            </ul>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-brand-400 mt-6 mb-3">Legal</h4>
            <ul className="space-y-2 text-sm text-brand-200">
              <li><Link href="/terms" className="hover:text-white transition">Terms of Service</Link></li>
              <li><Link href="/privacy" className="hover:text-white transition">Privacy Policy</Link></li>
              <li><Link href="/cookie-policy" className="hover:text-white transition">Cookie Policy</Link></li>
              <li><Link href="/refund-policy" className="hover:text-white transition">Refund Policy</Link></li>
              <li><Link href="/vendor-agreement" className="hover:text-white transition">Vendor Agreement</Link></li>
            </ul>
          </div>
        </div>

        <div className="mt-12 border-t border-brand-800 pt-6 flex flex-col sm:flex-row items-center justify-between gap-3">
          <p className="text-xs text-brand-500">
            © {new Date().getFullYear()} STRVend. All rights reserved.
          </p>
          <div className="flex flex-wrap items-center gap-x-4 gap-y-1">
            <Link href="/privacy" className="text-xs text-brand-500 hover:text-brand-300 transition">Privacy</Link>
            <Link href="/terms" className="text-xs text-brand-500 hover:text-brand-300 transition">Terms</Link>
            <Link href="/cookie-policy" className="text-xs text-brand-500 hover:text-brand-300 transition">Cookies</Link>
            <Link href="/refund-policy" className="text-xs text-brand-500 hover:text-brand-300 transition">Refunds</Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
