import Link from "next/link";
import { Building2 } from "lucide-react";

// Curated selection shown in footer — full list lives on /markets
const MARKETS_COL1 = [
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
];

const MARKETS_COL2 = [
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
];

const MARKETS_COL3 = [
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
];

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
    <footer className="border-t bg-gray-50 mt-16">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="grid grid-cols-2 gap-8 md:grid-cols-9">
          {/* Brand */}
          <div className="col-span-2 md:col-span-1">
            <div className="flex items-center gap-2 text-brand-700 font-bold">
              <Building2 className="h-4 w-4" /> STR Pro Directory
            </div>
            <p className="mt-2 text-sm text-gray-500">
              Connecting short-term rental hosts with the best local service providers.
            </p>
          </div>

          {/* Markets col 1 */}
          <div className="md:col-span-2">
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500">
              Markets
            </h4>
            <div className="mt-3 grid grid-cols-2 gap-x-4">
              <ul className="space-y-2 text-sm text-gray-600">
                {MARKETS_COL1.map((m) => (
                  <li key={m.slug}>
                    <Link href={`/markets/${m.slug}`} className="hover:text-brand-700 transition">{m.name}</Link>
                  </li>
                ))}
              </ul>
              <ul className="space-y-2 text-sm text-gray-600">
                {MARKETS_COL2.map((m) => (
                  <li key={m.slug}>
                    <Link href={`/markets/${m.slug}`} className="hover:text-brand-700 transition">{m.name}</Link>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Markets col 3 + view all */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500 invisible">More</h4>
            <ul className="mt-3 space-y-2 text-sm text-gray-600">
              {MARKETS_COL3.map((m) => (
                <li key={m.slug}>
                  <Link href={`/markets/${m.slug}`} className="hover:text-brand-700 transition">{m.name}</Link>
                </li>
              ))}
              <li className="pt-1">
                <Link href="/markets" className="text-brand-600 font-medium hover:text-brand-800 transition text-xs">
                  View all 106 markets →
                </Link>
              </li>
            </ul>
          </div>

          {/* Categories col 1 */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500">Categories</h4>
            <ul className="mt-3 space-y-2 text-sm text-gray-600">
              {CATEGORIES_COL1.map((c) => (
                <li key={c.slug}>
                  <Link href={`/vendors?category=${c.slug}`} className="hover:text-brand-700 transition">{c.name}</Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Categories col 2 */}
          <div>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500 invisible">More</h4>
            <ul className="mt-3 space-y-2 text-sm text-gray-600">
              {CATEGORIES_COL2.map((c) => (
                <li key={c.slug}>
                  <Link href={`/vendors?category=${c.slug}`} className="hover:text-brand-700 transition">{c.name}</Link>
                </li>
              ))}
            </ul>
          </div>

          {/* For Vendors */}
          <div className="md:col-span-2">
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500">For Vendors</h4>
            <ul className="mt-3 space-y-2 text-sm text-gray-600">
              <li><Link href="/register" className="hover:text-brand-700">List Your Business</Link></li>
              <li><Link href="/dashboard" className="hover:text-brand-700">Vendor Dashboard</Link></li>
            </ul>
            <h4 className="text-xs font-semibold uppercase tracking-wider text-gray-500 mt-6">Company</h4>
            <ul className="mt-3 space-y-2 text-sm text-gray-600">
              <li><Link href="/about" className="hover:text-brand-700">About</Link></li>
              <li><Link href="/contact" className="hover:text-brand-700">Contact</Link></li>
            </ul>
          </div>
        </div>

        <div className="mt-10 border-t pt-6 text-center text-xs text-gray-400">
          © {new Date().getFullYear()} STR Pro Directory. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
