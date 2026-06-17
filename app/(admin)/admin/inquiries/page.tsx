import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { MessageSquare } from "lucide-react";

export const metadata = { title: "Manage Inquiries" };

interface SearchParams { page?: string; status?: string; }

const STATUS_STYLES: Record<string, string> = {
  new:     "bg-blue-50 text-blue-700 border-blue-200",
  replied: "bg-green-50 text-green-700 border-green-200",
  closed:  "bg-gray-100 text-gray-500 border-gray-200",
};

export default async function AdminInquiriesPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const PER_PAGE = 25;
  const page = Math.max(1, parseInt(searchParams.page ?? "1"));
  const from = (page - 1) * PER_PAGE;

  let query = supabase
    .from("inquiries")
    .select("*, vendor:vendors(business_name, slug)", { count: "exact" });

  if (searchParams.status) query = query.eq("status", searchParams.status);

  const { data: inquiries, count } = await query
    .order("created_at", { ascending: false })
    .range(from, from + PER_PAGE - 1);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Inquiries</h1>
        <span className="text-sm text-gray-500">{count ?? 0} total</span>
      </div>

      {/* Status filters */}
      <div className="flex gap-2 flex-wrap">
        {[
          { label: "All",     value: "" },
          { label: "New",     value: "new" },
          { label: "Replied", value: "replied" },
          { label: "Closed",  value: "closed" },
        ].map(({ label, value }) => (
          <a
            key={value}
            href={`/admin/inquiries${value ? `?status=${value}` : ""}`}
            className={`rounded-full border px-3 py-1 text-xs font-medium transition ${
              (searchParams.status ?? "") === value
                ? "bg-brand-600 text-white border-brand-600"
                : "bg-white text-gray-600 hover:border-brand-400 hover:text-brand-700"
            }`}
          >
            {label}
          </a>
        ))}
      </div>

      {inquiries && inquiries.length > 0 ? (
        <div className="space-y-3">
          {(inquiries as any[]).map((inq) => (
            <div key={inq.id} className="card p-5 space-y-3">
              <div className="flex items-start justify-between gap-4 flex-wrap">
                <div className="flex items-start gap-3">
                  <span className="mt-0.5 flex h-8 w-8 items-center justify-center rounded-full bg-brand-50 text-brand-600 shrink-0">
                    <MessageSquare className="h-4 w-4" />
                  </span>
                  <div>
                    <p className="font-medium text-gray-800">
                      {inq.sender_name ?? "Anonymous"}
                      <span className="ml-2 text-sm font-normal text-gray-400">{inq.sender_email}</span>
                    </p>
                    <p className="text-xs text-gray-400 mt-0.5">
                      To: <a href={`/vendors/${inq.vendor?.slug}`} target="_blank" className="text-brand-600 hover:underline">{inq.vendor?.business_name ?? "Unknown vendor"}</a>
                      {" · "}{formatDate(inq.created_at)}
                    </p>
                  </div>
                </div>
                <span className={`rounded-full border px-2.5 py-0.5 text-xs font-medium shrink-0 ${STATUS_STYLES[inq.status] ?? STATUS_STYLES.new}`}>
                  {inq.status}
                </span>
              </div>

              <p className="text-sm text-gray-600 bg-gray-50 rounded-lg p-3 leading-relaxed">
                {inq.message}
              </p>

              {inq.sender_phone && (
                <p className="text-xs text-gray-400">Phone: {inq.sender_phone}</p>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="text-center py-16 text-gray-400">
          <MessageSquare className="mx-auto h-10 w-10 mb-3 opacity-30" />
          <p>No inquiries found.</p>
        </div>
      )}

      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2">
          {page > 1 && (
            <a href={`/admin/inquiries?page=${page - 1}${searchParams.status ? `&status=${searchParams.status}` : ""}`} className="btn-secondary px-3 py-1.5 text-xs">← Prev</a>
          )}
          <span className="text-sm text-gray-500">Page {page} of {totalPages}</span>
          {page < totalPages && (
            <a href={`/admin/inquiries?page=${page + 1}${searchParams.status ? `&status=${searchParams.status}` : ""}`} className="btn-secondary px-3 py-1.5 text-xs">Next →</a>
          )}
        </div>
      )}
    </div>
  );
}
