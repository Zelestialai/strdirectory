import type { Metadata, Viewport } from "next";
import "./globals.css";
import { Navbar } from "@/components/Navbar";
import { Footer } from "@/components/Footer";
import { getActiveMarket, getAllMarkets } from "@/lib/market";

export const metadata: Metadata = {
  title: { default: "STRVend", template: "%s | STRVend" },
  description: "Find trusted STR service providers near you — cleaning, photography, property management, and more. The vendor directory built for short-term rental hosts.",
  manifest: "/manifest.webmanifest",
  appleWebApp: { capable: true, title: "STRVend", statusBarStyle: "default" },
};

export const viewport: Viewport = {
  themeColor: "#0d9488",
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
};

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const [activeMarket, markets] = await Promise.all([getActiveMarket(), getAllMarkets()]);
  const currentMarket = activeMarket
    ? { name: activeMarket.name, slug: activeMarket.slug, state: activeMarket.state }
    : null;

  return (
    <html lang="en">
      <body className="flex min-h-screen flex-col">
        <Navbar currentMarket={currentMarket} markets={markets} />
        <main className="flex-1">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
