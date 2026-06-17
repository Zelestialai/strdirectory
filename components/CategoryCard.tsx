import Link from "next/link";
import {
  Sparkles, Camera, Wrench, Building2,
  Home, Palette, HardHat, Calculator,
  ShieldCheck, Sofa, Wifi, Scale,
} from "lucide-react";
import type { Category } from "@/types";
import { cn, COLOR_CLASSES } from "@/lib/utils";

const ICON_MAP: Record<string, React.FC<{ className?: string }>> = {
  Sparkles, Camera, Wrench, Building2,
  Home, Palette, HardHat, Calculator,
  ShieldCheck, Sofa, Wifi, Scale,
};

export function CategoryCard({ category }: { category: Category }) {
  const cls = COLOR_CLASSES[category.color ?? "sky"] ?? COLOR_CLASSES.sky;
  const Icon = ICON_MAP[category.icon ?? ""] ?? Building2;

  return (
    <Link
      href={`/vendors?category=${category.slug}`}
      className={cn(
        "card flex flex-col items-center gap-3 p-6 text-center border",
        cls.bg, cls.border,
        "hover:shadow-lg transition"
      )}
    >
      <span className={cn("flex h-12 w-12 items-center justify-center rounded-xl", cls.bg, cls.text)}>
        <Icon className="h-6 w-6" />
      </span>
      <div>
        <p className={cn("font-semibold", cls.text)}>{category.name}</p>
        {category.description && (
          <p className="mt-1 text-xs text-gray-500 leading-snug">{category.description}</p>
        )}
      </div>
    </Link>
  );
}
