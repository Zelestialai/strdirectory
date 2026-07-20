import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { CalendarDays, Home, ArrowLeft, Sparkles } from "lucide-react";

export const metadata = { title: "Calendar | STRVend Host" };

function formatDate(dateStr: string) {
  // dateStr is YYYY-MM-DD
  const [year, month, day] = dateStr.split("-").map(Number);
  return new Date(year, month - 1, day).toLocaleDateString(undefined, {
    weekday: "short",
    month: "short",
    day: "numeric",
    year: "numeric",
  });
}

function daysUntil(dateStr: string) {
  const [year, month, day] = dateStr.split("-").map(Number);
  const target = new Date(year, month - 1, day);
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.round((target.getTime() - today.getTime()) / 86_400_000);
}

function urgencyClass(days: number) {
  if (days < 0) return "bg-gray-100 text-gray-400";
  if (days === 0) return "bg-red-100 text-red-700 font-semibold";
  if (days <= 2) return "bg-amber-100 text-amber-700";
  if (days <= 7) return "bg-brand-50 text-brand-700";
  return "bg-gray-50 text-gray-600";
}

export default async function CalendarPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Today in YYYY-MM-DD
  const todayStr = new Date().toISOString().slice(0, 10);
  // 90 days out
  const futureStr = new Date(Date.now() + 90 * 86_400_000).toISOString().slice(0, 10);

  const { data: events } = await supabase
    .from("calendar_events")
    .select("*, property:properties(name)")
    .eq("host_id", user!.id)
    .gte("end_date", todayStr)
    .lte("start_date", futureStr)
    .order("start_date", { ascending: true })
    .limit(200);

  const { data: properties } = await supabase
    .from("properties")
    .select("id, name, last_synced_at")
    .eq("host_id", user!.id);

  const hasProperties = (properties?.length ?? 0) > 0;
  const hasEvents = (events?.length ?? 0) > 0;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Calendar</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            Upcoming reservations across all properties — next 90 days
          </p>
        </div>
        <Link
          href="/host/dashboard/properties"
          className="btn-secondary text-sm flex items-center gap-1.5 shrink-0"
        >
          <Home className="h-4 w-4" />
          Manage Properties
        </Link>
      </div>

      {/* No properties yet */}
      {!hasProperties && (
        <div className="card p-10 text-center space-y-3">
          <div className="flex justify-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-full bg-brand-50">
              <CalendarDays className="h-7 w-7 text-brand-500" />
            </span>
          </div>
          <h3 className="font-semibold text-gray-800">No properties connected</h3>
          <p className="text-sm text-gray-500 max-w-sm mx-auto">
            Add a property and paste in your Airbnb or VRBO iCal URL to see upcoming check-outs here.
          </p>
          <Link href="/host/dashboard/properties" className="btn-primary text-sm">
            Add a Property →
          </Link>
        </div>
      )}

      {/* Has properties but no events */}
      {hasProperties && !hasEvents && (
        <div className="card p-8 text-center space-y-2">
          <CalendarDays className="h-8 w-8 text-gray-300 mx-auto" />
          <p className="font-medium text-gray-700">No upcoming reservations</p>
          <p className="text-sm text-gray-400">
            Sync your properties on the{" "}
            <Link href="/host/dashboard/properties" className="text-brand-600 hover:underline">
              Properties page
            </Link>{" "}
            to pull in events.
          </p>
        </div>
      )}

      {/* Events list */}
      {hasEvents && (
        <div className="space-y-3">
          {events!.map((event) => {
            const checkoutDays = daysUntil(event.end_date);
            const checkinDays = daysUntil(event.start_date);
            const isPast = checkoutDays < 0;

            return (
              <div
                key={event.id}
                className={`card p-4 flex flex-col sm:flex-row sm:items-center gap-4 ${
                  isPast ? "opacity-50" : ""
                }`}
              >
                {/* Date column */}
                <div className="shrink-0 w-28 text-center">
                  <div className={`rounded-lg px-2 py-1 text-xs ${urgencyClass(checkinDays)}`}>
                    {checkinDays === 0
                      ? "Checks in today"
                      : checkinDays < 0
                      ? `Checked in ${Math.abs(checkinDays)}d ago`
                      : `In ${checkinDays} day${checkinDays !== 1 ? "s" : ""}`}
                  </div>
                </div>

                {/* Main info */}
                <div className="flex-1 min-w-0 space-y-0.5">
                  <p className="font-medium text-gray-900 text-sm truncate">
                    {event.summary || "Reservation"}
                  </p>
                  <div className="flex flex-wrap items-center gap-x-3 gap-y-0.5 text-xs text-gray-500">
                    <span className="flex items-center gap-1">
                      <Home className="h-3 w-3" />
                      {(event.property as { name: string } | null)?.name ?? "Unknown property"}
                    </span>
                    <span>
                      {formatDate(event.start_date)} → {formatDate(event.end_date)}
                    </span>
                  </div>
                </div>

                {/* Checkout badge + CTA */}
                <div className="shrink-0 flex items-center gap-2">
                  <div className={`rounded-full px-2.5 py-0.5 text-xs ${urgencyClass(checkoutDays)}`}>
                    Checkout:{" "}
                    {checkoutDays === 0
                      ? "Today"
                      : checkoutDays < 0
                      ? `${Math.abs(checkoutDays)}d ago`
                      : `in ${checkoutDays}d`}
                  </div>

                  {/* Suggest scheduling a cleaner for upcoming checkouts */}
                  {checkoutDays >= 0 && checkoutDays <= 14 && (
                    <Link
                      href="/vendors?category=cleaning-turnover"
                      className="flex items-center gap-1 text-xs text-brand-600 hover:text-brand-700 font-medium whitespace-nowrap"
                      title="Find a cleaner for this checkout"
                    >
                      <Sparkles className="h-3.5 w-3.5" />
                      Find cleaner
                    </Link>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* Footer: back link */}
      <Link
        href="/host/dashboard"
        className="inline-flex items-center gap-1.5 text-sm text-gray-400 hover:text-gray-600 transition"
      >
        <ArrowLeft className="h-4 w-4" /> Back to Dashboard
      </Link>
    </div>
  );
}
