"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import {
  Home, Sparkles, List, CalendarDays, ChevronLeft, ChevronRight,
} from "lucide-react";

export interface CalEvent {
  id: string;
  summary: string | null;
  start_date: string; // YYYY-MM-DD (check-in)
  end_date: string;   // YYYY-MM-DD (check-out)
  propertyName: string;
}

// ── date helpers (parse YYYY-MM-DD as local, no TZ shift) ─────────────────────
function parse(d: string) {
  const [y, m, day] = d.split("-").map(Number);
  return new Date(y, m - 1, day);
}
function ymd(dt: Date) {
  return `${dt.getFullYear()}-${String(dt.getMonth() + 1).padStart(2, "0")}-${String(dt.getDate()).padStart(2, "0")}`;
}
function fmtLong(d: string) {
  return parse(d).toLocaleDateString(undefined, { weekday: "short", month: "short", day: "numeric", year: "numeric" });
}
function daysUntil(d: string) {
  const t = parse(d); const today = new Date(); today.setHours(0, 0, 0, 0);
  return Math.round((t.getTime() - today.getTime()) / 86_400_000);
}
function urgency(days: number) {
  if (days < 0) return "bg-gray-100 text-gray-400";
  if (days === 0) return "bg-red-100 text-red-700 font-semibold";
  if (days <= 2) return "bg-amber-100 text-amber-700";
  if (days <= 7) return "bg-brand-50 text-brand-700";
  return "bg-gray-50 text-gray-600";
}

const WEEKDAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

export function HostCalendarView({ events }: { events: CalEvent[] }) {
  const [view, setView] = useState<"list" | "month">("list");
  const [cursor, setCursor] = useState(() => {
    const n = new Date();
    return new Date(n.getFullYear(), n.getMonth(), 1);
  });

  return (
    <div className="space-y-4">
      {/* View toggle */}
      <div className="flex items-center justify-between">
        <div className="inline-flex rounded-lg border border-gray-200 bg-white p-0.5">
          <button
            onClick={() => setView("list")}
            className={`inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium transition ${
              view === "list" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"
            }`}
          >
            <List className="h-4 w-4" /> List
          </button>
          <button
            onClick={() => setView("month")}
            className={`inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium transition ${
              view === "month" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"
            }`}
          >
            <CalendarDays className="h-4 w-4" /> Month
          </button>
        </div>
      </div>

      {view === "list" ? (
        <ListView events={events} />
      ) : (
        <MonthView events={events} cursor={cursor} setCursor={setCursor} />
      )}
    </div>
  );
}

// ── List view (the original "line" view) ──────────────────────────────────────
function ListView({ events }: { events: CalEvent[] }) {
  return (
    <div className="space-y-3">
      {events.map((event) => {
        const checkoutDays = daysUntil(event.end_date);
        const checkinDays = daysUntil(event.start_date);
        const isPast = checkoutDays < 0;
        return (
          <div key={event.id} className={`card p-4 flex flex-col sm:flex-row sm:items-center gap-4 ${isPast ? "opacity-50" : ""}`}>
            <div className="shrink-0 w-28 text-center">
              <div className={`rounded-lg px-2 py-1 text-xs ${urgency(checkinDays)}`}>
                {checkinDays === 0 ? "Checks in today" : checkinDays < 0 ? `Checked in ${Math.abs(checkinDays)}d ago` : `In ${checkinDays} day${checkinDays !== 1 ? "s" : ""}`}
              </div>
            </div>
            <div className="flex-1 min-w-0 space-y-0.5">
              <p className="font-medium text-gray-900 text-sm truncate">{event.summary || "Reservation"}</p>
              <div className="flex flex-wrap items-center gap-x-3 gap-y-0.5 text-xs text-gray-500">
                <span className="flex items-center gap-1"><Home className="h-3 w-3" />{event.propertyName}</span>
                <span>{fmtLong(event.start_date)} → {fmtLong(event.end_date)}</span>
              </div>
            </div>
            <div className="shrink-0 flex items-center gap-2">
              <div className={`rounded-full px-2.5 py-0.5 text-xs ${urgency(checkoutDays)}`}>
                Checkout: {checkoutDays === 0 ? "Today" : checkoutDays < 0 ? `${Math.abs(checkoutDays)}d ago` : `in ${checkoutDays}d`}
              </div>
              {checkoutDays >= 0 && checkoutDays <= 14 && (
                <Link href="/vendors?category=cleaning-turnover" className="flex items-center gap-1 text-xs text-brand-600 hover:text-brand-700 font-medium whitespace-nowrap" title="Find a cleaner for this checkout">
                  <Sparkles className="h-3.5 w-3.5" /> Find cleaner
                </Link>
              )}
            </div>
          </div>
        );
      })}
    </div>
  );
}

