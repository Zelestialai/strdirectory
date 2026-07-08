import { getAllPosts, BlogCategory } from "@/lib/blog";
import { BlogCard } from "@/components/BlogCard";
import Link from "next/link";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "STR Blog – Hosting Tips, Market Guides & Industry News | STRVend",
  description:
    "Expert advice for short-term rental hosts: hosting tips, local market guides, vendor spotlights, and the latest STR industry news.",
};

const CATEGORIES: { slug: BlogCategory | "all"; label: string }[] = [
  { slug: "all", label: "All Posts" },
  { slug: "hosting-tips", label: "Hosting Tips" },
  { slug: "market-guides", label: "Market Guides" },
  { slug: "vendor-spotlights", label: "Vendor Spotlights" },
  { slug: "industry-news", label: "Industry News" },
];

export default async function BlogIndexPage({
  searchParams,
}: {
  searchParams: { category?: string };
}) {
  const allPosts = await getAllPosts();
  const activeCategory = searchParams.category ?? "all";

  const posts =
    activeCategory === "all"
      ? allPosts
      : allPosts.filter((p) => p.category === activeCategory);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-white border-b border-gray-100">
        <div className="max-w-5xl mx-auto px-4 py-16 text-center">
          <h1 className="text-4xl font-extrabold text-gray-900 mb-4">
            STR Hosting Resources
          </h1>
          <p className="text-lg text-gray-500 max-w-2xl mx-auto">
            Tips, market insights, and vendor spotlights to help you build a
            better short-term rental business.
          </p>
        </div>
      </div>

      <div className="max-w-5xl mx-auto px-4 py-10">
        {/* Category tabs */}
        <div className="flex flex-wrap gap-2 mb-8">
          {CATEGORIES.map((cat) => {
            const isActive = activeCategory === cat.slug;
            return (
              <Link
                key={cat.slug}
                href={cat.slug === "all" ? "/blog" : `/blog?category=${cat.slug}`}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-colors ${
                  isActive
                    ? "bg-brand-600 text-white"
                    : "bg-white border border-gray-200 text-gray-600 hover:border-brand-400 hover:text-brand-600"
                }`}
              >
                {cat.label}
              </Link>
            );
          })}
        </div>

        {/* Grid */}
        {posts.length === 0 ? (
          <div className="text-center py-20 text-gray-400">
            No posts in this category yet.
          </div>
        ) : (
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {posts.map((post) => (
              <BlogCard key={post.slug} post={post} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
