"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import {
  CalendarDays,
  Plus,
  Loader2,
  Check,
  X,
  Clock,
  Sparkles,
  Home,
  Star,
} from "lucide-react";
import { TurnoverChecklist } from "@/components/turnover/TurnoverChecklist";

interface Bid {
  id: string;
  price_cents: number;
  message: string | null;
  status: string;
  vendor: { business_name: string; avg_rating: number | null; slug: string } | null;
}
interface Task {
  id: string;
  title: string;
  notes: string | null;
  scheduled_date: string;
  status: string;
  price_cents: number | null;
  property: { name: string } | null;
  assigned: { business_name: string } | null;
  bids: Bid[];
}
interface Property {
  id: string;
  name: string;
}

const STATUS_BADGE: Record<string, string> = {
  open: "bg-amber-50 text-amber-700 border-amber-200",
  assigned: "bg-blue-50 text-blue-700 border-blue-200",
  scheduled: "bg-green-50 text-green-700 border-green-200",
  completed: "bg-gray-100 text-gray-500 border-gray-200",
  cancelled: "bg-gray-100 text-gray-400 border-gray-200",
};
const STATUS_LABEL: Record<string, string> = {
  open: "Open for bids",
  assigned: "Awaiting cleaner",
  scheduled: "Scheduled",
  completed: "Completed",
  cancelled: "Cancelled",
};

function fmtMoney(cents: number) {
  return `$${(cents / 100).toFixed(0)}`;
}
function fmtDate(d: string) {
  return new Date(d + "T12:00:00").toLocaleDateString("en-US", {
    weekday: "short",
    month: "short",
    day: "numeric",
  });
}

