import type { MetadataRoute } from "next";
import { supabaseAdmin } from "@/lib/supabase/admin";

const BASE_URL =
  process.env.NEXT_PUBLIC_SITE_URL ??
  "https://strdirectory-qccmytf7r-zelestialai-6207s-projects.vercel.app";

export const revalidate = 3600; // regenerate every hour

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  // ── Static pages ────────────────────────────────────────────────────────────
  const staticPages: MetadataRoute.Sitemap = [
    { url: BASE_URL,             changeFrequency: "weekly",  priority: 1.0 },
    { url: `${BASE_URL}/vendors`, changeFrequency: "daily",   priority: 0.9 },
    { url: `${BASE_URL}/markets`, changeFrequency: "weekly",  priority: 0.8 },
    { url: `${BASE_URL}/login`,   changeFrequency: "monthly", priority: 0.3 },
    { url: `${BASE_URL}/register`,changeFrequency: "monthly", priority: 0.3 },
  ];

  // ── Vendor profiles ─────────────────────────────────────────────────────────
  const { data: vendors } = await supabaseAdmin
    .from("vendors")
    .select("slug, updated_at")
    .eq("is_active", true)
    .order("updated_at", { ascending: false })
    .limit(5000);

  const vendorPages: MetadataRoute.Sitemap = (vendors ?? []).map((v) => ({
    url: `${BASE_URL}/vendors/${v.slug}`,
    lastModified: v.updated_at ? new Date(v.updated_at) : undefined,
    changeFrequency: "weekly",
    priority: 0.8,
  }));

  // ── Market pages ─────────────────────────────────────────────────────────────
  const { data: markets } = await supabaseAdmin
    .from("markets")
    .select("slug")
    .eq("is_active", true)
    .limit(500);

  const marketPages: MetadataRoute.Sitemap = (markets ?? []).map((m) => ({
    url: `${BASE_URL}/markets/${m.slug}`,
    changeFrequency: "weekly",
    priority: 0.8,
  }));

  // ── Category pages (via vendor browse) ──────────────────────────────────────
  const { data: categories } = await supabaseAdmin
    .from("categories")
    .select("slug");

  const categoryPages: MetadataRoute.Sitemap = (categories ?? []).map((c) => ({
    url: `${BASE_URL}/vendors?category=${c.slug}`,
    changeFrequency: "weekly",
    priority: 0.7,
  }));

  return [...staticPages, ...vendorPages, ...marketPages, ...categoryPages];
}
