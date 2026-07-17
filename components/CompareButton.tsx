"use client";
import { useCompare } from "@/components/CompareContext";
import { GitCompare } from "lucide-react";
import { cn } from "@/lib/utils";

interface CompareButtonProps {
  vendor: {
    id: string;
    slug: string;
    business_name: string;
    logo_url: string | null;
  };
  className?: string;
}

export function CompareButton({ vendor, className }: CompareButtonProps) {
  const { toggle, has, full } = useCompare();
  const selected = has(vendor.id);

  return (
    <button
      onClick={(e) => {
        e.preventDefault();
        e.stopPropagation();
        toggle({ id: vendor.id, slug: vendor.slug, name: vendor.business_name, logo_url: vendor.logo_url });
      }}
      disabled={!selected && full}
      title={full && !selected ? "Remove a vendor to add another" : selected ? "Remove from comparison" : "Add to comparison"}
      className={cn(
        "flex items-center gap-1 rounded-full px-2.5 py-1 text-xs font-medium border transition-colors",
        selected
          ? "bg-brand-600 text-white border-brand-600"
          : "bg-white text-gray-500 border-gray-200 hover:border-brand-400 hover:text-brand-600",
        full && !selected && "opacity-40 cursor-not-allowed",
        className
      )}
    >
      <GitCompare className="h-3 w-3" />
      {selected ? "Added" : "Compare"}
    </button>
  );
}
