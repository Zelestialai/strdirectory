"use client";

import { useState } from "react";
import { CalendarClock, Copy, Check } from "lucide-react";

export function CalendarSubscribe({
  url,
  title = "Subscribe to this calendar",
  description = "Add this link in Google Calendar, Apple Calendar, or Outlook to keep it in sync automatically.",
}: {
  url: string;
  title?: string;
  description?: string;
}) {
  const [copied, setCopied] = useState(false);

  async function copy() {
    try {
      await navigator.clipboard.writeText(url);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      /* clipboard may be blocked; the input is selectable as a fallback */
    }
  }

  return (
    <div className="rounded-xl border border-gray-200 bg-white p-4">
      <div className="flex items-start gap-3">
        <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-brand-50 text-brand-600">
          <CalendarClock className="h-5 w-5" />
        </span>
        <div className="min-w-0 flex-1">
          <p className="text-sm font-semibold text-gray-900">{title}</p>
          <p className="text-xs text-gray-500 mt-0.5">{description}</p>
          <div className="mt-3 flex items-center gap-2">
            <input
              readOnly
              value={url}
              onFocus={(e) => e.currentTarget.select()}
              className="flex-1 min-w-0 rounded-lg border border-gray-200 bg-gray-50 px-3 py-1.5 text-xs text-gray-600 font-mono focus:outline-none focus:ring-2 focus:ring-brand-100"
            />
            <button
              onClick={copy}
              className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 transition shrink-0"
            >
              {copied ? <Check className="h-3.5 w-3.5" /> : <Copy className="h-3.5 w-3.5" />}
              {copied ? "Copied" : "Copy"}
            </button>
          </div>
          <p className="mt-2 text-[11px] text-gray-400">
            Keep this link private — anyone with it can view this calendar.
          </p>
        </div>
      </div>
    </div>
  );
}
