"use client";
import { useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import { Bookmark } from "lucide-react";
import { createClient } from "@/lib/supabase/client";

interface Props {
  vendorId: string;
  isSaved: boolean;
  className?: string;
}

export function SaveVendorButton({ vendorId, isSaved: initialSaved, className }: Props) {
  const [saved, setSaved] = useState(initialSaved);
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const pathname = usePathname();
  const supabase = createClient();

  const toggle = async () => {
    // Check auth first
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      router.push(`/login?next=${encodeURIComponent(pathname)}`);
      return;
    }

    setLoading(true);
    try {
      if (saved) {
        await fetch("/api/saved-vendors", {
          method: "DELETE",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ vendor_id: vendorId }),
        });
        setSaved(false);
      } else {
        const res = await fetch("/api/saved-vendors", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ vendor_id: vendorId }),
        });
        if (res.ok) setSaved(true);
      }
      router.refresh();
    } finally {
      setLoading(false);
    }
  };

  return (
    <button
      onClick={toggle}
      disabled={loading}
      title={saved ? "Remove from saved" : "Save vendor"}
      className={`flex items-center justify-center rounded-full p-2 transition-all ${
        saved
          ? "bg-brand-100 text-brand-600 hover:bg-red-50 hover:text-red-500"
          : "bg-gray-100 text-gray-400 hover:bg-brand-100 hover:text-brand-600"
      } ${loading ? "opacity-50 cursor-not-allowed" : ""} ${className ?? ""}`}
    >
      <Bookmark className={`h-4 w-4 ${saved ? "fill-current" : ""}`} />
    </button>
  );
}
