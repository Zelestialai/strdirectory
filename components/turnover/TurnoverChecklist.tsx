"use client";

import { useEffect, useState, useRef, useCallback } from "react";
import { useRouter } from "next/navigation";
import {
  Check,
  Loader2,
  Camera,
  ChevronDown,
  ChevronRight,
  ListChecks,
  X,
} from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import { isNativePlatform, takeNativePhoto } from "@/lib/native";

const BUCKET = "vendor-images";

interface Item {
  id: string;
  section_title: string;
  label: string;
  position: number;
  is_done: boolean;
  photo_url: string | null;
}

export function TurnoverChecklist({ taskId }: { taskId: string }) {
  const router = useRouter();
  const supabase = createClient();
  const fileRef = useRef<HTMLInputElement>(null);
  const [photoFor, setPhotoFor] = useState<string | null>(null);

  const [items, setItems] = useState<Item[]>([]);
  const [canEdit, setCanEdit] = useState(true);
  const [vendorId, setVendorId] = useState<string | null>(null);
  const [loaded, setLoaded] = useState(false);
  const [open, setOpen] = useState(true);
  const [busy, setBusy] = useState<string | null>(null);
  const [completing, setCompleting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    const res = await fetch(`/api/turnovers/${taskId}/checklist`);
    if (res.ok) {
      const data = await res.json();
      setItems(data.items ?? []);
      setCanEdit(!!data.canEdit);
      setVendorId(data.vendorId ?? null);
    }
    setLoaded(true);
  }, [taskId]);

  useEffect(() => {
    load();
  }, [load]);

  const total = items.length;
  const done = items.filter((i) => i.is_done).length;
  const allDone = total > 0 && done === total;

  async function toggle(item: Item) {
    if (!canEdit) return;
    setBusy(item.id);
    setError(null);
    const next = !item.is_done;
    setItems((prev) => prev.map((i) => (i.id === item.id ? { ...i, is_done: next } : i)));
    try {
      await fetch(`/api/turnovers/${taskId}/checklist`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ itemId: item.id, is_done: next }),
      });
    } catch {
      // revert on failure
      setItems((prev) => prev.map((i) => (i.id === item.id ? { ...i, is_done: !next } : i)));
    } finally {
      setBusy(null);
    }
  }

  async function pickPhoto(itemId: string) {
    // On the native app, use the OS camera/library; on web, use the file input.
    if (await isNativePlatform()) {
      const shot = await takeNativePhoto();
      if (shot) { await uploadItemPhoto(itemId, shot.file); return; }
      // fall through to file input if native capture was cancelled/unavailable
    }
    setPhotoFor(itemId);
    fileRef.current?.click();
  }

  async function uploadItemPhoto(itemId: string, file: File) {
    if (!file.type.startsWith("image/")) { setError("Please choose an image."); return; }
    if (file.size > 5 * 1024 * 1024) { setError("Image must be under 5 MB."); return; }
    if (!vendorId) { setError("Only the assigned cleaner can add photos."); return; }
    setBusy(itemId);
    setError(null);
    try {
      const extn = file.name.split(".").pop()?.toLowerCase() || "jpg";
      // Path begins with the cleaner's vendor id to satisfy the storage policy.
      const path = `${vendorId}/turnover-checklists/${taskId}/${itemId}.${extn}`;
      const { error: upErr } = await supabase.storage
        .from(BUCKET)
        .upload(path, file, { upsert: true, contentType: file.type });
      if (upErr) throw new Error(upErr.message);
      const { data } = supabase.storage.from(BUCKET).getPublicUrl(path);
      const url = `${data.publicUrl}?t=${Date.now()}`;
      await fetch(`/api/turnovers/${taskId}/checklist`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ itemId, photo_url: url }),
      });
      setItems((prev) => prev.map((i) => (i.id === itemId ? { ...i, photo_url: url } : i)));
    } catch (err) {
      setError(err instanceof Error ? err.message : "Upload failed");
    } finally {
      setBusy(null);
      setPhotoFor(null);
    }
  }

  async function onFile(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = "";
    if (!file || !photoFor) return;
    await uploadItemPhoto(photoFor, file);
  }

  async function removePhoto(itemId: string) {
    setBusy(itemId);
    try {
      await fetch(`/api/turnovers/${taskId}/checklist`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ itemId, photo_url: null }),
      });
      setItems((prev) => prev.map((i) => (i.id === itemId ? { ...i, photo_url: null } : i)));
    } finally {
      setBusy(null);
    }
  }

  async function markCompleted() {
    setCompleting(true);
    setError(null);
    try {
      const res = await fetch(`/api/turnovers/${taskId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: "completed" }),
      });
      if (!res.ok) {
        const data = await res.json().catch(() => ({}));
        throw new Error(data.error || "Couldn't complete this job");
      }
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Couldn't complete this job");
    } finally {
      setCompleting(false);
    }
  }

  if (!loaded) {
    return <div className="mt-3 h-9 rounded-lg bg-gray-100 animate-pulse" />;
  }

  // No checklist snapshotted (older tasks).
  if (total === 0) {
    if (!canEdit) return null; // host: nothing to show
    return (
      <div className="mt-3">
        <button
          onClick={markCompleted}
          disabled={completing}
          className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-1.5 text-xs font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50"
        >
          {completing ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Check className="h-3.5 w-3.5" />}
          Mark completed
        </button>
        {error && <p className="mt-1 text-xs text-red-600">{error}</p>}
      </div>
    );
  }

  // Group by section, preserving order
  const sections: { title: string; items: Item[] }[] = [];
  for (const it of [...items].sort((a, b) => a.position - b.position)) {
    let sec = sections.find((s) => s.title === it.section_title);
    if (!sec) { sec = { title: it.section_title, items: [] }; sections.push(sec); }
    sec.items.push(it);
  }

  const pct = Math.round((done / total) * 100);

  return (
    <div className="mt-3 rounded-xl border border-gray-100 bg-gray-50/60 overflow-hidden">
      <input ref={fileRef} type="file" accept="image/*" capture="environment" onChange={onFile} className="hidden" />

      {/* Header / progress */}
      <button
        onClick={() => setOpen((o) => !o)}
        className="w-full flex items-center gap-2 px-4 py-3 text-left"
      >
        {open ? <ChevronDown className="h-4 w-4 text-gray-400" /> : <ChevronRight className="h-4 w-4 text-gray-400" />}
        <ListChecks className="h-4 w-4 text-brand-600" />
        <span className="text-sm font-semibold text-gray-800">Cleaning checklist</span>
        <span className={`ml-auto text-xs font-medium ${allDone ? "text-green-700" : "text-gray-500"}`}>
          {done}/{total} done
        </span>
      </button>
      <div className="px-4 -mt-1 pb-2">
        <div className="h-1.5 w-full rounded-full bg-gray-200 overflow-hidden">
          <div
            className={`h-full rounded-full transition-all ${allDone ? "bg-green-500" : "bg-brand-500"}`}
            style={{ width: `${pct}%` }}
          />
        </div>
      </div>

      {open && (
        <div className="px-4 pb-4 space-y-4">
          {sections.map((s) => (
            <div key={s.title}>
              <p className="text-xs font-semibold uppercase tracking-wide text-gray-400 mb-1.5">{s.title}</p>
              <div className="space-y-1">
                {s.items.map((it) => (
                  <div key={it.id} className="flex items-center gap-2.5">
                    <button
                      onClick={() => toggle(it)}
                      disabled={busy === it.id || !canEdit}
                      className={`flex h-5 w-5 shrink-0 items-center justify-center rounded-md border transition ${
                        it.is_done
                          ? "bg-brand-600 border-brand-600 text-white"
                          : "bg-white border-gray-300 hover:border-brand-400"
                      } ${!canEdit ? "cursor-default" : ""}`}
                    >
                      {busy === it.id ? <Loader2 className="h-3 w-3 animate-spin text-gray-400" /> : it.is_done && <Check className="h-3.5 w-3.5" />}
                    </button>
                    <span className={`flex-1 text-sm ${it.is_done ? "text-gray-400 line-through" : "text-gray-700"}`}>
                      {it.label}
                    </span>
                    {it.photo_url ? (
                      <span className="flex items-center gap-1">
                        <a href={it.photo_url} target="_blank" rel="noopener noreferrer" className="shrink-0">
                          {/* eslint-disable-next-line @next/next/no-img-element */}
                          <img src={it.photo_url} alt="" className="h-8 w-8 rounded object-cover border border-gray-200" />
                        </a>
                        {canEdit && (
                          <button onClick={() => removePhoto(it.id)} className="text-gray-300 hover:text-red-500" title="Remove photo">
                            <X className="h-3.5 w-3.5" />
                          </button>
                        )}
                      </span>
                    ) : canEdit ? (
                      <button
                        onClick={() => pickPhoto(it.id)}
                        disabled={busy === it.id}
                        className="shrink-0 p-1 text-gray-400 hover:text-brand-600"
                        title="Add photo"
                      >
                        <Camera className="h-4 w-4" />
                      </button>
                    ) : null}
                  </div>
                ))}
              </div>
            </div>
          ))}

          {error && <p className="text-xs text-red-600">{error}</p>}

          {canEdit && (
            <div className="pt-1">
              <button
                onClick={markCompleted}
                disabled={!allDone || completing}
                className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {completing ? <Loader2 className="h-4 w-4 animate-spin" /> : <Check className="h-4 w-4" />}
                Mark completed
              </button>
              {!allDone && (
                <span className="ml-2 text-xs text-gray-500">
                  Check off all {total} items to finish.
                </span>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
