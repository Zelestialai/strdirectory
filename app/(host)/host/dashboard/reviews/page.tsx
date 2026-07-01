import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Star, ExternalLink } from "lucide-react";
import { StarRating } from "@/components/StarRating";
import { formatDate } from "@/lib/utils";
import type { Review } from "@/types";

export const metadata = { title: "My Reviews" };

export default async function HostReviewsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: reviews } = await supabase
    .from("reviews")
    .select("*, vendor:vendors(id, business_name, slug, category:categories(name))")
    .eq("reviewer_id", user!.id)
    .order("created_at", { ascending: false });

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 mb-6">My Reviews</h1>

      {reviews && reviews.length > 0 ? (
        <div className="space-y-4">
          {reviews.map((r: any) => (
            <div key={r.id} className="card p-5 space-y-3">
              <div className="flex items-start justify-between gap-3">
                <div className="flex-1 min-w-0">
                  {r.vendor && (
                    <Link href={`/vendors/${r.vendor.slug}`} className="font-semibold text-gray-900 hover:text-brand-700 transition">
                      {r.vendor.business_name}
                    </Link>
                  )}
                  {r.vendor?.category && (
                    <p className="text-xs text-gray-400">{r.vendor.category.name}</p>
                  )}
                </div>
                <span className="text-xs text-gray-400 shrink-0">{formatDate(r.created_at)}</span>
              </div>

              <div className="flex items-center gap-2">
                <StarRating rating={r.rating} size="sm" />
                {r.is_verified && (
                  <span className="text-xs font-medium text-green-600 bg-green-50 px-2 py-0.5 rounded-full">
                    Verified
                  </span>
                )}
              </div>

              {r.title && <p className="font-medium text-gray-800 text-sm">{r.title}</p>}
              {r.body && <p className="text-sm text-gray-600">{r.body}</p>}

              {/* Vendor response */}
              {r.vendor_response && (
                <div className="bg-gray-50 border-l-4 border-brand-300 rounded-r-lg p-3 mt-2">
                  <p className="text-xs font-semibold text-gray-500 mb-1">
                    Response from {r.vendor?.business_name} · {r.vendor_response_at ? formatDate(r.vendor_response_at) : ""}
                  </p>
                  <p className="text-sm text-gray-700">{r.vendor_response}</p>
                </div>
              )}

              {r.vendor && (
                <Link href={`/vendors/${r.vendor.slug}`} className="btn-secondary text-xs w-fit">
                  <ExternalLink className="h-3.5 w-3.5" /> View Vendor
                </Link>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <Star className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p className="font-medium text-gray-500 mb-1">No reviews written yet</p>
          <p className="text-sm mb-4">After contacting a vendor, share your experience to help other hosts.</p>
          <Link href="/vendors" className="btn-primary text-sm">
            Find Vendors to Review
          </Link>
        </div>
      )}
    </div>
  );
}
