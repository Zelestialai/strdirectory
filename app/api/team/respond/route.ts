import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";

export async function POST(req: NextRequest) {
  try {
    const supabase = createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const { team_member_id, status } = await req.json();
    if (!team_member_id || !["accepted", "declined"].includes(status)) {
      return NextResponse.json({ error: "Invalid request" }, { status: 400 });
    }

    // Fetch the invite to verify this vendor owns it
    const { data: member } = await supabase
      .from("team_members")
      .select("*, host:host_id(full_name, email), vendor:vendor_id(business_name)")
      .eq("id", team_member_id)
      .eq("vendor_user_id", user.id)
      .single();

    if (!member) return NextResponse.json({ error: "Invitation not found" }, { status: 404 });
    if (member.status !== "pending") {
      return NextResponse.json({ error: "Already responded to this invitation" }, { status: 400 });
    }

    const { data: updated, error } = await supabase
      .from("team_members")
      .update({ status, responded_at: new Date().toISOString() })
      .eq("id", team_member_id)
      .select()
      .single();

    if (error) return NextResponse.json({ error: error.message }, { status: 500 });

    // Notify the host if vendor accepted
    if (status === "accepted") {
      const hostEmail = (member.host as unknown as { email: string } | null)?.email;
      const hostName = (member.host as unknown as { full_name: string } | null)?.full_name ?? "there";
      const vendorName = (member.vendor as unknown as { business_name: string } | null)?.business_name ?? "A vendor";

      if (hostEmail) {
        await resend.emails.send({
          from: FROM_EMAIL,
          to: hostEmail,
          subject: `${vendorName} accepted your team invitation — StrVend`,
          html: `
<!DOCTYPE html>
<html lang="en">
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f9fafb;padding:40px 16px;">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%;">
        <tr>
          <td style="background:#0d9488;border-radius:12px 12px 0 0;padding:28px 32px;text-align:center;">
            <h1 style="margin:0;color:#fff;font-size:20px;font-weight:700;">StrVend</h1>
            <p style="margin:6px 0 0;color:#99f6e4;font-size:13px;">Team update</p>
          </td>
        </tr>
        <tr>
          <td style="background:#fff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">
            <p style="margin:0 0 16px;font-size:15px;color:#374151;">Hi <strong>${hostName}</strong>,</p>
            <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
              Great news — <strong>${vendorName}</strong> has accepted your team invitation!
              You can now message them directly from your host dashboard.
            </p>
            <a href="${SITE_URL}/host/dashboard/team" style="display:inline-block;background:#0d9488;color:#fff;font-size:14px;font-weight:600;text-decoration:none;padding:12px 24px;border-radius:8px;">
              View My Team →
            </a>
          </td>
        </tr>
        <tr>
          <td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;padding:16px 32px;text-align:center;">
            <p style="margin:0;font-size:12px;color:#9ca3af;">© ${new Date().getFullYear()} StrVend</p>
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>`,
        }).catch(() => {});
      }
    }

    return NextResponse.json({ member: updated });
  } catch (err) {
    console.error("Team respond error:", err);
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
