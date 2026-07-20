import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";

export async function POST(req: NextRequest) {
  try {
    const supabase = createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const { vendor_id } = await req.json();
    if (!vendor_id) return NextResponse.json({ error: "Missing vendor_id" }, { status: 400 });

    // Get vendor info + email
    const { data: vendor } = await supabase
      .from("vendors")
      .select("id, business_name, email, user_id, profiles:user_id(full_name, email)")
      .eq("id", vendor_id)
      .single();

    if (!vendor) return NextResponse.json({ error: "Vendor not found" }, { status: 404 });

    // Get host profile
    const { data: hostProfile } = await supabase
      .from("profiles")
      .select("full_name, email")
      .eq("id", user.id)
      .single();

    // Upsert invite (if already declined, allow re-invite)
    const { data: member, error } = await supabase
      .from("team_members")
      .upsert(
        {
          host_id: user.id,
          vendor_id: vendor.id,
          vendor_user_id: vendor.user_id ?? null,
          status: "pending",
          invited_at: new Date().toISOString(),
          responded_at: null,
        },
        { onConflict: "host_id,vendor_id" }
      )
      .select()
      .single();

    if (error) return NextResponse.json({ error: error.message }, { status: 500 });

    // Send email notification to vendor (only if they have a user account)
    const vendorEmail = (vendor.profiles as { email: string } | null)?.email ?? vendor.email;
    if (vendorEmail && vendor.user_id) {
      const dashboardUrl = `${SITE_URL}/dashboard/team`;
      await resend.emails.send({
        from: FROM_EMAIL,
        to: vendorEmail,
        subject: `${hostProfile?.full_name ?? "A host"} invited you to their STR team — StrVend`,
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
            <p style="margin:6px 0 0;color:#99f6e4;font-size:13px;">Team invitation</p>
          </td>
        </tr>
        <tr>
          <td style="background:#fff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">
            <p style="margin:0 0 16px;font-size:15px;color:#374151;">
              Hi <strong>${(vendor.profiles as { full_name: string } | null)?.full_name ?? vendor.business_name}</strong>,
            </p>
            <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
              <strong>${hostProfile?.full_name ?? "A host"}</strong> has invited you to join their STR vendor team on StrVend.
              As a team member, you'll be able to communicate directly with this host through your StrVend dashboard.
            </p>
            <table cellpadding="0" cellspacing="0">
              <tr>
                <td style="padding-right:12px;">
                  <a href="${dashboardUrl}" style="display:inline-block;background:#0d9488;color:#fff;font-size:14px;font-weight:600;text-decoration:none;padding:12px 24px;border-radius:8px;">
                    View Invitation →
                  </a>
                </td>
              </tr>
            </table>
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
      }).catch(() => {}); // don't fail the request if email fails
    }

    return NextResponse.json({ member }, { status: 201 });
  } catch (err) {
    console.error("Team invite error:", err);
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
