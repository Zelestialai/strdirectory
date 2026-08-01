"use client";

import { useState } from "react";
import { SettingsCard } from "./ProfileForm";

export interface NotificationPrefs {
  email_on_inquiry: boolean;
  email_on_review: boolean;
  email_weekly_digest: boolean;
  email_product_updates: boolean;
}

type ToggleItem = { key: keyof NotificationPrefs; label: string; description: string };

const VENDOR_ITEMS: ToggleItem[] = [
  {
    key: "email_on_inquiry",
    label: "New inquiries",
    description: "Email me when a host sends a new message or inquiry.",
  },
  {
    key: "email_on_review",
    label: "New reviews",
    description: "Email me when I receive a new review on my listing.",
  },
  {
    key: "email_weekly_digest",
    label: "Weekly performance digest",
    description: "A summary of your views, inquiries and reviews each week.",
  },
  {
    key: "email_product_updates",
    label: "Product updates",
    description: "Occasional news, tips and feature announcements from STRVend.",
  },
];

/** Host-facing labels for the same underlying preference columns. */
export const HOST_NOTIFICATION_ITEMS: ToggleItem[] = [
  {
    key: "email_on_inquiry",
    label: "Vendor replies",
    description: "Email me when a vendor replies to one of my inquiries.",
  },
  {
    key: "email_weekly_digest",
    label: "Weekly digest",
    description: "A weekly summary of vendor activity and upcoming reservations.",
  },
  {
    key: "email_product_updates",
    label: "Product updates",
    description: "Occasional news, tips and feature announcements from STRVend.",
  },
];

export function NotificationToggles({
  initial,
  items = VENDOR_ITEMS,
}: {
  initial: NotificationPrefs;
  items?: ToggleItem[];
}) {
  const [prefs, setPrefs] = useState<NotificationPrefs>(initial);
  const [savingKey, setSavingKey] = useState<string | null>(null);

  async function toggle(key: keyof NotificationPrefs) {
    const next = { ...prefs, [key]: !prefs[key] };
    setPrefs(next); // optimistic
    setSavingKey(key);
    try {
      const res = await fetch("/api/account/notifications", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ [key]: next[key] }),
      });
      if (!res.ok) throw new Error();
    } catch {
      setPrefs((p) => ({ ...p, [key]: !p[key] })); // revert on failure
    } finally {
      setSavingKey(null);
    }
  }

  return (
    <SettingsCard
      title="Email notifications"
      description="Choose which emails STRVend sends you. Changes save automatically."
    >
      <ul className="divide-y divide-gray-100 -my-1">
        {items.map(({ key, label, description }) => (
          <li key={key} className="flex items-center justify-between gap-4 py-3">
            <div className="min-w-0">
              <p className="text-sm font-medium text-gray-800">{label}</p>
              <p className="text-xs text-gray-500 mt-0.5">{description}</p>
            </div>
            <button
              role="switch"
              aria-checked={prefs[key]}
              aria-label={label}
              onClick={() => toggle(key)}
              disabled={savingKey === key}
              className={`relative inline-flex h-6 w-11 shrink-0 items-center rounded-full transition-colors disabled:opacity-60 ${
                prefs[key] ? "bg-brand-600" : "bg-gray-200"
              }`}
            >
              <span
                className={`inline-block h-5 w-5 transform rounded-full bg-white shadow transition-transform ${
                  prefs[key] ? "translate-x-5" : "translate-x-0.5"
                }`}
              />
            </button>
          </li>
        ))}
      </ul>
    </SettingsCard>
  );
}
