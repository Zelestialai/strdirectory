"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Home, Check } from "lucide-react";

interface Property {
  id: string;
  name: string;
}

export function TeamPropertyScope({
  memberId,
  properties,
  selectedIds,
}: {
  memberId: string;
  properties: Property[];
  selectedIds: string[];
}) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [sel, setSel] = useState<Set<string>>(new Set(selectedIds));
  const [saving, setSaving] = useState(false);

  const coversAll = sel.size === 0;

  const toggle = (id: string) => {
    setSel((prev) => {
      const next = new Set(prev);
      next.has(id) ? next.delete(id) : next.add(id);
      return next;
    });
  };

  const save = async () => {
    setSaving(true);
    await fetch(`/api/team/${memberId}/properties`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ propertyIds: Array.from(sel) }),
    });
    setSaving(false);
    setOpen(false);
    router.refresh();
  };

  const summary =
    selectedIds.length === 0
      ? "All properties"
      : selectedIds
          .map((id) => properties.find((p) => p.id === id)?.name)
          .filter(Boolean)
          .join(", ");

  if (properties.length === 0) {
    return <span className="text-xs text-gray-400">Add a property to assign jobs</span>;
  }

  return (
    <div className="text-xs">
      {!open ? (
        <button
          onClick={() => setOpen(true)}
          className="flex items-center gap-1.5 text-gray-500 hover:text-teal-700 transition"
          title="Choose which properties this cleaner covers"
        >
          <Home className="h-3.5 w-3.5 shrink-0" />
          <span className="truncate max-w-[220px]">
            Covers: <span className="font-medium text-gray-700">{summary}</span>
          </span>
          <span className="text-teal-600">Edit</span>
        </button>
      ) : (
        <div className="rounded-lg border border-gray-200 bg-white p-3 shadow-sm w-64">
          <p className="mb-2 font-medium text-gray-700">Properties this cleaner covers</p>
          <div className="space-y-1.5 max-h-48 overflow-auto">
            {properties.map((p) => (
              <label key={p.id} className="flex items-center gap-2 cursor-pointer">
                <input
                  type="checkbox"
                  checked={sel.has(p.id)}
                  onChange={() => toggle(p.id)}
                  className="rounded border-gray-300 text-teal-600 focus:ring-teal-500"
                />
                <span className="text-gray-700">{p.name}</span>
              </label>
            ))}
          </div>
          <p className="mt-2 text-[11px] text-gray-400">
            {coversAll
              ? "Nothing selected = covers all your properties."
              : `${sel.size} selected — they'll only get jobs for these.`}
          </p>
          <div className="mt-3 flex items-center gap-2">
            <button
              onClick={save}
              disabled={saving}
              className="inline-flex items-center gap-1 rounded-md bg-teal-600 px-2.5 py-1 text-xs font-semibold text-white hover:bg-teal-700 disabled:opacity-60"
            >
              <Check className="h-3.5 w-3.5" /> {saving ? "Saving…" : "Save"}
            </button>
            <button onClick={() => { setSel(new Set(selectedIds)); setOpen(false); }} className="text-gray-400 hover:text-gray-600">
              Cancel
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
