import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";
import { formatDate } from "@/lib/utils";
import type { Inquiry } from "@/types";
import { MessageSquare } from "lucide-react";
import { InquiryStatusButton } from "@/components/InquiryStatusButton";

export const metadata = { title: "Messages" };

const STATUS_STYLES: Record<string, string> = {
  new:     "bg-green-50 text-green-700 border-green-200",
  read:    "bg-gray-50 text-gray-500 border-gray-200",
  replied: "bg-blue-50 text-blue-700 border-blue-200",
  closed:  "bg-gray-100 text-gray-400 border-gray-200",
};

const FILTERS = [
  { label: "All",          value: ""         },
  { label: "Needs Reply",  value: "pending"  },
  { label: "Replied",      value: "replied"  },
  { label: "Archived",     value: "archived" },
];

async function updateStatus(inquiryId: string, status: string) {
  "use server";
  const supabase = createClient();
  await supabase.from("inquiries").update({ status }).eq("id", inquiryId);
  revalidatePath("/dashboard/inquiries");
}

interface SearchParams { filter?: string; }

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

  // Fetch ALL inquiries first so we can count unread regardless of active filter
  const { data: allInquiries } = await supabase
    .from("inquiries")
    .select("*")
    .eq("vendor_id", vendor.id)
    .order("created_at", { ascending: false });

  // Auto-mark all 'new' inquiries as 'read' now that the vendor is viewing them
  const newIds = (allInquiries ?? [])
    .filter((i) => i.status === "new")
    .map((i) => i.id);
  if (newIds.length > 0) {
    await supabase
      .from("inquiries")
      .update({ status: "read" })
      .in("id", newIds);
  }

  const unreadCount = newIds.length;

  // Apply client-side filter
  const inquiries = (allInquiries ?? []).filter((i) => {
    if (activeFilter === "pending")  return i.status === "new" || i.status === "read";
    if (activeFilter === "replied")  return i.status === "replied";
    if (activeFilter === "archived") return i.status === "closed";
    return true; // "all"
  });

  // Count per-filter for badges
  const counts = {
    pending:  (allInquiries ?? []).filter((i) => i.status === "new" || i.status === "read").length,
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
            <a
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
            </a>
          );
        })}
      </div>

      {inquiries && inquiries.length > 0 ? (
        <div className="space-y-4">
          {(inquiries as Inquiry[]).map((inq) => (
            <div key={inq.id} className="card p-5">
              <div className="flex items-start justify-between gap-4">
                <div className="space-y-1 min-w-0">
                  <div className="flex items-center gap-2 flex-wrap">
                    <p className="font-semibold text-gray-800">{inq.sender_name ?? "Anonymous"}</p>
                    <span className={`rounded-full border px-2 py-0.5 text-xs font-medium ${STATUS_STYLES[inq.status] ?? STATUS_STYLES.read}`}>
                      {inq.status}
                    </span>
                  </div>
                  {inq.sender_email && (
                    <a href={`mailto:${inq.sender_email}`} className="text-sm text-brand-600 hover:underline block">
                      {inq.sender_email}
                    </a>
                  )}
                  {inq.sender_phone && (
                    <a href={`tel:${inq.sender_phone}`} className="text-sm text-gray-500 block">
                      {inq.sender_phone}
                    </a>
                  )}
                </div>
                <p className="text-xs text-gray-400 whitespace-nowrap shrink-0">{formatDate(inq.created_at)}</p>
              </div>

              <p className="mt-3 text-sm text-gray-700 bg-gray-50 rounded-lg p-3 leading-relaxed">
                {inq.message}
              </p>

              <div className="mt-3 flex items-center gap-2 flex-wrap">
                {inq.sender_email && (
                  <a
                    href={`mailto:${inq.sender_email}?subject=Re: Your inquiry on STR Pro Directory`}
                    className="btn-primary text-xs"
                  >
                    Reply via Email
                  </a>
                )}
                <InquiryStatusButton
                  inquiryId={inq.id}
                  currentStatus={inq.status}
                  updateStatus={updateStatus}
                />
              </div>
            </div>
          ))}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <MessageSquare className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p>
            {activeFilter
              ? `No ${FILTERS.find(f => f.value === activeFilter)?.label.toLowerCase()} messages.`
              : "No messages yet. Share your profile to start receiving inquiries!"}
          </p>
        </div>
      )}
    </div>
  );
}
