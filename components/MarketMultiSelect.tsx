"use client";
import { useState, useEffect, useRef } from "react";
import { Search, X } from "lucide-react";

export const MARKETS = [
  { name: "Nashville", slug: "nashville", state: "TN" },
  { name: "Miami", slug: "miami", state: "FL" },
  { name: "Orlando", slug: "orlando", state: "FL" },
  { name: "Los Angeles", slug: "los-angeles", state: "CA" },
  { name: "Austin", slug: "austin", state: "TX" },
  { name: "Las Vegas", slug: "las-vegas", state: "NV" },
  { name: "Scottsdale", slug: "scottsdale", state: "AZ" },
  { name: "New York City", slug: "new-york-city", state: "NY" },
  { name: "Denver", slug: "denver", state: "CO" },
  { name: "New Orleans", slug: "new-orleans", state: "LA" },
  { name: "San Diego", slug: "san-diego", state: "CA" },
  { name: "Charleston", slug: "charleston", state: "SC" },
  { name: "Myrtle Beach", slug: "myrtle-beach", state: "SC" },
  { name: "Destin", slug: "destin", state: "FL" },
  { name: "Smoky Mountains", slug: "smoky-mountains", state: "TN" },
  { name: "Chicago", slug: "chicago", state: "IL" },
  { name: "Asheville", slug: "asheville", state: "NC" },
  { name: "Outer Banks", slug: "outer-banks", state: "NC" },
  { name: "Hilton Head", slug: "hilton-head", state: "SC" },
  { name: "Key West", slug: "key-west", state: "FL" },
  { name: "Lake Tahoe", slug: "lake-tahoe", state: "CA" },
  { name: "Park City", slug: "park-city", state: "UT" },
  { name: "Sedona", slug: "sedona", state: "AZ" },
  { name: "Savannah", slug: "savannah", state: "GA" },
  { name: "Virginia Beach", slug: "virginia-beach", state: "VA" },
  { name: "San Antonio", slug: "san-antonio", state: "TX" },
  { name: "Gulf Shores", slug: "gulf-shores", state: "AL" },
  { name: "Panama City Beach", slug: "panama-city-beach", state: "FL" },
  { name: "Naples", slug: "naples", state: "FL" },
  { name: "Anna Maria Island", slug: "anna-maria-island", state: "FL" },
  { name: "Cape Cod", slug: "cape-cod", state: "MA" },
  { name: "Hamptons", slug: "hamptons", state: "NY" },
  { name: "Jersey Shore", slug: "jersey-shore", state: "NJ" },
  { name: "Ocean City", slug: "ocean-city", state: "MD" },
  { name: "Galveston", slug: "galveston", state: "TX" },
  { name: "Rehoboth Beach", slug: "rehoboth-beach", state: "DE" },
  { name: "South Padre Island", slug: "south-padre-island", state: "TX" },
  { name: "30A", slug: "thirty-a", state: "FL" },
  { name: "Breckenridge", slug: "breckenridge", state: "CO" },
  { name: "Vail", slug: "vail", state: "CO" },
  { name: "Aspen", slug: "aspen", state: "CO" },
  { name: "Steamboat Springs", slug: "steamboat-springs", state: "CO" },
  { name: "Telluride", slug: "telluride", state: "CO" },
  { name: "Jackson Hole", slug: "jackson-hole", state: "WY" },
  { name: "Big Sky", slug: "big-sky", state: "MT" },
  { name: "Sun Valley", slug: "sun-valley", state: "ID" },
  { name: "Mammoth Lakes", slug: "mammoth-lakes", state: "CA" },
  { name: "Big Bear", slug: "big-bear", state: "CA" },
  { name: "Bend", slug: "bend", state: "OR" },
  { name: "Whitefish", slug: "whitefish", state: "MT" },
  { name: "Clearwater", slug: "clearwater", state: "FL" },
  { name: "Fort Lauderdale", slug: "fort-lauderdale", state: "FL" },
  { name: "Nantucket", slug: "nantucket", state: "MA" },
  { name: "Martha's Vineyard", slug: "marthas-vineyard", state: "MA" },
  { name: "Bar Harbor", slug: "bar-harbor", state: "ME" },
  { name: "MS Gulf Coast", slug: "mississippi-gulf-coast", state: "MS" },
  { name: "Crystal Coast", slug: "crystal-coast", state: "NC" },
  { name: "Newport", slug: "newport", state: "RI" },
  { name: "Port Aransas", slug: "port-aransas", state: "TX" },
  { name: "Amelia Island", slug: "amelia-island", state: "FL" },
  { name: "Blue Ridge", slug: "blue-ridge", state: "GA" },
  { name: "Poconos", slug: "poconos", state: "PA" },
  { name: "Flagstaff", slug: "flagstaff", state: "AZ" },
  { name: "Durango", slug: "durango", state: "CO" },
  { name: "Boone", slug: "boone", state: "NC" },
  { name: "Door County", slug: "door-county", state: "WI" },
  { name: "Traverse City", slug: "traverse-city", state: "MI" },
  { name: "Joshua Tree", slug: "joshua-tree", state: "CA" },
  { name: "Palm Springs", slug: "palm-springs", state: "CA" },
  { name: "Napa Valley", slug: "napa-valley", state: "CA" },
  { name: "San Francisco", slug: "san-francisco", state: "CA" },
  { name: "Seattle", slug: "seattle", state: "WA" },
  { name: "Dallas", slug: "dallas", state: "TX" },
  { name: "Houston", slug: "houston", state: "TX" },
  { name: "Atlanta", slug: "atlanta", state: "GA" },
  { name: "Boston", slug: "boston", state: "MA" },
  { name: "Washington DC", slug: "washington-dc", state: "DC" },
  { name: "Philadelphia", slug: "philadelphia", state: "PA" },
  { name: "Tampa", slug: "tampa", state: "FL" },
  { name: "Portland", slug: "portland", state: "OR" },
  { name: "Maui", slug: "maui", state: "HI" },
  { name: "Oahu", slug: "oahu", state: "HI" },
  { name: "Kauai", slug: "kauai", state: "HI" },
  { name: "Big Island", slug: "big-island", state: "HI" },
  { name: "Moab", slug: "moab", state: "UT" },
  { name: "Santa Fe", slug: "santa-fe", state: "NM" },
  { name: "Taos", slug: "taos", state: "NM" },
  { name: "Stowe", slug: "stowe", state: "VT" },
  { name: "Catskills", slug: "catskills", state: "NY" },
  { name: "Finger Lakes", slug: "finger-lakes", state: "NY" },
  { name: "Hudson Valley", slug: "hudson-valley", state: "NY" },
  { name: "Broken Bow", slug: "broken-bow", state: "OK" },
  { name: "Lake of the Ozarks", slug: "lake-of-the-ozarks", state: "MO" },
  { name: "Pigeon Forge", slug: "pigeon-forge", state: "TN" },
  { name: "Sarasota", slug: "sarasota", state: "FL" },
  { name: "St. Augustine", slug: "st-augustine", state: "FL" },
  { name: "Pensacola", slug: "pensacola", state: "FL" },
  { name: "Cannon Beach", slug: "cannon-beach", state: "OR" },
  { name: "Tybee Island", slug: "tybee-island", state: "GA" },
  { name: "Kiawah Island", slug: "kiawah-island", state: "SC" },
  { name: "St. Simons Island", slug: "st-simons-island", state: "GA" },
  { name: "Chattanooga", slug: "chattanooga", state: "TN" },
  { name: "Fredericksburg TX", slug: "fredericksburg-tx", state: "TX" },
  { name: "New Braunfels", slug: "new-braunfels", state: "TX" },
  { name: "Coeur d'Alene", slug: "coeur-dalene", state: "ID" },
  { name: "Lake Geneva", slug: "lake-geneva", state: "WI" },
];

