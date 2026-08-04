import { supabaseAdmin } from "@/lib/supabase/admin";
import { createNotification } from "@/lib/notifications";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";
import { snapshotChecklistToTurnover } from "@/lib/checklist";

const CLEANING_SLUG = "cleaning-turnover";

export interface CreateTurnoverInput {
  hostId: string;
  title: string;
  scheduledDate: string; // YYYY-MM-DD
  propertyId?: string | null;
  calendarEventId?: string | null;
  notes?: string | null;
  priceCents?: number | null;
  marketSlug?: string | null;
}

/**
 * Find an accepted cleaning vendor on the host's team, if any.
 */
async function findTeamCleaner(hostId: string): Promise<{
  vendor_id: string;
  business_name: string;
  user_id: string | null;
  email: string | null;
} | null> {
  const { data } = await supabaseAdmin
    .from("team_members")
    .select(
      "vendor_id, vendors!inner(id, business_name, user_id, email, category:categories(slug))"
    )
    .eq("host_id", hostId)
    .eq("status", "accepted");

  const match = (data ?? []).find(
    (m) => (m.vendors as any)?.category?.slug === CLEANING_SLUG
  );
  if (!match) return null;
  const v = match.vendors as any;
  return { vendor_id: v.id, business_name: v.business_name, user_id: v.user_id, email: v.email };
}

/**
 * Create a turnover task. Auto-assigns to a team cleaner if the host has one,
 * otherwise broadcasts it as an open job for cleaners to bid on.
 * Idempotent per calendar_event_id (used by auto-generation).
 */
export async function createTurnoverTask(input: CreateTurnoverInput) {
  // Skip if a task already exists for this synced checkout
  if (input.calendarEventId) {
    const { data: existing } = await supabaseAdmin
      .from("turnover_tasks")
      .select("id")
      .eq("calendar_event_id", input.calendarEventId)
      .maybeSingle();
    if (existing) return null;
  }

  const cleaner = await findTeamCleaner(input.hostId);

  const row = {
    host_id: input.hostId,
    property_id: input.propertyId ?? null,
    calendar_event_id: input.calendarEventId ?? null,
    title: input.title,
    notes: input.notes ?? null,
    scheduled_date: input.scheduledDate,
    price_cents: input.priceCents ?? null,
    market_slug: input.marketSlug ?? null,
    status: cleaner ? "assigned" : "open",
    assigned_vendor_id: cleaner?.vendor_id ?? null,
  };

  const { data: task, error } = await supabaseAdmin
    .from("turnover_tasks")
    .insert(row)
    .select()
    .single();

  if (error || !task) {
    console.error("createTurnoverTask failed:", error);
    return null;
  }

  // Snapshot the applicable cleaning checklist onto the task (best-effort)
  await snapshotChecklistToTurnover(task.id, input.hostId, input.propertyId ?? null).catch(
    (e) => console.error("snapshotChecklistToTurnover failed:", e)
  );

  // Notify the auto-assigned cleaner
  if (cleaner?.user_id) {
    await createNotification({
      userId: cleaner.user_id,
      type: "system",
      title: "New turnover job assigned",
      body: `${input.title} on ${input.scheduledDate}. Accept or decline it.`,
      link: "/dashboard/jobs",
    });
    if (cleaner.email) {
      await resend.emails
        .send({
          from: FROM_EMAIL,
          to: cleaner.email,
          subject: `New turnover job — ${input.scheduledDate}`,
          html: turnoverEmail({
            heading: "You've been assigned a turnover",
            body: `<strong>${input.title}</strong> is scheduled for <strong>${input.scheduledDate}</strong>. Please accept or decline it in your dashboard.`,
            cta: { label: "View job", url: `${SITE_URL}/dashboard/jobs` },
          }),
        })
        .catch(() => {});
    }
  }

  return task;
}

export function turnoverEmail({
  heading,
  body,
  cta,
}: {
  heading: string;
  body: string;
  cta: { label: string; url: string };
}) {
  return `
<!DOCTYPE html>
<html lang="en"><body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f9fafb;padding:40px 16px;"><tr><td align="center">
    <table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%;">
      <tr><td style="background:#0d9488;border-radius:12px 12px 0 0;padding:24px 32px;text-align:center;">
        <span style="font-size:20px;font-weight:700;color:#fff;"><span style="color:#99f6e4;">STR</span>Vend</span>
      </td></tr>
      <tr><td style="background:#fff;padding:32px;border-left:1px solid #e5e7eb;border-right:1px solid #e5e7eb;">
        <h2 style="margin:0 0 16px;font-size:19px;color:#111827;">${heading}</h2>
        <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">${body}</p>
        <a href="${cta.url}" style="display:inline-block;background:#0d9488;color:#fff;font-size:14px;font-weight:600;text-decoration:none;padding:12px 24px;border-radius:8px;">${cta.label} →</a>
      </td></tr>
      <tr><td style="background:#f3f4f6;border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;padding:16px 32px;text-align:center;">
        <p style="margin:0;font-size:12px;color:#9ca3af;">© ${new Date().getFullYear()} STRVend</p>
      </td></tr>
    </table>
  </td></tr></table>
</body></html>`;
}
