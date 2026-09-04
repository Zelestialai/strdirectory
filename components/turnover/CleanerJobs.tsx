"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import {
  CalendarDays,
  Loader2,
  Check,
  X,
  Home,
  MapPin,
  Gavel,
  Sparkles,
} from "lucide-react";
import { TurnoverChecklist } from "@/components/turnover/TurnoverChecklist";
import { SharedPhotos } from "@/components/photos/SharedPhotos";

interface Task {
  id: string;
  property_id: string | null;
  title: string;
  notes: string | null;
  scheduled_date: string;
  status: string;
  price_cents: number | null;
  market_slug: string | null;
  property: { name: string } | null;
}

function fmtMoney(cents: number) {
  return `$${(cents / 100).toFixed(0)}`;
}
function fmtDate(d: string) {
  return new Date(d + "T12:00:00").toLocaleDateString("en-US", {
    weekday: "long",
    month: "short",
    day: "numeric",
  });
}

export function CleanerJobs({
  assigned,
  open,
  scheduled,
  myBids,
}: {
  assigned: Task[];
  open: Task[];
  scheduled: Task[];
  myBids: Record<string, number>; // task_id -> price_cents
}) {
  const router = useRouter();
  const [tab, setTab] = useState<"scheduled" | "assigned" | "open">(
    assigned.length > 0 ? "assigned" : "scheduled"
  );
  const [busy, setBusy] = useState<string | null>(null);
  const [bidFor, setBidFor] = useState<string | null>(null);
  const [bidPrice, setBidPrice] = useState("");
  const [bidMsg, setBidMsg] = useState("");

  async function respond(taskId: string, action: "accept" | "decline") {
    setBusy(taskId + action);
    try {
      await fetch(`/api/turnovers/${taskId}/respond`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ action }),
      });
      router.refresh();
    } finally {
      setBusy(null);
    }
  }

  async function submitBid(taskId: string) {
    if (!bidPrice) return;
    setBusy(taskId + "bid");
    try {
      await fetch(`/api/turnovers/${taskId}/bids`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          price_cents: Math.round(parseFloat(bidPrice) * 100),
          message: bidMsg.trim() || null,
        }),
      });
      setBidFor(null);
      setBidPrice("");
      setBidMsg("");
      router.refresh();
    } finally {
      setBusy(null);
    }
  }

  const TABS = [
    { key: "scheduled" as const, label: "My schedule", count: scheduled.length },
    { key: "assigned" as const, label: "Assigned", count: assigned.length },
    { key: "open" as const, label: "Open jobs", count: open.length },
  ];

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Turnover Jobs</h1>
        <p className="text-sm text-gray-500 mt-0.5">
          Accept assigned jobs, bid on open ones, and see your cleaning schedule.
        </p>
      </div>

      <div className="flex gap-2 flex-wrap">
        {TABS.map((t) => (
          <button
            key={t.key}
            onClick={() => setTab(t.key)}
            className={`rounded-full border px-3 py-1.5 text-sm font-medium transition flex items-center gap-1.5 ${
              tab === t.key
                ? "bg-brand-600 text-white border-brand-600"
                : "bg-white text-gray-600 hover:border-brand-400"
            }`}
          >
            {t.label}
            {t.count > 0 && (
              <span className={`rounded-full px-1.5 text-xs font-semibold ${tab === t.key ? "bg-white/20" : "bg-gray-100 text-gray-500"}`}>
                {t.count}
              </span>
            )}
          </button>
        ))}
      </div>

      {/* Assigned — accept/decline */}
      {tab === "assigned" && (
        <List empty="No jobs awaiting your response.">
          {assigned.map((t) => (
            <div key={t.id} className="card p-5">
              <JobHeader t={t} />
              <div className="mt-3 flex items-center gap-2">
                <button onClick={() => respond(t.id, "accept")} disabled={busy === t.id + "accept"}
                  className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
                  {busy === t.id + "accept" ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Check className="h-3.5 w-3.5" />} Accept
                </button>
                <button onClick={() => respond(t.id, "decline")} disabled={busy === t.id + "decline"}
                  className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-50 disabled:opacity-50">
                  <X className="h-3.5 w-3.5" /> Decline
                </button>
              </div>
            </div>
          ))}
        </List>
      )}

      {/* Open — bid */}
      {tab === "open" && (
        <List empty="No open jobs right now. Check back soon.">
          {open.map((t) => {
            const myBid = myBids[t.id];
            return (
              <div key={t.id} className="card p-5">
                <JobHeader t={t} showBudget />
                {myBid != null ? (
                  <p className="mt-3 inline-flex items-center gap-1.5 text-sm text-green-700">
                    <Check className="h-4 w-4" /> You bid {fmtMoney(myBid)} — waiting on the host.
                  </p>
                ) : bidFor === t.id ? (
                  <div className="mt-3 space-y-2 rounded-lg border border-gray-100 p-3">
                    <div className="flex gap-2">
                      <div className="relative">
                        <span className="absolute left-2.5 top-1/2 -translate-y-1/2 text-sm text-gray-400">$</span>
                        <input type="number" min="0" step="1" value={bidPrice} onChange={(e) => setBidPrice(e.target.value)}
                          placeholder="Your price" className="w-28 rounded-lg border border-gray-200 pl-6 pr-2 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
                      </div>
                      <input value={bidMsg} onChange={(e) => setBidMsg(e.target.value)} placeholder="Optional note to host"
                        className="flex-1 rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
                    </div>
                    <div className="flex items-center gap-2">
                      <button onClick={() => submitBid(t.id)} disabled={!bidPrice || busy === t.id + "bid"}
                        className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-3 py-1.5 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
                        {busy === t.id + "bid" ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Gavel className="h-3.5 w-3.5" />} Submit bid
                      </button>
                      <button onClick={() => setBidFor(null)} className="text-sm text-gray-500 hover:text-gray-700 px-2">Cancel</button>
                    </div>
                  </div>
                ) : (
                  <button onClick={() => { setBidFor(t.id); setBidPrice(""); setBidMsg(""); }}
                    className="mt-3 inline-flex items-center gap-1.5 rounded-lg border border-brand-200 bg-brand-50 px-4 py-2 text-sm font-medium text-brand-700 hover:bg-brand-100">
                    <Gavel className="h-3.5 w-3.5" /> Place a bid
                  </button>
                )}
              </div>
            );
          })}
        </List>
      )}

      {/* Scheduled — the calendar/list */}
      {tab === "scheduled" && (
        <List empty="No scheduled jobs yet.">
          {scheduled.map((t) => (
            <div key={t.id} className="card p-5 space-y-4">
              <JobHeader t={t} scheduled />
              <TurnoverChecklist taskId={t.id} />
              {t.property_id && (
                <div className="border-t pt-4">
                  <p className="text-sm font-semibold text-gray-800 mb-2">Photos</p>
                  <SharedPhotos propertyId={t.property_id} turnoverTaskId={t.id} />
                </div>
              )}
            </div>
          ))}
        </List>
      )}
    </div>
  );
}

