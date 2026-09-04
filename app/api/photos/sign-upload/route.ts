import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { authorizeForProperty, authorizeForTask } from "@/lib/photos-auth";

export const runtime = "nodejs";

const BUCKET = "shared-photos";
const ALLOWED_EXT = ["jpg", "jpeg", "png", "webp", "heic", "heif"];

/**
 * Returns a short-lived signed upload URL so the client can PUT a photo
 * directly to storage (no large body through our server). Body:
 *   { turnoverTaskId?, propertyId?, ext }
 */
export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const ext = String(body.ext || "jpg").toLowerCase().replace(/[^a-z0-9]/g, "");
  if (!ALLOWED_EXT.includes(ext)) {
    return NextResponse.json({ error: "Unsupported file type" }, { status: 400 });
  }

  const auth = body.turnoverTaskId
    ? await authorizeForTask(String(body.turnoverTaskId), user.id)
    : await authorizeForProperty(String(body.propertyId), user.id);
  if (!auth.ok || !auth.propertyId) {
    return NextResponse.json({ error: "Not allowed" }, { status: 403 });
  }

  const scope = body.turnoverTaskId ? `job/${body.turnoverTaskId}` : "album";
  const uuid = (globalThis.crypto?.randomUUID?.() ?? `${Date.now()}-${Math.random().toString(36).slice(2)}`);
  const path = `${auth.propertyId}/${scope}/${uuid}.${ext}`;

  const { data, error } = await supabaseAdmin.storage
    .from(BUCKET)
    .createSignedUploadUrl(path);
  if (error || !data) {
    return NextResponse.json({ error: error?.message || "Could not create upload URL" }, { status: 500 });
  }

  return NextResponse.json({ path: data.path, token: data.token });
}
