"use client";

import { useState, useMemo } from "react";
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
  List as ListIcon,
  ChevronLeft,
  ChevronRight,
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
function ymd(dt: Date) {
  return `${dt.getFullYear()}-${String(dt.getMonth() + 1).padStart(2, "0")}-${String(dt.getDate()).padStart(2, "0")}`;
}
const WEEKDAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
type JobKind = "assigned" | "scheduled" | "open";
const KIND_STYLE: Record<JobKind, string> = {
  assigned: "bg-amber-100 text-amber-800",
  scheduled: "bg-green-100 text-green-800",
  open: "bg-brand-50 text-brand-700",
};

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
  const [mode, setMode] = useState<"list" | "calendar">("list");
  const [tab, setTab] = useState<"scheduled" | "assigned" | "open">(
    assigned.length > 0 ? "assigned" : "scheduled"
  );
  const [cursor, setCursor] = useState(() => {
    const n = new Date();
    return new Date(n.getFullYear(), n.getMonth(), 1);
  });
  const [selectedDate, setSelectedDate] = useState<string | null>(null);
  const [busy, setBusy] = useState<string | null>(null);
  const [bidFor, setBidFor] = useState<string | null>(null);
  const [bidPrice, setBidPrice] = useState("");
  const [bidMsg, setBidMsg] = useState("");

  // All jobs (accepted or not) tagged by kind, for the calendar.
  const allJobs = useMemo(
    () => [
      ...assigned.map((t) => ({ ...t, kind: "assigned" as JobKind })),
      ...scheduled.map((t) => ({ ...t, kind: "scheduled" as JobKind })),
      ...open.map((t) => ({ ...t, kind: "open" as JobKind })),
    ],
    [assigned, scheduled, open]
  );
  const jobsByDate = useMemo(() => {
    const m: Record<string, (Task & { kind: JobKind })[]> = {};
    for (const j of allJobs) (m[j.scheduled_date] ??= []).push(j);
    return m;
  }, [allJobs]);

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
      <div className="flex items-start justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Turnover Jobs</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            Accept assigned jobs, bid on open ones, and see your cleaning schedule.
          </p>
        </div>
        <div className="inline-flex shrink-0 rounded-lg border border-gray-200 bg-white p-0.5">
          <button
            onClick={() => setMode("list")}
            className={`inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium transition ${mode === "list" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"}`}
          >
            <ListIcon className="h-4 w-4" /> List
          </button>
          <button
            onClick={() => setMode("calendar")}
            className={`inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium transition ${mode === "calendar" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"}`}
          >
            <CalendarDays className="h-4 w-4" /> Calendar
          </button>
        </div>
      </div>

      {mode === "calendar" && (
        <CalendarView
          jobsByDate={jobsByDate}
          cursor={cursor}
          setCursor={setCursor}
          selectedDate={selectedDate}
          setSelectedDate={setSelectedDate}
          respond={respond}
          busy={busy}
        />
      )}

      {mode === "list" && (<>
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
      </>)}
    </div>
  );
}

