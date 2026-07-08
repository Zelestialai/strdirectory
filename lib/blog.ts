import fs from "fs";
import path from "path";
import matter from "gray-matter";
import readingTime from "reading-time";

const BLOG_DIR = path.join(process.cwd(), "content/blog");

export type BlogCategory =
  | "hosting-tips"
  | "market-guides"
  | "vendor-spotlights"
  | "industry-news";

export interface BlogPost {
  slug: string;
  title: string;
  description: string;
  date: string;
  category: BlogCategory;
  author: string;
  tags: string[];
  image?: string;
  readingTime: string;
  content: string;
}

export const CATEGORY_LABELS: Record<BlogCategory, string> = {
  "hosting-tips": "Hosting Tips",
  "market-guides": "Market Guides",
  "vendor-spotlights": "Vendor Spotlights",
  "industry-news": "Industry News",
};

export const CATEGORY_COLORS: Record<BlogCategory, string> = {
  "hosting-tips": "bg-brand-100 text-brand-700",
  "market-guides": "bg-purple-100 text-purple-700",
  "vendor-spotlights": "bg-coral-100 text-coral-700",
  "industry-news": "bg-amber-100 text-amber-700",
};

function slugify(filename: string) {
  return filename.replace(/\.mdx?$/, "");
}

export function getAllPosts(): Omit<BlogPost, "content">[] {
  if (!fs.existsSync(BLOG_DIR)) return [];

  const files = fs
    .readdirSync(BLOG_DIR)
    .filter((f) => f.endsWith(".mdx") || f.endsWith(".md"));

  return files
    .map((file) => {
      const raw = fs.readFileSync(path.join(BLOG_DIR, file), "utf-8");
      const { data, content } = matter(raw);
      const stats = readingTime(content);
      return {
        slug: slugify(file),
        title: data.title ?? "",
        description: data.description ?? "",
        date: data.date ?? "",
        category: (data.category ?? "hosting-tips") as BlogCategory,
        author: data.author ?? "STRVend Team",
        tags: data.tags ?? [],
        image: data.image,
        readingTime: stats.text,
      };
    })
    .sort((a, b) => (a.date < b.date ? 1 : -1)); // newest first
}

export function getPostBySlug(slug: string): BlogPost | null {
  const mdxPath = path.join(BLOG_DIR, `${slug}.mdx`);
  const mdPath = path.join(BLOG_DIR, `${slug}.md`);
  const filePath = fs.existsSync(mdxPath) ? mdxPath : fs.existsSync(mdPath) ? mdPath : null;

  if (!filePath) return null;

  const raw = fs.readFileSync(filePath, "utf-8");
  const { data, content } = matter(raw);
  const stats = readingTime(content);

  return {
    slug,
    title: data.title ?? "",
    description: data.description ?? "",
    date: data.date ?? "",
    category: (data.category ?? "hosting-tips") as BlogCategory,
    author: data.author ?? "STRVend Team",
    tags: data.tags ?? [],
    image: data.image,
    readingTime: stats.text,
    content,
  };
}

export function getPostsByCategory(category: BlogCategory): Omit<BlogPost, "content">[] {
  return getAllPosts().filter((p) => p.category === category);
}

export function getRelatedPosts(
  slug: string,
  category: BlogCategory,
  limit = 3
): Omit<BlogPost, "content">[] {
  return getAllPosts()
    .filter((p) => p.slug !== slug && p.category === category)
    .slice(0, limit);
}