export function MarketMultiSelect({
  selected,
  onChange,
  placeholder = "Search 106 markets…",
}: {
  selected: string[];
  onChange: (v: string[]) => void;
  placeholder?: string;
}) {
  const [search, setSearch] = useState("");
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  const filtered = MARKETS.filter(
    (m) =>
      m.name.toLowerCase().includes(search.toLowerCase()) ||
      m.state.toLowerCase().includes(search.toLowerCase())
  );

  const toggle = (slug: string) =>
    onChange(
      selected.includes(slug)
        ? selected.filter((s) => s !== slug)
        : [...selected, slug]
    );

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  return (
    <div ref={ref} className="space-y-2">
      {selected.length > 0 && (
        <div className="flex flex-wrap gap-1.5">
          {selected.map((slug) => {
            const m = MARKETS.find((m) => m.slug === slug);
            return m ? (
              <span
                key={slug}
                className="inline-flex items-center gap-1 text-xs bg-brand-100 text-brand-700 rounded-full px-2.5 py-1 font-medium"
              >
                {m.name}, {m.state}
                <button
                  type="button"
                  onClick={() => toggle(slug)}
                  className="hover:text-brand-900 ml-0.5"
                >
                  <X className="h-3 w-3" />
                </button>
              </span>
            ) : null;
          })}
        </div>
      )}

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400 pointer-events-none" />
        <input
          type="text"
          value={search}
          onChange={(e) => { setSearch(e.target.value); setOpen(true); }}
          onFocus={() => setOpen(true)}
          className="input pl-9"
          placeholder={placeholder}
        />
      </div>

      {open && (
        <div className="max-h-52 overflow-y-auto rounded-xl border border-gray-200 bg-white shadow-lg divide-y divide-gray-50">
          {filtered.slice(0, 40).map((m) => (
            <label
              key={m.slug}
              className="flex items-center gap-2.5 px-3 py-2.5 hover:bg-gray-50 cursor-pointer"
            >
              <input
                type="checkbox"
                checked={selected.includes(m.slug)}
                onChange={() => toggle(m.slug)}
                className="h-4 w-4 rounded border-gray-300 text-brand-600 focus:ring-brand-500"
              />
              <span className="text-sm text-gray-700 flex-1">{m.name}</span>
              <span className="text-xs text-gray-400">{m.state}</span>
            </label>
          ))}
          {filtered.length === 0 && (
            <p className="text-sm text-gray-400 text-center py-4">No markets match</p>
          )}
        </div>
      )}
    </div>
  );
}
