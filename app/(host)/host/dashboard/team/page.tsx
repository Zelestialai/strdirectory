import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Users, UserPlus, Clock, ChevronRight } from "lucide-react";
import { TeamMessageThread } from "@/components/TeamMessageThread";

export const metadata = { title: "My Team | STRVend Host" };

export default async function HostTeamPage({
  searchParams,
}: {
  searchParams: { thread?: string };
}) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: members } = await supabase
    .from("team_members")
    .select(`
      id, status, invited_at, responded_at, host_notes,
      vendor:vendor_id (
        id, business_name, slug, logo_url, email, phone,
        category:categories(name, color)
      )
    `)
    .eq("host_id", user!.id)
    .order("invited_at", { ascending: false });

  const accepted = (members ?? []).filter((m) => m.status === "accepted");
  const pending  = (members ?? []).filter((m) => m.status === "pending");

  const activeThreadId = searchParams.thread;
  const activeMember = activeThreadId
    ? accepted.find((m) => m.id === activeThreadId)
    : null;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">My Team</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            Vendors you've added to your STR team — message them directly here.
          </p>
        </div>
        <Link href="/vendors" className="btn-primary text-sm flex items-center gap-1.5">
          <UserPlus className="h-4 w-4" /> Find Vendors
        </Link>
      </div>

      {/* Active message thread */}
      {activeMember && (
        <div className="card overflow-hidden">
          <div className="flex items-center justify-between px-5 py-3 border-b bg-gray-50">
            <div className="flex items-center gap-2">
              <div className="h-8 w-8 rounded-full bg-teal-100 flex items-center justify-center text-teal-700 font-bold text-sm">
                {(activeMember.vendor as unknown as { business_name: string }).business_name[0]}
              </div>
              <span className="font-medium text-gray-900 text-sm">
                {(activeMember.vendor as unknown as { business_name: string }).business_name}
              </span>
            </div>
            <Link
              href="/host/dashboard/team"
              className="text-xs text-gray-400 hover:text-gray-600 transition"
            >
              Close
            </Link>
          </div>
          <TeamMessageThread
            teamMemberId={activeMember.id}
            currentUserId={user!.id}
            otherName={(activeMember.vendor as unknown as { business_name: string }).business_name}
          />
        </div>
      )}

      {/* Pending invites */}
      {pending.length > 0 && (
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
            Pending Invitations
          </h2>
          <div className="space-y-2">
            {pending.map((m) => {
              const v = m.vendor as unknown as { business_name: string; category?: { name: string } | null };
              return (
                <div key={m.id} className="card p-4 flex items-center gap-3">
                  <div className="h-9 w-9 rounded-full bg-gray-100 flex items-center justify-center text-gray-500 font-bold text-sm shrink-0">
                    {v.business_name[0]}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-medium text-gray-900 text-sm">{v.business_name}</p>
                    <p className="text-xs text-gray-400">{v.category?.name ?? "Vendor"}</p>
                  </div>
                  <span className="flex items-center gap-1 text-xs text-amber-600 bg-amber-50 rounded-full px-2.5 py-1">
                    <Clock className="h-3 w-3" /> Awaiting response
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Active team members */}
      {accepted.length > 0 ? (
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
            Team Members ({accepted.length})
          </h2>
          <div className="space-y-2">
            {accepted.map((m) => {
              const v = m.vendor as unknown as {
                id: string; slug?: string; business_name: string;
                email?: string; phone?: string;
                category?: { name: string; color?: string } | null;
              };
              const isActive = m.id === activeThreadId;
              return (
                <div key={m.id} className={`card p-4 flex items-center gap-3 ${isActive ? "ring-2 ring-teal-400" : ""}`}>
                  <div className="h-10 w-10 rounded-full bg-teal-50 flex items-center justify-center text-teal-700 font-bold shrink-0">
                    {v.business_name[0]}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-gray-900 text-sm">{v.business_name}</p>
                    <p className="text-xs text-gray-500">{v.category?.name ?? "Vendor"}</p>
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    {v.slug && (
                      <Link href={`/vendors/${v.id}`} className="text-xs text-gray-400 hover:text-gray-600 transition">
                        Profile
                      </Link>
                    )}
                    <Link
                      href={`/host/dashboard/team?thread=${m.id}`}
                      className="flex items-center gap-1 text-sm font-medium text-teal-700 bg-teal-50 hover:bg-teal-100 rounded-lg px-3 py-1.5 transition"
                    >
                      Message <ChevronRight className="h-3.5 w-3.5" />
                    </Link>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      ) : (
        pending.length === 0 && (
          <div className="card p-10 text-center space-y-3">
            <div className="flex justify-center">
              <span className="flex h-14 w-14 items-center justify-center rounded-full bg-teal-50">
                <Users className="h-7 w-7 text-teal-500" />
              </span>
            </div>
            <h3 className="font-semibold text-gray-800">No team members yet</h3>
            <p className="text-sm text-gray-500 max-w-sm mx-auto">
              Browse vendors and click "Add to Team" on their profile to invite them.
              Once they accept, you can message them directly here.
            </p>
            <Link href="/vendors" className="btn-primary text-sm">
              Find Vendors →
            </Link>
          </div>
        )
      )}
    </div>
  );
}
