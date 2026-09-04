"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { takeNativePhoto } from "@/lib/native";
import { Camera, Trash2, ImagePlus, Loader2, X } from "lucide-react";

const BUCKET = "shared-photos";

interface Photo {
  id: string;
  url: string | null;
  caption: string | null;
  uploaderName: string;
  uploaderRole: "host" | "vendor";
  mine: boolean;
  createdAt: string;
}

interface Props {
  propertyId: string;
  /** When set, shows a Job/Album tab switch; otherwise album only. */
  turnoverTaskId?: string;
}

export function SharedPhotos({ propertyId, turnoverTaskId }: Props) {
  const supabase = createClient();
  const fileRef = useRef<HTMLInputElement>(null);

  const [tab, setTab] = useState<"job" | "album">(turnoverTaskId ? "job" : "album");
  const [photos, setPhotos] = useState<Photo[]>([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState("");
  const [lightbox, setLightbox] = useState<string | null>(null);
  const [isHost, setIsHost] = useState(false);

  const scopeQuery = tab === "job" && turnoverTaskId
    ? `turnoverTaskId=${turnoverTaskId}`
    : `propertyId=${propertyId}`;

  const load = useCallback(async () => {
    setLoading(true);
    setError("");
    const res = await fetch(`/api/photos?${scopeQuery}`);
    const json = await res.json();
    setLoading(false);
    if (!res.ok) { setError(json.error || "Could not load photos"); return; }
    setPhotos(json.photos ?? []);
    setIsHost(!!json.isHost);
  }, [scopeQuery]);

  useEffect(() => { load(); }, [load]);

  const uploadFile = async (file: File) => {
    setUploading(true);
    setError("");
    try {
      const extRaw = (file.name.split(".").pop() || file.type.split("/")[1] || "jpg").toLowerCase();
      const ext = extRaw === "jpeg" ? "jpg" : extRaw;

      const scopeBody = tab === "job" && turnoverTaskId
        ? { turnoverTaskId }
        : { propertyId };

      const signRes = await fetch("/api/photos/sign-upload", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...scopeBody, ext }),
      });
      const sign = await signRes.json();
      if (!signRes.ok) throw new Error(sign.error || "Upload not allowed");

      const { error: upErr } = await supabase.storage
        .from(BUCKET)
        .uploadToSignedUrl(sign.path, sign.token, file);
      if (upErr) throw new Error(upErr.message);

      const saveRes = await fetch("/api/photos", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...scopeBody, path: sign.path }),
      });
      const save = await saveRes.json();
      if (!saveRes.ok) throw new Error(save.error || "Could not save photo");

      await load();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Upload failed");
    } finally {
      setUploading(false);
    }
  };

  const addPhoto = async () => {
    // Native camera first (inside the mobile app); fall back to file picker.
    const native = await takeNativePhoto();
    if (native) { await uploadFile(native.file); return; }
    fileRef.current?.click();
  };

  const onFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files ?? []);
    for (const f of files) await uploadFile(f);
    e.target.value = "";
  };

  const remove = async (id: string) => {
    setPhotos((p) => p.filter((x) => x.id !== id));
    await fetch(`/api/photos/${id}`, { method: "DELETE" });
  };

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between gap-3">
        {turnoverTaskId ? (
          <div className="inline-flex rounded-lg border border-gray-200 bg-white p-0.5">
            <button onClick={() => setTab("job")}
              className={`rounded-md px-3 py-1.5 text-sm font-medium transition ${tab === "job" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"}`}>
              This job
            </button>
            <button onClick={() => setTab("album")}
              className={`rounded-md px-3 py-1.5 text-sm font-medium transition ${tab === "album" ? "bg-brand-600 text-white" : "text-gray-600 hover:text-brand-700"}`}>
              Property album
            </button>
          </div>
        ) : (
          <h3 className="font-semibold text-gray-800">Property album</h3>
        )}

        <button onClick={addPhoto} disabled={uploading}
          className="btn-primary text-sm flex items-center gap-1.5 shrink-0">
          {uploading ? <Loader2 className="h-4 w-4 animate-spin" /> : <Camera className="h-4 w-4" />}
          {uploading ? "Uploading…" : "Add photo"}
        </button>
        <input ref={fileRef} type="file" accept="image/*" capture="environment"
          multiple className="hidden" onChange={onFileChange} />
      </div>

      {error && (
        <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700">{error}</div>
      )}

      {tab === "job" && turnoverTaskId && (
        <p className="text-xs text-gray-400">
          Job photos are automatically removed 15 days after upload. Save anything you need to keep,
          or add it to the property album.
        </p>
      )}

      {loading ? (
        <div className="grid grid-cols-3 sm:grid-cols-4 gap-2">
          {Array.from({ length: 4 }).map((_, i) => (
            <div key={i} className="aspect-square rounded-lg bg-gray-100 animate-pulse" />
          ))}
        </div>
      ) : photos.length === 0 ? (
        <div className="rounded-xl border border-dashed border-gray-200 p-8 text-center">
          <ImagePlus className="h-8 w-8 text-gray-300 mx-auto mb-2" />
          <p className="text-sm text-gray-500">No photos yet.</p>
          <p className="text-xs text-gray-400 mt-0.5">
            {tab === "job" ? "Share before / after photos for this turnover." : "Share reference photos for this property."}
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-3 sm:grid-cols-4 gap-2">
          {photos.map((p) => (
            <div key={p.id} className="group relative aspect-square overflow-hidden rounded-lg bg-gray-100">
              {p.url && (
                <img src={p.url} alt={p.caption ?? "Shared photo"}
                  className="h-full w-full object-cover cursor-pointer"
                  onClick={() => setLightbox(p.url)} />
              )}
              <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/60 to-transparent px-2 py-1">
                <span className={`text-[10px] font-medium ${p.uploaderRole === "host" ? "text-white" : "text-amber-200"}`}>
                  {p.uploaderName}
                </span>
              </div>
              {(p.mine || isHost) && (
                <button onClick={() => remove(p.id)}
                  className="absolute top-1 right-1 rounded-md bg-black/50 p-1 text-white opacity-0 transition group-hover:opacity-100"
                  aria-label="Delete photo">
                  <Trash2 className="h-3.5 w-3.5" />
                </button>
              )}
            </div>
          ))}
        </div>
      )}

      {lightbox && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 p-4"
          onClick={() => setLightbox(null)}>
          <button className="absolute top-4 right-4 text-white/80 hover:text-white" aria-label="Close">
            <X className="h-6 w-6" />
          </button>
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src={lightbox} alt="Photo" className="max-h-full max-w-full rounded-lg object-contain" />
        </div>
      )}
    </div>
  );
}