export function HostTurnovers({
  tasks,
  properties,
}: {
  tasks: Task[];
  properties: Property[];
}) {
  const router = useRouter();
  const [showForm, setShowForm] = useState(false);
  const [busy, setBusy] = useState<string | null>(null);
  const [statusError, setStatusError] = useState<Record<string, string>>({});

  // create form state
  const [title, setTitle] = useState("");
  const [propertyId, setPropertyId] = useState("");
  const [date, setDate] = useState("");
  const [price, setPrice] = useState("");
  const [notes, setNotes] = useState("");
  const [error, setError] = useState<string | null>(null);

  async function createTask(e: React.FormEvent) {
    e.preventDefault();
    if (!title.trim() || !date) {
      setError("Title and date are required");
      return;
    }
    setBusy("create");
    setError(null);
    try {
      const res = await fetch("/api/turnovers", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          title: title.trim(),
          scheduled_date: date,
          property_id: propertyId || null,
          price_cents: price ? Math.round(parseFloat(price) * 100) : null,
          notes: notes.trim() || null,
        }),
      });
      if (!res.ok) throw new Error((await res.json()).error || "Failed to create");
      setShowForm(false);
      setTitle(""); setPropertyId(""); setDate(""); setPrice(""); setNotes("");
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Something went wrong");
    } finally {
      setBusy(null);
    }
  }

  async function acceptBid(taskId: string, bidId: string) {
    setBusy(bidId);
    try {
      await fetch(`/api/turnovers/${taskId}/accept-bid`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ bid_id: bidId }),
      });
      router.refresh();
    } finally {
      setBusy(null);
    }
  }

  async function setStatus(taskId: string, status: "completed" | "cancelled") {
    setBusy(taskId + status);
    setStatusError((p) => { const n = { ...p }; delete n[taskId]; return n; });
    try {
      const res = await fetch(`/api/turnovers/${taskId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status }),
      });
      if (!res.ok) {
        const data = await res.json().catch(() => ({}));
        setStatusError((p) => ({ ...p, [taskId]: data.error || "Couldn't update this turnover" }));
        return;
      }
      router.refresh();
    } finally {
      setBusy(null);
    }
  }

  const upcoming = tasks.filter((t) => !["completed", "cancelled"].includes(t.status));
  const past = tasks.filter((t) => ["completed", "cancelled"].includes(t.status));

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between gap-4 flex-wrap">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Turnovers</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            Cleaning tasks are auto-created from your synced check-outs, or add one manually.
          </p>
        </div>
        <button
          onClick={() => setShowForm((s) => !s)}
          className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 transition"
        >
          <Plus className="h-4 w-4" /> New turnover
        </button>
      </div>

      {showForm && (
        <form onSubmit={createTask} className="card p-5 space-y-4">
          <div className="grid gap-4 sm:grid-cols-2">
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
              <input value={title} onChange={(e) => setTitle(e.target.value)}
                placeholder="Turnover cleaning — Beach House"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Property (optional)</label>
              <select value={propertyId} onChange={(e) => setPropertyId(e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm bg-white focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none">
                <option value="">— none —</option>
                {properties.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Turnover date</label>
              <input type="date" value={date} onChange={(e) => setDate(e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Budget / offer (optional)</label>
              <input type="number" min="0" step="1" value={price} onChange={(e) => setPrice(e.target.value)}
                placeholder="120"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">Notes (optional)</label>
              <textarea value={notes} onChange={(e) => setNotes(e.target.value)} rows={2}
                placeholder="Gate code, linen closet location, pet on site…"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm resize-none focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
          </div>
          {error && <p className="text-xs text-red-600">{error}</p>}
          <div className="flex items-center gap-2">
            <button type="submit" disabled={busy === "create"}
              className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50 transition">
              {busy === "create" && <Loader2 className="h-3.5 w-3.5 animate-spin" />} Create turnover
            </button>
            <button type="button" onClick={() => setShowForm(false)} className="rounded-lg px-4 py-2 text-sm text-gray-600 hover:bg-gray-100">Cancel</button>
          </div>
          <p className="text-xs text-gray-400">
            If you have a cleaner on your team, they'll be auto-assigned. Otherwise it's posted for cleaners to bid on.
          </p>
        </form>
      )}

      {upcoming.length === 0 ? (
        <div className="card p-12 text-center text-gray-400">
          <CalendarDays className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p>No upcoming turnovers. Sync a property calendar or add one manually.</p>
        </div>
      ) : (
        <div className="space-y-3">
          {upcoming.map((t) => (
            <div key={t.id} className="card p-5">
              <div className="flex items-start justify-between gap-4 flex-wrap">
                <div className="min-w-0">
                  <div className="flex items-center gap-2 flex-wrap">
                    <h3 className="font-semibold text-gray-900">{t.title}</h3>
                    <span className={`rounded-full border px-2 py-0.5 text-xs font-medium ${STATUS_BADGE[t.status]}`}>
                      {STATUS_LABEL[t.status]}
                    </span>
                  </div>
                  <div className="mt-1.5 flex flex-wrap items-center gap-x-4 gap-y-1 text-sm text-gray-500">
                    <span className="inline-flex items-center gap-1"><CalendarDays className="h-3.5 w-3.5" />{fmtDate(t.scheduled_date)}</span>
                    {t.property && <span className="inline-flex items-center gap-1"><Home className="h-3.5 w-3.5" />{t.property.name}</span>}
                    {t.price_cents != null && <span className="font-medium text-gray-700">{fmtMoney(t.price_cents)}</span>}
                    {t.assigned && <span className="inline-flex items-center gap-1 text-green-700"><Sparkles className="h-3.5 w-3.5" />{t.assigned.business_name}</span>}
                  </div>
                  {t.notes && <p className="mt-2 text-sm text-gray-600 bg-gray-50 rounded-lg p-2.5">{t.notes}</p>}
                </div>
                <div className="flex items-center gap-2 shrink-0">
                  {t.status === "scheduled" && (
                    <button onClick={() => setStatus(t.id, "completed")} disabled={busy === t.id + "completed"}
                      className="inline-flex items-center gap-1 rounded-lg border border-gray-200 px-3 py-1.5 text-xs font-medium text-gray-700 hover:bg-gray-50">
                      <Check className="h-3.5 w-3.5" /> Mark done
                    </button>
                  )}
                  <button onClick={() => setStatus(t.id, "cancelled")} disabled={busy === t.id + "cancelled"}
                    className="inline-flex items-center gap-1 rounded-lg px-2.5 py-1.5 text-xs text-gray-400 hover:text-red-600 hover:bg-red-50">
                    <X className="h-3.5 w-3.5" /> Cancel
                  </button>
                </div>
              </div>

              {statusError[t.id] && (
                <p className="mt-2 text-xs text-red-600 bg-red-50 border border-red-100 rounded-lg px-3 py-2">
                  {statusError[t.id]}
                </p>
              )}

              {/* Cleaning checklist progress (read-only for the host) */}
              {(t.status === "scheduled" || t.status === "assigned" || t.status === "completed") && (
                <TurnoverChecklist taskId={t.id} />
              )}

              {/* Bids on open tasks */}
              {t.status === "open" && (
                <div className="mt-4 border-t border-gray-100 pt-3">
                  <p className="text-xs font-semibold uppercase tracking-wider text-gray-400 mb-2">
                    {t.bids.length > 0 ? `${t.bids.length} bid${t.bids.length !== 1 ? "s" : ""}` : "Awaiting bids from cleaners"}
                  </p>
                  <div className="space-y-2">
                    {t.bids.map((b) => (
                      <div key={b.id} className="flex items-center justify-between gap-3 rounded-lg border border-gray-100 p-3">
                        <div className="min-w-0">
                          <div className="flex items-center gap-2">
                            <p className="text-sm font-medium text-gray-800">{b.vendor?.business_name ?? "Cleaner"}</p>
                            {b.vendor?.avg_rating ? (
                              <span className="inline-flex items-center gap-0.5 text-xs text-amber-600">
                                <Star className="h-3 w-3 fill-amber-400 text-amber-400" />{b.vendor.avg_rating.toFixed(1)}
                              </span>
                            ) : null}
                          </div>
                          {b.message && <p className="text-xs text-gray-500 mt-0.5">{b.message}</p>}
                        </div>
                        <div className="flex items-center gap-2 shrink-0">
                          <span className="font-bold text-gray-900">{fmtMoney(b.price_cents)}</span>
                          <button onClick={() => acceptBid(t.id, b.id)} disabled={busy === b.id}
                            className="inline-flex items-center gap-1 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
                            {busy === b.id ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Check className="h-3.5 w-3.5" />} Accept
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {t.status === "assigned" && (
                <p className="mt-3 text-xs text-gray-400 inline-flex items-center gap-1">
                  <Clock className="h-3.5 w-3.5" /> Waiting for the assigned cleaner to accept.
                </p>
              )}
            </div>
          ))}
        </div>
      )}

      {past.length > 0 && (
        <div>
          <h2 className="text-sm font-semibold text-gray-500 mb-2">History</h2>
          <div className="space-y-2">
            {past.map((t) => (
              <div key={t.id} className="flex items-center justify-between gap-3 rounded-lg border border-gray-100 bg-gray-50/50 px-4 py-2.5 text-sm">
                <span className="text-gray-600">{t.title}</span>
                <span className="flex items-center gap-3">
                  <span className="text-gray-400 text-xs">{fmtDate(t.scheduled_date)}</span>
                  <span className={`rounded-full border px-2 py-0.5 text-xs ${STATUS_BADGE[t.status]}`}>{STATUS_LABEL[t.status]}</span>
                </span>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
