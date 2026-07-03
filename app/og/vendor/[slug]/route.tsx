import { ImageResponse } from "next/og";
import { createClient } from "@/lib/supabase/server";

export const runtime = "edge";

export async function GET(_req: Request, { params }: { params: { slug: string } }) {
  const supabase = createClient();

  const { data: v } = await supabase
    .from("vendors")
    .select("business_name, tagline, description, city, state, avg_rating, review_count, category:categories(name), subscription_tier, is_verified")
    .eq("slug", params.slug)
    .single();

  const name        = v?.business_name ?? "STR Pro Directory";
  const tagline     = v?.tagline ?? v?.description?.slice(0, 90) ?? "";
  const location    = v?.city ? `${v.city}${v.state ? `, ${v.state}` : ""}` : "";
  const category    = (v?.category as { name: string } | null)?.name ?? "";
  const rating      = v?.avg_rating ?? 0;
  const reviewCount = v?.review_count ?? 0;
  const isFeatured  = v?.subscription_tier === "featured";
  const isPro       = v?.subscription_tier === "pro";
  const isVerified  = v?.is_verified ?? false;

  const stars = rating > 0
    ? "★".repeat(Math.round(rating)) + "☆".repeat(5 - Math.round(rating))
    : "";

  return new ImageResponse(
    (
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          width: "1200px",
          height: "630px",
          background: "linear-gradient(135deg, #0f172a 0%, #1e3a5f 60%, #0f2e4e 100%)",
          padding: "60px",
          fontFamily: "sans-serif",
          position: "relative",
        }}
      >
        {/* Subtle grid pattern overlay */}
        <div
          style={{
            position: "absolute",
            inset: 0,
            backgroundImage: "radial-gradient(circle at 1px 1px, rgba(255,255,255,0.05) 1px, transparent 0)",
            backgroundSize: "40px 40px",
          }}
        />

        {/* Top accent line */}
        <div
          style={{
            position: "absolute",
            top: 0,
            left: 0,
            right: 0,
            height: "5px",
            background: "linear-gradient(90deg, #3b82f6, #6366f1, #8b5cf6)",
          }}
        />

        {/* STR Pro Directory watermark top-right */}
        <div
          style={{
            position: "absolute",
            top: "30px",
            right: "60px",
            display: "flex",
            alignItems: "center",
            gap: "8px",
          }}
        >
          <div
            style={{
              width: "28px",
              height: "28px",
              borderRadius: "8px",
              background: "linear-gradient(135deg, #3b82f6, #6366f1)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              fontSize: "16px",
              color: "white",
            }}
          >
            ⌂
          </div>
          <span style={{ color: "rgba(255,255,255,0.6)", fontSize: "16px", letterSpacing: "0.05em" }}>
            STR Pro Directory
          </span>
        </div>

        {/* Content */}
        <div style={{ display: "flex", flexDirection: "column", flex: 1, justifyContent: "center", gap: "20px", zIndex: 1 }}>

          {/* Category + tier badge row */}
          <div style={{ display: "flex", alignItems: "center", gap: "12px" }}>
            {category && (
              <div
                style={{
                  background: "rgba(59,130,246,0.2)",
                  border: "1px solid rgba(59,130,246,0.4)",
                  borderRadius: "100px",
                  padding: "6px 16px",
                  color: "#93c5fd",
                  fontSize: "15px",
                  fontWeight: 600,
                }}
              >
                {category}
              </div>
            )}
            {isFeatured && (
              <div
                style={{
                  background: "rgba(251,191,36,0.2)",
                  border: "1px solid rgba(251,191,36,0.4)",
                  borderRadius: "100px",
                  padding: "6px 16px",
                  color: "#fbbf24",
                  fontSize: "15px",
                  fontWeight: 600,
                }}
              >
                ★ Featured
              </div>
            )}
            {isPro && !isFeatured && (
              <div
                style={{
                  background: "rgba(99,102,241,0.2)",
                  border: "1px solid rgba(99,102,241,0.4)",
                  borderRadius: "100px",
                  padding: "6px 16px",
                  color: "#a5b4fc",
                  fontSize: "15px",
                  fontWeight: 600,
                }}
              >
                Pro
              </div>
            )}
            {isVerified && (
              <div style={{ color: "#60a5fa", fontSize: "20px" }}>✓</div>
            )}
          </div>

          {/* Business name */}
          <div
            style={{
              color: "white",
              fontSize: name.length > 30 ? "52px" : "64px",
              fontWeight: 800,
              lineHeight: 1.1,
              letterSpacing: "-0.02em",
            }}
          >
            {name}
          </div>

          {/* Tagline */}
          {tagline && (
            <div
              style={{
                color: "rgba(255,255,255,0.65)",
                fontSize: "22px",
                lineHeight: 1.4,
                maxWidth: "800px",
              }}
            >
              {tagline.length > 100 ? tagline.slice(0, 97) + "…" : tagline}
            </div>
          )}

          {/* Bottom row: location + rating */}
          <div style={{ display: "flex", alignItems: "center", gap: "32px", marginTop: "12px" }}>
            {location && (
              <div style={{ display: "flex", alignItems: "center", gap: "8px", color: "rgba(255,255,255,0.5)", fontSize: "18px" }}>
                <span>📍</span> {location}
              </div>
            )}
            {rating > 0 && (
              <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
                <span style={{ color: "#fbbf24", fontSize: "22px", letterSpacing: "2px" }}>{stars}</span>
                <span style={{ color: "rgba(255,255,255,0.7)", fontSize: "18px" }}>
                  {rating.toFixed(1)} {reviewCount > 0 ? `(${reviewCount} review${reviewCount !== 1 ? "s" : ""})` : ""}
                </span>
              </div>
            )}
          </div>
        </div>

        {/* Bottom tagline */}
        <div
          style={{
            position: "absolute",
            bottom: "30px",
            left: "60px",
            color: "rgba(255,255,255,0.3)",
            fontSize: "14px",
            letterSpacing: "0.1em",
            textTransform: "uppercase",
          }}
        >
          strprodirectory.com
        </div>
      </div>
    ),
    { width: 1200, height: 630 }
  );
}
