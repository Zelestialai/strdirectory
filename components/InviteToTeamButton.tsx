"use client";

import { useState } from "react";
import { Users, Check, Clock } from "lucide-react";

interface Props {
  vendorId: string;
  initialStatus: "none" | "pending" | "accepted" | "declined";
  className?: string;
}

export function InviteToTeamButton({ vendorId, initialStatus, className = "" }: Props) {
  const [status, setStatus] = useState(initialStatus);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (status === "accepted") {
    return (
      <span className={`inline-flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium bg-teal-50 text-teal-700 ${className}`}>
        <Check className="h-4 w-4" /> On Your Team
      </span>
    );
  }

  if (status === "pending") {
    return (
      <span className={`inline-flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium bg-gray-100 text-gray-500 ${className}`}>
        <Clock className="h-4 w-4" /> Invite Sent
      </span>
    );
  }

  async function handleInvite() {
    setLoading(true);
    setError(null);
    try {
      const res = await fetch("/api/team/invite", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ vendor_id: vendorId }),
      });
      if (res.ok) {
        setStatus("pending");
      } else {
        const data = await res.json().catch(() => ({}));
        setError(data.error || "Couldn't send invite. Please try again.");
      }
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className={className}>
      <button
        onClick={handleInvite}
        disabled={loading}
        className="inline-flex items-center gap-1.5 rounded-lg border border-teal-200 bg-teal-50 px-3 py-2 text-sm font-medium text-teal-700 hover:bg-teal-100 disabled:opacity-50 transition"
      >
        <Users className="h-4 w-4" />
        {loading ? "Sending…" : "Add to Team"}
      </button>
      {error && <p className="mt-1 text-xs text-red-600">{error}</p>}
    </div>
  );
}
