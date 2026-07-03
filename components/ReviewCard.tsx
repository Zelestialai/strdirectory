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
