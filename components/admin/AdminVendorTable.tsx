"use client";
import { useState, useTransition } from "react";
import Link from "next/link";
import { CheckCircle2, Star, EyeOff, Eye, ExternalLink, Pencil } from "lucide-react";
import { useRouter } from "next/navigation";
import { AdminVendorForm, type AdminCategory } from "@/components/admin/AdminVendorForm";

interface Vendor {
  id: string;
  business_name: string;
  slug: string;
  city: string | null;
  state: string | null;
  email: string | null;
  phone?: string | null;
  website?: string | null;
  tagline?: string | null;
  description?: string | null;
  category_id?: string | null;
  markets?: string[] | null;
  subscription_tier?: string | null;
  is_verified: boolean;
  is_featured: boolean;
  is_active: boolean;
  avg_rating: number;
  review_count: number;
  created_at: string;
  category?: { name: string; slug: string } | null;
}

interface Props { vendors: Vendor[]; categories?: AdminCategory[]; }

const TIER_BADGE: Record<string, string> = {
  pro: "bg-blue-50 text-blue-700 border-blue-200",
  featured: "bg-yellow-50 text-yellow-700 border-yellow-200",
};

export function AdminVendorTable({ vendors, categories = [] }: Props) {
  const router = useRouter();
  const [, startTransition] = useTransition();
  const [loadingId, setLoadingId] = useState<string | null>(null);
  const [editing, setEditing] = useState<Vendor | null>(null);

  const update = async (id: string, patch: Record<string, boolean>) => {
    setLoadingId(id);
    await fetch(`/api/admin/vendors/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(patch),
    });
    setLoadingId(null);
    startTransition(() => router.refresh());
  };

  if (vendors.length === 0) {
    return <p className="text-center text-gray-400 py-16">No vendors match this filter.</p>;
  }

  return (
    <>
    <div className="card overflow-x-auto">
      <table className="w-full text-sm">
        <thead className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wider">
          <tr>
            <th className="px-4 py-3 text-left">Business</th>
            <th className="px-4 py-3 text-left hidden lg:table-cell">Category</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Location</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Rating</th>
            <th className="px-4 py-3 text-left">Status</th>
            <th className="px-4 py-3 text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="divide-y">
          {vendors.map((v) => {
            const isLoading = loadingId === v.id;
            return (
              <tr key={v.id} className={`hover:bg-gray-50 transition ${!v.is_active ? "opacity-50" : ""}`}>
                {/* Business name */}
                <td className="px-4 py-3">
                  <div className="font-medium text-gray-800">{v.business_name}</div>
                  {v.email && <div className="text-xs text-gray-400">{v.email}</div>}
                </td>

                {/* Category */}
                <td className="px-4 py-3 text-gray-500 hidden lg:table-cell">
                  {v.category?.name ?? "—"}
                </td>

                {/* Location */}
                <td className="px-4 py-3 text-gray-500 hidden md:table-cell">
                  {[v.city, v.state].filter(Boolean).join(", ") || "—"}
                </td>

                {/* Rating */}
                <td className="px-4 py-3 hidden md:table-cell">
                  {v.avg_rating > 0
                    ? <span className="flex items-center gap-1 text-amber-600 font-medium">★ {Number(v.avg_rating).toFixed(1)} <span className="text-gray-400 font-normal">({v.review_count})</span></span>
                    : <span className="text-gray-400">No reviews</span>
                  }
                </td>

                {/* Status badges */}
                <td className="px-4 py-3">
                  <div className="flex flex-wrap gap-1">
                    {v.is_verified
                      ? <span className="rounded-full bg-green-50 text-green-700 border border-green-200 px-2 py-0.5 text-xs">Verified</span>
                      : <span className="rounded-full bg-amber-50 text-amber-700 border border-amber-200 px-2 py-0.5 text-xs">Pending</span>
                    }
                    {v.is_featured && <span className="rounded-full bg-yellow-50 text-yellow-700 border border-yellow-200 px-2 py-0.5 text-xs">Featured</span>}
                    {v.subscription_tier && v.subscription_tier !== "free" && (
                      <span className={`rounded-full border px-2 py-0.5 text-xs capitalize ${TIER_BADGE[v.subscription_tier] ?? "bg-gray-50 text-gray-600 border-gray-200"}`}>
                        {v.subscription_tier}
                      </span>
                    )}
                    {!v.is_active && <span className="rounded-full bg-red-50 text-red-700 border border-red-200 px-2 py-0.5 text-xs">Inactive</span>}
                  </div>
                </td>

                {/* Action buttons */}
                <td className="px-4 py-3">
                  <div className="flex items-center justify-center gap-1 flex-wrap">
                    {/* Verify / Unverify */}
                    <button
                      disabled={isLoading}
                      onClick={() => update(v.id, { is_verified: !v.is_verified })}
                      title={v.is_verified ? "Remove verification" : "Verify vendor"}
                      className={`rounded-lg p-1.5 transition ${
                        v.is_verified
                          ? "text-green-600 hover:bg-green-50"
                          : "text-gray-400 hover:bg-green-50 hover:text-green-600"
                      }`}
                    >
                      <CheckCircle2 className="h-4 w-4" />
                    </button>

                    {/* Feature / Unfeature */}
                    <button
                      disabled={isLoading}
                      onClick={() => update(v.id, { is_featured: !v.is_featured })}
                      title={v.is_featured ? "Remove featured" : "Mark as featured"}
                      className={`rounded-lg p-1.5 transition ${
                        v.is_featured
                          ? "text-amber-500 hover:bg-amber-50"
                          : "text-gray-400 hover:bg-amber-50 hover:text-amber-500"
                      }`}
                    >
                      <Star className="h-4 w-4" />
                    </button>

                    {/* Activate / Deactivate */}
                    <button
                      disabled={isLoading}
                      onClick={() => update(v.id, { is_active: !v.is_active })}
                      title={v.is_active ? "Deactivate listing" : "Activate listing"}
                      className={`rounded-lg p-1.5 transition ${
                        v.is_active
                          ? "text-gray-400 hover:bg-red-50 hover:text-red-500"
                          : "text-red-400 hover:bg-gray-50 hover:text-gray-600"
                      }`}
                    >
                      {v.is_active ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                    </button>

                    {/* Edit details */}
                    <button
                      onClick={() => setEditing(v)}
                      className="rounded-lg p-1.5 text-gray-400 hover:bg-brand-50 hover:text-brand-600 transition"
                      title="Edit vendor"
                    >
                      <Pencil className="h-4 w-4" />
                    </button>

                    {/* View public profile */}
                    <Link
                      href={`/vendors/${v.slug}`}
                      target="_blank"
                      className="rounded-lg p-1.5 text-gray-400 hover:bg-brand-50 hover:text-brand-600 transition"
                      title="View public profile"
                    >
                      <ExternalLink className="h-4 w-4" />
                    </Link>
                  </div>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>

    {editing && (
      <AdminVendorForm
        categories={categories}
        vendor={{
          id: editing.id,
          business_name: editing.business_name,
          category_id: editing.category_id ?? null,
          tagline: editing.tagline ?? null,
          description: editing.description ?? null,
          website: editing.website ?? null,
          phone: editing.phone ?? null,
          email: editing.email ?? null,
          city: editing.city ?? null,
          state: editing.state ?? null,
          markets: editing.markets ?? [],
          subscription_tier: editing.subscription_tier ?? "free",
          is_verified: editing.is_verified,
          is_featured: editing.is_featured,
          is_active: editing.is_active,
        }}
        onClose={() => setEditing(null)}
      />
    )}
    </>
  );
}
