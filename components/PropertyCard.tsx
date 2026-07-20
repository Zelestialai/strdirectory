"use client";

import { useState } from "react";
import { Home, RefreshCw, Pencil, Trash2, Clock, Link2 } from "lucide-react";

interface Property {
  id: string;
  name: string;
  address: string | null;
  ical_url: string | null;
  last_synced_at: string | null;
}

interface Props {
  property: Property;
  onEdit: (property: Property) => void;
  onDelete: (id: string) => void;
  onSynced: () => void;
}

export function PropertyCard({ property, onEdit, onDelete, onSynced }: Props) {
  const [syncing, setSyncing] = useState(false);
  const [syncResult, setSyncResult] = useState<string | null>(null);
  const [deleting, setDeleting] = useState(false);

  async function handleSync() {
    setSyncing(true);
    setSyncResult(null);
    try {
      const res = await fetch("/api/calendar/sync", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ property_id: property.id }),
      });
      const data = await res.json();
      if (!res.ok) {
        setSyncResult(`Error: ${data.error}`);
      } else {
        setSyncResult(
          data.synced === 0
            ? "No events found"
            : `Synced ${data.synced} event${data.synced !== 1 ? "s" : ""}`
        );
        onSynced();
      }
    } catch {
      setSyncResult("Network error — please try again");
    } finally {
      setSyncing(false);
    }
  }

  async function handleDelete() {
    if (!confirm(`Delete "${property.name}"? This will also remove all its calendar events.`)) return;
    setDeleting(true);
    await fetch(`/api/properties/${property.id}`, { method: "DELETE" });
    onDelete(property.id);
  }

  const lastSynced = property.last_synced_at
    ? new Date(property.last_synced_at).toLocaleString(undefined, {
        month: "short",
        day: "numeric",
        hour: "numeric",
        minute: "2-digit",
      })
    : null;

  return (
    <div className="card p-5 space-y-3">
      {/* Header */}
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-center gap-2.5 min-w-0">
          <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-brand-50 text-brand-600">
            <Home className="h-4 w-4" />
          </span>
          <div className="min-w-0">
            <p className="font-semibold text-gray-900 truncate">{property.name}</p>
            {property.address && (
              <p className="text-xs text-gray-500 truncate">{property.address}</p>
            )}
          </div>
        </div>
        <div className="flex items-center gap-1 shrink-0">
          <button
            onClick={() => onEdit(property)}
            className="p-1.5 text-gray-400 hover:text-gray-700 rounded transition"
            title="Edit property"
          >
            <Pencil className="h-4 w-4" />
          </button>
          <button
            onClick={handleDelete}
            disabled={deleting}
            className="p-1.5 text-gray-400 hover:text-red-500 rounded transition disabled:opacity-50"
            title="Delete property"
          >
            <Trash2 className="h-4 w-4" />
          </button>
        </div>
      </div>

      {/* iCal status */}
      {property.ical_url ? (
        <div className="flex items-center gap-2 text-xs text-gray-500 bg-gray-50 rounded-lg px-3 py-2">
          <Link2 className="h-3.5 w-3.5 shrink-0 text-brand-400" />
          <span className="truncate font-mono">{property.ical_url}</span>
        </div>
      ) : (
        <p className="text-xs text-amber-600 bg-amber-50 rounded-lg px-3 py-2">
          No iCal URL — edit this property to add one
        </p>
      )}

      {/* Footer: sync */}
      <div className="flex items-center justify-between gap-3 pt-1">
        <div className="flex items-center gap-1.5 text-xs text-gray-400">
          {lastSynced ? (
            <>
              <Clock className="h-3.5 w-3.5" />
              <span>Last synced {lastSynced}</span>
            </>
          ) : (
            <span className="italic">Never synced</span>
          )}
        </div>
        <button
          onClick={handleSync}
          disabled={syncing || !property.ical_url}
          className="flex items-center gap-1.5 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-brand-700 disabled:opacity-50 disabled:cursor-not-allowed transition"
        >
          <RefreshCw className={`h-3.5 w-3.5 ${syncing ? "animate-spin" : ""}`} />
          {syncing ? "Syncing…" : "Sync Now"}
        </button>
      </div>

      {/* Sync result toast */}
      {syncResult && (
        <p
          className={`text-xs rounded px-2 py-1 ${
            syncResult.startsWith("Error")
              ? "bg-red-50 text-red-600"
              : "bg-green-50 text-green-700"
          }`}
        >
          {syncResult}
        </p>
      )}
    </div>
  );
}
