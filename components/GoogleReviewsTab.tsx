"use client";

import { useEffect, useState } from "react";
import { Star, Loader2, ExternalLink } from "lucide-react";

interface GoogleReview {
  author: string;
  authorPhoto?: string;
  rating: number;
  text: string;
  relativeTime: string;
}

interface Props {
  vendorSlug: string;
  placeId: string;
}

export function GoogleReviewsTab({ vendorSlug, placeId }: Props) {
  const [reviews, setReviews] = useState<GoogleReview[]>([]);
  const [rating, setRating] = useState<number | null>(null);
  const [count, setCount] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`/api/vendors/${vendorSlug}/google-reviews`)
      .then((r) => r.json())
      .then((data) => {
        setReviews(data.reviews ?? []);
        setRating(data.rating ?? null);
        setCount(data.count ?? 0);
      })
      .finally(() => setLoading(false));
  }, [vendorSlug]);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-16 text-gray-400 gap-2">
        <Loader2 className="h-5 w-5 animate-spin" />
        <span>Loading Google reviews…</span>
      </div>
    );
  }

  if (!reviews.length) {
    return (
      <div className="text-center py-16 text-gray-400">
        <p className="font-medium">No Google reviews found</p>
        <p className="text-sm mt-1">This vendor hasn&apos;t linked a Google Business profile yet.</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Summary bar */}
      <div className="flex items-center gap-4 p-4 bg-white rounded-xl border border-gray-100 shadow-sm">
        <div className="flex items-center gap-2">
          <svg className="h-5 w-5" viewBox="0 0 24 24" fill="none">
            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
          </svg>
          <span className="font-bold text-gray-900 text-lg">{rating?.toFixed(1)}</span>
          <div className="flex">
            {[1,2,3,4,5].map((s) => (
              <Star
                key={s}
                className={`h-4 w-4 ${s <= Math.round(rating ?? 0) ? "text-yellow-400 fill-yellow-400" : "text-gray-200 fill-gray-200"}`}
              />
            ))}
          </div>
          <span className="text-sm text-gray-500">({count.toLocaleString()} Google reviews)</span>
        </div>
        <a
          href={`https://search.google.com/local/reviews?placeid=${placeId}`}
          target="_blank"
          rel="noopener noreferrer"
          className="ml-auto text-xs text-brand-600 hover:underline flex items-center gap-1"
        >
          View on Google <ExternalLink className="h-3 w-3" />
        </a>
      </div>

      {/* Reviews list */}
      <div className="space-y-4">
        {reviews.map((r, i) => (
          <div key={i} className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
            <div className="flex items-start gap-3 mb-3">
              {r.authorPhoto ? (
                <img
                  src={r.authorPhoto}
                  alt={r.author}
                  className="h-9 w-9 rounded-full object-cover"
                />
              ) : (
                <div className="h-9 w-9 rounded-full bg-brand-100 flex items-center justify-center text-brand-700 font-semibold text-sm">
                  {r.author[0]?.toUpperCase()}
                </div>
              )}
              <div>
                <p className="font-semibold text-gray-900 text-sm">{r.author}</p>
                <div className="flex items-center gap-2">
                  <div className="flex">
                    {[1,2,3,4,5].map((s) => (
                      <Star key={s} className={`h-3.5 w-3.5 ${s <= r.rating ? "text-yellow-400 fill-yellow-400" : "text-gray-200 fill-gray-200"}`} />
                    ))}
                  </div>
                  <span className="text-xs text-gray-400">{r.relativeTime}</span>
                </div>
              </div>
              <div className="ml-auto">
                <svg className="h-4 w-4 text-gray-300" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                  <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                  <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                  <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                </svg>
              </div>
            </div>
            {r.text && (
              <p className="text-gray-700 text-sm leading-relaxed">{r.text}</p>
            )}
          </div>
        ))}
      </div>

      <p className="text-xs text-gray-400 text-center">
        Reviews sourced from Google Business Profile via Google Places API
      </p>
    </div>
  );
}
