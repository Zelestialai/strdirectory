/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    // Lint warnings/errors still show in `next dev` and CI if you run `next lint`,
    // but they no longer fail the production build on Vercel.
    ignoreDuringBuilds: true,
  },
  images: {
    remotePatterns: [
      { protocol: "https", hostname: "*.supabase.co" },
      { protocol: "https", hostname: "images.unsplash.com" },
    ],
  },
};

export default nextConfig;
