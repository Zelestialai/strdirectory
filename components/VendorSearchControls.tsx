"use client";
import { useRouter, useSearchParams, usePathname } from "next/navigation";
import { useRef, useState, useTransition } from "react";
import { Search, X, SlidersHorizontal } from "lucide-react";
import type { Market } from "@/types";

interface Props {
  markets: Market[];
}

export function VendorSearchControls({ markets }: Props) {
  const router = useRouter();
  const pathname = usePathname();
  const sp = useSearchParams();
  const [isPending, startTransition] = useTransition();
  const [showFilters, setShowFilters] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  function buildUrl(overrides: Record<string, string | undefined>) {
    const p = new URLSearchParams(sp.toString());
    // Always reset page when any filter changes
    p.delete("page");
    for (const [k, v] of Object.entries(overrides)) {
      if (v === undefined || v === "") p.delete(k);
      else p.set(k, v);
    }
    return `${pathname}?${p.toString()}`;
  }

  function push(overrides: Record<string, string | undefined>) {
    startTransition(() => router.push(buildUrl(overrides)));
  }

  const currentQ = sp.get("q") ?? "";
  const currentMarket = sp.get("market") ?? "";
  const currentSort = sp.get("sort") ?? "best_rated";

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    push({ q: inputRef.current?.value || undefined });
  };

  return (
    <div className="space-y-3">
      {/* Search bar */}
      <form onSubmit={handleSearch} className="flex gap-2">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400 pointer-events-none" />
          <input
            ref={inputRef}
            defaultValue={currentQ}
            className="input pl-9 pr-8 w-full"
            placeholder="Search by name, service…"
          />
          {currentQ && (
            <button
              type="button"
              onClick={() => { if (inputRef.current) inputRef.current.value = ""; push({ q: undefined }); }}
              className="absolute right-2.5 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
            >
              <X className="h-3.5 w-3.5" />
            </button>
          )}
        </div>
        <button type="submit" className="btn-primary px-4 text-sm" disabled={isPending}>
          Search
        </button>
      </form>

      {/* Mobile: toggle filters button */}
      <button
        className="lg:hidden flex items-center gap-2 text-sm font-medium text-gray-600 border border-gray-200 rounded-lg px-3 py-2 w-full justify-center hover:bg-gray-50"
        onClick={() => setShowFilters((v) => !v)}
      >
        <SlidersHorizontal className="h-4 w-4" />
        {showFilters ? "Hide filters" : "Show filters"}
      </button>

      {/* Controls — always visible on lg, toggle on mobile */}
      <div className={`${showFilters ? "flex" : "hidden"} lg:flex flex-col sm:flex-row lg:flex-col gap-3`}>
        {/* Market select */}
        <div className="flex-1 lg:flex-none">
          <label className="block text-xs font-semibold uppercase tracking-wider text-gray-500 mb-1.5">Market</label>
          <select
            value={currentMarket}
            onChange={(e) => push({ market: e.target.value || undefined, city: undefined, state: undefined })}
            className="input text-sm w-full"
          >
            <option value="">All markets</option>
            {markets.map((m) => (
              <option key={m.id} value={m.slug}>
                {m.name}, {m.state}
              </option>
            ))}
          </select>
        </div>

        {/* Sort select */}
        <div className="flex-1 lg:flex-none">
          <label className="block text-xs font-semibold uppercase tracking-wider text-gray-500 mb-1.5">Sort by</label>
          <select
            value={currentSort}
            onChange={(e) => push({ sort: e.target.value })}
            className="input text-sm w-full"
          >
            <option value="best_rated">Best rated</option>
            <option value="most_reviewed">Most reviews</option>
            <option value="featured">Featured first</option>
            <option value="newest">Newest</option>
            <option value="alpha">A – Z</option>
          </select>
        </div>
      </div>

      {isPending && (
        <div className="h-0.5 w-full rounded-full overflow-hidden bg-gray-100">
          <div className="h-full bg-brand-400 animate-pulse w-2/3" />
        </div>
      )}
    </div>
  );
}
