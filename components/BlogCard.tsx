import Link from "next/link";
import { BlogPost } from "@/lib/blog";

const CATEGORY_COLORS: Record<string, { bg: string; text: string }> = {
  "hosting-tips": { bg: "bg-brand-100", text: "text-brand-700" },
  "market-guides": { bg: "bg-blue-100", text: "text-blue-700" },
  "vendor-spotlights": { bg: "bg-coral-100", text: "text-coral-700" },
  "industry-news": { bg: "bg-purple-100", text: "text-purple-700" },
};

const CATEGORY_LABELS: Record<string, string> = {
  "hosting-tips": "Hosting Tips",
  "market-guides": "Market Guides",
  "vendor-spotlights": "Vendor Spotlights",
  "industry-news": "Industry News",
};

export function BlogCard({ post }: { post: BlogPost }) {
  const colors = CATEGORY_COLORS[post.category] ?? { bg: "bg-gray-100", text: "text-gray-700" };

  return (
    <Link href={`/blog/${post.slug}`} className="group block">
      <article className="h-full bg-white rounded-2xl border border-gray-100 shadow-sm hover:shadow-md transition-shadow overflow-hidden">
        {/* Category badge */}
        <div className="px-5 pt-5 pb-3">
          <span className={`inline-block text-xs font-semibold px-2.5 py-1 rounded-full ${colors.bg} ${colors.text}`}>
            {CATEGORY_LABELS[post.category] ?? post.category}
          </span>
        </div>

        <div className="px-5 pb-5 flex flex-col gap-3">
          {/* Title */}
          <h2 className="text-lg font-bold text-gray-900 leading-snug group-hover:text-brand-600 transition-colors">
            {post.title}
          </h2>

          {/* Description */}
          <p className="text-sm text-gray-600 leading-relaxed line-clamp-3">
            {post.description}
          </p>

          {/* Meta */}
          <div className="flex items-center gap-3 text-xs text-gray-400 mt-auto pt-2 border-t border-gray-50">
            <time dateTime={post.date}>
              {new Date(post.date).toLocaleDateString("en-US", {
                month: "short",
                day: "numeric",
                year: "numeric",
              })}
            </time>
            <span>·</span>
            <span>{post.readingTime}</span>
          </div>
        </div>
      </article>
    </Link>
  );
}
