"use client";

import { useEffect, useState, useCallback } from "react";
import {
  Loader2,
  Plus,
  Trash2,
  GripVertical,
  ArrowUp,
  ArrowDown,
  Check,
  RotateCcw,
  ListChecks,
} from "lucide-react";

interface Section {
  title: string;
  items: { label: string }[];
}
interface Property {
  id: string;
  name: string;
}

export function ChecklistEditor() {
  const [target, setTarget] = useState<string | null>(null); // null = account default
  const [properties, setProperties] = useState<Property[]>([]);
  const [overridden, setOverridden] = useState<string[]>([]);
  const [sections, setSections] = useState<Section[]>([]);
  const [isOverride, setIsOverride] = useState(false);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [msg, setMsg] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async (propertyId: string | null) => {
    setLoading(true);
    setMsg(null);
    setError(null);
    const qs = propertyId ? `?propertyId=${propertyId}` : "";
    const res = await fetch(`/api/checklists${qs}`);
    const data = await res.json();
    setSections(
      (data.checklist?.sections ?? []).map((s: any) => ({
        title: s.title,
        items: (s.items ?? []).map((i: any) => ({ label: i.label })),
      }))
    );
    setIsOverride(!!data.checklist?.isOverride);
    setProperties(data.properties ?? []);
    setOverridden(data.overriddenPropertyIds ?? []);
    setLoading(false);
  }, []);

  useEffect(() => {
    load(target);
  }, [target, load]);

  // ── mutations on local state ──
  function setSectionTitle(si: number, title: string) {
    setSections((prev) => prev.map((s, i) => (i === si ? { ...s, title } : s)));
  }
  function setItemLabel(si: number, ii: number, label: string) {
    setSections((prev) =>
      prev.map((s, i) =>
        i === si ? { ...s, items: s.items.map((it, j) => (j === ii ? { label } : it)) } : s
      )
    );
  }
  function addItem(si: number) {
    setSections((prev) => prev.map((s, i) => (i === si ? { ...s, items: [...s.items, { label: "" }] } : s)));
  }
  function removeItem(si: number, ii: number) {
    setSections((prev) => prev.map((s, i) => (i === si ? { ...s, items: s.items.filter((_, j) => j !== ii) } : s)));
  }
  function addSection() {
    setSections((prev) => [...prev, { title: "New room", items: [{ label: "" }] }]);
  }
  function removeSection(si: number) {
    setSections((prev) => prev.filter((_, i) => i !== si));
  }
  function moveSection(si: number, dir: -1 | 1) {
    setSections((prev) => {
      const next = [...prev];
      const j = si + dir;
      if (j < 0 || j >= next.length) return prev;
      [next[si], next[j]] = [next[j], next[si]];
      return next;
    });
  }

  async function save() {
    setSaving(true);
    setMsg(null);
    setError(null);
    const clean = sections
      .map((s) => ({ title: s.title.trim(), items: s.items.filter((i) => i.label.trim()) }))
      .filter((s) => s.title && s.items.length);
    if (!clean.length) {
      setError("Add at least one room with items.");
      setSaving(false);
      return;
    }
    try {
      const res = await fetch("/api/checklists", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ propertyId: target, sections: clean }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Save failed");
      setMsg(target ? "Saved this property's checklist." : "Saved the default checklist.");
      await load(target);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Save failed");
    } finally {
      setSaving(false);
    }
  }

  async function resetOverride() {
    if (!target) return;
    if (!confirm("Remove this property's custom checklist and use the account default?")) return;
    setSaving(true);
    try {
      await fetch(`/api/checklists?propertyId=${target}`, { method: "DELETE" });
      setMsg("Reverted to the account default.");
      await load(target);
    } finally {
      setSaving(false);
    }
  }

  const totalItems = sections.reduce((n, s) => n + s.items.filter((i) => i.label.trim()).length, 0);

  return (
    <div className="space-y-5">
      {/* Target selector */}
      <div className="card p-4">
        <label className="block text-sm font-medium text-gray-700 mb-1.5">Editing checklist for</label>
        <select
          value={target ?? ""}
          onChange={(e) => setTarget(e.target.value || null)}
          className="w-full sm:w-96 rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none"
        >
          <option value="">⭐ Account default (all properties)</option>
          {properties.map((p) => (
            <option key={p.id} value={p.id}>
              {p.name}{overridden.includes(p.id) ? " — custom" : ""}
            </option>
          ))}
        </select>
        <p className="mt-2 text-xs text-gray-500">
          {target == null
            ? "This is the default checklist used for every property that doesn't have its own."
            : isOverride
            ? "This property has a custom checklist. Edits here only affect this property."
            : "This property currently uses the account default. Saving here creates a custom checklist just for it."}
        </p>
      </div>

      {loading ? (
        <div className="card p-10 text-center text-gray-400">
          <Loader2 className="mx-auto h-6 w-6 animate-spin" />
        </div>
      ) : (
        <>
          <div className="flex items-center justify-between">
            <p className="text-sm text-gray-500 flex items-center gap-1.5">
              <ListChecks className="h-4 w-4 text-brand-600" />
              {sections.length} rooms · {totalItems} items
            </p>
            {target && isOverride && (
              <button onClick={resetOverride} disabled={saving}
                className="inline-flex items-center gap-1.5 text-xs text-gray-500 hover:text-red-600">
                <RotateCcw className="h-3.5 w-3.5" /> Reset to default
              </button>
            )}
          </div>

          {sections.map((section, si) => (
            <div key={si} className="card p-4 space-y-3">
              <div className="flex items-center gap-2">
                <GripVertical className="h-4 w-4 text-gray-300 shrink-0" />
                <input
                  value={section.title}
                  onChange={(e) => setSectionTitle(si, e.target.value)}
                  placeholder="Room name"
                  className="flex-1 font-semibold text-gray-900 rounded-lg border border-transparent hover:border-gray-200 focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none px-2 py-1"
                />
                <button onClick={() => moveSection(si, -1)} disabled={si === 0}
                  className="p-1 text-gray-300 hover:text-gray-600 disabled:opacity-30" title="Move up">
                  <ArrowUp className="h-4 w-4" />
                </button>
                <button onClick={() => moveSection(si, 1)} disabled={si === sections.length - 1}
                  className="p-1 text-gray-300 hover:text-gray-600 disabled:opacity-30" title="Move down">
                  <ArrowDown className="h-4 w-4" />
                </button>
                <button onClick={() => removeSection(si)}
                  className="p-1 text-gray-300 hover:text-red-500" title="Delete room">
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>

              <div className="space-y-1.5 pl-6">
                {section.items.map((item, ii) => (
                  <div key={ii} className="flex items-center gap-2">
                    <span className="h-1.5 w-1.5 rounded-full bg-gray-300 shrink-0" />
                    <input
                      value={item.label}
                      onChange={(e) => setItemLabel(si, ii, e.target.value)}
                      placeholder="Checklist item"
                      className="flex-1 text-sm rounded-lg border border-gray-200 px-3 py-1.5 focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none"
                    />
                    <button onClick={() => removeItem(si, ii)}
                      className="p-1 text-gray-300 hover:text-red-500" title="Remove item">
                      <Trash2 className="h-3.5 w-3.5" />
                    </button>
                  </div>
                ))}
                <button onClick={() => addItem(si)}
                  className="inline-flex items-center gap-1 text-xs text-brand-600 hover:text-brand-700 pl-3.5 pt-1">
                  <Plus className="h-3.5 w-3.5" /> Add item
                </button>
              </div>
            </div>
          ))}

          <button onClick={addSection}
            className="w-full rounded-xl border-2 border-dashed border-gray-200 py-3 text-sm font-medium text-gray-500 hover:border-brand-300 hover:text-brand-600 transition inline-flex items-center justify-center gap-1.5">
            <Plus className="h-4 w-4" /> Add room
          </button>

          {error && <p className="text-sm text-red-600">{error}</p>}
          {msg && <p className="text-sm text-green-700 flex items-center gap-1.5"><Check className="h-4 w-4" />{msg}</p>}

          <div className="sticky bottom-0 bg-gradient-to-t from-white via-white to-transparent pt-3">
            <button onClick={save} disabled={saving}
              className="btn-primary text-sm inline-flex items-center gap-1.5">
              {saving ? <Loader2 className="h-4 w-4 animate-spin" /> : <Check className="h-4 w-4" />}
              {target ? "Save property checklist" : "Save default checklist"}
            </button>
          </div>
        </>
      )}
    </div>
  );
}
