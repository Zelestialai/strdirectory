import { NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { syncOwnerRezForHost } from "@/lib/ownerrez";

export const runtime = "nodejs";
export const maxDuration = 60;

// Vercel cron — daily OwnerRez sync for all connected hosts. Guarded by CRON_SECRET.
export async function GET(req: Request) {
  const authHeader = req.headers.get("authorization");
  if (authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { data: integrations } = await supabaseAdmin
    .from("host_integrations")
    .select("host_id")
    .eq("provider", "ownerrez")
    .eq("status", "active");

  const results: { host_id: string; ok: boolean; turnovers?: number; error?: string }[] = [];
  for (const it of integrations ?? []) {
    const r = await syncOwnerRezForHost(it.host_id);
    results.push({ host_id: it.host_id, ok: r.ok, turnovers: r.turnovers, error: r.error });
  }

  return NextResponse.json({ synced: results.length, results });
}
