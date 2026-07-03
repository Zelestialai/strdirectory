import { notFound } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { StarRating } from "@/components/StarRating";
import { ReviewCard } from "@/components/ReviewCard";
import { StarBreakdown } from "@/components/StarBreakdown";
import { VendorContactButton } from "@/components/VendorContactButton";
import { MapPin, Globe, Phone, Mail, CheckCircle2, Shield, Star, Tag, ChevronLeft, ChevronRight } from "lucide-react";
import type { Vendor, Review } from "@/types";
import { cn, COLOR_CLASSES, CATEGORY_COLORS } from "@/lib/utils";
import { SaveVendorButton } from "@/components/SaveVendorButton";

export async function generateMetadata({ params }: { params: { id: string } }) {
  const supabase = createClient();
  const { data } = await supabase.from("vendors").select("business_name, tagline").eq("slug", params.id).single();
  if (!data) return {};
  return { title: data.business_name, description: data.tagline };
}

const REVIEWS_PER_PAGE = 10;

export default async function VendorProfilePage({
  params,
  searchParams,
}: {
  params: { id: string };
  searchParams?: { review_sort?: string; review_page?: string };
}) {
  const supabase = createClient();

  const { data: vendor } = await supabase
    .from("vendors")
    .select("*, category:categories(*), services:vendor_services(*), profiles(*)")
    .eq("slug", params.id)
    .eq("is_active", true)
    .single();

  if (!vendor) notFound();
  const v = vendor as Vendor;

  const reviewSort = searchParams?.review_sort ?? "newest";
  const reviewPage = Math.max(1, parseInt(searchParams?.review_page ?? "1"));
  const reviewFrom = (reviewPage - 1) * REVIEWS_PER_PAGE;

  // Build review query with sort
  let reviewQuery = supabase
    .from("reviews")
    .select("*, profiles(*), review_votes(id, voter_id)", { count: "exact" })
    .eq("vendor_id", v.id);

  switch (reviewSort) {
    case "highest":
      reviewQuery = reviewQuery.order("rating", { ascending: false }).order("created_at", { ascending: false });
      break;
    case "most_helpful":
      // Sort by vote count desc via a subquery workaround — fetch all and sort in JS
      reviewQuery = reviewQuery.order("created_at", { ascending: false });
      break;
    default: // newest
      reviewQuery = reviewQuery.order("created_at", { ascending: false });
  }

  const { data: rawReviews, count: reviewCount } = await reviewQuery.range(reviewFrom, reviewFrom + REVIEWS_PER_PAGE - 1);

  // Attach helpful_count to each review
  let reviews = (rawReviews ?? []).map((r) => ({
    ...r,
    helpful_count: Array.isArray(r.review_votes) ? r.review_votes.length : 0,
  })) as (Review & { review_votes: { id: string; voter_id: string }[] })[];

  if (reviewSort === "most_helpful") {
    reviews = [...reviews].sort((a, b) => b.helpful_count - a.helpful_count);
  }

  const totalReviewPages = Math.ceil((reviewCount ?? 0) / REVIEWS_PER_PAGE);

  const { data: { user } } = await supabase.auth.getUser();
  const hasReviewed = reviews.some((r) => r.reviewer_id === user?.id);

  // Which reviews the current user has voted helpful
  const userVotedIds = new Set(
    reviews.flatMap((r) =>
      r.review_votes
        .filter((v) => v.voter_id === user?.id)
        .map(() => r.id)
    )
  );

  // Star breakdown counts
  const starCounts: Record<number, number> = { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 };
  if (v.review_count > 0) {
    const { data: allRatings } = await supabase
      .from("reviews")
      .select("rating")
      .eq("vendor_id", v.id);
    for (const r of allRatings ?? []) {
      starCounts[r.rating] = (starCounts[r.rating] ?? 0) + 1;
    }
  }

  // Check if host has saved this vendor
  let isSaved = false;
  let hasInquired = false;
  if (user) {
    const [{ data: savedRow }, { data: inquiryRow }] = await Promise.all([
      supabase.from("saved_vendors").select("id").eq("host_id", user.id).eq("vendor_id", v.id).maybeSingle(),
      supabase.from("inquiries").select("id").eq("sender_id", user.id).eq("vendor_id", v.id).limit(1).maybeSingle(),
    ]);
    isSaved = !!savedRow;
    hasInquired = !!inquiryRow;
  }

  // Record a profile view — skip if the viewer is the vendor themselves
  if (!user || user.id !== v.user_id) {
    supabase.from("vendor_views").insert({ vendor_id: v.id }).then(() => {});
  }

  function reviewHref(overrides: Record<string, string | undefined>) {
    const p = new URLSearchParams();
    const merged = { review_sort: reviewSort !== "newest" ? reviewSort : undefined, review_page: reviewPage > 1 ? String(reviewPage) : undefined, ...overrides };
    Object.entries(merged).forEach(([k, val]) => { if (val) p.set(k, val); });
    return `/vendors/${v.slug}${p.toString() ? `?${p.toString()}` : ""}`;
  }

  const color = v.category?.color ?? CATEGORY_COLORS[v.category?.slug ?? ""] ?? "sky";
  const cls = COLOR_CLASSES[color] ?? COLOR_CLASSES.sky;

  // ── LocalBusiness JSON-LD ──────────────────────────────────────────────────
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    name: v.business_name,
    ...(v.description || v.tagline ? { description: v.description ?? v.tagline } : {}),
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? ""}/vendors/${v.slug}`,
    ...(v.phone ? { telephone: v.phone } : {}),
    ...(v.email ? { email: v.email } : {}),
    ...(v.logo_url ? { image: v.logo_url } : {}),
    address: {
      "@type": "PostalAddress",
      ...(v.city ? { addressLocality: v.city } : {}),
      ...(v.state ? { addressRegion: v.state } : {}),
      addressCountry: "US",
    },
    ...(v.avg_rating > 0
      ? {
          aggregateRating: {
            "@type": "AggregateRating",
            ratingValue: v.avg_rating,
            reviewCount: v.review_count,
          },
        }
      : {}),
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <div>
      {/* Cover */}
      <div className={cn("relative h-56 sm:h-72 w-full", v.cover_url ? "" : cls.bg)}>
        {v.cover_url && (
          <Image src={v.cover_url} alt="" fill className="object-cover" priority />
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent" />
      </div>

      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
        {/* Claim this business banner — shown for unclaimed listings */}
        {!v.is_claimed && (
          <div className="mt-4 mb-2 rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
            <div className="flex items-center gap-2.5">
              <Tag className="h-4 w-4 text-amber-600 shrink-0" />
              <p className="text-sm text-amber-800">
                <span className="font-semibold">Is this your business?</span>{" "}
                Claim this listing to manage your profile, respond to inquiries, and reply to reviews.
              </p>
            </div>
            <Link
              href={`/vendors/${v.slug}/claim`}
              className="shrink-0 rounded-lg border border-amber-300 bg-white px-3 py-1.5 text-xs font-semibold text-amber-800 hover:bg-amber-100 transition-colors"
            >
              Claim this business →
            </Link>
          </div>
        )}

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
              {v.subscription_tier === "featured" && (
                <span className="text-xs font-semibold bg-amber-100 text-amber-700 border border-amber-200 px-2 py-0.5 rounded-full">
                  ★ Featured
                </span>
              )}
              {v.subscription_tier === "pro" && (
                <span className="text-xs font-semibold bg-blue-50 text-blue-700 border border-blue-200 px-2 py-0.5 rounded-full">
                  ⚡ Pro
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
            <div className="flex items-center gap-2">
              {v.is_claimed ? (
                <VendorContactButton vendor={v} />
              ) : (
                v.email && (
                  <a href={`mailto:${v.email}`} className="btn-primary justify-center">
                    <Mail className="h-4 w-4" /> Send Email
                  </a>
                )
              )}
              {user && <SaveVendorButton vendorId={v.id} isSaved={isSaved} />}
            </div>
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
                </