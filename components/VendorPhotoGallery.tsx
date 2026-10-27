"use client";

import { useState, useCallback, useEffect } from "react";
import Image from "next/image";
import { X, ChevronLeft, ChevronRight } from "lucide-react";

interface Photo {
  id: string;
  url: string;
  sort_order: number;
}

export function VendorPhotoGallery({ photos }: { photos: Photo[] }) {
  const ordered = [...photos].sort((a, b) => a.sort_order - b.sort_order);
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  const close = useCallback(() => setOpenIndex(null), []);
  const prev = useCallback(
    () => setOpenIndex((i) => (i === null ? i : (i - 1 + ordered.length) % ordered.length)),
    [ordered.length]
  );
  const next = useCallback(
    () => setOpenIndex((i) => (i === null ? i : (i + 1) % ordered.length)),
    [ordered.length]
  );

  useEffect(() => {
    if (openIndex === null) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") close();
      else if (e.key === "ArrowLeft") prev();
      else if (e.key === "ArrowRight") next();
    };
    window.addEventListener("keydown", onKey);
    document.body.style.overflow = "hidden";
    return () => {
      window.removeEventListener("keydown", onKey);
      document.body.style.overflow = "";
    };
  }, [openIndex, close, prev, next]);

  if (ordered.length === 0) return null;

  return (
    <>
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {ordered.map((photo, i) => (
          <button
            key={photo.id}
            type="button"
            onClick={() => setOpenIndex(i)}
            className="group relative aspect-video rounded-xl overflow-hidden bg-gray-100 focus:outline-none focus:ring-2 focus:ring-brand-500"
            aria-label="View photo"
          >
            <Image
              src={photo.url}
              alt=""
              fill
              className="object-cover group-hover:scale-105 transition-transform duration-300"
              sizes="(max-width: 640px) 50vw, 33vw"
            />
          </button>
        ))}
      </div>

      {openIndex !== null && (
        <div
          className="fixed inset-0 z-[100] flex items-center justify-center bg-black/90 p-4"
          onClick={close}
          role="dialog"
          aria-modal="true"
        >
          <button
            type="button"
            onClick={close}
            className="absolute top-4 right-4 rounded-full bg-white/10 p-2 text-white hover:bg-white/20 transition"
            aria-label="Close"
          >
            <X className="h-6 w-6" />
          </button>

          {ordered.length > 1 && (
            <>
              <button
                type="button"
                onClick={(e) => { e.stopPropagation(); prev(); }}
                className="absolute left-2 sm:left-4 rounded-full bg-white/10 p-2 text-white hover:bg-white/20 transition"
                aria-label="Previous photo"
              >
                <ChevronLeft className="h-7 w-7" />
              </button>
              <button
                type="button"
                onClick={(e) => { e.stopPropagation(); next(); }}
                className="absolute right-2 sm:right-4 rounded-full bg-white/10 p-2 text-white hover:bg-white/20 transition"
                aria-label="Next photo"
              >
                <ChevronRight className="h-7 w-7" />
              </button>
            </>
          )}

          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={ordered[openIndex].url}
            alt=""
            onClick={(e) => e.stopPropagation()}
            className="max-h-[90vh] max-w-[90vw] rounded-lg object-contain shadow-2xl"
          />

          {ordered.length > 1 && (
            <div className="absolute bottom-4 left-1/2 -translate-x-1/2 rounded-full bg-black/50 px-3 py-1 text-xs text-white">
              {openIndex + 1} / {ordered.length}
            </div>
          )}
        </div>
      )}
    </>
  );
}