function List({ children, empty }: { children: React.ReactNode; empty: string }) {
  const arr = Array.isArray(children) ? children : [children];
  if (arr.filter(Boolean).length === 0) {
    return (
      <div className="card p-12 text-center text-gray-400">
        <CalendarDays className="mx-auto h-10 w-10 opacity-30 mb-3" />
        <p>{empty}</p>
      </div>
    );
  }
  return <div className="space-y-3">{children}</div>;
}

function JobHeader({
  t,
  showBudget = false,
  scheduled = false,
}: {
  t: Task;
  showBudget?: boolean;
  scheduled?: boolean;
}) {
  return (
    <div>
      <div className="flex items-center gap-2 flex-wrap">
        <h3 className="font-semibold text-gray-900">{t.title}</h3>
        {scheduled && (
          <span className="inline-flex items-center gap-1 rounded-full bg-green-50 text-green-700 border border-green-200 px-2 py-0.5 text-xs font-medium">
            <Sparkles className="h-3 w-3" /> Scheduled
          </span>
        )}
      </div>
      <div className="mt-1.5 flex flex-wrap items-center gap-x-4 gap-y-1 text-sm text-gray-500">
        <span className="inline-flex items-center gap-1 font-medium text-gray-700">
          <CalendarDays className="h-3.5 w-3.5" /> {fmtDate(t.scheduled_date)}
        </span>
        {t.property && <span className="inline-flex items-center gap-1"><Home className="h-3.5 w-3.5" />{t.property.name}</span>}
        {t.market_slug && <span className="inline-flex items-center gap-1 capitalize"><MapPin className="h-3.5 w-3.5" />{t.market_slug.replace(/-/g, " ")}</span>}
        {(showBudget || scheduled) && t.price_cents != null && (
          <span className="font-semibold text-gray-900">{fmtMoney(t.price_cents)}{showBudget ? " budget" : ""}</span>
        )}
      </div>
      {t.notes && <p className="mt-2 text-sm text-gray-600 bg-gray-50 rounded-lg p-2.5">{t.notes}</p>}
    </div>
  );
}
