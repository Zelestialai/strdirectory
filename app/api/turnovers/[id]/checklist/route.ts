import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

export const runtime = "nodejs";

// Resolve whether the caller is the host or the assigned cleaner for a task.
async function authorizeForTask(taskId: string, userId: string) {
  const { data: task } = await supabaseAdmin
    .from("turnover_tasks")
    .select("id, host_id, assigned_vendor_id, status")
    .eq("id", taskId)
    .maybeSingle();
  if (!task) return { task: null, isHost: false, isCleaner: false, vendorId: null };

  const isHost = task.host_id === userId;
  let isCleaner = false;
  let vendorId: string | null = null;
  if (task.assigned_vendor_id) {
    const { data: vendor } = await supabaseAdmin
      .from("vendors")
      .select("id")
      .eq("user_id", userId)
      .maybeSingle();
    isCleaner = vendor?.id === task.assigned_vendor_id;
    if (isCleaner) vendorId = vendor!.id;
  }
  return { task, isHost, isCleaner, vendorId };
}

// GET — the task's checklist items, grouped by section, with progress.
export async function GET(
  _req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { task, isHost, isCleaner, vendorId } = await authorizeForTask(params.id, user.id);
  if (!task) return NextResponse.json({ error: "Task not found" }, { status: 404 });
  if (!isHost && !isCleaner) return NextResponse.json({ error: "Not allowed" }, { status: 403 });

  const { data: items } = await supabaseAdmin
    .from("turnover_checklist_items")
    .select("id, section_title, label, position, is_done, done_at, photo_url")
    .eq("turnover_task_id", params.id)
    .order("position", { ascending: true });

  const total = items?.length ?? 0;
  const done = (items ?? []).filter((i) => i.is_done).length;

  return NextResponse.json({
    canEdit: isCleaner,
    vendorId, // used to build a storage path the upload policy allows
    total,
    done,
    items: items ?? [],
  });
}

// PATCH — toggle an item done / attach a photo. Body: { itemId, is_done?, photo_url? }
export async function PATCH(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { task, isCleaner } = await authorizeForTask(params.id, user.id);
  if (!task) return NextResponse.json({ error: "Task not found" }, { status: 404 });
  if (!isCleaner) {
    return NextResponse.json({ error: "Only the assigned cleaner can update the checklist" }, { status: 403 });
  }

  const body = await req.json().catch(() => ({}));
  const itemId: string | undefined = body.itemId;
  if (!itemId) return NextResponse.json({ error: "itemId required" }, { status: 400 });

  const update: Record<string, unknown> = {};
  if (typeof body.is_done === "boolean") {
    update.is_done = body.is_done;
    update.done_at = body.is_done ? new Date().toISOString() : null;
    update.done_by = body.is_done ? user.id : null;
  }
  if ("photo_url" in body) {
    update.photo_url = body.photo_url || null;
  }
  if (Object.keys(update).length === 0) {
    return NextResponse.json({ error: "Nothing to update" }, { status: 400 });
  }

  const { error } = await supabaseAdmin
    .from("turnover_checklist_items")
    .update(update)
    .eq("id", itemId)
    .eq("turnover_task_id", params.id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const { data: items } = await supabaseAdmin
    .from("turnover_checklist_items")
    .select("is_done")
    .eq("turnover_task_id", params.id);
  const total = items?.length ?? 0;
  const done = (items ?? []).filter((i) => i.is_done).length;

  return NextResponse.json({ ok: true, total, done });
}