// ── Month grid view ───────────────────────────────────────────────────────────
function MonthView({
  events, cursor, setCursor,
}: {
  events: CalEvent[];
  cursor: Date;
  setCursor: (d: Date) => void;
}) {
  const todayStr = ymd(new Date());
  const monthLabel = cursor.toLocaleDateString(undefined, { month: "long", year: "numeric" });

  // 6-week grid starting on the Sunday on/before the 1st
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

  // events overlapping a given day (check-in ≤ day ≤ check-out)
  function eventsOn(dayStr: string) {
    return events.filter((e) => dayStr >= e.start_date && dayStr <= e.end_date);
  }

  return (
    <div className="card overflow-hidden">
      {/* Month nav */}
      <div className="flex items-center justify-between px-4 py-3 border-b">
        <button
          onClick={() => setCursor(new Date(cursor.getFullYear(), cursor.getMonth() - 1, 1))}
          className="rounded-lg p-1.5 text-gray-500 hover:bg-gray-100" aria-label="Previous month"
        >
          <ChevronLeft className="h-4 w-4" />
        </button>
        <div className="flex items-center gap-3">
          <span className="font-semibold text-gray-900">{monthLabel}</span>
          <button
            onClick={() => { const n = new Date(); setCursor(new Date(n.getFullYear(), n.getMonth(), 1)); }}
            className="rounded-md border border-gray-200 px-2 py-0.5 text-xs text-gray-600 hover:bg-gray-50"
          >
            Today
          </button>
        </div>
        <button
          onClick={() => setCursor(new Date(cursor.getFullYear(), cursor.getMonth() + 1, 1))}
          className="rounded-lg p-1.5 text-gray-500 hover:bg-gray-100" aria-label="Next month"
        >
          <ChevronRight className="h-4 w-4" />
        </button>
      </div>

      {/* Weekday header */}
      <div className="grid grid-cols-7 border-b bg-gray-50 text-center text-xs font-medium text-gray-400">
        {WEEKDAYS.map((w) => (
          <div key={w} className="py-2">{w}</div>
        ))}
      </div>

      {/* Day cells */}
      <div className="grid grid-cols-7">
        {cells.map((d, i) => {
          const dayStr = ymd(d);
          const inMonth = d.getMonth() === cursor.getMonth();
          const isToday = dayStr === todayStr;
          const dayEvents = eventsOn(dayStr);
          return (
            <div
              key={i}
              className={`min-h-[92px] border-b border-r p-1.5 ${i % 7 === 0 ? "border-l" : ""} ${inMonth ? "bg-white" : "bg-gray-50/60"}`}
            >
              <div className="flex items-center justify-between">
                <span className={`inline-flex h-5 w-5 items-center justify-center rounded-full text-xs ${
                  isToday ? "bg-brand-600 text-white font-semibold" : inMonth ? "text-gray-700" : "text-gray-300"
                }`}>
                  {d.getDate()}
                </span>
              </div>
              <div className="mt-1 space-y-1">
                {dayEvents.slice(0, 3).map((e) => {
                  const isCheckout = dayStr === e.end_date;
                  const isCheckin = dayStr === e.start_date;
                  return (
                    <div
                      key={e.id}
                      title={`${e.propertyName}: ${fmtLong(e.start_date)} → ${fmtLong(e.end_date)}`}
                      className={`truncate rounded px-1 py-0.5 text-[10px] leading-tight ${
                        isCheckout ? "bg-amber-100 text-amber-800" : "bg-brand-50 text-brand-700"
                      }`}
                    >
                      {isCheckin ? "▸ " : isCheckout ? "◂ " : ""}{e.propertyName}
                    </div>
                  );
                })}
                {dayEvents.length > 3 && (
                  <div className="px-1 text-[10px] text-gray-400">+{dayEvents.length - 3} more</div>
                )}
              </div>
            </div>
          );
        })}
      </div>

      {/* Legend */}
      <div className="flex items-center gap-4 px-4 py-2 text-[11px] text-gray-500 border-t">
        <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-2.5 rounded bg-brand-50 border border-brand-200" /> Booked night</span>
        <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-2.5 rounded bg-amber-100 border border-amber-200" /> Check-out day</span>
        <span className="text-gray-400">▸ check-in · ◂ check-out</span>
      </div>
    </div>
  );
}
