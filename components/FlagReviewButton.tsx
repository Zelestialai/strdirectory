"use client";

import { useState } from "react";
import { Flag, X, Loader2 } from "lucide-react";

const FLAG_REASONS = [
  "Fake or spam review",
  "Offensive or inappropriate content",
  "Conflict of interest",
  "Not about this vendor",
  "Other",
];

export function FlagReviewButton({ reviewId }: { reviewId: string }) {
  const [open, setOpen] = useState(false);
  const [reason, setReason] = useState("");
  const [custom, setCustom] = useState("");
  const [loading, setLoading] = useState(false);
  const [done, setDone] = useState(false);

  async function submit() {
    const finalReason = reason === "Other" ? custom.trim() : reason;
    if (!finalReason) return;
    setLoading(true);
    await fetch(`/api/reviews/${reviewId}/flag`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ reason: finalReason }),
    });
    setLoading(false);
    setDone(true);
    setTimeout(() => setOpen(false), 1500);
  }

  if (done) {
    return (
      <span className="text-xs text-green-600 font-medium">Flagged — thank you</span>
    );
  }

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="text-xs text-gray-400 hover:text-red-500 transition-colors flex items-center gap-1"
      >
        <Flag className="h-3 w-3" /> Flag
      </button>

      {open && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-sm p-6">
            <div className="flex items-center justify-between mb-4">
              <h3 className="font-bold text-gray-900">Flag this review</h3>
              <button onClick={() => setOpen(false)} className="text-gray-400 hover:text-gray-600">
                <X className="h-5 w-5" />
              </button>
            </div>

            <p className="text-sm text-gray-500 mb-4">
              Why are you flagging this review? Our team will review it within 48 hours.
            </p>

            <div className="space-y-2 mb-4">
              {FLAG_REASONS.map((r) => (
                <label key={r} className="flex items-center gap-3 cursor-pointer group">
                  <input
                    type="radio"
                    name="flag-reason"
                    value={r}
                    checked={reason === r}
                    onChange={() => setReason(r)}
                    className="accent-brand-600"
                  />
                  <span className="text-sm text-gray-700 group-hover:text-gray-900">{r}</span>
                </label>
              ))}
            </div>

            {reason === "Other" && (
              <textarea
                value={custom}
                onChange={(e) => setCustom(e.target.value)}
                placeholder="Please describe the issue…"
                className="w-full border border-gray-200 rounded-xl px-3 py-2 text-sm mb-4 resize-none focus:ring-2 focus:ring-brand-300 focus:border-transparent outline-none"
                rows={3}
              />
            )}

            <div className="flex gap-2">
              <button
                onClick={() => setOpen(false)}
                className="flex-1 py-2 rounded-xl border border-gray-200 text-sm font-medium text-gray-600 hover:bg-gray-50"
              >
                Cancel
              </button>
              <button
                onClick={submit}
                disabled={!reason || loading || (reason === "Other" && !custom.trim())}
                className="flex-1 py-2 rounded-xl bg-red-600 text-white text-sm font-semibold hover:bg-red-700 disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {loading ? <Loader2 className="h-4 w-4 animate-spin" /> : <Flag className="h-4 w-4" />}
                Submit flag
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
