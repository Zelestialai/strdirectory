"use client";
import { useState, useMemo } from "react";
import { Search, X, MapPin } from "lucide-react";
import { MarketCard } from "./MarketCard";
import type { Market } from "@/types";

interface MarketWithCount extends Market {
  vendorCount: number;
}

// Loosely group markets by US region for the "Browse by region" tabs
const REGION_STATES: Record<string, string[]> = {
  Southeast:   ["FL", "GA", "SC", "NC", "VA", "TN", "AL", "MS", "LA"],
  Northeast:   ["NY", "NJ", "MA", "CT", "RI", "NH", "ME", "VT", "PA", "DE", "DC", "MD"],
  Southwest:   ["TX", "AZ", "NM", "NV", "OK"],
  West:        ["CA", "OR", "WA", "HI", "ID", "MT"],
  Mountain:    ["CO", "UT", "WY"],
  Midwest:     ["IL", "WI", "MI", "MO", "MN", "IN", "OH"],
};

function getRegion(state: string): string {
  for (const [region, states] of Object.entries(REGION_STATES)) {
    if (states.includes(state)) return region;
  }
  return "Other";
}

const ALL_REGIONS = ["All", ...Object.keys(REGION_STATES), "Other"];

interface Props {
  markets: MarketWithCount[];
}

export function MarketsClientPage({ markets }: Props) {
  const [query, setQuery] = useState("");
  const [region, setRegion] = useState("All");

  const filtered = useMemo(() => {
    const q = query.toLowerCase().trim();
    return markets.filter((m) => {
      const matchesQuery =
        !q ||
        m.name.toLowerCase().includes(q) ||
        m.state.toLowerCase().includes(q) ||
        m.cities.some((c) => c.toLowerCase().includes(q));
      const matchesRegion = region === "All" || getRegion(m.state) === region;
      return matchesQuery && matchesRegion;
    });
  }, [markets, query, region]);

  // Count per region for badges
  const regionCounts = useMemo(() => {
    const counts: Record<string, number> = { All: markets.length };
    for (const m of markets) {
      const r = getRegion(m.state);
      counts[r] = (counts[r] ?? 0) + 1;
    }
    return counts;
  }, [markets]);

  return (
    <>
      {/* Search bar */}
      <div className="relative mb-6">
        <Search className="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search by market name, state, or city…"
          className="input pl-10 pr-10 w-full max-w-lg"
        />
        {query && (
          <button
            onClick={() => setQuery("")}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          >
            <X className="h-4 w-4" />
          </button>
        )}
      </div>

      {/* Region tabs */}
      <div className="flex flex-wrap gap-2 mb-8">
        {ALL_REGIONS.map((r) => {
          const count = regionCounts[r] ?? 0;
          if (r !== "All" && count === 0) return null;
          return (
            <button
              key={r}
              onClick={() => setRegion(r)}
              className={`rounded-full border px-3.5 py-1.5 text-sm font-medium transition ${
                region === r
                  ? "bg-brand-600 border-brand-600 text-white"
                  : "border-gray-200 text-gray-600 hover:border-brand-300 hover:text-brand-700"
              }`}
            >
              {r}
              <span className={`ml-1.5 text-xs ${region === r ? "text-brand-100" : "text-gray-400"}`}>
                {count}
              </span>
            </button>
          );
        })}
      </div>

      {/* Results count */}
      {(query || region !== "All") && (
        <p className="text-sm text-gray-500 mb-5">
          {filtered.length === 0
            ? "No markets found — try a different search"
            : `${filtered.length} market${filtered.length !== 1 ? "s" : ""} found`}
          {query && (
            <button onClick={() => { setQuery(""); setRegion("All"); }} className="ml-2 text-brand-600 hover:underline">
              Clear
            </button>
          )}
        </p>
      )}

      {/* Grid */}
      {filtered.length > 0 ? (
        <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
          {filtered.map((market) => (
            <MarketCard
              key={market.id}
              market={market}
              vendorCount={market.vendorCount}
            />
          ))}
        </div>
      ) : (
        <div className="text-center py-20 text-gray-400">
          <MapPin className="mx-auto h-10 w-10 mb-3 opacity-30" />
          <p className="font-medium">No markets match your search.</p>
          <button
            onClick={() => { setQuery(""); setRegion("All"); }}
            className="mt-3 text-sm text-brand-600 hover:underline"
          >
            Show all markets
          </button>
        </div>
      )}
    </>
  );
}
