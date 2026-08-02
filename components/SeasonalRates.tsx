"use client";

import { useState, useEffect, useCallback } from "react";
import { Plus, Trash2, Loader2, CalendarRange } from "lucide-react";

interface Rate {
  id: string;
  label: string | null;
  start_date: string;
  end_date: string;
  nightly_rate_cents: number;
  source: string;
}

function fmt(cents: number) {
  return `$${(cents / 100).toFixed(0)}`;
}
function fmtDate(d: string) {
  return new Date(d + "T12:00:00").toLocaleDateString("en-US", { month: "short", day: "numeric", year: "2-digit" });
}

export function SeasonalRates({ siteId }: { siteId: string }) {
  const [rates, setRates] = useState<Rate[]>([]);
  const [open, setOpen] = useState(false);
  const [label, setLabel] = useState("");
  const [start, setStart] = useState("");
  const [end, setEnd] = useState("");
  const [price, setPrice] = useState("");
  const [busy, setBusy] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    const res = await fetch(`/api/booking-sites/${siteId}/seasonal-rates`);
    if (res.ok) setRates((await res.json()).rates ?? []);
  }, [siteId]);

  useEffect(() => {
    load();
  }, [load]);

  async function add(e: React.FormEvent) {
    e.preventDefault();
    if (!start || !end || !price) {
      setError("Dates and rate are required");
      return;
    }
    setBusy("add");
    setError(null);
    try {
      const res = await fetch(`/api/booking-sites/${siteId}/seasonal-rates`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          label: label || null,
          start_date: start,
          end_date: end,
          nightly_rate_cents: Math.round(parseFloat(price) * 100),
        }),
      });
      if (!res.ok) throw new Error((await res.json()).error || "Failed to add");
      setLabel(""); setStart(""); setEnd(""); setPrice(""); setOpen(false);
      await load();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
    } finally {
      setBusy(null);
    }
  }

  async function remove(id: string) {
    setBusy(id);
    try {
      await fetch(`/api/booking-sites/${siteId}/seasonal-rates?id=${id}`, { method: "DELETE" });
      await load();
    } finally {
      setBusy(null);
    }
  }

  return (
    <div className="border-t border-gray-100 pt-3">
      <div className="flex items-center justify-between">
        <p className="text-xs font-semibold text-gray-700 flex items-center gap-1.5">
          <CalendarRange className="h-3.5 w-3.5" /> Seasonal & event rates
        </p>
        <button type="button" onClick={() => setOpen((o) => !o)}
          className="text-xs text-brand-600 hover:underline inline-flex items-center gap-1">
          <Plus className="h-3 w-3" /> Add rate
        </button>
      </div>

      {rates.length > 0 && (
        <ul className="mt-2 space-y-1.5">
          {rates.map((r) => (
            <li key={r.id} className="flex items-center justify-between gap-2 rounded-lg bg-gray-50 px-3 py-2 text-xs">
              <span className="min-w-0">
                <span className="font-medium text-gray-800">{r.label || "Seasonal"}</span>
                <span className="text-gray-500"> · {fmtDate(r.start_date)}–{fmtDate(r.end_date)}</span>
                {r.source === "pricelabs" && <span className="ml-1 text-brand-600">(PriceLabs)</span>}
              </span>
              <span className="flex items-center gap-2 shrink-0">
                <span className="font-semibold text-gray-900">{fmt(r.nightly_rate_cents)}/nt</span>
                <button type="button" onClick={() => remove(r.id)} disabled={busy === r.id}
                  className="text-gray-300 hover:text-red-600">
                  {busy === r.id ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Trash2 className="h-3.5 w-3.5" />}
                </button>
              </span>
            </li>
          ))}
        </ul>
      )}

      {open && (
        <form onSubmit={add} className="mt-2 space-y-2 rounded-lg border border-gray-100 p-3">
          <input value={label} onChange={(e) => setLabel(e.target.value)} placeholder="Label (e.g. Peak season)"
            className="w-full rounded-lg border border-gray-200 px-2.5 py-1.5 text-xs focus:border-brand-400 focus:outline-none" />
          <div className="grid grid-cols-3 gap-2">
            <input type="date" value={start} onChange={(e) => setStart(e.target.value)}
              className="rounded-lg border border-gray-200 px-2 py-1.5 text-xs focus:border-brand-400 focus:outline-none" />
            <input type="date" value={end} onChange={(e) => setEnd(e.target.value)}
              className="rounded-lg border border-gray-200 px-2 py-1.5 text-xs focus:border-brand-400 focus:outline-none" />
            <input type="number" min="0" step="1" value={price} onChange={(e) => setPrice(e.target.value)} placeholder="$/night"
              className="rounded-lg border border-gray-200 px-2 py-1.5 text-xs focus:border-brand-400 focus:outline-none" />
          </div>
          {error && <p className="text-[11px] text-red-600">{error}</p>}
          <div className="flex items-center gap-2">
            <button type="submit" disabled={busy === "add"}
              className="inline-flex items-center gap-1 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
              {busy === "add" && <Loader2 className="h-3 w-3 animate-spin" />} Add
            </button>
            <button type="button" onClick={() => setOpen(false)} className="text-xs text-gray-500 hover:text-gray-700">Cancel</button>
          </div>
        </form>
      )}
    </div>
  );
}
