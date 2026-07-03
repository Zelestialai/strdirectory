"use client";
import { useState } from "react";
import { ThumbsUp } from "lucide-react";
import { StarRating } from "./StarRating";
import { formatDate } from "@/lib/utils";
import type { Review } from "@/types";

interface Props {
  review: Review;
  currentUserId?: string;
  initialHelpfulCount?: number;
  initialVoted?: boolean;
}

export function ReviewCard({
  review,
  currentUserId,
  initialHelpfulCount = 0,
  initialVoted = false,
}: Props) {
  const [helpfulCount, setHelpfulCount] = useState(initialHelpfulCount);
  const [voted, setVoted] = useState(initialVoted);
  const [loading, setLoading] = useState(false);

  async function toggleHelpful() {
    if (!currentUserId || loading) return;
    setLoading(true);
    const wasVoted = voted;
    try {
      const method = wasVoted ? "DELETE" : "POST";
      const res = await fetch(`/api/reviews/${review.id}/helpful`, { method });
      if (res.ok) {
        // Clean success path
        setVoted(!wasVoted);
        setHelpfulCount((c) => (wasVoted ? Math.max(0, c - 1) : c + 1));
      } else if (res.status === 409 && !wasVoted) {
        // 409 = already voted (DB unique constraint) — resync local state to voted=true
        setVoted(true);
      }
      // Any other error: leave state unchanged (implicit)
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="rounded-xl border bg-white p-5 space-y-2">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <div className="h-8 w-8 rounded-full bg-brand-100 flex items-center justify-center text-brand-700 font-semibold text-sm">
            {review.profiles?.full_name?.[0]?.toUpperCase() ?? "?"}
          </div>
          <span className="text-sm font-medium text-gray-800">
            {review.profiles?.full_name ?? "Anonymous"}
          </span>
        </div>
        <span className="text-xs text-gray-400">{formatDate(review.created_at)}</span>
      </div>

      <StarRating rating={review.rating} size="sm" />
      {review.title && <p className="font-medium text-gray-800 text-sm">{review.title}</p>}
      {review.body && <p className="text-sm text-gray-600 leading-relaxed">{review.body}</p>}

      {review.vendor_response && (
        <div className="bg-gray-50 border-l-4 border-brand-300 rounded-r-lg p-3 mt-1">
          <p className="text-xs font-semibold text-gray-500 mb-1">
            Response from vendor
            {review.vendor_response_at ? ` · ${formatDate(review.vendor_response_at)}` : ""}
          </p>
          <p className="text-sm text-gray-700 leading-relaxed">{review.vendor_response}</p>
        </div>
      )}

      {/* Helpful vote */}
      <div className="pt-1 flex items-center gap-2">
        <button
          onClick={toggleHelpful}
          disabled={!currentUserId || loading}
          className={`flex items-center gap-1.5 text-xs rounded-full px-2.5 py-1 transition-colors border ${
            voted
              ? "bg-brand-50 border-brand-200 text-brand-700"
              : "border-gray-200 text-gray-400 hover:border-gray-300 hover:text-gray-600"
          } disabled:opacity-40 disabled:cursor-not-allowed`}
        >
          <ThumbsUp className={`h-3 w-3 ${voted ? "fill-brand-500 text-brand-500" : ""}`} />
          Helpful{helpfulCount > 0 ? ` (${helpfulCount})` : ""}
        </button>
        {!currentUserId && (
          <span className="text-xs text-gray-300">Sign in to vote</span>
        )}
      </div>
    </div>
  );
}
