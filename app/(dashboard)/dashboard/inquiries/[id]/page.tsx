import { createClient } from "@/lib/supabase/server";
import { redirect, notFound } from "next/navigation";
import Link from "next/link";
import { ArrowLeft, Mail, Phone, MessageSquare } from "lucide-react";
import { formatDate } from "@/lib/utils";
import { ReplyComposer } from "@/components/ReplyComposer";

export const metadata = { title: "Inquiry Thread" };

interface Props {
  params: { id: string };
}

export default async function InquiryThreadPage({ params }: Props) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  // Get this user's vendor
  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name")
    .eq("user_id", user.id)
    .single();

  if (!vendor) redirect("/dashboard/profile");

  // Fetch inquiry (must belong to this vendor)
  const { data: inquiry } = await supabase
    .from("inquiries")
    .select("*")
    .eq("id", params.id)
    .eq("vendor_id", vendor.id)
    .single();

  if (!inquiry) notFound();

  // Fetch all replies
  const { data: replies } = await supabase
    .from("inquiry_replies")
    .select("*")
    .eq("inquiry_id", inquiry.id)
    .order("created_at", { ascending: true });

  // Mark as read if still 'new'
  if (inquiry.status === "new") {
    await supabase
      .from("inquiries")
      .update({ status: "read" })
      .eq("id", inquiry.id);
  }

  return (
    <div className="max-w-2xl">
      {/* Back nav */}
      <Link
        href="/dashboard/inquiries"
        className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-brand-600 mb-5 transition"
      >
        <ArrowLeft className="h-4 w-4" />
        All messages
      </Link>

      {/* Sender info */}
      <div className="card p-5 mb-4">
        <div className="flex items-start justify-between gap-4 flex-wrap">
          <div>
            <p className="font-semibold text-gray-900 text-base">
              {inquiry.sender_name ?? "Anonymous"}
            </p>
            <div className="flex flex-wrap items-center gap-x-4 gap-y-1 mt-1.5">
              {inquiry.sender_email && (
                <a
                  href={`mailto:${inquiry.sender_email}`}
                  className="inline-flex items-center gap-1 text-sm text-brand-600 hover:underline"
                >
                  <Mail className="h-3.5 w-3.5" />
                  {inquiry.sender_email}
                </a>
              )}
              {inquiry.sender_phone && (
                <a
                  href={`tel:${inquiry.sender_phone}`}
                  className="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-800"
                >
                  <Phone className="h-3.5 w-3.5" />
                  {inquiry.sender_phone}
                </a>
              )}
            </div>
          </div>
          <span className="text-xs text-gray-400 whitespace-nowrap shrink-0 pt-0.5">
            {formatDate(inquiry.created_at)}
          </span>
        </div>
      </div>

      {/* Thread */}
      <div className="card p-5 space-y-5">
        {/* Original message */}
        <div className="flex gap-3">
          <div className="flex-shrink-0 mt-0.5">
            <div className="h-8 w-8 rounded-full bg-gray-100 flex items-center justify-center">
              <MessageSquare className="h-4 w-4 text-gray-400" />
            </div>
          </div>
          <div className="flex-1 min-w-0">
            <div className="flex items-baseline justify-between gap-2 flex-wrap mb-1.5">
              <p className="text-sm font-semibold text-gray-800">
                {inquiry.sender_name ?? "Guest"}
              </p>
              <span className="text-xs text-gray-400 shrink-0">
                {formatDate(inquiry.created_at)}
              </span>
            </div>
            <div className="bg-gray-50 rounded-xl rounded-tl-none p-4 text-sm text-gray-700 leading-relaxed whitespace-pre-wrap">
              {inquiry.message}
            </div>
          </div>
        </div>

        {/* Vendor replies */}
        {(replies ?? []).map((reply) => (
          <div key={reply.id} className="flex gap-3 flex-row-reverse">
            <div className="flex-shrink-0 mt-0.5">
              <div className="h-8 w-8 rounded-full bg-brand-100 flex items-center justify-center">
                <span className="text-xs font-bold text-brand-700">
                  {vendor.business_name.charAt(0).toUpperCase()}
                </span>
              </div>
            </div>
            <div className="flex-1 min-w-0">
              <div className="flex items-baseline justify-between gap-2 flex-wrap mb-1.5">
                <span className="text-xs text-gray-400 shrink-0">
                  {formatDate(reply.created_at)}
                </span>
                <p className="text-sm font-semibold text-brand-700">
                  {vendor.business_name}
                </p>
              </div>
              <div className="bg-brand-50 rounded-xl rounded-tr-none p-4 text-sm text-gray-800 leading-relaxed whitespace-pre-wrap">
                {reply.body}
              </div>
            </div>
          </div>
        ))}

        {/* Divider */}
        {(replies ?? []).length > 0 && (
          <div className="border-t border-dashed border-gray-200" />
        )}

        {/* Compose */}
        <ReplyComposer inquiryId={inquiry.id} />
      </div>
    </div>
  );
}
