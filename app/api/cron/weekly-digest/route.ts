import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";

// Vercel cron hits this — protected by CRON_SECRET
export async function GET(req: Request) {
  const authHeader = req.headers.get("authorization");
  if (authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const supabase = createClient();
  const since = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();

  // Fetch all active vendors
  const { data: vendors } = await supabase
    .from("vendors")
    .select("id, business_name, slug, email, notification_email, logo_url, avg_rating, review_count, subscription_tier")
    .eq("is_active", true)
    .eq("is_claimed", true);

  if (!vendors?.length) return NextResponse.json({ sent: 0 });

  let sent = 0;
  let skipped = 0;

  for (const vendor of vendors) {
    const toEmail = vendor.notification_email || vendor.email;
    if (!toEmail) { skipped++; continue; }

    // Gather this week's stats in parallel
    const [
      { count: newInquiries },
      { data: newReviews },
      { count: profileViews },
    ] = await Promise.all([
      supabase
        .from("inquiries")
        .select("*", { count: "exact", head: true })
        .eq("vendor_id", vendor.id)
        .gte("created_at", since),
      supabase
        .from("reviews")
        .select("id, rating, title, body, created_at, profiles(full_name)")
        .eq("vendor_id", vendor.id)
        .gte("created_at", since)
        .order("created_at", { ascending: false })
        .limit(3),
      supabase
        .from("vendor_views")
        .select("*", { count: "exact", head: true })
        .eq("vendor_id", vendor.id)
        .gte("viewed_at", since),
    ]);

    // Skip if no activity
    const hasActivity = (newInquiries ?? 0) > 0 || (newReviews?.length ?? 0) > 0 || (profileViews ?? 0) > 0;
    if (!hasActivity) { skipped++; continue; }

    const html = buildDigestEmail({
      vendorName: vendor.business_name,
      vendorSlug: vendor.slug,
      tier: vendor.subscription_tier,
      avgRating: vendor.avg_rating,
      totalReviews: vendor.review_count,
      newInquiries: newInquiries ?? 0,
      newReviews: (newReviews ?? []) as { rating: number; title: string | null; body: string | null; profiles: { full_name: string | null } | null }[],
      profileViews: profileViews ?? 0,
    });

    await resend.emails.send({
      from: FROM_EMAIL,
      to: toEmail,
      subject: `Your StrVend weekly recap — ${new Date().toLocaleDateString("en-US", { month: "short", day: "numeric" })}`,
      html,
    });

    sent++;
  }

  return NextResponse.json({ sent, skipped });
}

// ── Email HTML builder ────────────────────────────────────────────────────────

interface DigestData {
  vendorName: string;
  vendorSlug: string;
  tier: string;
  avgRating: number;
  totalReviews: number;
  newInquiries: number;
  newReviews: { rating: number; title: string | null; body: string | null; profiles: { full_name: string | null } | null }[];
  profileViews: number;
}

function stars(n: number) {
  return "★".repeat(Math.round(n)) + "☆".repeat(5 - Math.round(n));
}

function buildDigestEmail(d: DigestData): string {
  const dashboardUrl = `${SITE_URL}/dashboard`;
  const profileUrl   = `${SITE_URL}/vendors/${d.vendorSlug}`;
  const inquiriesUrl = `${SITE_URL}/dashboard/inquiries`;
  const upgradeUrl   = `${SITE_URL}/dashboard/upgrade`;

  const tip = d.tier === "free"
    ? `<tr>
        <td style="background:#fffbeb;border:1px solid #fde68a;border-radius:10px;padding:16px 20px;margin-bottom:24px;display:block;">
          <p style="margin:0 0 6px;font-size:13px;font-weight:700;color:#92400e;">💡 Tip: Upgrade to Pro</p>
          <p style="margin:0;font-size:13px;color:#78350f;line-height:1.6;">
            Pro vendors appear higher in search results and get a ⚡ badge.
            <a href="${upgradeUrl}" style="color:#b45309;font-weight:600;">Upgrade now →</a>
          </p>
        </td>
      </tr>`
    : `<tr>
        <td style="background:#f0fdf4;border:1px solid #bbf7d0;border-radius:10px;padding:16px 20px;margin-bottom:24px;display:block;">
          <p style="margin:0 0 6px;font-size:13px;font-weight:700;color:#166534;">💡 Tip: Add more photos</p>
          <p style="margin:0;font-size:13px;color:#15803d;line-height:1.6;">
            Listings with 5+ photos get significantly more inquiries.
            <a href="${dashboardUrl}/profile" style="color:#166534;font-weight:600;">Update your profile →</a>
          </p>
        </td>
      </tr>`;

  const reviewRows = d.newReviews.length > 0
    ? d.newReviews.map(r => `
        <tr>
          <td style="border-bottom:1px solid #f3f4f6;padding:14px 0;">
            <p style="margin:0 0 4px;font-size:13px;color:#f59e0b;letter-spacing:2px;">${stars(r.rating)}</p>
            ${r.title ? `<p style="margin:0 0 4px;font-size:14px;font-weight:600;color:#111827;">${r.title}</p>` : ""}
            ${r.body ? `<p style="margin:0 0 4px;font-size:13px;color:#6b7280;line-height:1.5;">"${r.body.slice(0, 120)}${r.body.length > 120 ? "…" : ""}"</p>` : ""}
            <p style="margin:0;font-size:12px;color:#9ca3af;">— ${r.profiles?.full_name ?? "Anonymous"}</p>
          </td>
        </tr>`).join("")
    : "";

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Your StrVend Weekly Recap</title>
</head>
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f9fafb;padding:40px 16px;">
    <tr>
      <td align="center">
        <table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%;">

          <!-- Header -->
          <tr>
            <td style="background:#0369a1;border-radius:12px 12px 0 0;padding:28px 32px;text-align:center;">
              <h1 style="margin:0;color:#ffffff;font-size:20px;font-weight:700;">StrVend</h1>
              <p style="margin:6px 0 0;color:#bae6fd;font-size:13px;">Your weekly performance recap</p>
            </td>
          </tr>

          <!-- Body -->
          <tr>
            <td style="background:#ffffff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">

              <p style="margin:0 0 24px;font-size:15px;color:#374151;">
                Hi <strong>${d.vendorName}</strong>, here's what happened on your listing this week.
              </p>

              <!-- Stats row -->
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:28px;">
                <tr>
                  <td width="33%" style="text-align:center;padding:16px 8px;background:#f0f9ff;border-radius:10px;border:1px solid #bae6fd;">
                    <p style="margin:0 0 4px;font-size:28px;font-weight:700;color:#0369a1;">${d.profileViews}</p>
                    <p style="margin:0;font-size:12px;color:#0284c7;font-weight:500;">Profile Views</p>
                  </td>
                  <td width="4%"></td>
                  <td width="33%" style="text-align:center;padding:16px 8px;background:#f0f9ff;border-radius:10px;border:1px solid #bae6fd;">
                    <p style="margin:0 0 4px;font-size:28px;font-weight:700;color:#0369a1;">${d.newInquiries}</p>
                    <p style="margin:0;font-size:12px;color:#0284c7;font-weight:500;">New Inquiries</p>
                  </td>
                  <td width="4%"></td>
                  <td width="33%" style="text-align:center;padding:16px 8px;background:#f0f9ff;border-radius:10px;border:1px solid #bae6fd;">
                    <p style="margin:0 0 4px;font-size:28px;font-weight:700;color:#0369a1;">${d.newReviews.length}</p>
                    <p style="margin:0;font-size:12px;color:#0284c7;font-weight:500;">New Reviews</p>
                  </td>
                </tr>
              </table>

              ${d.newInquiries > 0 ? `
              <!-- Inquiries CTA -->
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:24px;">
                <tr>
                  <td style="background:#f8fafc;border:1px solid #e2e8f0;border-radius:10px;padding:16px 20px;">
                    <p style="margin:0 0 8px;font-size:14px;font-weight:600;color:#1e293b;">
                      📬 ${d.newInquiries} new ${d.newInquiries === 1 ? "inquiry" : "inquiries"} waiting
                    </p>
                    <p style="margin:0 0 12px;font-size:13px;color:#64748b;line-height:1.5;">
                      Responding within 24 hours significantly improves your conversion rate.
                    </p>
                    <a href="${inquiriesUrl}"
                      style="display:inline-block;background:#0369a1;color:#ffffff;font-size:13px;font-weight:600;
                             text-decoration:none;padding:8px 18px;border-radius:7px;">
                      View Inquiries →
                    </a>
                  </td>
                </tr>
              </table>` : ""}

              ${d.newReviews.length > 0 ? `
              <!-- New reviews -->
              <p style="margin:0 0 12px;font-size:14px;font-weight:600;color:#111827;">New reviews this week</p>
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:24px;">
                ${reviewRows}
              </table>
              <a href="${profileUrl}"
                style="display:inline-block;background:#ffffff;color:#0369a1;font-size:13px;font-weight:600;
                       text-decoration:none;padding:8px 18px;border-radius:7px;border:1px solid #bae6fd;margin-bottom:24px;">
                View your listing →
              </a>` : ""}

              <!-- Rating summary -->
              ${d.totalReviews > 0 ? `
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:24px;">
                <tr>
                  <td style="background:#fafafa;border:1px solid #e5e7eb;border-radius:10px;padding:14px 20px;">
                    <p style="margin:0;font-size:13px;color:#374151;">
                      Overall rating: <strong style="color:#f59e0b;">${stars(d.avgRating)}</strong>
                      <span style="color:#6b7280;">${d.avgRating.toFixed(1)} from ${d.totalReviews} review${d.totalReviews !== 1 ? "s" : ""}</span>
                    </p>
                  </td>
                </tr>
              </table>` : ""}

              <!-- Tip -->
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:8px;">
                ${tip}
              </table>

            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;
                       padding:20px 32px;text-align:center;">
              <p style="margin:0 0 6px;font-size:12px;color:#9ca3af;">
                <a href="${dashboardUrl}" style="color:#0369a1;">Dashboard</a> ·
                <a href="${profileUrl}" style="color:#0369a1;">Your Listing</a>
              </p>
              <p style="margin:0;font-size:12px;color:#9ca3af;">
                © ${new Date().getFullYear()} StrVend · You're receiving this because you're a listed vendor.
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>`;
}
