import { createClient } from "@/lib/supabase/server";
import { ReviewCard } from "@/components/ReviewCard";
import { StarRating } from "@/components/StarRating";
import type { Review } from "@/types";
import { Star } from "lucide-react";

export const metadata = { title: "Reviews" };

export default async function ReviewsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: vendor } = await supabase.from("vendors").select("id, avg_rating, review_count").eq("user_id", user!.id).single();

  if (!vendor) {
    return (
      <div className="card p-10 text-center text-gray-500">
        <Star className="mx-auto h-10 w-10 opacity-30 mb-3" />
        <p>Create a listing first to receive reviews.</p>
      </div>
    );
  }

  const { data: reviews } = await supabase
    .from("reviews")
    .select("*, profiles(*)")
    .eq("vendor_id", vendor.id)
    .order("created_at", { ascending: false });

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-gray-900">Reviews</h1>
        {vendor.avg_rating > 0 && (
          <div className="flex items-center gap-2">
            <StarRating rating={vendor.avg_rating} size="md" />
            <span className="font-bold text-gray-900">{Number(vendor.avg_rating).toFixed(1)}</span>
            <span className="text-sm text-gray-400">({vendor.review_count})</span>
          </div>
        )}
      </div>

      {reviews && reviews.length > 0 ? (
        <div className="space-y-4">
          {(reviews as Review[]).map((r) => <ReviewCard key={r.id} review={r} />)}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <Star className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p>No reviews yet. Provide great service and ask happy clients to leave a review!</p>
        </div>
      )}
    </div>
  );
}
