"use client";

import { useState } from "react";
import { CheckCircle, XCircle } from "lucide-react";
import { useRouter } from "next/navigation";

export function TeamRespondButtons({ teamMemberId }: { teamMemberId: string }) {
  const [loading, setLoading] = useState<"accepted" | "declined" | null>(null);
  const [done, setDone] = useState<"accepted" | "declined" | null>(null);
  const router = useRouter();

  async function respond(status: "accepted" | "declined") {
    setLoading(status);
    const res = await fetch("/api/team/respond", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ team_member_id: teamMemberId, status }),
    });
    setLoading(null);
    if (res.ok) {
      setDone(status);
      router.refresh();
    }
  }

  if (done === "accepted") {
    return (
      <p className="text-sm text-teal-600 flex items-center gap-1.5">
        <CheckCircle className="h-4 w-4" /> You joined their team
      </p>
    );
  }
  if (done === "declined") {
    return (
      <p className="text-sm text-gray-400 flex items-center gap-1.5">
        <XCircle className="h-4 w-4" /> Invitation declined
      </p>
    );
  }

  return (
    <div className="flex gap-2">
      <button
        onClick={() => respond("accepted")}
        disabled={!!loading}
        className="flex items-center gap-1.5 rounded-lg bg-teal-600 px-4 py-2 text-sm font-medium text-white hover:bg-teal-700 disabled:opacity-50 transition"
      >
        <CheckCircle className="h-4 w-4" />
        {loading === "accepted" ? "Accepting…" : "Accept"}
      </button>
      <button
        onClick={() => respond("declined")}
        disabled={!!loading}
        className="flex items-center gap-1.5 rounded-lg border px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-50 disabled:opacity-50 transition"
      >
        {loading === "declined" ? "Declining…" : "Decline"}
      </button>
    </div>
  );
}