// ── Month calendar: all jobs (accepted or not), click a day to act ────────────
function CalendarView({
  jobsByDate,
  cursor,
  setCursor,
  selectedDate,
  setSelectedDate,
  respond,
  busy,
}: {
  jobsByDate: Record<string, (Task & { kind: JobKind })[]>;
  cursor: Date;
  setCursor: (d: Date) => void;
  selectedDate: string | null;
  setSelectedDate: (d: string | null) => void;
  respond: (taskId: string, action: "accept" | "decline") => void;
  busy: string | null;
}) {
  const todayStr = ymd(new Date());
  const monthLabel = cursor.toLocaleDateString(undefined, { month: "long", year: "numeric" });
  const cells = useMemo(() => {
    const first = new Date(cursor.getFullYear(), cursor.getMonth(), 1);
    const gridStart = new Date(first);
    gridStart.setDate(first.getDate() - first.getDay());
    return Array.from({ length: 42 }, (_, i) => {
      const d = new Date(gridStart);
      d.setDate(gridStart.getDate() + i);
      return d;
    });
  }, [cursor]);

  const dayJobs = selectedDate ? jobsByDate[selectedDate] ?? [] : [];

  return (
    <div className="space-y-4">
      <div className="card overflow-hidden">
        <div className="flex items-center justify-between px-4 py-3 border-b">
          <button onClick={() => setCursor(new Date(cursor.getFullYear(), cursor.getMonth() - 1, 1))}
            className="rounded-lg p-1.5 text-gray-500 hover:bg-gray-100" aria-label="Previous month">
            <ChevronLeft className="h-4 w-4" />
          </button>
          <div className="flex items-center gap-3">
            <span className="font-semibold text-gray-900">{monthLabel}</span>
            <button onClick={() => { const n = new Date(); setCursor(new Date(n.getFullYear(), n.getMonth(), 1)); }}
              className="rounded-md border border-gray-200 px-2 py-0.5 text-xs text-gray-600 hover:bg-gray-50">Today</button>
          </div>
          <button onClick={() => setCursor(new Date(cursor.getFullYear(), cursor.getMonth() + 1, 1))}
            className="rounded-lg p-1.5 text-gray-500 hover:bg-gray-100" aria-label="Next month">
            <ChevronRight className="h-4 w-4" />
          </button>
        </div>

        <div className="grid grid-cols-7 border-b bg-gray-50 text-center text-xs font-medium text-gray-400">
          {WEEKDAYS.map((w) => <div key={w} className="py-2">{w}</div>)}
        </div>

        <div className="grid grid-cols-7">
          {cells.map((d, i) => {
            const dayStr = ymd(d);
            const inMonth = d.getMonth() === cursor.getMonth();
            const isToday = dayStr === todayStr;
            const isSel = dayStr === selectedDate;
            const dEvents = jobsByDate[dayStr] ?? [];
            return (
              <button
                key={i}
                onClick={() => setSelectedDate(dEvents.length ? dayStr : null)}
                className={`min-h-[92px] border-b border-r p-1.5 text-left align-top ${i % 7 === 0 ? "border-l" : ""} ${inMonth ? "bg-white" : "bg-gray-50/60"} ${isSel ? "ring-2 ring-inset ring-brand-400" : ""} ${dEvents.length ? "cursor-pointer hover:bg-brand-50/40" : "cursor-default"}`}
              >
                <span className={`inline-flex h-5 w-5 items-center justify-center rounded-full text-xs ${isToday ? "bg-brand-600 text-white font-semibold" : inMonth ? "text-gray-700" : "text-gray-300"}`}>
                  {d.getDate()}
                </span>
                <div className="mt-1 space-y-1">
                  {dEvents.slice(0, 3).map((j) => (
                    <div key={j.id} title={`${j.title}${j.property ? " · " + j.property.name : ""}`}
                      className={`truncate rounded px-1 py-0.5 text-[10px] leading-tight ${KIND_STYLE[j.kind]}`}>
                      {j.property?.name || j.title}
                    </div>
                  ))}
                  {dEvents.length > 3 && <div className="px-1 text-[10px] text-gray-400">+{dEvents.length - 3} more</div>}
                </div>
              </button>
            );
          })}
        </div>

        <div className="flex flex-wrap items-center gap-4 px-4 py-2 text-[11px] text-gray-500 border-t">
          <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-2.5 rounded bg-amber-100 border border-amber-200" /> Needs response</span>
          <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-2.5 rounded bg-green-100 border border-green-200" /> Accepted</span>
          <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-2.5 rounded bg-brand-50 border border-brand-200" /> Open to bid</span>
        </div>
      </div>

      {selectedDate && (
        <div className="space-y-2">
          <h3 className="text-sm font-semibold text-gray-700">{fmtDate(selectedDate)}</h3>
          {dayJobs.length === 0 ? (
            <p className="text-sm text-gray-400">No jobs on this day.</p>
          ) : (
            dayJobs.map((j) => (
              <div key={j.id} className="card p-4">
                <JobHeader t={j} scheduled={j.kind === "scheduled"} showBudget={j.kind === "open"} />
                {j.kind === "assigned" && (
                  <div className="mt-3 flex items-center gap-2">
                    <button onClick={() => respond(j.id, "accept")} disabled={busy === j.id + "accept"}
                      className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
                      {busy === j.id + "accept" ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Check className="h-3.5 w-3.5" />} Accept
                    </button>
                    <button onClick={() => respond(j.id, "decline")} disabled={busy === j.id + "decline"}
                      className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-50 disabled:opacity-50">
                      <X className="h-3.5 w-3.5" /> Decline
                    </button>
                  </div>
                )}
                {j.kind === "open" && (
                  <p className="mt-2 text-xs text-gray-500">Open job — switch to the List view's “Open jobs” tab to place a bid.</p>
                )}
              </div>
            ))
          )}
        </div>
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
