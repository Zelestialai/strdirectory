import { getPostBySlug, getAllPosts, getRelatedPosts, CATEGORY_LABELS } from "@/lib/blog";
import { BlogCard } from "@/components/BlogCard";
import { MDXRemote } from "next-mdx-remote/rsc";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Metadata } from "next";
import { ArrowLeft } from "lucide-react";

export async function generateStaticParams() {
  const posts = await getAllPosts();
  return posts.map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const post = await getPostBySlug(params.slug);
  if (!post) return {};
  return {
    title: `${post.title} | STRVend Blog`,
    description: post.description,
  };
}

const mdxComponents = {
  h1: (props: React.HTMLAttributes<HTMLHeadingElement>) => (
    <h1 className="text-3xl font-extrabold text-gray-900 mt-8 mb-4" {...props} />
  ),
  h2: (props: React.HTMLAttributes<HTMLHeadingElement>) => (
    <h2 className="text-2xl font-bold text-gray-800 mt-10 mb-3" {...props} />
  ),
  h3: (props: React.HTMLAttributes<HTMLHeadingElement>) => (
    <h3 className="text-xl font-semibold text-gray-800 mt-8 mb-2" {...props} />
  ),
  p: (props: React.HTMLAttributes<HTMLParagraphElement>) => (
    <p className="text-gray-700 leading-relaxed mb-5" {...props} />
  ),
  ul: (props: React.HTMLAttributes<HTMLUListElement>) => (
    <ul className="list-disc list-inside space-y-2 mb-5 text-gray-700" {...props} />
  ),
  ol: (props: React.HTMLAttributes<HTMLOListElement>) => (
    <ol className="list-decimal list-inside space-y-2 mb-5 text-gray-700" {...props} />
  ),
  li: (props: React.HTMLAttributes<HTMLLIElement>) => (
    <li className="leading-relaxed" {...props} />
  ),
  strong: (props: React.HTMLAttributes<HTMLElement>) => (
    <strong className="font-semibold text-gray-900" {...props} />
  ),
  a: (props: React.AnchorHTMLAttributes<HTMLAnchorElement>) => (
    <a className="text-brand-600 hover:text-brand-700 underline underline-offset-2" {...props} />
  ),
  blockquote: (props: React.HTMLAttributes<HTMLQuoteElement>) => (
    <blockquote
      className="border-l-4 border-brand-400 pl-5 italic text-gray-600 my-6"
      {...props}
    />
  ),
  hr: () => <hr className="border-gray-200 my-10" />,
  table: (props: React.HTMLAttributes<HTMLTableElement>) => (
    <div className="overflow-x-auto my-6">
      <table className="min-w-full border border-gray-200 rounded-xl text-sm" {...props} />
    </div>
  ),
  thead: (props: React.HTMLAttributes<HTMLTableSectionElement>) => (
    <thead className="bg-gray-50" {...props} />
  ),
  th: (props: React.ThHTMLAttributes<HTMLTableCellElement>) => (
    <th className="px-4 py-3 text-left font-semibold text-gray-700 border-b border-gray-200" {...props} />
  ),
  td: (props: React.TdHTMLAttributes<HTMLTableCellElement>) => (
    <td className="px-4 py-3 text-gray-600 border-b border-gray-100" {...props} />
  ),
};

export default async function BlogPostPage({
  params,
}: {
  params: { slug: string };
}) {
  const post = await getPostBySlug(params.slug);
  if (!post) notFound();

  const related = await getRelatedPosts(post.slug, post.category, 3);

  const categoryLabel = CATEGORY_LABELS[post.category] ?? post.category;

  return (
    <div className="min-h-screen bg-white">
      {/* Back nav */}
      <div className="border-b border-gray-100 bg-gray-50">
        <div className="max-w-3xl mx-auto px-4 py-4">
          <Link
            href="/blog"
            className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-brand-600 transition-colors"
          >
            <ArrowLeft size={14} />
            Back to Blog
          </Link>
        </div>
      </div>

      <div className="max-w-3xl mx-auto px-4 py-12">
        {/* Header */}
        <header className="mb-10">
          <div className="mb-4">
            <Link
              href={`/blog?category=${post.category}`}
              className="inline-block text-xs font-semibold px-3 py-1 rounded-full bg-brand-100 text-brand-700 hover:bg-brand-200 transition-colors"
            >
              {categoryLabel}
            </Link>
          </div>
          <h1 className="text-3xl sm:text-4xl font-extrabold text-gray-900 leading-tight mb-4">
            {post.title}
          </h1>
          <p className="text-lg text-gray-500 mb-6">{post.description}</p>
          <div className="flex items-center gap-3 text-sm text-gray-400">
            {post.author && (
              <>
                <span>{post.author}</span>
                <span>·</span>
              </>
            )}
            <time dateTime={post.date}>
              {new Date(post.date).toLocaleDateString("en-US", {
                month: "long",
                day: "numeric",
                year: "numeric",
              })}
            </time>
            <span>·</span>
            <span>{post.readingTime}</span>
          </div>
        </header>

        {/* Tags */}
        {post.tags && post.tags.length > 0 && (
          <div className="flex flex-wrap gap-2 mb-10">
            {post.tags.map((tag) => (
              <span
                key={tag}
                className="text-xs px-2.5 py-1 rounded-full bg-gray-100 text-gray-500"
              >
                #{tag}
              </span>
            ))}
          </div>
        )}

        {/* Content */}
        <article className="prose-gray">
          <MDXRemote source={post.content} components={mdxComponents} />
        </article>

        {/* CTA */}
        <div className="mt-14 p-7 bg-brand-50 rounded-2xl border border-brand-100 text-center">
          <h3 className="text-xl font-bold text-gray-900 mb-2">
            Find Trusted STR Vendors in Your Market
          </h3>
          <p className="text-gray-600 mb-5 text-sm">
            Browse cleaners, photographers, property managers, and more — all
            specialized in short-term rentals.
          </p>
          <Link
            href="/vendors"
            className="inline-block bg-brand-600 text-white font-semibold px-6 py-3 rounded-xl hover:bg-brand-700 transition-colors"
          >
            Browse the Directory
          </Link>
        </div>

        {/* Related posts */}
        {related.length > 0 && (
          <div className="mt-16">
            <h2 className="text-xl font-bold text-gray-900 mb-6">Related Posts</h2>
            <div className="grid sm:grid-cols-3 gap-5">
              {related.map((rp) => (
                <BlogCard key={rp.slug} post={rp} />
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
