"use client";
import { StarRating } from "./StarRating";
import { formatDate } from "@/lib/utils";
import type { Review } from "@/types";

export function ReviewCard({ review }: { review: Review }) {
  return (
    <div className="rounded-xl border bg-white p-5 space-y-2">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <div className="h-8 w-8 rounded-full bg-brand-100 flex items-center justify-center text-brand-700 font-semibold text-sm">
            {review.profiles?.full_name?.[0]?.toUpperCase() ?? "?"}
          </div>
          <span className="text-sm font-medium text-gray-800">{review.profiles?.full_name ?? "Anonymous"}</span>
        </div>
        <span className="text-xs text-gray-400">{formatDate(review.created_at)}</span>
      </div>
      <StarRating rating={review.rating} size="sm" />
      {review.title && <p className="font-medium text-gray-800 text-sm">{review.title}</p>}
      {review.body && <p className="text-sm text-gray-600 leading-relaxed">{review.body}</p>}
    </div>
  );
}
