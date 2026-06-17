"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Trash2 } from "lucide-react";
import { formatDate } from "@/lib/utils";

interface Profile {
  id: string;
  full_name: string | null;
  role: string;
  created_at: string;
}

const ROLE_STYLES: Record<string, string> = {
  admin:  "bg-red-50 text-red-700 border-red-200",
  vendor: "bg-brand-50 text-brand-700 border-brand-200",
  user:   "bg-gray-100 text-gray-600 border-gray-200",
};

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
            <th className="px-4 py-3 text-left">Role</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Joined</th>
            <th className="px-4 py-3 text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="divide-y">
          {users.map((u) => {
            const isSelf = u.id === currentUserId;
            const isLoading = loadingId === u.id;
            return (
              <tr key={u.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-3">
                  <div className="font-medium text-gray-800">{u.full_name ?? "—"} {isSelf && <span className="text-xs text-brand-500">(you)</span>}</div>
                  <div className="text-xs text-gray-400 font-mono">{u.id.slice(0, 12)}…</div>
                </td>
                <td className="px-4 py-3">
                  {isSelf ? (
                    <span className={`rounded-full border px-2.5 py-0.5 text-xs font-medium ${ROLE_STYLES[u.role] ?? ROLE_STYLES.user}`}>
                      {u.role}
                    </span>
                  ) : (
                    <select
                      value={u.role}
                      disabled={isLoading}
                      onChange={(e) => changeRole(u.id, e.target.value)}
                      className={`rounded-full border px-2.5 py-0.5 text-xs font-medium cursor-pointer appearance-none pr-5 focus:outline-none ${ROLE_STYLES[u.role] ?? ROLE_STYLES.user}`}
                    >
                      <option value="user">user</option>
                      <option value="vendor">vendor</option>
                      <option value="admin">admin</option>
                    </select>
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
