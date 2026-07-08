"use client";
import { useRef, useState } from "react";
import Image from "next/image";
import { Upload, X, Loader2, ImagePlus, Camera } from "lucide-react";
import { createClient } from "@/lib/supabase/client";

const BUCKET = "vendor-images";
const MAX_SIZE = 5 * 1024 * 1024; // 5 MB
const ACCEPT = "image/jpeg,image/png,image/webp,image/gif";

// ── Helpers ───────────────────────────────────────────────────────────────────
function ext(file: File) {
  return file.name.split(".").pop()?.toLowerCase() ?? "jpg";
}

// ── Logo uploader ─────────────────────────────────────────────────────────────
export function LogoUploader({
  vendorId,
  initialUrl,
  onUploaded,
}: {
  vendorId: string;
  initialUrl: string | null;
  onUploaded: (url: string) => void;
}) {
  const supabase = createClient();
  const ref = useRef<HTMLInputElement>(null);
  const [preview, setPreview] = useState<string | null>(initialUrl);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState("");

  const handleFile = async (file: File) => {
    setError("");
    if (!file.type.startsWith("image/")) { setError("Please select an image file."); return; }
    if (file.size > MAX_SIZE) { setError("Image must be under 5 MB."); return; }

    setUploading(true);
    // Local preview immediately
    const objectUrl = URL.createObjectURL(file);
    setPreview(objectUrl);

    const path = `${vendorId}/logo.${ext(file)}`;
    const { error: uploadErr } = await supabase.storage
      .from(BUCKET)
      .upload(path, file, { upsert: true, contentType: file.type });

    if (uploadErr) {
      setError(uploadErr.message);
      setPreview(initialUrl);
      setUploading(false);
      return;
    }

    const { data } = supabase.storage.from(BUCKET).getPublicUrl(path);
    const publicUrl = `${data.publicUrl}?t=${Date.now()}`; // bust cache

    // Persist URL to vendor row
    await supabase.from("vendors").update({ logo_url: data.publicUrl }).eq("id", vendorId);

    setPreview(publicUrl);
    onUploaded(data.publicUrl);
    setUploading(false);
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    const file = e.dataTransfer.files[0];
    if (file) handleFile(file);
  };

  return (
    <div className="space-y-2">
      <p className="text-sm font-medium text-gray-700">Business Logo</p>
      <div
        className="relative h-28 w-28 rounded-xl border-2 border-dashed border-gray-300 hover:border-brand-400 cursor-pointer transition-colors overflow-hidden bg-gray-50 group"
        onClick={() => ref.current?.click()}
        onDrop={handleDrop}
        onDragOver={(e) => e.preventDefault()}
      >
        {preview ? (
          <>
            <Image src={preview} alt="Logo" fill className="object-contain p-2" />
            <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
              <Camera className="h-6 w-6 text-white" />
            </div>
          </>
        ) : (
          <div className="h-full w-full flex flex-col items-center justify-center gap-1 text-gray-400 group-hover:text-brand-500 transition-colors">
            <Upload className="h-6 w-6" />
            <span className="text-xs">Upload logo</span>
          </div>
        )}
        {uploading && (
          <div className="absolute inset-0 bg-white/80 flex items-center justify-center">
            <Loader2 className="h-5 w-5 animate-spin text-brand-600" />
          </div>
        )}
        <input
          ref={ref}
          type="file"
          accept={ACCEPT}
          className="hidden"
          onChange={(e) => { const f = e.target.files?.[0]; if (f) handleFile(f); }}
        />
      </div>
      <p className="text-xs text-gray-400">JPG, PNG, WebP · max 5 MB</p>
      {error && <p className="text-xs text-red-500">{error}</p>}
    </div>
  );
}

// ── Gallery uploader ──────────────────────────────────────────────────────────
export interface GalleryPhoto {
  id: string;
  url: string;
  storage_path: string;
  sort_order: number;
}

const MAX_GALLERY = 8;

