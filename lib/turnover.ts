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
 * Find an accepted cleaning vendor on the host's team who covers this property.
 *
 * Property scoping: a team member with rows in team_member_properties covers
 * only those properties; a team member with no rows covers all of the host's
 * properties (backward-compatible default).
 */
async function findTeamCleaner(
  hostId: string,
  propertyId: string | null
): Promise<{
  vendor_id: string;
  business_name: string;
  user_id: string | null;
  email: string | null;
} | null> {
  const { data } = await supabaseAdmin
    .from("team_members")
    .select(
      "id, vendor_id, vendors!inner(id, business_name, user_id, email, category:categories(slug))"
    )
    .eq("host_id", hostId)
    .eq("status", "accepted");

  const cleaners = (data ?? []).filter(
    (m) => (m.vendors as any)?.category?.slug === CLEANING_SLUG
  );
  if (cleaners.length === 0) return null;

  // Load each cleaner's property scope.
  const { data: scopes } = await supabaseAdmin
    .from("team_member_properties")
    .select("team_member_id, property_id")
    .in(
      "team_member_id",
      cleaners.map((m) => m.id)
    );
  const scopeByMember = new Map<string, Set<string>>();
  for (const s of scopes ?? []) {
    if (!scopeByMember.has(s.team_member_id)) scopeByMember.set(s.team_member_id, new Set());
    scopeByMember.get(s.team_member_id)!.add(s.property_id as string);
  }

  const match = cleaners.find((m) => {
    const scope = scopeByMember.get(m.id);
    if (!scope || scope.size === 0) return true; // unrestricted (covers all)
    return propertyId != null && scope.has(propertyId);
  });
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

  const cleaner = await findTeamCleaner(input.hostId, input.propertyId ?? null);

  // The job's market comes from the property it's for, falling back to whatever
  // the caller passed (host's preferred market) only when the property has none.
  let marketSlug = input.marketSlug ?? null;
  if (input.propertyId) {
    const { data: prop } = await supabaseAdmin
      .from("properties")
      .select("market_slug")
      .eq("id", input.propertyId)
      .maybeSingle();
    if (prop?.market_slug) marketSlug = prop.market_slug;
  }

  const row = {
    host_id: input.hostId,
    property_id: input.propertyId ?? null,
    calendar_event_id: input.calendarEventId ?? null,
    title: input.title,
    notes: input.notes ?? null,
    scheduled_date: input.scheduledDate,
    price_cents: input.priceCents ?? null,
    market_slug: marketSlug,
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

/**
 * Remove turnover tasks tied to calendar events that were canceled/removed
 * upstream. Completed jobs are kept (history); any assigned cleaner is notified.
 * Returns the number of tasks removed.
 */
export async function removeTurnoversForCanceledEvents(eventIds: string[]): Promise<number> {
  if (!eventIds.length) return 0;

  const { data: tasks } = await supabaseAdmin
    .from("turnover_tasks")
    .select("id, title, scheduled_date, assigned_vendor_id, vendor:assigned_vendor_id(user_id)")
    .in("calendar_event_id", eventIds)
    .neq("status", "completed");

  if (!tasks || tasks.length === 0) return 0;

  // Let any assigned cleaner know their job is off.
  for (const t of tasks) {
    const cleanerUserId = (t.vendor as any)?.user_id as string | undefined;
    if (cleanerUserId) {
      await createNotification({
        userId: cleanerUserId,
        type: "system",
        title: "Turnover job canceled",
        body: `${t.title} on ${t.scheduled_date} was canceled — the booking was canceled.`,
        link: "/dashboard/jobs",
      });
    }
  }

  const ids = tasks.map((t) => t.id as string);
  await supabaseAdmin.from("turnover_tasks").delete().in("id", ids);
  return ids.length;
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
