import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { syncOwnerRezForHost } from "@/lib/ownerrez";

// POST — manual "Sync now" for the logged-in host
export async function POST() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const result = await syncOwnerRezForHost(user.id);
  if (!result.ok) {
    return NextResponse.json({ error: result.error || "Sync failed" }, { status: 400 });
  }
  return NextResponse.json({ ok: true, result });
}
