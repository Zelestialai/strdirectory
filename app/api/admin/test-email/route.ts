import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { resend, FROM_EMAIL } from "@/lib/email";
import { getAdminEmails } from "@/lib/admin-notify";

export const runtime = "nodejs";

/**
 * Admin-only email diagnostic. Visit /api/admin/test-email while signed in as an
 * admin. Returns a JSON report of the email configuration and attempts a real
 * send to the admin recipients, surfacing any Resend error directly.
 */
export async function GET() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Not signed in" }, { status: 401 });

  const { data: me } = await supabaseAdmin
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();
  if (me?.role !== "admin") {
    return NextResponse.json({ error: "Admins only" }, { status: 403 });
  }

  const report: Record<string, unknown> = {
    hasResendApiKey: !!process.env.RESEND_API_KEY,
    resendKeyPrefix: process.env.RESEND_API_KEY?.slice(0, 5) ?? null,
    hasServiceRoleKey: !!process.env.SUPABASE_SERVICE_ROLE_KEY,
    fromEmail: FROM_EMAIL,
    siteUrl: process.env.NEXT_PUBLIC_SITE_URL ?? null,
  };

  let recipients: string[] = [];
  try {
    recipients = await getAdminEmails();
  } catch (e) {
    report.getAdminEmailsError = e instanceof Error ? e.message : String(e);
  }
  report.recipientCount = recipients.length;
  report.recipients = recipients;

  if (!process.env.RESEND_API_KEY) {
    report.result = "SKIPPED — RESEND_API_KEY missing";
    return NextResponse.json(report, { status: 200 });
  }
  if (recipients.length === 0) {
    report.result = "SKIPPED — no admin recipients (no profiles with role='admin', or SUPABASE_SERVICE_ROLE_KEY is wrong)";
    return NextResponse.json(report, { status: 200 });
  }

  try {
    const { data, error } = await resend.emails.send({
      from: FROM_EMAIL,
      to: recipients,
      subject: "STRVend email test ✅",
      html: `<p>This is a STRVend email configuration test. If you received this, notification emails are working.</p>`,
    });
    if (error) {
      report.result = "RESEND_REJECTED";
      report.resendError = error;
    } else {
      report.result = "SENT";
      report.messageId = data?.id ?? null;
    }
  } catch (e) {
    report.result = "SEND_THREW";
    report.sendError = e instanceof Error ? e.message : String(e);
  }

  return NextResponse.json(report, { status: 200 });
}
