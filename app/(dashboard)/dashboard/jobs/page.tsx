import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { CleanerJobs } from "@/components/turnover/CleanerJobs";
import { CalendarSubscribe } from "@/components/CalendarSubscribe";

export const metadata = { title: "Turnover Jobs" };

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "https://strvend.com";

export default async function CleanerJobsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/dashboard/jobs");

  const { data: profile } = await supabase
    .from("profiles")
    .select("ical_token")
    .eq("id", user.id)
    .maybeSingle();

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, markets")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!vendor) {
    return (
      <div className="card p-10 text-center text-gray-500">
        <p>Create a vendor listing to receive turnover jobs.</p>
      </div>
    );
  }

  const today = new Date().toISOString().slice(0, 10);

  // Open/biddable jobs are scoped to the markets this cleaner's listing serves,
  // so they never see every host's jobs platform-wide.
  const markets: string[] = Array.isArray(vendor.markets) ? (vendor.markets as string[]) : [];

  const openQuery = markets.length
    ? supabase
        .from("turnover_tasks")
        .select("id, host_id, property_id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("status", "open")
        .gte("scheduled_date", today)
        .in("market_slug", markets)
        .order("scheduled_date")
        .limit(50)
    : Promise.resolve({ data: [] as unknown[] });

  const [{ data: assigned }, { data: scheduled }, { data: open }, { data: bids }] =
    await Promise.all([
      supabase
        .from("turnover_tasks")
        .select("id, property_id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("assigned_vendor_id", vendor.id)
        .eq("status", "assigned")
        .order("scheduled_date"),
      supabase
        .from("turnover_tasks")
        .select("id, property_id, title, notes, scheduled_date, status, price_cents, market_slug, property:properties(name)")
        .eq("assigned_vendor_id", vendor.id)
        .eq("status", "scheduled")
        .gte("scheduled_date", today)
        .order("scheduled_date"),
      openQuery,
      supabase
        .from("turnover_bids")
        .select("task_id, price_cents")
        .eq("vendor_id", vendor.id),
    ]);

  const myBids: Record<string, number> = {};
  for (const b of bids ?? []) myBids[b.task_id] = b.price_cents;

  // Hide a host's open jobs that this cleaner has been scoped away from. If the
  // cleaner is on a host's team with a restricted property scope, that host's
  // open jobs for other properties should not appear on their board.
  const { data: myTeams } = await supabase
    .from("team_members")
    .select("id, host_id")
    .eq("vendor_id", vendor.id)
    .eq("status", "accepted");
  const teamMemberIds = (myTeams ?? []).map((t) => t.id as string);
  const { data: myScopes } = teamMemberIds.length
    ? await supabase
        .from("team_member_properties")
        .select("team_member_id, property_id")
        .in("team_member_id", teamMemberIds)
    : { data: [] as { team_member_id: string; property_id: string }[] };

  // host_id -> set of property_ids the cleaner is scoped to (only hosts that
  // actually restricted them; an unrestricted team membership isn't listed).
  const hostToMember = new Map<string, string>();
  for (const t of myTeams ?? []) hostToMember.set(t.id as string, t.host_id as string);
  const restrictedHostScope = new Map<string, Set<string>>();
  for (const s of myScopes ?? []) {
    const hostId = hostToMember.get(s.team_member_id);
    if (!hostId) continue;
    if (!restrictedHostScope.has(hostId)) restrictedHostScope.set(hostId, new Set());
    restrictedHostScope.get(hostId)!.add(s.property_id as string);
  }

  const openFiltered = ((open as any[]) ?? []).filter((job) => {
    const scope = restrictedHostScope.get(job.host_id);
    if (!scope) return true; // not a restricted team host — normal marketplace
    return job.property_id != null && scope.has(job.property_id);
  });

  return (
    <div className="space-y-6">
      <a
        href="/install"
        className="flex items-center justify-between gap-3 rounded-xl border border-brand-200 bg-brand-50 px-4 py-3 text-sm text-brand-800 transition hover:bg-brand-100"
      >
        <span>
          <span className="font-semibold">Add STRVend to your phone</span> — one-tap access to jobs,
          checklists &amp; photos with the camera built in.
        </span>
        <span className="shrink-0 font-medium text-brand-700">Get the app →</span>
      </a>
      <CleanerJobs
        assigned={(assigned as any) ?? []}
        scheduled={(scheduled as any) ?? []}
        open={openFiltered as any}
        myBids={myBids}
      />
      {profile?.ical_token && (
        <CalendarSubscribe
          url={`${SITE_URL}/api/ical/turnovers/${profile.ical_token}.ics`}
          title="Sync your job schedule"
          description="Add this link to Google, Apple, or Outlook Calendar to see your accepted turnover jobs automatically."
        />
      )}
    </div>
  );
}
