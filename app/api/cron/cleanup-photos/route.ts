import { NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

export const runtime = "nodejs";
export const maxDuration = 60;

const BUCKET = "shared-photos";
const RETENTION_DAYS = 15;

/**
 * Vercel cron — delete job-scoped turnover photos older than RETENTION_DAYS.
 * Property album photos (turnover_task_id IS NULL) are kept indefinitely since
 * they're reference material. Guarded by CRON_SECRET.
 */
export async function GET(req: Request) {
  const authHeader = req.headers.get("authorization");
  if (authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const cutoff = new Date(Date.now() - RETENTION_DAYS * 86_400_000).toISOString();

  // Only job photos expire; album photos (null task) are retained.
  const { data: expired, error } = await supabaseAdmin
    .from("shared_photos")
    .select("id, storage_path")
    .not("turnover_task_id", "is", null)
    .lt("created_at", cutoff);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  if (!expired || expired.length === 0) {
    return NextResponse.json({ deleted: 0 });
  }

  // Remove files from storage (batched), then their rows.
  const paths = expired.map((p) => p.storage_path);
  for (let i = 0; i < paths.length; i += 100) {
    await supabaseAdmin.storage.from(BUCKET).remove(paths.slice(i, i + 100));
  }

  const ids = expired.map((p) => p.id);
  const { error: delErr } = await supabaseAdmin
    .from("shared_photos")
    .delete()
    .in("id", ids);
  if (delErr) {
    return NextResponse.json({ error: delErr.message, filesRemoved: paths.length }, { status: 500 });
  }

  return NextResponse.json({ deleted: expired.length, retentionDays: RETENTION_DAYS });
}
