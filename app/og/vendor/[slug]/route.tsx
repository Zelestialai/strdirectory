import { ImageResponse } from "next/og";
import { supabaseAdmin } from "@/lib/supabase/admin";

export async function GET(_req: Request, { params }: { params: { slug: string } }) {
  const { data: v } = await supabaseAdmin
    .from("vendors")
    .select("business_name, tagline, description, city, state, avg_rating, review_count, category:categories(name), subscription_tier, is_verified")
    .eq("slug", params.slug)
    .single();

  const name        = v?.business_name ?? "STR Pro Directory";
  const tagline     = v?.tagline ?? v?.description?.slice(0, 90) ?? "";
  const location    = v?.city ? `${v.city}${v.state ? `, ${v.state}` : ""}` : "";
  const category    = (v?.category as { name: string }[] | null)?.[0]?.name ?? "";
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
        {/* Subtle dot grid */}
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

        {/* Branding — top right */}
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
          <span style={{ color: "rgba(255,255,255,0.5)", fontSize: "15px", letterSpacing: "0.05em" }}>
            STR Pro Directory
          </span>
        </div>

        {/* Main content */}
        <div style={{ display: "flex", flexDirection: "column", flex: 1, justifyContent: "center", gap: "18px", zIndex: 1 }}>

          {/* Badges row */}
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            {category ? (
              <div
                style={{
                  background: "rgba(59,130,246,0.2)",
                  border: "1px solid rgba(59,130,246,0.4)",
                  borderRadius: "100px",
                  padding: "5px 14px",
                  color: "#93c5fd",
                  fontSize: "14px",
                  fontWeight: 600,
                }}
              >
                {category}
              </div>
            ) : null}
            {isFeatured ? (
              <div
                style={{
                  background: "rgba(251,191,36,0.2)",
                  border: "1px solid rgba(251,191,36,0.4)",
                  borderRadius: "100px",
                  padding: "5px 14px",
                  color: "#fbbf24",
                  fontSize: "14px",
                  fontWeight: 600,
                }}
              >
                ★ Featured
              </div>
            ) : null}
            {isPro && !isFeatured ? (
              <div
                style={{
                  background: "rgba(99,102,241,0.2)",
                  border: "1px solid rgba(99,102,241,0.4)",
                  borderRadius: "100px",
                  padding: "5px 14px",
                  color: "#a5b4fc",
                  fontSize: "14px",
                  fontWeight: 600,
                }}
              >
                Pro
              </div>
            ) : null}
            {isVerified ? (
              <div style={{ color: "#60a5fa", fontSize: "18px" }}>✓ Verified</div>
            ) : null}
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
          {tagline ? (
            <div
              style={{
                color: "rgba(255,255,255,0.6)",
                fontSize: "22px",
                lineHeight: 1.4,
                maxWidth: "800px",
              }}
            >
              {tagline.length > 100 ? tagline.slice(0, 97) + "…" : tagline}
            </div>
          ) : null}

          {/* Location + rating */}
          <div style={{ display: "flex", alignItems: "center", gap: "28px", marginTop: "8px" }}>
            {location ? (
              <div style={{ display: "flex", alignItems: "center", gap: "6px", color: "rgba(255,255,255,0.45)", fontSize: "17px" }}>
                <span>📍</span>
                <span>{location}</span>
              </div>
            ) : null}
            {rating > 0 ? (
              <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
                <span style={{ color: "#fbbf24", fontSize: "20px" }}>{stars}</span>
                <span style={{ color: "rgba(255,255,255,0.65)", fontSize: "17px" }}>
                  {rating.toFixed(1)}{reviewCount > 0 ? ` (${reviewCount})` : ""}
                </span>
              </div>
            ) : null}
          </div>
        </div>

        {/* Footer */}
        <div
          style={{
            position: "absolute",
            bottom: "28px",
            left: "60px",
            color: "rgba(255,255,255,0.25)",
            fontSize: "13px",
            letterSpacing: "0.08em",
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
