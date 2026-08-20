import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { CalendarDays, Home, ArrowLeft } from "lucide-react";
import { CalendarSubscribe } from "@/components/CalendarSubscribe";
import { HostCalendarView, type CalEvent } from "@/components/HostCalendarView";

export const metadata = { title: "Calendar | STRVend Host" };

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "https://strvend.com";

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

  const { data: profile } = await supabase
    .from("profiles")
    .select("ical_token")
    .eq("id", user!.id)
    .maybeSingle();

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

      {/* Subscribe feed */}
      {profile?.ical_token && (
        <CalendarSubscribe
          url={`${SITE_URL}/api/ical/reservations/${profile.ical_token}.ics`}
          title="Subscribe to your reservations & turnovers"
          description="Add this link to Google, Apple, or Outlook Calendar to see reservations and cleaning turnovers automatically."
        />
      )}

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

      {/* Events — List / Month toggle */}
      {hasEvents && (
        <HostCalendarView
          events={events!.map(
            (event): CalEvent => ({
              id: event.id,
              summary: event.summary,
              start_date: event.start_date,
              end_date: event.end_date,
              propertyName:
                (event.property as { name: string } | null)?.name ?? "Unknown property",
            })
          )}
        />
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
