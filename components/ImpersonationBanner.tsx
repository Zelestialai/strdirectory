"use client";

import { useState } from "react";
import { Eye, LogOut } from "lucide-react";

export function ImpersonationBanner({ name }: { name: string }) {
  const [loading, setLoading] = useState(false);

  const exit = async () => {
    setLoading(true);
    try {
      const res = await fetch("/api/admin/impersonate/exit", { method: "POST" });
      const json = await res.json().catch(() => ({}));
      window.location.href = json.redirect || "/admin/users";
    } catch {
      setLoading(false);
    }
  };

  return (
    <div className="sticky top-0 z-[90] flex items-center justify-center gap-3 bg-amber-500 px-4 py-2 text-sm font-medium text-amber-950 shadow">
      <Eye className="h-4 w-4 shrink-0" />
      <span className="truncate">
        Viewing as <strong>{name}</strong> — you are in their account.
      </span>
      <button
        onClick={exit}
        disabled={loading}
        className="ml-1 inline-flex shrink-0 items-center gap-1.5 rounded-md bg-amber-950/90 px-3 py-1 text-xs font-semibold text-amber-50 hover:bg-amber-950 disabled:opacity-60"
      >
        <LogOut className="h-3.5 w-3.5" />
        {loading ? "Exiting…" : "Exit to admin"}
      </button>
    </div>
  );
}
