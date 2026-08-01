"use client";

import { useState, useRef, useEffect, useMemo } from "react";
import { useRouter } from "next/navigation";
import { MapPin, ChevronDown, Search, Check, Loader2 } from "lucide-react";

interface MarketBrief {
  name: string;
  slug: string;
  state: string;
}

export function MarketSwitcher({
  current,
  markets,
}: {
  current: MarketBrief | null;
  markets: MarketBrief[];
}) {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [saving, setSaving] = useState<string | null>(null);
  const ref = useRef<HTMLDivElement>(null);
  const router = useRouter();

  useEffect(() => {
    function onClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) {
        setOpen(false);
        setQuery("");
      }
    }
    document.addEventListener("mousedown", onClick);
    return () => document.removeEventListener("mousedown", onClick);
  }, []);

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return markets;
    return markets.filter(
      (m) => m.name.toLowerCase().includes(q) || m.state.toLowerCase().includes(q)
    );
  }, [query, markets]);

  async function pick(slug: string) {
    if (saving) return;
    setSaving(slug);
    try {
      const res = await fetch("/api/market", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ slug }),
      });
      if (!res.ok) throw new Error();
      setOpen(false);
      setQuery("");
      router.refresh();
    } catch {
      // leave open so the user can retry
    } finally {
      setSaving(null);
    }
  }

  return (
    <div className="relative" ref={ref}>
      <button
        onClick={() => setOpen((o) => !o)}
        className="flex items-center gap-1.5 rounded-lg border border-gray-200 px-2.5 py-1.5 text-sm text-gray-700 hover:bg-gray-50 transition max-w-[180px]"
        title="Change your market"
      >
        <MapPin className="h-4 w-4 text-brand-600 shrink-0" />
        <span className="truncate font-medium">{current?.name ?? "Choose market"}</span>
        <ChevronDown className="h-3 w-3 text-gray-400 shrink-0" />
      </button>

      {open && (
        <div className="absolute left-0 mt-2 w-72 max-w-[calc(100vw-2rem)] rounded-xl border border-gray-200 bg-white shadow-lg z-50 overflow-hidden">
          <div className="p-2 border-b border-gray-100">
            <div className="relative">
              <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
              <input
                autoFocus
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Search markets…"
                className="w-full rounded-lg border border-gray-200 pl-8 pr-3 py-1.5 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none"
              />
            </div>
          </div>
          <ul className="max-h-72 overflow-y-auto py-1">
            {filtered.length === 0 ? (
              <li className="px-4 py-6 text-center text-sm text-gray-400">No markets found</li>
            ) : (
              filtered.map((m) => {
                const isCurrent = current?.slug === m.slug;
                return (
                  <li key={m.slug}>
                    <button
                      onClick={() => pick(m.slug)}
                      disabled={!!saving}
                      className={`flex w-full items-center justify-between gap-2 px-4 py-2 text-sm text-left hover:bg-brand-50 transition ${
                        isCurrent ? "text-brand-700 font-medium" : "text-gray-700"
                      }`}
                    >
                      <span className="flex items-center gap-2 min-w-0">
                        <MapPin className={`h-3.5 w-3.5 shrink-0 ${isCurrent ? "text-brand-600" : "text-gray-300"}`} />
                        <span className="truncate">{m.name}</span>
                        <span className="text-xs text-gray-400 shrink-0">{m.state}</span>
                      </span>
                      {saving === m.slug ? (
                        <Loader2 className="h-3.5 w-3.5 animate-spin text-brand-500 shrink-0" />
                      ) : isCurrent ? (
                        <Check className="h-4 w-4 text-brand-600 shrink-0" />
                      ) : null}
                    </button>
                  </li>
                );
              })
            )}
          </ul>
        </div>
      )}
    </div>
  );
}
