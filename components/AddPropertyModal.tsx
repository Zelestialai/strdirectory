"use client";

import { useState, useEffect, useRef } from "react";
import { X, Home } from "lucide-react";

interface Property {
  id: string;
  name: string;
  address: string | null;
  ical_url: string | null;
  last_synced_at: string | null;
}

interface Props {
  editing?: Property | null;
  onClose: () => void;
  onSaved: (property: Property) => void;
}

export function AddPropertyModal({ editing, onClose, onSaved }: Props) {
  const [name, setName] = useState(editing?.name ?? "");
  const [address, setAddress] = useState(editing?.address ?? "");
  const [icalUrl, setIcalUrl] = useState(editing?.ical_url ?? "");
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const nameRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    nameRef.current?.focus();
  }, []);

  // Reset form when editing target changes
  useEffect(() => {
    setName(editing?.name ?? "");
    setAddress(editing?.address ?? "");
    setIcalUrl(editing?.ical_url ?? "");
    setError(null);
  }, [editing]);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!name.trim()) return;
    setSaving(true);
    setError(null);

    try {
      const isEdit = !!editing;
      const url = isEdit ? `/api/properties/${editing!.id}` : "/api/properties";
      const method = isEdit ? "PATCH" : "POST";

      const res = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          name: name.trim(),
          address: address.trim() || null,
          ical_url: icalUrl.trim() || null,
        }),
      });

      const data = await res.json();
      if (!res.ok) {
        setError(data.error ?? "Something went wrong");
      } else {
        onSaved(data.property);
        onClose();
      }
    } catch {
      setError("Network error — please try again");
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-sm">
      <div className="w-full max-w-md rounded-2xl bg-white shadow-xl">
        {/* Header */}
        <div className="flex items-center justify-between border-b px-6 py-4">
          <div className="flex items-center gap-2 font-semibold text-gray-900">
            <Home className="h-4 w-4 text-brand-600" />
            {editing ? "Edit Property" : "Add Property"}
          </div>
          <button onClick={onClose} className="p-1 rounded hover:bg-gray-100 text-gray-500 transition">
            <X className="h-5 w-5" />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-5 space-y-4">
          {/* Name */}
          <div>
            <label className="label">Property Name *</label>
            <input
              ref={nameRef}
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="e.g. Mountain Cabin, Beach House 1"
              className="input"
              required
            />
          </div>

          {/* Address */}
          <div>
            <label className="label">Address (optional)</label>
            <input
              type="text"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              placeholder="123 Main St, Aspen CO 81611"
              className="input"
            />
          </div>

          {/* iCal URL */}
          <div>
            <label className="label">iCal URL (optional)</label>
            <input
              type="url"
              value={icalUrl}
              onChange={(e) => setIcalUrl(e.target.value)}
              placeholder="https://www.airbnb.com/calendar/ical/…"
              className="input font-mono text-sm"
            />
            <p className="mt-1.5 text-xs text-gray-400">
              In Airbnb: Listing → Calendar → Export Calendar. In VRBO: Calendar → Import/Export.
            </p>
          </div>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2">{error}</p>
          )}

          {/* Actions */}
          <div className="flex justify-end gap-3 pt-1">
            <button type="button" onClick={onClose} className="btn-secondary text-sm">
              Cancel
            </button>
            <button type="submit" disabled={saving || !name.trim()} className="btn-primary text-sm">
              {saving ? "Saving…" : editing ? "Save Changes" : "Add Property"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
