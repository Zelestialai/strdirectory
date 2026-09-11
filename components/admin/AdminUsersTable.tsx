"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Trash2 } from "lucide-react";
import { formatDate } from "@/lib/utils";

type AccountType = "host" | "vendor" | null;

interface Profile {
  id: string;
  full_name: string | null;
  role: string;
  created_at: string;
  accountType?: AccountType;
}

const ROLE_STYLES: Record<string, string> = {
  admin:  "bg-red-50 text-red-700 border-red-200",
  host:   "bg-amber-50 text-amber-700 border-amber-200",
  vendor: "bg-brand-50 text-brand-700 border-brand-200",
  user:   "bg-gray-100 text-gray-600 border-gray-200",
};

/**
 * The role an account *should* have given the records it owns. A host_profile
 * means the account is a host; a vendor listing means it's a vendor. When the
 * role field disagrees, the person lands on the wrong dashboard.
 */
function expectedRole(accountType: AccountType): "host" | "vendor" | null {
  return accountType === "host" ? "host" : accountType === "vendor" ? "vendor" : null;
}

export function AdminUsersTable({ users, currentUserId }: { users: Profile[]; currentUserId: string }) {
  const router = useRouter();
  const [, startTransition] = useTransition();
  const [loadingId, setLoadingId] = useState<string | null>(null);
  const [confirmDeleteId, setConfirmDeleteId] = useState<string | null>(null);

  const changeRole = async (id: string, role: string) => {
    setLoadingId(id);
    await fetch(`/api/admin/users/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ role }),
    });
    setLoadingId(null);
    startTransition(() => router.refresh());
  };

  const deleteUser = async (id: string) => {
    setLoadingId(id);
    await fetch(`/api/admin/users/${id}`, { method: "DELETE" });
    setLoadingId(null);
    setConfirmDeleteId(null);
    startTransition(() => router.refresh());
  };

  return (
    <div className="card overflow-x-auto">
      <table className="w-full text-sm">
        <thead className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wider">
          <tr>
            <th className="px-4 py-3 text-left">Name / ID</th>
            <th className="px-4 py-3 text-left">Account</th>
            <th className="px-4 py-3 text-left">Role</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Joined</th>
            <th className="px-4 py-3 text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="divide-y">
          {users.map((u) => {
            const isSelf = u.id === currentUserId;
            const isLoading = loadingId === u.id;
            const want = expectedRole(u.accountType ?? null);
            const mismatch = want !== null && u.role !== want && u.role !== "admin";
            return (
              <tr key={u.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-3">
                  <div className="font-medium text-gray-800">{u.full_name ?? "—"} {isSelf && <span className="text-xs text-brand-500">(you)</span>}</div>
                  <div className="text-xs text-gray-400 font-mono">{u.id.slice(0, 12)}…</div>
                </td>
                <td className="px-4 py-3">
                  {u.accountType === "host" ? (
                    <span className="rounded-full border border-amber-200 bg-amber-50 px-2.5 py-0.5 text-xs font-medium text-amber-700">Host</span>
                  ) : u.accountType === "vendor" ? (
                    <span className="rounded-full border border-brand-200 bg-brand-50 px-2.5 py-0.5 text-xs font-medium text-brand-700">Vendor</span>
                  ) : (
                    <span className="text-xs text-gray-300">—</span>
                  )}
                </td>
                <td className="px-4 py-3">
                  {isSelf ? (
                    <span className={`rounded-full border px-2.5 py-0.5 text-xs font-medium ${ROLE_STYLES[u.role] ?? ROLE_STYLES.user}`}>
                      {u.role}
                    </span>
                  ) : (
                    <div className="flex flex-col gap-1">
                      <select
                        value={u.role}
                        disabled={isLoading}
                        onChange={(e) => changeRole(u.id, e.target.value)}
                        className={`rounded-full border px-2.5 py-0.5 text-xs font-medium cursor-pointer appearance-none pr-5 focus:outline-none ${ROLE_STYLES[u.role] ?? ROLE_STYLES.user}`}
                      >
                        <option value="user">user</option>
                        <option value="host">host</option>
                        <option value="vendor">vendor</option>
                        <option value="admin">admin</option>
                      </select>
                      {mismatch && (
                        <button
                          onClick={() => changeRole(u.id, want!)}
                          disabled={isLoading}
                          className="text-left text-[11px] leading-tight text-amber-600 hover:text-amber-800"
                          title={`This is a ${u.accountType} account but its role is "${u.role}". Click to set role to "${want}".`}
                        >
                          ⚠ Should be <strong>{want}</strong> — fix
                        </button>
                      )}
                    </div>
                  )}
                </td>
                <td className="px-4 py-3 text-gray-500 hidden md:table-cell text-xs">
                  {formatDate(u.created_at)}
                </td>
                <td className="px-4 py-3 text-center">
                  {isSelf ? (
                    <span className="text-xs text-gray-300">—</span>
                  ) : confirmDeleteId === u.id ? (
                    <div className="flex items-center justify-center gap-2">
                      <button
                        onClick={() => deleteUser(u.id)}
                        disabled={isLoading}
                        className="rounded-lg bg-red-600 text-white px-2.5 py-1 text-xs font-medium hover:bg-red-700 transition"
                      >
                        {isLoading ? "Deleting…" : "Confirm"}
                      </button>
                      <button onClick={() => setConfirmDeleteId(null)} className="text-xs text-gray-400 hover:text-gray-600">
                        Cancel
                      </button>
                    </div>
                  ) : (
                    <button
                      onClick={() => setConfirmDeleteId(u.id)}
                      disabled={isLoading}
                      className="rounded-lg p-1.5 text-gray-400 hover:bg-red-50 hover:text-red-500 transition"
                      title="Delete user"
                    >
                      <Trash2 className="h-4 w-4" />
                    </button>
                  )}
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}
