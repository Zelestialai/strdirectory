import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { createClient as createAdmin } from "@supabase/supabase-js";

function admin() {
  return createAdmin(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

// PATCH — update task status. Body: { status: 'completed' | 'cancelled' }
// Host can complete/cancel; the assigned cleaner can mark completed.
export async function PATCH(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { status } = await req.json().catch(() => ({}));
  if (!["completed", "cancelled"].includes(status)) {
    return NextResponse.json({ error: "Invalid status" }, { status: 400 });
  }

  const db = admin();
  const { data: task } = await db
    .from("turnover_tasks")
    .select("id, host_id, assigned_vendor_id")
    .eq("id", params.id)
    .maybeSingle();
  if (!task) return NextResponse.json({ error: "Task not found" }, { status: 404 });

  // Authorize: host owns it, or caller is the assigned cleaner (completed only)
  const isHost = task.host_id === user.id;
  let isAssignedCleaner = false;
  if (task.assigned_vendor_id) {
    const { data: vendor } = await supabase
      .from("vendors")
      .select("id")
      .eq("user_id", user.id)
      .maybeSingle();
    isAssignedCleaner = vendor?.id === task.assigned_vendor_id;
  }

  if (!isHost && !(isAssignedCleaner && status === "completed")) {
    return NextResponse.json({ error: "Not allowed" }, { status: 403 });
  }

  // Require the full checklist to be completed before a turnover can be closed.
  if (status === "completed") {
    const { data: items } = await db
      .from("turnover_checklist_items")
      .select("is_done")
      .eq("turnover_task_id", task.id);
    const total = items?.length ?? 0;
    const remaining = (items ?? []).filter((i) => !i.is_done).length;
    if (total > 0 && remaining > 0) {
      return NextResponse.json(
        {
          error: `Finish the cleaning checklist first — ${remaining} of ${total} item${total === 1 ? "" : "s"} still unchecked.`,
          remaining,
          total,
        },
        { status: 400 }
      );
    }
  }

  await db
    .from("turnover_tasks")
    .update({ status, updated_at: new Date().toISOString() })
    .eq("id", task.id);

  return NextResponse.json({ ok: true });
}
