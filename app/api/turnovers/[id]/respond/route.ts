import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { createClient as createAdmin } from "@supabase/supabase-js";
import { createNotification } from "@/lib/notifications";

function admin() {
  return createAdmin(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

// POST — assigned cleaner accepts or declines a task. Body: { action: 'accept' | 'decline' }
export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { action } = await req.json().catch(() => ({}));
  if (!["accept", "decline"].includes(action)) {
    return NextResponse.json({ error: "Invalid action" }, { status: 400 });
  }

  // Verify the caller owns the assigned vendor for this task
  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name")
    .eq("user_id", user.id)
    .maybeSingle();
  if (!vendor) return NextResponse.json({ error: "No vendor profile" }, { status: 403 });

  const db = admin();
  const { data: task } = await db
    .from("turnover_tasks")
    .select("id, host_id, title, scheduled_date, assigned_vendor_id, status")
    .eq("id", params.id)
    .maybeSingle();

  if (!task || task.assigned_vendor_id !== vendor.id) {
    return NextResponse.json({ error: "Task not found" }, { status: 404 });
  }
  if (task.status !== "assigned") {
    return NextResponse.json({ error: "Task is no longer pending" }, { status: 400 });
  }

  if (action === "accept") {
    await db
      .from("turnover_tasks")
      .update({ status: "scheduled", updated_at: new Date().toISOString() })
      .eq("id", task.id);

    await createNotification({
      userId: task.host_id,
      type: "system",
      title: "Turnover accepted",
      body: `${vendor.business_name} accepted "${task.title}" on ${task.scheduled_date}.`,
      link: "/host/dashboard/turnovers",
    });
  } else {
    // Declined → re-broadcast as an open job
    await db
      .from("turnover_tasks")
      .update({
        status: "open",
        assigned_vendor_id: null,
        updated_at: new Date().toISOString(),
      })
      .eq("id", task.id);

    await createNotification({
      userId: task.host_id,
      type: "system",
      title: "Turnover declined",
      body: `${vendor.business_name} declined "${task.title}". It's now open for bids.`,
      link: "/host/dashboard/turnovers",
    });
  }

  return NextResponse.json({ ok: true });
}
