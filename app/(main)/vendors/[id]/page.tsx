import { notFound } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { StarRating } from "@/components/StarRating";
import { ReviewCard } from "@/components/ReviewCard";
import { VendorContactButton } from "@/components/VendorContactButton";
import { MapPin, Globe, Phone, Mail, CheckCircle2, Shield, Star, MessageSquare } from "lucide-react";
import type { Vendor, Review } from "@/types";
import { cn, COLOR_CLASSES, CATEGORY_COLORS } from "@/lib/utils";

export async function generateMetadata({ params }: { params: { id: string } }) {
  const supabase = createClient();
  const { data } = await supabase.from("vendors").select("business_name, tagline").eq("slug", params.id).single();
  if (!data) return {};
  return { title: data.business_name, description: data.tagline };
}

export default async function VendorProfilePage({ params }: { params: { id: string } }) {
  const supabase = createClient();

  const { data: vendor } = await supabase
    .from("vendors")
    .select("*, category:categories(*), services:vendor_services(*), profiles(*)")
    .eq("slug", params.id)
    .eq("is_active", true)
    .single();

  if (!vendor) notFound();
  const v = vendor as Vendor;

  const { data: reviews } = await supabase
    .from("reviews")
    .select("*, profiles(*)")
    .eq("vendor_id", v.id)
    .order("created_at", { ascending: false })
    .limit(20);

  const { data: { user } } = await supabase.auth.getUser();
  const hasReviewed = reviews?.some((r: Review) => r.reviewer_id === user?.id);

  const color = v.category?.color ?? CATEGORY_COLORS[v.category?.slug ?? ""] ?? "sky";
  const cls = COLOR_CLASSES[color] ?? COLOR_CLASSES.sky;

  return (
    <div>
      {/* Cover */}
      <div className={cn("relative h-56 sm:h-72 w-full", v.cover_url ? "" : cls.bg)}>
        {v.cover_url && (
          <Image src={v.cover_url} alt="" fill className="object-cover" priority />
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent" />
      </div>

      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
        {/* Header card */}
        <div className="relative -mt-16 mb-8 rounded-2xl bg-white shadow-lg border p-6 flex flex-col sm:flex-row gap-5 items-start">
          {/* Logo */}
          <div className={cn("h-20 w-20 shrink-0 rounded-xl border-2 border-white shadow overflow-hidden", cls.bg)}>
            {v.logo_url ? (
              <Image src={v.logo_url} alt={v.business_name} width={80} height={80} className="object-cover h-full w-full" />
            ) : (
              <div className={cn("h-full w-full flex items-center justify-center text-3xl font-bold", cls.text)}>
                {v.business_name[0]}
              </div>
            )}
          </div>

          <div className="flex-1 min-w-0">
            <div className="flex flex-wrap items-center gap-2">
              <h1 className="text-2xl font-bold text-gray-900">{v.business_name}</h1>
              {v.is_verified && (
                <span className="flex items-center gap-1 text-xs font-medium text-brand-700 bg-brand-50 border border-brand-200 px-2 py-0.5 rounded-full">
                  <Shield className="h-3 w-3" /> Verified
                </span>
              )}
              {v.is_featured && (
                <span className="text-xs font-semibold bg-amber-100 text-amber-700 border border-amber-200 px-2 py-0.5 rounded-full">
                  Featured
                </span>
              )}
            </div>

            {v.category && (
              <span className={cn("mt-1 inline-block text-xs font-medium px-2.5 py-0.5 rounded-full border", cls.bg, cls.text, cls.border)}>
                {v.category.name}
              </span>
            )}

            {v.tagline && <p className="mt-2 text-gray-600">{v.tagline}</p>}

            <div className="mt-3 flex flex-wrap items-center gap-4 text-sm text-gray-500">
              {v.city && (
                <span className="flex items-center gap-1">
                  <MapPin className="h-4 w-4" /> {v.city}{v.state ? `, ${v.state}` : ""}
                </span>
              )}
              {v.avg_rating > 0 && (
                <span className="flex items-center gap-1.5">
                  <StarRating rating={v.avg_rating} size="sm" />
                  <span className="font-medium text-gray-800">{v.avg_rating.toFixed(1)}</span>
                  <span className="text-gray-400">({v.review_count} review{v.review_count !== 1 ? "s" : ""})</span>
                </span>
              )}
            </div>
          </div>

          <div className="flex flex-col gap-2 shrink-0">
            {v.is_claimed ? (
              /* Registered vendor — in-app messaging */
              <VendorContactButton vendor={v} />
            ) : (
              /* Unclaimed / seed vendor — direct contact only */
              <>
                {v.email && (
                  <a href={`mailto:${v.email}`} className="btn-primary justify-center">
                    <Mail className="h-4 w-4" /> Send Email
                  </a>
                )}
              </>
            )}
            {v.phone && (
              <a href={`tel:${v.phone}`} className="btn-secondary justify-center">
                <Phone className="h-4 w-4" /> Call
              </a>
            )}
          </div>
        </div>

        <div className="grid grid-cols-1 gap-8 lg:grid-cols-3">
          {/* Main content */}
          <div className="lg:col-span-2 space-y-8">
            {/* About */}
            {v.description && (
              <section>
                <h2 className="text-lg font-semibold text-gray-900 mb-3">About</h2>
                <div className="prose prose-sm max-w-none text-gray-600 whitespace-pre-line">
                  {v.description}
                </div>
              </section>
            )}

            {/* Services */}
            {v.services && v.services.length > 0 && (
              <section>
                <h2 className="text-lg font-semibold text-gray-900 mb-3">Services Offered</h2>
                <ul className="flex flex-wrap gap-2">
                  {v.services.map((s) => (
                    <li key={s.id} className="flex items-center gap-1.5 rounded-full border px-3 py-1 text-sm text-gray-700 bg-gray-50">
                      <CheckCircle2 className="h-3.5 w-3.5 text-green-500" /> {s.name}
                    </li>
                  ))}
                </ul>
              </section>
            )}

            {/* Reviews */}
            <section>
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-lg font-semibold text-gray-900">
                  Reviews {v.review_count > 0 && <span className="text-gray-400 font-normal text-base">({v.review_count})</span>}
                </h2>
                {user && !hasReviewed && (
                  <Link href={`/vendors/${v.slug}/review`} className="btn-secondary text-xs">
                    <Star className="h-3.5 w-3.5" /> Write a Review
                  </Link>
                )}
              </div>

              {reviews && reviews.length > 0 ? (
                <div className="space-y-4">
                  {(reviews as Review[]).map((r) => <ReviewCard key={r.id} review={r} />)}
                </div>
              ) : (
                <p className="text-sm text-gray-400 rounded-xl border p-6 text-center">
                  No reviews yet. Be the first to leave one!
                </p>
              )}
            </section>
          </div>

          {/* Sidebar */}
          <aside className="space-y-5">
            {/* Contact card */}
            <div className="rounded-xl border bg-white p-5 space-y-3">
              <h3 className="font-semibold text-gray-800">Contact Info</h3>
              {v.email && (
                <a href={`mailto:${v.email}`} className="flex items-center gap-2 text-sm text-gray-600 hover:text-brand-700">
                  <Mail className="h-4 w-4 shrink-0" /> {v.email}
                </a>
              )}
              {v.phone && (
                <a href={`tel:${v.phone}`} className="flex items-center gap-2 text-sm text-gray-600 hover:text-brand-700">
                  <Phone className="h-4 w-4 shrink-0" /> {v.phone}
                </a>
              )}
              {v.website && (
                <a href={v.website} target="_blank" rel="noopener noreferrer" className="flex items-center gap-2 text-sm text-gray-600 hover:text-brand-700">
                  <Globe className="h-4 w-4 shrink-0" /> Website
                </a>
              )}
              {v.city && (
                <span className="flex items-center gap-2 text-sm text-gray-600">
                  <MapPin className="h-4 w-4 shrink-0" />
                  {[v.city, v.state, v.zip].filter(Boolean).join(", ")}
                </span>
              )}
              {v.service_radius && (
                <p className="text-xs text-gray-400">Services within {v.service_radius} miles</p>
              )}
            </div>

            {/* Rating summary */}
            {v.avg_rating > 0 && (
              <div className="rounded-xl border bg-white p-5">
                <h3 className="font-semibold text-gray-800 mb-3">Rating</h3>
                <div className="flex items-center gap-3">
                  <span className="text-4xl font-bold text-gray-900">{v.avg_rating.toFixed(1)}</span>
                  <div>
                    <StarRating rating={v.avg_rating} size="md" />
                    <p className="text-xs text-gray-400 mt-1">{v.review_count} review{v.review_count !== 1 ? "s" : ""}</p>
                  </div>
                </div>
              </div>
            )}
          </aside>
        </div>
      </div>
    </div>
  );
}
