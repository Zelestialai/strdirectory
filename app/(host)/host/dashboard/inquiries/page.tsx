import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { MessageSquare, ExternalLink } from "lucide-react";
import { formatDate } from "@/lib/utils";

export const metadata = { title: "My Inquiries" };

const STATUS_STYLES: Record<string, string> = {
  new: "bg-blue-50 text-blue-700",
  read: "bg-gray-100 text-gray-600",
  replied: "bg-green-50 text-green-700",
  closed: "bg-gray-100 text-gray-400",
};

export default async function HostInquiriesPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: inquiries } = await supabase
    .from("inquiries")
    .select("*, vendor:vendors(id, business_name, slug, city, state, category:categories(name))")
    .eq("sender_id", user!.id)
    .order("created_at", { ascending: false });

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 mb-6">My Inquiries</h1>

      {inquiries && inquiries.length > 0 ? (
        <div className="space-y-4">
          {inquiries.map((inq) => {
            const v = inq.vendor;
            return (
              <div key={inq.id} className="card p-5 space-y-3">
                <div className="flex items-start justify-between gap-3">
                  <div className="flex-1 min-w-0">
                    {v ? (
                      <Link href={`/vendors/${v.slug}`} className="font-semibold text-gray-900 hover:text-brand-700 transition">
                        {v.business_name}
                      </Link>
                    ) : (
                      <span className="font-semibold text-gray-900">Unknown Vendor</span>
                    )}
                    {v?.category && (
                      <p className="text-xs text-gray-400">{v.category.name}</p>
                    )}
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    <span className={`rounded-full px-2.5 py-0.5 text-xs font-medium capitalize ${STATUS_STYLES[inq.status] ?? STATUS_STYLES.read}`}>
                      {inq.status}
                    </span>
                    <span className="text-xs text-gray-400">{formatDate(inq.created_at)}</span>
                  </div>
                </div>

                <p className="text-sm text-gray-600 line-clamp-2 bg-gray-50 rounded-lg p-3 italic">
                  "{inq.message}"
                </p>

                <div className="flex items-center gap-3">
                  {v && (
                    <>
                      <Link href={`/vendors/${v.slug}`} className="btn-secondary text-xs">
                        <ExternalLink className="h-3.5 w-3.5" /> View Vendor
                      </Link>
                      {/* If vendor has replied, offer to write a review */}
                      {inq.status === "replied" && (
                        <Link href={`/vendors/${v.slug}/review`} className="text-xs text-brand-600 hover:underline font-medium">
                          ★ Leave a review
                        </Link>
                      )}
                    </>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <MessageSquare className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p className="font-medium text-gray-500 mb-1">No inquiries sent yet</p>
          <p className="text-sm mb-4">Contact vendors from their profile page to get quotes and information.</p>
          <Link href="/vendors" className="btn-primary text-sm">
            Browse Vendors
          </Link>
        </div>
      )}
    </div>
  );
}
