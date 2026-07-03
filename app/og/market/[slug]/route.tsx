import { ImageResponse } from "next/og";
import { createClient } from "@/lib/supabase/server";

export const runtime = "edge";

export async function GET(_req: Request, { params }: { params: { slug: string } }) {
  const supabase = createClient();

  const { data: market } = await supabase
    .from("markets")
    .select("name, state, tagline, description, vendor_count")
    .eq("slug", params.slug)
    .single();

  const name        = market?.name ?? "STR Pro Directory";
  const state       = market?.state ?? "";
  const tagline     = market?.tagline ?? market?.description?.slice(0, 100) ?? `Find trusted STR service providers in ${name}.`;
  const vendorCount = market?.vendor_count ?? 0;

  return new ImageResponse(
    (
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          width: "1200px",
          height: "630px",
          background: "linear-gradient(135deg, #0f172a 0%, #1a3a2e 60%, #0d2b22 100%)",
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
            background: "linear-gradient(90deg, #10b981, #059669, #047857)",
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
              background: "linear-gradient(135deg, #10b981, #059669)",
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

          {/* Location label */}
          <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
            <div
              style={{
                background: "rgba(16,185,129,0.2)",
                border: "1px solid rgba(16,185,129,0.4)",
                borderRadius: "100px",
                padding: "6px 16px",
                color: "#6ee7b7",
                fontSize: "15px",
                fontWeight: 600,
                display: "flex",
                alignItems: "center",
                gap: "6px",
              }}
            >
              📍 {state ? `${name}, ${state}` : name}
            </div>
            {vendorCount > 0 && (
              <div
                style={{
                  background: "rgba(255,255,255,0.08)",
                  border: "1px solid rgba(255,255,255,0.15)",
                  borderRadius: "100px",
                  padding: "6px 16px",
                  color: "rgba(255,255,255,0.6)",
                  fontSize: "15px",
                  fontWeight: 500,
                }}
              >
                {vendorCount} vendor{vendorCount !== 1 ? "s" : ""}
              </div>
            )}
          </div>

          {/* Market name */}
          <div
            style={{
              color: "white",
              fontSize: name.length > 25 ? "56px" : "72px",
              fontWeight: 800,
              lineHeight: 1.05,
              letterSpacing: "-0.02em",
            }}
          >
            {name}
          </div>

          {/* Subtitle */}
          <div
            style={{
              color: "rgba(255,255,255,0.65)",
              fontSize: "22px",
              lineHeight: 1.4,
              maxWidth: "860px",
            }}
          >
            {tagline.length > 110 ? tagline.slice(0, 107) + "…" : tagline}
          </div>

          {/* Services row */}
          <div style={{ display: "flex", gap: "10px", marginTop: "8px", flexWrap: "wrap" }}>
            {["Cleaning", "Photography", "Property Mgmt", "Maintenance", "Interior Design"].map((s) => (
              <div
                key={s}
                style={{
                  background: "rgba(255,255,255,0.06)",
                  border: "1px solid rgba(255,255,255,0.12)",
                  borderRadius: "8px",
                  padding: "5px 12px",
                  color: "rgba(255,255,255,0.45)",
                  fontSize: "13px",
                }}
              >
                {s}
              </div>
            ))}
            <div
              style={{
                background: "rgba(255,255,255,0.06)",
                border: "1px solid rgba(255,255,255,0.12)",
                borderRadius: "8px",
                padding: "5px 12px",
                color: "rgba(255,255,255,0.45)",
                fontSize: "13px",
              }}
            >
              + more
            </div>
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
