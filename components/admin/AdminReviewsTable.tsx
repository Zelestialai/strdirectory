"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Star, Trash2, ExternalLink } from "lucide-react";
import { formatDate } from "@/lib/utils";

interface Review {
  id: string;
  rating: number;
  title: string | null;
  body: string | null;
  created_at: string;
  vendor?: { business_name: string; slug: string } | null;
  reviewer?: { full_name: string | null } | null;
}

export function AdminReviewsTable({ reviews }: { reviews: Review[] }) {
  const router = useRouter();
  const [, startTransition] = useTransition();
  const [deletingId, setDeletingId] = useState<string | null>(null);
  const [confirmId, setConfirmId] = useState<string | null>(null);

  const deleteReview = async (id: string) => {
    setDeletingId(id);
    await fetch(`/api/admin/reviews/${id}`, { method: "DELETE" });
    setDeletingId(null);
    setConfirmId(null);
    startTransition(() => router.refresh());
  };

  if (reviews.length === 0) {
    return <p className="text-center text-gray-400 py-16">No reviews found.</p>;
  }

  return (
    <div className="card overflow-x-auto">
      <table className="w-full text-sm">
        <thead className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wider">
          <tr>
            <th className="px-4 py-3 text-left">Reviewer</th>
            <th className="px-4 py-3 text-left">Vendor</th>
            <th className="px-4 py-3 text-left">Rating</th>
            <th className="px-4 py-3 text-left hidden lg:table-cell">Review</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Date</th>
            <th className="px-4 py-3 text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="divide-y">
          {reviews.map((r) => (
            <tr key={r.id} className="hover:bg-gray-50 transition">
              <td className="px-4 py-3 font-medium text-gray-800">
                {r.reviewer?.full_name ?? "Anonymous"}
              </td>
              <td className="px-4 py-3 text-gray-600">
                <a href={`/vendors/${r.vendor?.slug}`} target="_blank" className="hover:text-brand-600 flex items-center gap-1">
                  {r.vendor?.business_name ?? "Unknown"}
                  <ExternalLink className="h-3 w-3 opacity-50" />
                </a>
              </td>
              <td className="px-4 py-3">
                <span className="flex items-center gap-1 text-amber-500 font-medium">
                  <Star className="h-3.5 w-3.5 fill-amber-400" />
                  {r.rating}
                </span>
              </td>
              <td className="px-4 py-3 hidden lg:table-cell max-w-xs">
                {r.title && <p className="font-medium text-gray-700 truncate">{r.title}</p>}
                {r.body && <p className="text-gray-400 truncate text-xs">{r.body}</p>}
              </td>
              <td className="px-4 py-3 text-gray-400 hidden md:table-cell text-xs">
                {formatDate(r.created_at)}
              </td>
              <td className="px-4 py-3 text-center">
                {confirmId === r.id ? (
                  <div className="flex items-center justify-center gap-2">
                    <button
                      onClick={() => deleteReview(r.id)}
                      disabled={deletingId === r.id}
                      className="rounded-lg bg-red-600 text-white px-2.5 py-1 text-xs font-medium hover:bg-red-700 transition"
                    >
                      {deletingId === r.id ? "Deleting…" : "Confirm"}
                    </button>
                    <button onClick={() => setConfirmId(null)} className="text-xs text-gray-400 hover:text-gray-600">
                      Cancel
                    </button>
                  </div>
                ) : (
                  <button
                    onClick={() => setConfirmId(r.id)}
                    className="rounded-lg p-1.5 text-gray-400 hover:bg-red-50 hover:text-red-500 transition"
                    title="Delete review"
                  >
                    <Trash2 className="h-4 w-4" />
                  </button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
