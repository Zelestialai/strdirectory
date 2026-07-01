import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Bookmark, ExternalLink, MapPin } from "lucide-react";
import { SaveVendorButton } from "@/components/SaveVendorButton";

export const metadata = { title: "Saved Vendors" };

export default async function SavedVendorsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: saved } = await supabase
    .from("saved_vendors")
    .select("*, vendor:vendors(*, category:categories(name, color, slug))")
    .eq("host_id", user!.id)
    .order("created_at", { ascending: false });

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Saved Vendors</h1>

      {saved && saved.length > 0 ? (
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          {saved.map((s) => {
            const v = s.vendor;
            if (!v) return null;
            return (
              <div key={s.id} className="card p-5 flex flex-col gap-3">
                <div className="flex items-start justify-between gap-2">
                  <div className="flex-1 min-w-0">
                    <Link
                      href={`/vendors/${v.slug}`}
                      className="font-semibold text-gray-900 hover:text-brand-700 transition line-clamp-1"
                    >
                      {v.business_name}
                    </Link>
                    {v.category && (
                      <p className="text-xs text-gray-400 mt-0.5">{v.category.name}</p>
                    )}
                    {(v.city || v.state) && (
                      <p className="flex items-center gap-1 text-xs text-gray-500 mt-1">
                        <MapPin className="h-3 w-3" />
                        {[v.city, v.state].filter(Boolean).join(", ")}
                      </p>
                    )}
                  </div>
                  <SaveVendorButton vendorId={v.id} isSaved={true} />
                </div>

                {v.tagline && (
                  <p className="text-sm text-gray-500 line-clamp-2">{v.tagline}</p>
                )}

                {v.avg_rating > 0 && (
                  <p className="text-xs text-amber-600 font-medium">
                    ★ {v.avg_rating.toFixed(1)} · {v.review_count} review{v.review_count !== 1 ? "s" : ""}
                  </p>
                )}

                <div className="flex gap-2 pt-1 border-t">
                  <Link href={`/vendors/${v.slug}`} className="btn-secondary text-xs flex-1 justify-center">
                    <ExternalLink className="h-3.5 w-3.5" /> View Profile
                  </Link>
                  {v.website && (
                    <a
                      href={v.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="btn-secondary text-xs"
                    >
                      Website
                    </a>
                  )}
                </div>

                {s.notes && (
                  <p className="text-xs text-gray-400 italic border-t pt-2">Note: {s.notes}</p>
                )}
              </div>
            );
          })}
        </div>
      ) : (
        <div className="card p-12 text-center text-gray-400">
          <Bookmark className="mx-auto h-10 w-10 opacity-30 mb-3" />
          <p className="font-medium text-gray-500 mb-1">No saved vendors yet</p>
          <p className="text-sm mb-4">Browse vendors and tap the bookmark icon to save them here.</p>
          <Link href="/vendors" className="btn-primary text-sm">
            Browse Vendors
          </Link>
        </div>
      )}
    </div>
  );
}