export function GalleryUploader({
  vendorId,
  initialPhotos,
}: {
  vendorId: string;
  initialPhotos: GalleryPhoto[];
}) {
  const supabase = createClient();
  const ref = useRef<HTMLInputElement>(null);
  const [photos, setPhotos] = useState<GalleryPhoto[]>(initialPhotos);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState("");

  const handleFiles = async (files: FileList) => {
    setError("");
    const remaining = MAX_GALLERY - photos.length;
    if (remaining <= 0) { setError(`Maximum ${MAX_GALLERY} photos allowed.`); return; }

    const toUpload = Array.from(files).slice(0, remaining);
    const invalid = toUpload.find((f) => !f.type.startsWith("image/") || f.size > MAX_SIZE);
    if (invalid) { setError("All files must be images under 5 MB."); return; }

    setUploading(true);

    const results: GalleryPhoto[] = [];
    for (let i = 0; i < toUpload.length; i++) {
      const file = toUpload[i];
      const path = `${vendorId}/gallery/${Date.now()}-${i}.${ext(file)}`;

      const { error: uploadErr } = await supabase.storage
        .from(BUCKET)
        .upload(path, file, { contentType: file.type });

      if (uploadErr) { setError(uploadErr.message); continue; }

      const { data } = supabase.storage.from(BUCKET).getPublicUrl(path);

      const { data: row } = await supabase
        .from("vendor_photos")
        .insert({ vendor_id: vendorId, url: data.publicUrl, storage_path: path, sort_order: photos.length + results.length })
        .select("id, url, storage_path, sort_order")
        .single();

      if (row) results.push(row);
    }

    setPhotos((prev) => [...prev, ...results]);
    setUploading(false);
  };

  const deletePhoto = async (photo: GalleryPhoto) => {
    await Promise.all([
      supabase.storage.from(BUCKET).remove([photo.storage_path]),
      supabase.from("vendor_photos").delete().eq("id", photo.id),
    ]);
    setPhotos((prev) => prev.filter((p) => p.id !== photo.id));
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    if (e.dataTransfer.files.length) handleFiles(e.dataTransfer.files);
  };

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <p className="text-sm font-medium text-gray-700">Photo Gallery</p>
        <span className="text-xs text-gray-400">{photos.length}/{MAX_GALLERY} photos</span>
      </div>

      <div className="grid grid-cols-4 gap-2">
        {photos.map((photo) => (
          <div key={photo.id} className="relative aspect-square rounded-lg overflow-hidden bg-gray-100 group">
            <Image src={photo.url} alt="" fill className="object-cover" />
            <button
              type="button"
              onClick={() => deletePhoto(photo)}
              className="absolute top-1 right-1 h-5 w-5 rounded-full bg-black/60 text-white flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity hover:bg-red-500"
            >
              <X className="h-3 w-3" />
            </button>
          </div>
        ))}

        {photos.length < MAX_GALLERY && (
          <div
            className="aspect-square rounded-lg border-2 border-dashed border-gray-300 hover:border-brand-400 cursor-pointer transition-colors flex flex-col items-center justify-center gap-1 text-gray-400 hover:text-brand-500 bg-gray-50"
            onClick={() => ref.current?.click()}
            onDrop={handleDrop}
            onDragOver={(e) => e.preventDefault()}
          >
            {uploading ? (
              <Loader2 className="h-5 w-5 animate-spin text-brand-600" />
            ) : (
              <>
                <ImagePlus className="h-5 w-5" />
                <span className="text-xs">Add photo</span>
              </>
            )}
          </div>
        )}
      </div>

      <p className="text-xs text-gray-400">JPG, PNG, WebP · max 5 MB each · up to {MAX_GALLERY} photos</p>
      {error && <p className="text-xs text-red-500">{error}</p>}

      <input
        ref={ref}
        type="file"
        accept={ACCEPT}
        multiple
        className="hidden"
        onChange={(e) => { if (e.target.files?.length) handleFiles(e.target.files); }}
      />
    </div>
  );
}
