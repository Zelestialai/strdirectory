import { NextRequest, NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

const CACHE_TTL_HOURS = 24;

interface GoogleReview {
  name: string;
  rating: number;
  text: { text: string; languageCode: string };
  relativePublishTimeDescription: string;
  authorAttribution: { displayName: string; photoUri?: string };
}

export async function GET(
  _req: NextRequest,
  { params }: { params: { id: string } }
) {
  // id is the vendor slug
  const { data: vendor } = await supabaseAdmin
    .from("vendors")
    .select("id, google_place_id, google_rating, google_review_count, google_reviews_cached_at")
    .eq("slug", params.id)
    .single();

  if (!vendor?.google_place_id) {
    return NextResponse.json({ reviews: [], rating: null, count: 0 });
  }

  // Return cached data if fresh
  const cachedAt = vendor.google_reviews_cached_at
    ? new Date(vendor.google_reviews_cached_at)
    : null;
  const cacheAge = cachedAt
    ? (Date.now() - cachedAt.getTime()) / 3600000
    : Infinity;

  if (cacheAge < CACHE_TTL_HOURS && vendor.google_rating) {
    // Return cached rating/count — we don't store individual reviews in DB
    // (Google ToS: don't cache review text long-term)
    // We still need to re-fetch review text from Google
  }

  const apiKey = process.env.GOOGLE_PLACES_API_KEY;
  if (!apiKey) {
    return NextResponse.json(
      { error: "Google Places API not configured" },
      { status: 503 }
    );
  }

  try {
    const res = await fetch(
      `https://places.googleapis.com/v1/places/${vendor.google_place_id}`,
      {
        headers: {
          "X-Goog-Api-Key": apiKey,
          "X-Goog-FieldMask":
            "rating,userRatingCount,reviews",
        },
        next: { revalidate: 3600 }, // Next.js fetch cache 1h
      }
    );

    if (!res.ok) {
      const err = await res.text();
      console.error("Google Places error:", err);
      return NextResponse.json({ reviews: [], rating: null, count: 0 });
    }

    const data = await res.json();
    const reviews: GoogleReview[] = data.reviews ?? [];
    const rating: number | null = data.rating ?? null;
    const count: number = data.userRatingCount ?? 0;

    // Cache rating + count in DB
    await supabaseAdmin
      .from("vendors")
      .update({
        google_rating: rating,
        google_review_count: count,
        google_reviews_cached_at: new Date().toISOString(),
      })
      .eq("id", vendor.id);

    return NextResponse.json({
      reviews: reviews.map((r) => ({
        author: r.authorAttribution?.displayName ?? "Google User",
        authorPhoto: r.authorAttribution?.photoUri,
        rating: r.rating,
        text: r.text?.text ?? "",
        relativeTime: r.relativePublishTimeDescription,
      })),
      rating,
      count,
    });
  } catch (err) {
    console.error("Google Places fetch failed:", err);
    return NextResponse.json({ reviews: [], rating: null, count: 0 });
  }
}
