import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { authorizeForProperty, authorizeForTask } from "@/lib/photos-auth";

export const runtime = "nodejs";

const BUCKET = "shared-photos";

// DELETE /api/photos/[id] — uploader or the property host may remove a photo.
export async function DELETE(
  _req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { data: photo } = await supabaseAdmin
    .from("shared_photos")
    .select("id, property_id, turnover_task_id, uploaded_by, storage_path")
    .eq("id", params.id)
    .maybeSingle();
  if (!photo) return NextResponse.json({ error: "Not found" }, { status: 404 });

  const auth = photo.turnover_task_id
    ? await authorizeForTask(photo.turnover_task_id, user.id)
    : await authorizeForProperty(photo.property_id, user.id);
  const canDelete = photo.uploaded_by === user.id || auth.isHost;
  if (!auth.ok || !canDelete) {
    return NextResponse.json({ error: "Not allowed" }, { status: 403 });
  }

  await supabaseAdmin.storage.from(BUCKET).remove([photo.storage_path]);
  const { error } = await supabaseAdmin.from("shared_photos").delete().eq("id", params.id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  return NextResponse.json({ ok: true });
}
