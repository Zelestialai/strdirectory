import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Users, CheckCircle, XCircle, ChevronRight } from "lucide-react";
import { TeamMessageThread } from "@/components/TeamMessageThread";
import { TeamRespondButtons } from "@/components/TeamRespondButtons";

export const metadata = { title: "My Clients | STRVend Dashboard" };

export default async function VendorTeamPage({
  searchParams,
}: {
  searchParams: { thread?: string };
}) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  // Find this user's vendor record
  const { data: vendor } = await supabase
    .from("vendors")
    .select("id")
    .eq("user_id", user!.id)
    .single();

  if (!vendor) {
    return (
      <div className="card p-10 text-center">
        <p className="text-gray-500">You need a vendor profile to use team features.</p>
        <Link href="/dashboard/profile" className="btn-primary text-sm mt-4">
          Set Up Profile →
        </Link>
      </div>
    );
  }

  const { data: members } = await supabase
    .from("team_members")
    .select(`
      id, status, invited_at,
      host:host_id (
        id, full_name, email
      )
    `)
    .eq("vendor_user_id", user!.id)
    .order("invited_at", { ascending: false });

  const pending  = (members ?? []).filter((m) => m.status === "pending");
  const accepted = (members ?? []).filter((m) => m.status === "accepted");
  const declined = (members ?? []).filter((m) => m.status === "declined");

  const activeThreadId = searchParams.thread;
  const activeMember = activeThreadId
    ? accepted.find((m) => m.id === activeThreadId)
    : null;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-bold text-gray-900">My Clients</h1>
        <p className="text-sm text-gray-500 mt-0.5">
          Hosts who have invited you to their team — accept to start communicating directly.
        </p>
      </div>

      {/* Active message thread */}
      {activeMember && (
        <div className="card overflow-hidden">
          <div className="flex items-center justify-between px-5 py-3 border-b bg-gray-50">
            <div className="flex items-center gap-2">
              <div className="h-8 w-8 rounded-full bg-teal-100 flex items-center justify-center text-teal-700 font-bold text-sm">
                {((activeMember.host as { full_name: string } | null)?.full_name ?? "H")[0]}
              </div>
              <span className="font-medium text-gray-900 text-sm">
                {(activeMember.host as { full_name: string } | null)?.full_name ?? "Host"}
              </span>
            </div>
            <Link
              href="/dashboard/team"
              className="text-xs text-gray-400 hover:text-gray-600 transition"
            >
              Close
            </Link>
          </div>
          <TeamMessageThread
            teamMemberId={activeMember.id}
            currentUserId={user!.id}
            otherName={(activeMember.host as { full_name: string } | null)?.full_name ?? "Host"}
          />
        </div>
      )}

      {/* Pending invitations */}
      {pending.length > 0 && (
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3 flex items-center gap-2">
            Pending Invitations
            <span className="bg-amber-100 text-amber-700 text-xs rounded-full px-2 py-0.5">{pending.length}</span>
          </h2>
          <div className="space-y-3">
            {pending.map((m) => {
              const host = m.host as { id: string; full_name: string; email: string } | null;
              return (
                <div key={m.id} className="card p-4 space-y-3">
                  <div className="flex items-center gap-3">
                    <div className="h-10 w-10 rounded-full bg-teal-50 flex items-center justify-center text-teal-700 font-bold shrink-0">
                      {(host?.full_name ?? "H")[0]}
                    </div>
                    <div>
                      <p className="font-semibold text-gray-900 text-sm">{host?.full_name ?? "STR Host"}</p>
                      <p className="text-xs text-gray-400">
                        Invited {new Date(m.invited_at as string).toLocaleDateString(undefined, { month: "short", day: "numeric" })}
                      </p>
                    </div>
                  </div>
                  <p className="text-sm text-gray-600">
                    This host wants to add you to their STR vendor team. Accept to enable direct messaging through StrVend.
                  </p>
                  <TeamRespondButtons teamMemberId={m.id} />
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Active clients */}
      {accepted.length > 0 && (
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
            Active Clients ({accepted.length})
          </h2>
          <div className="space-y-2">
            {accepted.map((m) => {
              const host = m.host as { full_name: string; email: string } | null;
              const isActive = m.id === activeThreadId;
              return (
                <div key={m.id} className={`card p-4 flex items-center gap-3 ${isActive ? "ring-2 ring-teal-400" : ""}`}>
                  <div className="h-10 w-10 rounded-full bg-teal-50 flex items-center justify-center text-teal-700 font-bold shrink-0">
                    {(host?.full_name ?? "H")[0]}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-gray-900 text-sm">{host?.full_name ?? "STR Host"}</p>
                    <div className="flex items-center gap-1 text-xs text-teal-600 mt-0.5">
                      <CheckCircle className="h-3 w-3" /> Active client
                    </div>
                  </div>
                  <Link
                    href={`/dashboard/team?thread=${m.id}`}
                    className="flex items-center gap-1 text-sm font-medium text-teal-700 bg-teal-50 hover:bg-teal-100 rounded-lg px-3 py-1.5 transition shrink-0"
                  >
                    Message <ChevronRight className="h-3.5 w-3.5" />
                  </Link>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Declined (collapsed) */}
      {declined.length > 0 && (
        <details className="text-sm text-gray-400">
          <summary className="cursor-pointer hover:text-gray-600 transition flex items-center gap-1">
            <XCircle className="h-3.5 w-3.5" /> {declined.length} declined invitation{declined.length !== 1 ? "s" : ""}
          </summary>
          <div className="mt-2 space-y-1 pl-4">
            {declined.map((m) => {
              const host = m.host as { full_name: string } | null;
              return (
                <p key={m.id} className="text-xs">{host?.full_name ?? "A host"}</p>
              );
            })}
          </div>
        </details>
      )}

      {/* Empty state */}
      {pending.length === 0 && accepted.length === 0 && declined.length === 0 && (
        <div className="card p-10 text-center space-y-3">
          <div className="flex justify-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-full bg-teal-50">
              <Users className="h-7 w-7 text-teal-500" />
            </span>
          </div>
          <h3 className="font-semibold text-gray-800">No team invitations yet</h3>
          <p className="text-sm text-gray-500 max-w-sm mx-auto">
            When hosts add you to their STR team, you'll see their invitations here.
            Make sure your profile is complete to attract more hosts.
          </p>
          <Link href="/dashboard/profile" className="btn-primary text-sm">
            Complete Profile →
          </Link>
        </div>
      )}
    </div>
  );
}
