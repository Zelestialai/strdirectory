"use client";

import { useState } from "react";
import { Loader2, AlertTriangle } from "lucide-react";
import { useRouter } from "next/navigation";
import { SettingsCard } from "./ProfileForm";

export function DangerZone() {
  const [open, setOpen] = useState(false);
  const [confirmText, setConfirmText] = useState("");
  const [working, setWorking] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  async function deactivate() {
    if (confirmText !== "DEACTIVATE" || working) return;
    setWorking(true);
    setError(null);
    try {
      const res = await fetch("/api/account/deactivate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ confirm: "DEACTIVATE" }),
      });
      if (!res.ok) throw new Error((await res.json()).error || "Failed to deactivate");
      // Signed out server-side; send to home
      router.push("/");
      router.refresh();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
      setWorking(false);
    }
  }

  return (
    <SettingsCard
      title="Deactivate account"
      description="Hide your listing and close your account."
      danger
    >
      <div className="flex items-start gap-3 mb-4">
        <AlertTriangle className="h-5 w-5 text-red-500 shrink-0 mt-0.5" />
        <p className="text-sm text-gray-600">
          Deactivating hides your vendor listing from search and signs you out. Your data is
          retained so you can reactivate by contacting{" "}
          <a href="mailto:support@strvend.com" className="text-red-600 hover:underline font-medium">
            support@strvend.com
          </a>
          . This does not cancel an active subscription — cancel that first from the Upgrade page.
        </p>
      </div>

      {!open ? (
        <button
          onClick={() => setOpen(true)}
          className="rounded-lg border border-red-300 px-4 py-2 text-sm font-semibold text-red-700 hover:bg-red-50 transition"
        >
          Deactivate my account
        </button>
      ) : (
        <div className="rounded-lg border border-red-200 bg-red-50 p-4 space-y-3">
          <p className="text-sm text-gray-700">
            Type <span className="font-mono font-bold text-red-700">DEACTIVATE</span> to confirm.
          </p>
          <input
            type="text"
            value={confirmText}
            onChange={(e) => setConfirmText(e.target.value)}
            placeholder="DEACTIVATE"
            className="w-full rounded-lg border border-red-200 px-3 py-2 text-sm focus:border-red-400 focus:ring-2 focus:ring-red-100 focus:outline-none"
          />
          {error && <p className="text-xs text-red-600">{error}</p>}
          <div className="flex items-center gap-2">
            <button
              onClick={deactivate}
              disabled={confirmText !== "DEACTIVATE" || working}
              className="inline-flex items-center gap-1.5 rounded-lg bg-red-600 px-4 py-2 text-sm font-semibold text-white hover:bg-red-700 disabled:opacity-40 disabled:cursor-not-allowed transition"
            >
              {working && <Loader2 className="h-3.5 w-3.5 animate-spin" />}
              Confirm deactivation
            </button>
            <button
              onClick={() => {
                setOpen(false);
                setConfirmText("");
                setError(null);
              }}
              disabled={working}
              className="rounded-lg px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 transition"
            >
              Cancel
            </button>
          </div>
        </div>
      )}
    </SettingsCard>
  );
}
