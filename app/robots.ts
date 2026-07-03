import type { MetadataRoute } from "next";

const BASE_URL =
  process.env.NEXT_PUBLIC_SITE_URL ??
  "https://strdirectory-qccmytf7r-zelestialai-6207s-projects.vercel.app";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: [
          "/admin/",
          "/dashboard/",
          "/api/",
          "/auth/",
          "/login",
          "/register",
        ],
      },
    ],
    sitemap: `${BASE_URL}/sitemap.xml`,
  };
}
