"use client";
import { useCompare } from "@/components/CompareContext";
import { useRouter } from "next/navigation";
import Image from "next/image";
import { X, GitCompare } from "lucide-react";

export function CompareBar() {
  const { items, toggle, clear } = useCompare();
  const router = useRouter();

  if (items.length === 0) return null;

  const handleCompare = () => {
    const slugs = items.map(i => i.slug).join(",");
    router.push(`/compare?vendors=${slugs}`);
  };

  return (
    <div className="fixed bottom-0 left-0 right-0 z-50 bg-white border-t border-gray-200 shadow-2xl">
      <div className="mx-auto max-w-5xl px-4 py-3 flex items-center gap-4">
        <div className="flex items-center gap-2 flex-1">
          <GitCompare className="h-4 w-4 text-brand-600 shrink-0" />
          <span className="text-sm font-medium text-gray-700">
            Compare ({items.length}/3)
          </span>
          <div className="flex gap-2 ml-2">
            {items.map(v => (
              <div key={v.id} className="flex items-center gap-1.5 bg-brand-50 border border-brand-200 rounded-full pl-1 pr-2 py-0.5">
                <div className="h-6 w-6 rounded-full overflow-hidden bg-white border border-brand-200 shrink-0">
                  {v.logo_url ? (
                    <Image src={v.logo_url} alt={v.name} width={24} height={24} className="object-contain" />
                  ) : (
                    <div className="h-full w-full bg-brand-100 flex items-center justify-center text-xs font-bold text-brand-600">
                      {v.name[0]}
                    </div>
                  )}
                </div>
                <span className="text-xs font-medium text-brand-700 max-w-[80px] truncate">{v.name}</span>
                <button onClick={() => toggle(v)} className="text-brand-400 hover:text-brand-600 ml-0.5">
                  <X className="h-3 w-3" />
                </button>
              </div>
            ))}
            {/* Empty slots */}
            {Array.from({ length: 3 - items.length }).map((_, i) => (
              <div key={i} className="h-7 w-20 rounded-full border border-dashed border-gray-300 bg-gray-50" />
            ))}
          </div>
        </div>
        <div className="flex items-center gap-2 shrink-0">
          <button onClick={clear} className="text-xs text-gray-500 hover:text-gray-700">
            Clear
          </button>
          <button
            onClick={handleCompare}
            disabled={items.length < 2}
            className="btn-primary text-sm px-4 py-2 disabled:opacity-40 disabled:cursor-not-allowed"
          >
            Compare {items.length >= 2 ? `${items.length} Vendors` : "(need 2+)"}
          </button>
        </div>
      </div>
    </div>
  );
}
