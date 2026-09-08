import { supabaseAdmin } from "@/lib/supabase/admin";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";

/** Email addresses of every account with role = 'admin'. */
export async function getAdminEmails(): Promise<string[]> {
  const { data: admins } = await supabaseAdmin
    .from("profiles")
    .select("id")
    .eq("role", "admin");
  const ids = new Set((admins ?? []).map((a) => a.id as string));
  if (ids.size === 0) return [];

  const emails: string[] = [];
  let page = 1;
  // Match admin profile ids to their auth emails (paginated for safety).
  for (;;) {
    const { data, error } = await supabaseAdmin.auth.admin.listUsers({ page, perPage: 200 });
    if (error || !data) break;
    for (const u of data.users) if (ids.has(u.id) && u.email) emails.push(u.email);
    if (data.users.length < 200) break;
    page++;
    if (page > 20) break;
  }
  return Array.from(new Set(emails));
}

/** True if an auth user with this email was created in the last `withinMin` minutes. */
export async function isRecentSignup(email: string, withinMin = 30): Promise<boolean> {
  const target = email.trim().toLowerCase();
  const cutoff = Date.now() - withinMin * 60_000;
  let page = 1;
  for (;;) {
    const { data, error } = await supabaseAdmin.auth.admin.listUsers({ page, perPage: 200 });
    if (error || !data) return false;
    const hit = data.users.find((u) => (u.email ?? "").toLowerCase() === target);
    if (hit) return new Date(hit.created_at).getTime() >= cutoff;
    if (data.users.length < 200) return false;
    page++;
    if (page > 20) return false;
  }
}

export interface SignupNotice {
  kind: "user" | "host" | "vendor";
  fullName?: string | null;
  email?: string | null;
  businessName?: string | null;
  categoryName?: string | null;
  market?: string | null;
}

function esc(s: string) {
  return s.replace(/[<>&]/g, (c) => ({ "<": "&lt;", ">": "&gt;", "&": "&amp;" }[c] ?? c));
}

export async function notifyAdminsOfSignup(n: SignupNotice): Promise<void> {
  const to = await getAdminEmails();
  if (to.length === 0) return;

  const title =
    n.kind === "vendor" ? "New vendor pending approval"
    : n.kind === "host" ? "New host registered"
    : "New user registered";

  const rows = [
    n.businessName && ["Business", n.businessName],
    n.fullName && ["Name", n.fullName],
    n.email && ["Email", n.email],
    n.categoryName && ["Category", n.categoryName],
    n.market && ["Market", n.market],
  ]
    .filter(Boolean)
    .map(
      (r) =>
        `<tr><td style="padding:6px 12px;color:#6b7280;font-size:13px;">${(r as string[])[0]}</td><td style="padding:6px 12px;color:#111827;font-size:14px;font-weight:500;">${esc((r as string[])[1])}</td></tr>`
    )
    .join("");

  const adminUrl = `${SITE_URL}/admin/vendors${n.kind === "vendor" ? "?filter=pending" : ""}`;

  const html = `<!DOCTYPE html><html><body style="margin:0;background:#f9fafb;font-family:-apple-system,Segoe UI,Roboto,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="padding:32px 16px;"><tr><td align="center">
    <table width="560" cellpadding="0" cellspacing="0" style="max-width:560px;width:100%;">
      <tr><td style="background:#0d9488;border-radius:12px 12px 0 0;padding:24px 28px;text-align:center;">
        <h1 style="margin:0;color:#fff;font-size:18px;">STRVend</h1>
        <p style="margin:6px 0 0;color:#99f6e4;font-size:13px;">${title}</p>
      </td></tr>
      <tr><td style="background:#fff;padding:24px 28px;border:1px solid #e5e7eb;border-top:none;">
        <table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #e5e7eb;border-radius:10px;">${rows || `<tr><td style="padding:12px;color:#6b7280;">A new account just registered.</td></tr>`}</table>
        <div style="margin-top:20px;">
          <a href="${adminUrl}" style="display:inline-block;background:#0d9488;color:#fff;font-size:14px;font-weight:600;text-decoration:none;padding:10px 20px;border-radius:8px;">Open Admin</a>
        </div>
      </td></tr>
      <tr><td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;padding:16px 28px;text-align:center;">
        <p style="margin:0;font-size:12px;color:#9ca3af;">Automated admin notification · © ${new Date().getFullYear()} STRVend</p>
      </td></tr>
    </table>
  </td></tr></table></body></html>`;

  try {
    await resend.emails.send({ from: FROM_EMAIL, to, subject: `${title} — STRVend`, html });
  } catch {
    /* email failures must never block the user flow */
  }
}
