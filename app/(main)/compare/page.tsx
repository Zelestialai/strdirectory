import { notFound } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import { createClient } from "@/lib/supabase/server";
import { StarRating } from "@/components/StarRating";
import { VendorContactButton } from "@/components/VendorContactButton";
import { CheckCircle2, MapPin, Star, X } from "lucide-react";
import type { Vendor } from "@/types";
import { COLOR_CLASSES, CATEGORY_COLORS, cn } from "@/lib/utils";

export const metadata = { title: "Compare Vendors — StrVend" };

export default async function ComparePage({
  searchParams,
}: {
  searchParams?: { vendors?: string };
}) {
  const slugs = (searchParams?.vendors ?? "").split(",").filter(Boolean).slice(0, 3);
  if (slugs.length < 2) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-20 text-center">
        <h1 className="text-2xl font-bold text-gray-900 mb-3">Compare Vendors</h1>
        <p className="text-gray-500 mb-6">
          Select 2–3 vendors from the search page or your saved vendors list to compare them side by side.
        </p>
        <Link href="/vendors" className="btn-primary">Browse Vendors</Link>
      </div>
    );
  }

  const supabase = createClient();

  const { data: vendors } = await supabase
    .from("vendors")
    .select("*, category:categories(*), services:vendor_services(*)")
    .in("slug", slugs)
    .eq("is_active", true);

  if (!vendors?.length) notFound();

  // Preserve user-specified order
  const ordered = slugs
    .map(s => vendors.find(v => v.slug === s))
    .filter(Boolean) as Vendor[];

  const { data: { user } } = await supabase.auth.getUser();

  // Fetch recent reviews for each vendor
  const reviewMap: Record<string, { rating: number; body: string | null; profiles: { full_name: string | null } | null }[]> = {};
  for (const v of ordered) {
    const { data } = await supabase
      .from("reviews")
      .select("rating, body, profiles(full_name)")
      .eq("vendor_id", v.id)
      .order("created_at", { ascending: false })
      .limit(2);
    reviewMap[v.id] = (data ?? []).map(r => ({
      rating: r.rating,
      body: r.body,
      profiles: Array.isArray(r.profiles) ? r.profiles[0] ?? null : r.profiles,
    }));
  }

  const colWidth = ordered.length === 2 ? "w-1/2" : "w-1/3";

  return (
    <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-10">
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Compare Vendors</h1>
          <p className="text-sm text-gray-500 mt-1">Comparing {ordered.length} vendors side by side</p>
        </div>
        <Link href="/vendors" className="btn-secondary text-sm">← Back to search</Link>
      </div>

      <div className="overflow-x-auto">
        <table className="w-full border-collapse">
          {/* Header row — vendor logos & names */}
          <thead>
            <tr>
              <th className="w-36 min-w-[120px]" />
              {ordered.map(v => {
                const color = v.category?.color ?? CATEGORY_COLORS[v.category?.slug ?? ""] ?? "sky";
                const cls = COLOR_CLASSES[color] ?? COLOR_CLASSES.sky;
                return (
                  <th key={v.id} className={cn("px-4 pb-6 align-top", colWidth)}>
                    <div className="flex flex-col items-center gap-3">
                      <div className={cn("h-20 w-20 rounded-2xl overflow-hidden border-2 border-white shadow-md", cls.bg)}>
                        {v.logo_url ? (
                          <Image src={v.logo_url} alt={v.business_name} width={80} height={80} className="object-contain h-full w-full p-1" />
                        ) : (
                          <div className={cn("h-full w-full flex items-center justify-center text-2xl font-bold", cls.text)}>
                            {v.business_name[0]}
                          </div>
                        )}
                      </div>
                      <div className="text-center">
                        <Link href={`/vendors/${v.slug}`} className="font-bold text-gray-900 hover:text-brand-700 text-sm leading-tight block">
                          {v.business_name}
                        </Link>
                        {v.is_verified && (
                          <span className="inline-flex items-center gap-1 text-xs text-brand-600 mt-1">
                            <CheckCircle2 className="h-3 w-3" /> Verified
                          </span>
                        )}
                        {v.subscription_tier === "featured" && (
                          <span className="block text-xs font-semibold text-amber-600 mt-0.5">★ Featured</span>
                        )}
                        {v.subscription_tier === "pro" && (
                          <span className="block text-xs font-semibold text-blue-600 mt-0.5">⚡ Pro</span>
                        )}
                      </div>
                    </div>
                  </th>
                );
              })}
            </tr>
          </thead>

          <tbody className="divide-y divide-gray-100">
            {/* Rating */}
            <tr className="bg-white">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Rating</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top">
                  {v.avg_rating > 0 ? (
                    <div>
                      <div className="flex items-center gap-2 mb-1">
                        <span className="text-2xl font-bold text-gray-900">{v.avg_rating.toFixed(1)}</span>
                        <StarRating rating={v.avg_rating} size="sm" />
                      </div>
                      <p className="text-xs text-gray-400">{v.review_count} review{v.review_count !== 1 ? "s" : ""}</p>
                    </div>
                  ) : (
                    <span className="text-sm text-gray-400">No reviews yet</span>
                  )}
                </td>
              ))}
            </tr>

            {/* Category */}
            <tr className="bg-gray-50">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Category</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top text-sm text-gray-700">
                  {v.category?.name ?? "—"}
                </td>
              ))}
            </tr>

            {/* Location */}
            <tr className="bg-white">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Location</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top">
                  <div className="flex items-start gap-1.5 text-sm text-gray-700">
                    <MapPin className="h-4 w-4 text-gray-400 shrink-0 mt-0.5" />
                    <div>
                      <p>{[v.city, v.state].filter(Boolean).join(", ") || "—"}</p>
                      {v.service_radius && (
                        <p className="text-xs text-gray-400 mt-0.5">Serves within {v.service_radius} mi</p>
                      )}
                    </div>
                  </div>
                </td>
              ))}
            </tr>

            {/* Services */}
            <tr className="bg-gray-50">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Services</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top">
                  {v.services && v.services.length > 0 ? (
                    <ul className="space-y-1">
                      {v.services.slice(0, 5).map(s => (
                        <li key={s.id} className="flex items-center gap-1.5 text-sm text-gray-700">
                          <span className="h-1.5 w-1.5 rounded-full bg-brand-500 shrink-0" />
                          {s.name}
                        </li>
                      ))}
                      {v.services.length > 5 && (
                        <li className="text-xs text-gray-400">+{v.services.length - 5} more</li>
                      )}
                    </ul>
                  ) : (
                    <span className="text-sm text-gray-400">—</span>
                  )}
                </td>
              ))}
            </tr>

            {/* Recent reviews */}
            <tr className="bg-white">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Recent reviews</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top">
                  {reviewMap[v.id]?.length > 0 ? (
                    <div className="space-y-3">
                      {reviewMap[v.id].map((r, i) => (
                        <div key={i} className="bg-gray-50 rounded-lg p-3">
                          <div className="flex items-center gap-1 mb-1">
                            {Array.from({ length: 5 }).map((_, s) => (
                              <Star key={s} className={cn("h-3 w-3", s < r.rating ? "text-amber-400 fill-amber-400" : "text-gray-200 fill-gray-200")} />
                            ))}
                          </div>
                          {r.body && (
                            <p className="text-xs text-gray-600 line-clamp-2">"{r.body}"</p>
                          )}
                          <p className="text-xs text-gray-400 mt-1">— {r.profiles?.full_name ?? "Anonymous"}</p>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <span className="text-sm text-gray-400">No reviews yet</span>
                  )}
                </td>
              ))}
            </tr>

            {/* Contact CTA */}
            <tr className="bg-gray-50">
              <td className="py-4 pr-4 text-sm font-semibold text-gray-500 align-top">Contact</td>
              {ordered.map(v => (
                <td key={v.id} className="px-4 py-4 align-top">
                  <div className="flex flex-col gap-2">
                    <VendorContactButton vendor={v} user={user} />
                    <Link href={`/vendors/${v.slug}`} className="text-xs text-brand-600 hover:underline text-center">
                      View full profile →
                    </Link>
                  </div>
                </td>
              ))}
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
}
