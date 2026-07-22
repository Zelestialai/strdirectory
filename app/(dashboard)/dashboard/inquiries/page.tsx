import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { MessageSquare, ChevronRight, CornerDownRight } from "lucide-react";
import Link from "next/link";

export const metadata = { title: "Messages" };

const STATUS_STYLES: Record<string, string> = {
  new:     "bg-green-50 text-green-700 border-green-200",
  read:    "bg-gray-50 text-gray-500 border-gray-200",
  replied: "bg-brand-50 text-brand-700 border-brand-200",
  closed:  "bg-gray-100 text-gray-400 border-gray-200",
};

const STATUS_LABEL: Record<string, string> = {
  new: "New",
  read: "Unread",
  replied: "Replied",
  closed: "Archived",
};

const FILTERS = [
  { label: "All",      value: "" },
  { label: "Unread",   value: "unread" },
  { label: "Replied",  value: "replied" },
  { label: "Archived", value: "archived" },
];

interface SearchParams { filter?: string }

export default async function InquiriesPage({ searchParams }: { searchParams: SearchParams }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const activeFilter = searchParams.filter ?? "";

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id")
    .eq("user_id", user!.id)
    .single();

  if (!vendor) {
    return (
      <div className="card p-10 text-center text-gray-500">
        <MessageSquare className="mx-auto h-10 w-10 opacity-30 mb-3" />
        <p>Create a listing first to receive messages.</p>
      </div>
    );
  }

  // Fetch inquiries + reply counts in one query
  const { data: allInquiries } = await supabase
    .from("inquiries")
    .select("*, inquiry_replies(id)")
    .eq("vendor_id", vendor.id)
    .order("created_at", { ascending: false });

  // Auto-mark 'new' → 'read' when vendor views the list
  const newIds = (allInquiries ?? [])
    .filter((i) => i.status === "new")
    .map((i) => i.id);
  if (newIds.length > 0) {
    await supabase.from("inquiries").update({ status: "read" }).in("id", newIds);
  }

  const unreadCount = newIds.length;

  // Apply filter
  const inquiries = (allInquiries ?? []).filter((i) => {
    if (activeFilter === "unread")   return i.status === "new" || i.status === "read";
    if (activeFilter === "replied")  return i.status === "replied";
    if (activeFilter === "archived") return i.status === "closed";
    return true;
  });

  const counts = {
    unread:   (allInquiries ?? []).filter((i) => i.status === "new" || i.status === "read").length,
    replied:  (allInquiries ?? []).filter((i) => i.status === "replied").length,
    archived: (allInquiries ?? []).filter((i) => i.status === "closed").length,
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          Messages
          {unreadCount > 0 && (
            <span className="inline-flex items-center justify-center h-6 min-w-6 rounded-full bg-brand-600 text-white text-xs font-semibold px-1.5">
              {unreadCount}
            </span>
          )}
        </h1>
        <p className="text-sm text-gray-400">{allInquiries?.length ?? 0} total</p>
      </div>

      {/* Filter tabs */}
      <div className="flex flex-wrap gap-2 mb-6">
        {FILTERS.map(({ label, value }) => {
          const count = value === "" ? (allInquiries?.length ?? 0) : counts[value as keyof typeof counts];
          const isActive = activeFilter === value;
          return (
            <Link
              key={value}
              href={`/dashboard/inquiries${value ? `?filter=${value}` : ""}`}
              className={`rounded-full border px-3 py-1 text-xs font-medium transition flex items-center gap-1.5 ${
                isActive
                  ? "bg-brand-600 text-white border-brand-600"
                  : "bg-white text-gray-600 hover:border-brand-400 hover:text-brand-700"
              }`}
            >
              {label}
              {count > 0 && (
                <span className={`rounded-full px-1.5 py-0.5 text-xs font-semibold ${
                  isActive ? "bg-white/20 text-white" : "bg-gray-100 text-gray-500"
                }`}>
                  {count}
                </span>
              )}
            </Link>
          );
        })}
      </div>

      {inquiries.length > 0 ? (
        <div className="space-y-3">
          {inquiries.map((inq) => {
            const replyCount = (inq.inquiry_replies as { id: string }[] | null)?.length ?? 0;
            const isUnread = inq.status === "new" || inq.status === "read";

            return (
              <Link
                key={inq.id}
                href={`/dashboard/inquiries/${inq.id}`}
                className={`card p-4 flex items-start gap-4 hover:shadow-md transition group ${
                  isUnread ? "border-brand-100 bg-brand-50/30" : ""
                }`}
              >
                {/* Avatar */}
                <div className={`flex-shrink-0 h-9 w-9 rounded-full flex items-center justify-center text-sm font-bold ${
                  isUnread ? "bg-brand-100 text-brand-700" : "bg-gray-100 text-gray-500"
                }`}>
                  {(inq.sender_name ?? "?").charAt(0).toUpperCase()}
                </div>

                {/* Content */}
                <div className="flex-1 min-w-0">
                  <div className="flex items-baseline justify-between gap-2 mb-0.5 flex-wrap">
                    <p className={`text-sm font-semibold ${isUnread ? "text-gray-900" : "text-gray-700"}`}>
                      {inq.sender_name ?? "Anonymous"}
                      {isUnread && (
                        <span className="ml-2 inline-block h-1.5 w-1.5 rounded-full bg-brand-500 align-middle" />
                      )}
                    </p>
                    <span className="text-xs text-gray-400 shrink-0">{formatDate(inq.created_at)}</span>
                  </div>

                  <p className="text-sm text-gray-600 line-clamp-1 mb-2">
                    {inq.message}
                  </p>

                  <div className="flex items-center gap-2 flex-wrap">
                    <span className={`inline-block rounded-full border px-2 py-0.5 text-xs font-medium ${
                      STATUS_STYLES[inq.status] ?? STATUS_STYLES.read
                    }`}>
                      {STATUS_LABEL[inq.status] ?? inq.status}
                    </span>

                    {replyCount > 0 && (
                      <span className="inline-flex items-center gap-1 text-xs text-brand-600 font-medium">
                        <CornerDownRight className="h-3 w-3" />
                        {replyCount} {replyCount === 1 ? "reply" : "replies"}
                      </span>
                    )}

                    {inq.sender_email && (
                      <span className="text-xs text-gray-400 truncate max-w-[160px]">{inq.sender_email}</span>
                    )}
                  </div>
                </div>

                <ChevronRight className="h-4 w-4 text-gray-300 group-hover:text-gray-400 shrink-0 mt-1 transition" />
              </Link>
            );
          })}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <MessageSquare className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p>
            {activeFilter
              ? `No ${FILTERS.find((f) => f.value === activeFilter)?.label.toLowerCase()} messages.`
              : "No messages yet. Share your profile to start receiving inquiries!"}
          </p>
        </div>
      )}
    </div>
  );
}
