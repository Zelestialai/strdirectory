import Link from "next/link";
import { MapPin } from "lucide-react";
import type { Market } from "@/types";

interface MarketCardProps {
  market: Market;
  vendorCount?: number;
}

export function MarketCard({ market, vendorCount }: MarketCardProps) {
  const visibleCities = market.cities.slice(0, 4);
  const overflow = market.cities.length - visibleCities.length;

  return (
    <Link
      href={`/markets/${market.slug}`}
      className="card group flex flex-col gap-3 p-5 hover:shadow-md transition-shadow"
    >
      {/* Header */}
      <div className="flex items-start justify-between gap-2">
        <div className="flex items-center gap-2">
          <span className="flex h-9 w-9 items-center justify-center rounded-lg bg-brand-50 text-brand-600 group-hover:bg-brand-100 transition-colors shrink-0">
            <MapPin className="h-4 w-4" />
          </span>
          <div>
            <h3 className="font-semibold text-gray-900 group-hover:text-brand-700 transition-colors leading-tight">
              {market.name}
            </h3>
            <span className="text-xs text-gray-400 font-medium">{market.state}</span>
          </div>
        </div>
        {vendorCount !== undefined && (
          <span className="shrink-0 rounded-full bg-gray-100 px-2.5 py-0.5 text-xs font-medium text-gray-500">
            {vendorCount} vendors
          </span>
        )}
      </div>

      {/* Tagline */}
      {market.tagline && (
        <p className="text-sm text-gray-500 leading-snug line-clamp-2">{market.tagline}</p>
      )}

      {/* City chips */}
      <div className="flex flex-wrap gap-1.5 mt-auto pt-1">
        {visibleCities.map((city) => (
          <span
            key={city}
            className="rounded-md bg-gray-50 border border-gray-200 px-2 py-0.5 text-xs text-gray-600"
          >
            {city}
          </span>
        ))}
        {overflow > 0 && (
          <span className="rounded-md bg-gray-50 border border-gray-200 px-2 py-0.5 text-xs text-gray-400">
            +{overflow} more
          </span>
        )}
      </div>
    </Link>
  );
}
