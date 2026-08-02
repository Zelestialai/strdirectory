import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { createClient as createAdmin } from "@supabase/supabase-js";
import { createNotification } from "@/lib/notifications";
import { resend, FROM_EMAIL, SITE_URL } from "@/lib/email";
import { turnoverEmail } from "@/lib/turnover";

function admin() {
  return createAdmin(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

// POST — host accepts a bid on their open task. Body: { bid_id }
export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { bid_id } = await req.json().catch(() => ({}));
  if (!bid_id) return NextResponse.json({ error: "bid_id is required" }, { status: 400 });

  const db = admin();

  // Verify the task belongs to this host and is open
  const { data: task } = await db
    .from("turnover_tasks")
    .select("id, host_id, title, scheduled_date, status")
    .eq("id", params.id)
    .maybeSingle();
  if (!task || task.host_id !== user.id) {
    return NextResponse.json({ error: "Task not found" }, { status: 404 });
  }
  if (task.status !== "open") {
    return NextResponse.json({ error: "Task is not open" }, { status: 400 });
  }

  // Load the winning bid + its vendor
  const { data: bid } = await db
    .from("turnover_bids")
    .select("id, task_id, vendor_id, price_cents, vendors(business_name, user_id, email)")
    .eq("id", bid_id)
    .eq("task_id", task.id)
    .maybeSingle();
  if (!bid) return NextResponse.json({ error: "Bid not found" }, { status: 404 });

  // Award: assign task to the winning vendor, set price, mark scheduled
  await db
    .from("turnover_tasks")
    .update({
      status: "scheduled",
      assigned_vendor_id: bid.vendor_id,
      price_cents: bid.price_cents,
      updated_at: new Date().toISOString(),
    })
    .eq("id", task.id);

  // Update bid statuses: winner accepted, others rejected
  await db.from("turnover_bids").update({ status: "accepted" }).eq("id", bid.id);
  await db
    .from("turnover_bids")
    .update({ status: "rejected" })
    .eq("task_id", task.id)
    .neq("id", bid.id);

  // Notify the winning cleaner
  const v = bid.vendors as unknown as {
    business_name: string;
    user_id: string | null;
    email: string | null;
  } | null;
  if (v?.user_id) {
    await createNotification({
      userId: v.user_id,
      type: "system",
      title: "Your bid was accepted 🎉",
      body: `You won "${task.title}" on ${task.scheduled_date}.`,
      link: "/dashboard/jobs",
    });
    if (v.email) {
      await resend.emails
        .send({
          from: FROM_EMAIL,
          to: v.email,
          subject: `Your bid was accepted — ${task.scheduled_date}`,
          html: turnoverEmail({
            heading: "Your bid was accepted 🎉",
            body: `You've been awarded <strong>${task.title}</strong> on <strong>${task.scheduled_date}</strong> for $${(bid.price_cents / 100).toFixed(0)}. It's now on your job calendar.`,
            cta: { label: "View job", url: `${SITE_URL}/dashboard/jobs` },
          }),
        })
        .catch(() => {});
    }
  }

  return NextResponse.json({ ok: true });
}
