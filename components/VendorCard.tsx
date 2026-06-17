"use client";
import Link from "next/link";
import Image from "next/image";
import { MapPin, Star, CheckCircle2, Mail, Phone } from "lucide-react";
import type { Vendor } from "@/types";
import { truncate, COLOR_CLASSES, CATEGORY_COLORS, CATEGORY_COVERS } from "@/lib/utils";
import { cn } from "@/lib/utils";
import { VendorContactButton } from "./VendorContactButton";

interface VendorCardProps {
  vendor: Vendor;
}

export function VendorCard({ vendor }: VendorCardProps) {
  const color = vendor.category?.color ?? CATEGORY_COLORS[vendor.category?.slug ?? ""] ?? "sky";
  const cls = COLOR_CLASSES[color] ?? COLOR_CLASSES.sky;
  const coverSrc = vendor.cover_url ?? CATEGORY_COVERS[vendor.category?.slug ?? ""];
  const hasCustomCover = !!vendor.cover_url;

  return (
    <div className="card flex flex-col group overflow-hidden">
      {/* Clickable body — links to full profile */}
      <Link href={`/vendors/${vendor.slug}`} className="flex flex-col flex-1">
        {/* Cover / logo area */}
        <div className="relative h-40 overflow-hidden rounded-t-xl bg-gray-100">
          {coverSrc ? (
            <Image
              src={coverSrc}
              alt=""
              fill
              className={cn(
                "object-cover group-hover:scale-105 transition duration-300",
                !hasCustomCover && vendor.logo_url && "brightness-75"
              )}
            />
          ) : (
            <div className={cn("h-full w-full", cls.bg)} />
          )}

          {vendor.logo_url && (
            hasCustomCover ? (
              <div className="absolute bottom-3 left-3 h-12 w-12 overflow-hidden rounded-lg border-2 border-white shadow-md bg-white">
                <Image src={vendor.logo_url} alt={vendor.business_name} fill className="object-contain p-1" />
              </div>
            ) : (
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="h-20 w-20 overflow-hidden rounded-xl border-2 border-white shadow-lg bg-white">
                  <Image src={vendor.logo_url} alt={vendor.business_name} fill className="object-contain p-2" />
                </div>
              </div>
            )
          )}

          {vendor.is_featured && (
            <span className="absolute top-2 right-2 rounded-full bg-amber-400 px-2 py-0.5 text-xs font-semibold text-white shadow">
              Featured
            </span>
          )}
        </div>

        {/* Body */}
        <div className="flex flex-col flex-1 p-4 gap-2">
          {vendor.category && (
            <span className={cn("self-start rounded-full px-2.5 py-0.5 text-xs font-medium border", cls.bg, cls.text, cls.border)}>
              {vendor.category.name}
            </span>
          )}

          <div className="flex items-start justify-between gap-2">
            <h3 className="font-semibold text-gray-900 leading-snug group-hover:text-brand-700 transition">
              {vendor.business_name}
              {vendor.is_verified && (
                <CheckCircle2 className="inline ml-1 h-4 w-4 text-brand-500 align-text-bottom" />
              )}
            </h3>
          </div>

          {vendor.tagline && (
            <p className="text-sm text-gray-500 leading-snug">{truncate(vendor.tagline, 80)}</p>
          )}

          <div className="mt-auto pt-3 flex items-center justify-between text-sm text-gray-500">
            {vendor.city && (
              <span className="flex items-center gap-1">
                <MapPin className="h-3.5 w-3.5" />
                {vendor.city}{vendor.state ? `, ${vendor.state}` : ""}
              </span>
            )}
            <span className="flex items-center gap-1 font-medium text-gray-700">
              <Star className="h-3.5 w-3.5 fill-amber-400 text-amber-400" />
              {vendor.avg_rating > 0 ? vendor.avg_rating.toFixed(1) : "New"}
              {vendor.review_count > 0 && (
                <span className="text-gray-400 font-normal">({vendor.review_count})</span>
              )}
            </span>
          </div>
        </div>
      </Link>

      {/* Contact footer — outside the Link so clicks don't navigate */}
      <div className="px-4 pb-4 pt-2 border-t border-gray-100">
        {vendor.is_claimed ? (
          /* Registered vendor → in-app message button */
          <VendorContactButton vendor={vendor} size="sm" />
        ) : (
          /* Seed / unclaimed vendor → direct contact links */
          <div className="flex gap-2">
            {vendor.email && (
              <a
                href={`mailto:${vendor.email}`}
                onClick={(e) => e.stopPropagation()}
                className="btn-secondary flex-1 justify-center text-xs py-1.5"
              >
                <Mail className="h-3.5 w-3.5" /> Email
              </a>
            )}
            {vendor.phone && (
              <a
                href={`tel:${vendor.phone}`}
                onClick={(e) => e.stopPropagation()}
                className="btn-secondary flex-1 justify-center text-xs py-1.5"
              >
                <Phone className="h-3.5 w-3.5" /> Call
              </a>
            )}
            {!vendor.email && !vendor.phone && (
              <Link
                href={`/vendors/${vendor.slug}`}
                className="btn-secondary w-full justify-center text-xs py-1.5"
              >
                View Profile
              </Link>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
