import { Resend } from "resend";

export const resend = new Resend(process.env.RESEND_API_KEY);

export const FROM_EMAIL = process.env.RESEND_FROM_EMAIL ?? "StrVend <noreply@strvend.com>";
export const SITE_URL   = process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000";

export interface InquiryEmailData {
  vendorName:   string;
  vendorEmail:  string;
  vendorSlug:   string;
  senderName:   string;
  senderEmail:  string;
  senderPhone?: string | null;
  message:      string;
}

export async function sendInquiryNotification(data: InquiryEmailData) {
  const dashboardUrl = `${SITE_URL}/dashboard/inquiries`;
  const profileUrl   = `${SITE_URL}/vendors/${data.vendorSlug}`;

  const html = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>New Inquiry</title>
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
              <p style="margin:6px 0 0;color:#bae6fd;font-size:13px;">New inquiry received</p>
            </td>
          </tr>

          <!-- Body -->
          <tr>
            <td style="background:#ffffff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">
              <p style="margin:0 0 20px;font-size:15px;color:#374151;">
                Hi <strong>${data.vendorName}</strong>,
              </p>
              <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
                You have a new inquiry from <strong>${data.senderName}</strong> on your StrVend listing.
              </p>

              <!-- Sender info card -->
              <table width="100%" cellpadding="0" cellspacing="0"
                style="background:#f0f9ff;border:1px solid #bae6fd;border-radius:10px;padding:20px;margin-bottom:24px;">
                <tr>
                  <td>
                    <p style="margin:0 0 6px;font-size:12px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:#0369a1;">From</p>
                    <p style="margin:0 0 4px;font-size:15px;font-weight:600;color:#0c4a6e;">${data.senderName}</p>
                    <p style="margin:0 0 4px;font-size:13px;color:#0369a1;">
                      <a href="mailto:${data.senderEmail}" style="color:#0369a1;">${data.senderEmail}</a>
                    </p>
                    ${data.senderPhone ? `<p style="margin:0;font-size:13px;color:#0369a1;">${data.senderPhone}</p>` : ""}
                  </td>
                </tr>
              </table>

              <!-- Message -->
              <p style="margin:0 0 8px;font-size:12px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:#6b7280;">Message</p>
              <div style="background:#f9fafb;border:1px solid #e5e7eb;border-radius:10px;padding:16px 20px;margin-bottom:28px;">
                <p style="margin:0;font-size:14px;color:#374151;line-height:1.7;white-space:pre-wrap;">${data.message}</p>
              </div>

              <!-- CTA buttons -->
              <table cellpadding="0" cellspacing="0">
                <tr>
                  <td style="padding-right:12px;">
                    <a href="mailto:${data.senderEmail}?subject=Re: Your inquiry on StrVend"
                      style="display:inline-block;background:#0369a1;color:#ffffff;font-size:14px;font-weight:600;
                             text-decoration:none;padding:10px 20px;border-radius:8px;">
                      Reply to ${data.senderName}
                    </a>
                  </td>
                  <td>
                    <a href="${dashboardUrl}"
                      style="display:inline-block;background:#ffffff;color:#0369a1;font-size:14px;font-weight:600;
                             text-decoration:none;padding:10px 20px;border-radius:8px;border:1px solid #bae6fd;">
                      View Dashboard
                    </a>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;
                       padding:20px 32px;text-align:center;">
              <p style="margin:0 0 6px;font-size:12px;color:#9ca3af;">
                This email was sent because someone contacted you via
                <a href="${profileUrl}" style="color:#0369a1;">your StrVend listing</a>.
              </p>
              <p style="margin:0;font-size:12px;color:#9ca3af;">
                © ${new Date().getFullYear()} StrVend
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>`;

  return resend.emails.send({
    from:    FROM_EMAIL,
    to:      data.vendorEmail,
    subject: `New inquiry from ${data.senderName} — StrVend`,
    html,
  });
}

// ─── Vendor Claim Verification ────────────────────────────────────────────────

export interface ClaimEmailData {
  contactName: string;
  vendorName:  string;
  email:       string;
  verifyUrl:   string;
}

export async function sendClaimVerificationEmail(data: ClaimEmailData) {
  const html = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Verify your listing claim</title>
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
              <p style="margin:6px 0 0;color:#bae6fd;font-size:13px;">Verify your listing claim</p>
            </td>
          </tr>

          <!-- Body -->
          <tr>
            <td style="background:#ffffff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">
              <p style="margin:0 0 20px;font-size:15px;color:#374151;">
                Hi <strong>${data.contactName}</strong>,
              </p>
              <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
                You requested to claim the listing for <strong>${data.vendorName}</strong> on StrVend.
                Click the button below to verify your email and instantly claim your listing.
              </p>

              <!-- CTA -->
              <table cellpadding="0" cellspacing="0" style="margin:0 0 28px;">
                <tr>
                  <td>
                    <a href="${data.verifyUrl}"
                      style="display:inline-block;background:#0369a1;color:#ffffff;font-size:15px;font-weight:600;
                             text-decoration:none;padding:14px 28px;border-radius:8px;">
                      Verify &amp; Claim My Listing
                    </a>
                  </td>
                </tr>
              </table>

              <!-- Info box -->
              <table width="100%" cellpadding="0" cellspacing="0"
                style="background:#f0f9ff;border:1px solid #bae6fd;border-radius:10px;padding:16px 20px;margin-bottom:24px;">
                <tr>
                  <td>
                    <p style="margin:0 0 8px;font-size:13px;color:#0c4a6e;line-height:1.6;">
                      <strong>What happens next:</strong>
                    </p>
                    <ul style="margin:0;padding-left:18px;font-size:13px;color:#0369a1;line-height:1.8;">
                      <li>Your listing will be claimed and linked to a new vendor account</li>
                      <li>You'll be automatically signed in to your dashboard</li>
                      <li>You can then edit your profile, add photos, and respond to inquiries</li>
                    </ul>
                  </td>
                </tr>
              </table>

              <p style="margin:0;font-size:13px;color:#6b7280;line-height:1.6;">
                This link expires in <strong>24 hours</strong>. If you did not request this,
                you can safely ignore this email.
              </p>
            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;
                       padding:20px 32px;text-align:center;">
              <p style="margin:0 0 6px;font-size:12px;color:#9ca3af;">
                Or copy this link: <a href="${data.verifyUrl}" style="color:#0369a1;word-break:break-all;">${data.verifyUrl}</a>
              </p>
              <p style="margin:0;font-size:12px;color:#9ca3af;">
                © ${new Date().getFullYear()} StrVend
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>`;

  return resend.emails.send({
    from:    FROM_EMAIL,
    to:      data.email,
    subject: `Verify your claim for ${data.vendorName} — StrVend`,
    html,
  });
}
