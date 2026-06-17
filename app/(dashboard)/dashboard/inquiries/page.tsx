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

async function markAsRead(inquiryId: string) {
  "use server";
  const supabase = createClient();
  await supabase
    .from("inquiries")
    .update({ status: "read" })
    .eq("id", inquiryId)
    .eq("status", "new"); // only bump 'new' → 'read', leave others alone
  revalidatePath("/dashboard/inquiries");
}

async function updateStatus(inquiryId: string, status: string) {
  "use server";
  const supabase = createClient();
  await supabase.from("inquiries").update({ status }).eq("id", inquiryId);
  revalidatePath("/dashboard/inquiries");
}

export default async function InquiriesPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

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

  const { data: inquiries } = await supabase
    .from("inquiries")
    .select("*")
    .eq("vendor_id", vendor.id)
    .order("created_at", { ascending: false });

  // Auto-mark all 'new' inquiries as 'read' now that the vendor is viewing them
  const newIds = (inquiries ?? [])
    .filter((i) => i.status === "new")
    .map((i) => i.id);
  if (newIds.length > 0) {
    await supabase
      .from("inquiries")
      .update({ status: "read" })
      .in("id", newIds);
  }

  const unreadCount = newIds.length;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
          Messages
          {unreadCount > 0 && (
            <span className="inline-flex items-center justify-center h-6 min-w-6 rounded-full bg-brand-600 text-white text-xs font-semibold px-1.5">
              {unreadCount}
            </span>
          )}
        </h1>
        <p className="text-sm text-gray-400">{inquiries?.length ?? 0} total</p>
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
          <p>No messages yet. Share your profile to start receiving inquiries!</p>
        </div>
      )}
    </div>
  );
}
