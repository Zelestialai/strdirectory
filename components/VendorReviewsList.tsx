"use client";
import { useState } from "react";
import { StarRating } from "./StarRating";
import { formatDate } from "@/lib/utils";
import type { Review } from "@/types";
import { MessageSquare, CheckCircle } from "lucide-react";

export function VendorReviewsList({ reviews }: { reviews: Review[] }) {
  return (
    <div className="space-y-4">
      {reviews.map((r) => <VendorReviewCard key={r.id} review={r} />)}
    </div>
  );
}

function VendorReviewCard({ review }: { review: Review }) {
  const [responding, setResponding] = useState(false);
  const [text, setText] = useState(review.vendor_response ?? "");
  const [saved, setSaved] = useState(!!review.vendor_response);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  const handleSave = async () => {
    if (!text.trim()) return;
    setSaving(true);
    setError("");
    try {
      const res = await fetch(`/api/reviews/${review.id}/respond`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ vendor_response: text.trim() }),
      });
      if (!res.ok) {
        const data = await res.json();
        setError(data.error ?? "Failed to save response");
      } else {
        setSaved(true);
        setResponding(false);
      }
    } catch {
      setError("Network error — please try again");
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="rounded-xl border bg-white p-5 space-y-3">
      {/* Reviewer header */}
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

      {/* Existing response */}
      {saved && !responding && (
        <div className="bg-gray-50 border-l-4 border-brand-300 rounded-r-lg p-3">
          <p className="text-xs font-semibold text-gray-500 mb-1">Your response</p>
          <p className="text-sm text-gray-700 leading-relaxed">{text}</p>
          <button
            onClick={() => { setResponding(true); setSaved(false); }}
            className="mt-2 text-xs text-brand-600 hover:underline font-medium"
          >
            Edit response
          </button>
        </div>
      )}

      {/* Respond form */}
      {responding ? (
        <div className="border-t pt-3 space-y-2">
          <label className="text-xs font-semibold text-gray-600 flex items-center gap-1">
            <MessageSquare className="h-3.5 w-3.5" /> Your public response
          </label>
          <textarea
            value={text}
            onChange={(e) => setText(e.target.value)}
            rows={3}
            className="input resize-none text-sm"
            placeholder="Thank the reviewer and address their feedback…"
          />
          {error && <p className="text-xs text-red-500">{error}</p>}
          <div className="flex items-center gap-2">
            <button
              onClick={handleSave}
              disabled={saving || !text.trim()}
              className="btn-primary text-xs"
            >
              {saving ? "Saving…" : "Post Response"}
            </button>
            <button
              onClick={() => { setResponding(false); setText(review.vendor_response ?? ""); }}
              className="btn-secondary text-xs"
            >
              Cancel
            </button>
          </div>
        </div>
      ) : !saved ? (
        <button
          onClick={() => setResponding(true)}
          className="flex items-center gap-1.5 text-xs text-brand-600 hover:underline font-medium border-t pt-3 w-full"
        >
          <MessageSquare className="h-3.5 w-3.5" /> Respond to this review
        </button>
      ) : null}

      {/* Success flash */}
      {saved && !responding && review.vendor_response === null && (
        <p className="flex items-center gap-1 text-xs text-green-600">
          <CheckCircle className="h-3.5 w-3.5" /> Response posted
        </p>
      )}
    </div>
  );
}
