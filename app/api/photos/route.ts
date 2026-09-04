import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { authorizeForProperty, authorizeForTask } from "@/lib/photos-auth";

export const runtime = "nodejs";

const BUCKET = "shared-photos";

// GET /api/photos?turnoverTaskId=… (job photos) or ?propertyId=… (album)
export async function GET(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { searchParams } = new URL(req.url);
  const turnoverTaskId = searchParams.get("turnoverTaskId");
  const propertyId = searchParams.get("propertyId");

  const auth = turnoverTaskId
    ? await authorizeForTask(turnoverTaskId, user.id)
    : propertyId
    ? await authorizeForProperty(propertyId, user.id)
    : null;
  if (!auth || !auth.ok) return NextResponse.json({ error: "Not allowed" }, { status: 403 });

  let query = supabaseAdmin
    .from("shared_photos")
    .select("id, storage_path, caption, uploaded_by, uploader_role, created_at")
    .order("created_at", { ascending: false });

  if (turnoverTaskId) query = query.eq("turnover_task_id", turnoverTaskId);
  else query = query.eq("property_id", propertyId!).is("turnover_task_id", null);

  const { data: rows, error } = await query;
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Uploader names.
  const uploaderIds = Array.from(new Set((rows ?? []).map((r) => r.uploaded_by)));
  const nameById = new Map<string, string>();
  if (uploaderIds.length) {
    const { data: profiles } = await supabaseAdmin
      .from("profiles").select("id, full_name").in("id", uploaderIds);
    (profiles ?? []).forEach((p) => nameById.set(p.id, p.full_name ?? "Someone"));
  }

  // Signed view URLs (1 hour).
  const paths = (rows ?? []).map((r) => r.storage_path);
  const signedById = new Map<string, string>();
  if (paths.length) {
    const { data: signed } = await supabaseAdmin.storage
      .from(BUCKET).createSignedUrls(paths, 3600);
    (signed ?? []).forEach((s) => { if (s.path && s.signedUrl) signedById.set(s.path, s.signedUrl); });
  }

  const photos = (rows ?? []).map((r) => ({
    id: r.id,
    url: signedById.get(r.storage_path) ?? null,
    caption: r.caption,
    uploaderName: nameById.get(r.uploaded_by) ?? "Someone",
    uploaderRole: r.uploader_role,
    mine: r.uploaded_by === user.id,
    createdAt: r.created_at,
  }));

  return NextResponse.json({ canUpload: true, isHost: auth.isHost, photos });
}

// POST /api/photos — record an uploaded file. Body: { path, caption?, turnoverTaskId?, propertyId? }
export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const path: string | undefined = body.path;
  if (!path) return NextResponse.json({ error: "path required" }, { status: 400 });

  const auth = body.turnoverTaskId
    ? await authorizeForTask(String(body.turnoverTaskId), user.id)
    : await authorizeForProperty(String(body.propertyId), user.id);
  if (!auth.ok || !auth.propertyId || !auth.hostId) {
    return NextResponse.json({ error: "Not allowed" }, { status: 403 });
  }

  const { error } = await supabaseAdmin.from("shared_photos").insert({
    property_id: auth.propertyId,
    turnover_task_id: body.turnoverTaskId ?? null,
    host_id: auth.hostId,
    uploaded_by: user.id,
    uploader_role: auth.isHost ? "host" : "vendor",
    vendor_id: auth.vendorId,
    storage_path: path,
    caption: body.caption ? String(body.caption).slice(0, 300) : null,
  });
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  return NextResponse.json({ ok: true });
}
