import { createClient } from "@/lib/supabase/server";
import { AdminUsersTable } from "@/components/admin/AdminUsersTable";

export const metadata = { title: "Manage Users" };

interface SearchParams { page?: string; }

export default async function AdminUsersPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const PER_PAGE = 50;
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const from = (page - 1) * PER_PAGE;

  const { data: { user } } = await supabase.auth.getUser();

  const { data: users, count } = await supabase
    .from("profiles")
    .select("*", { count: "exact" })
    .order("created_at", { ascending: false })
    .range(from, from + PER_PAGE - 1);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Users</h1>
        <span className="text-sm text-gray-500">{count ?? 0} total</span>
      </div>

      <AdminUsersTable users={users ?? []} currentUserId={user?.id ?? ""} />

      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2">
          {page > 1 && (
            <a href={`/admin/users?page=${page - 1}`} className="btn-secondary px-3 py-1.5 text-xs">← Prev</a>
          )}
          <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
          {page < totalPages && (
            <a href={`/admin/users?page=${page + 1}`} className="btn-secondary px-3 py-1.5 text-xs">Next →</a>
          )}
        </div>
      )}

      <div className="rounded-xl border border-blue-200 bg-blue-50 p-4 text-sm text-blue-800">
        <strong>Tip:</strong> Use the role dropdown to promote/demote users. Delete permanently removes the account and all associated data.
      </div>
    </div>
  );
}
