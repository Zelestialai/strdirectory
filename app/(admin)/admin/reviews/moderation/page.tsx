"use client";

import { useEffect, useState, useCallback } from "react";
import { Flag, Eye, EyeOff, CheckCircle, AlertTriangle, Loader2 } from "lucide-react";
import { createClient } from "@/lib/supabase/client";

interface FlaggedReview {
  id: string;
  rating: number;
  comment: string;
  is_hidden: boolean;
  is_flagged: boolean;
  flag_reason: string | null;
  flagged_at: string | null;
  created_at: string;
  vendor: { business_name: string; slug: string } | null;
  reviewer: { full_name: string | null } | null;
}

export default function AdminReviewModerationPage() {
  const [reviews, setReviews] = useState<FlaggedReview[]>([]);
  const [loading, setLoading] = useState(true);
  const [tab, setTab] = useState<"flagged" | "hidden">("flagged");
  const [acting, setActing] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    const supabase = createClient();
    const query = supabase
      .from("reviews")
      .select("id,rating,comment,is_hidden,is_flagged,flag_reason,flagged_at,created_at,vendor:vendors(business_name,slug),reviewer:profiles(full_name)")
      .order("flagged_at", { ascending: false });

    if (tab === "flagged") {
      query.eq("is_flagged", true);
    } else {
      query.eq("is_hidden", true);
    }

    const { data } = await query;
    setReviews((data as unknown as FlaggedReview[]) ?? []);
    setLoading(false);
  }, [tab]);

  useEffect(() => { load(); }, [load]);

  async function moderate(id: string, action: "hide" | "unhide" | "dismiss") {
    setActing(id);
    await fetch(`/api/admin/reviews/${id}/moderate`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ action }),
    });
    setActing(null);
    load();
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Review Moderation</h1>
        <div className="flex gap-2">
          <button
            onClick={() => setTab("flagged")}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
              tab === "flagged"
                ? "bg-red-100 text-red-700 border border-red-200"
                : "bg-white border border-gray-200 text-gray-600 hover:bg-gray-50"
            }`}
          >
            <Flag className="inline h-4 w-4 mr-1.5" />
            Flagged
          </button>
          <button
            onClick={() => setTab("hidden")}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
              tab === "hidden"
                ? "bg-gray-900 text-white"
                : "bg-white border border-gray-200 text-gray-600 hover:bg-gray-50"
            }`}
          >
            <EyeOff className="inline h-4 w-4 mr-1.5" />
            Hidden
          </button>
        </div>
      </div>

      {loading ? (
        <div className="flex items-center gap-2 text-gray-400 py-12 justify-center">
          <Loader2 className="h-5 w-5 animate-spin" />
          <span>Loading…</span>
        </div>
      ) : reviews.length === 0 ? (
        <div className="text-center py-16 text-gray-400">
          <CheckCircle className="h-10 w-10 mx-auto mb-3 text-green-300" />
          <p className="font-medium">No {tab} reviews</p>
        </div>
      ) : (
        <div className="space-y-4">
          {reviews.map((r) => (
            <div key={r.id} className="bg-white rounded-2xl border border-gray-100 shadow-sm p-5">
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1 min-w-0">
                  {/* Vendor + reviewer */}
                  <div className="flex flex-wrap items-center gap-2 mb-2">
                    <a
                      href={`/vendors/${r.vendor?.slug}`}
                      target="_blank"
                      className="font-semibold text-brand-600 hover:underline text-sm"
                    >
                      {r.vendor?.business_name ?? "Unknown vendor"}
                    </a>
                    <span className="text-gray-300">·</span>
                    <span className="text-sm text-gray-500">
                      by {r.reviewer?.full_name ?? "Anonymous"}
                    </span>
                    <span className="text-gray-300">·</span>
                    <span className="text-sm text-gray-400">
                      {"★".repeat(r.rating)}{"☆".repeat(5 - r.rating)}
                    </span>
                  </div>

                  {/* Review text */}
                  <p className="text-gray-700 text-sm leading-relaxed mb-3 line-clamp-3">
                    {r.comment}
                  </p>

                  {/* Flag reason */}
                  {r.flag_reason && (
                    <div className="flex items-start gap-2 bg-red-50 border border-red-100 rounded-lg px-3 py-2 text-sm text-red-700">
                      <AlertTriangle className="h-4 w-4 mt-0.5 shrink-0" />
                      <span><strong>Flag reason:</strong> {r.flag_reason}</span>
                    </div>
                  )}
                </div>

                {/* Actions */}
                <div className="flex flex-col gap-2 shrink-0">
                  {tab === "flagged" && (
                    <>
                      <button
                        onClick={() => moderate(r.id, "hide")}
                        disabled={acting === r.id}
                        className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-red-600 text-white text-xs font-semibold rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors"
                      >
                        {acting === r.id ? <Loader2 className="h-3 w-3 animate-spin" /> : <EyeOff className="h-3 w-3" />}
                        Hide review
                      </button>
                      <button
                        onClick={() => moderate(r.id, "dismiss")}
                        disabled={acting === r.id}
                        className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-gray-100 text-gray-700 text-xs font-semibold rounded-lg hover:bg-gray-200 disabled:opacity-50 transition-colors"
                      >
                        <CheckCircle className="h-3 w-3" />
                        Dismiss flag
                      </button>
                    </>
                  )}
                  {tab === "hidden" && (
                    <button
                      onClick={() => moderate(r.id, "unhide")}
                      disabled={acting === r.id}
                      className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-green-600 text-white text-xs font-semibold rounded-lg hover:bg-green-700 disabled:opacity-50 transition-colors"
                    >
                      {acting === r.id ? <Loader2 className="h-3 w-3 animate-spin" /> : <Eye className="h-3 w-3" />}
                      Restore
                    </button>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
