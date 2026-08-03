import { NextRequest, NextResponse } from "next/server";
import { supabaseAdmin } from "@/lib/supabase/admin";
import { syncOwnerRezForHost } from "@/lib/ownerrez";

export const runtime = "nodejs";
export const maxDuration = 60;

// OwnerRez authenticates to this endpoint with HTTP Basic auth using the
// user/password configured on the OAuth app. We verify against env vars.
function authorized(req: NextRequest): boolean {
  const header = req.headers.get("authorization") || "";
  if (!header.startsWith("Basic ")) return false;
  const [user, pass] = Buffer.from(header.slice(6), "base64").toString().split(":");
  return (
    !!process.env.OWNERREZ_WEBHOOK_USER &&
    !!process.env.OWNERREZ_WEBHOOK_PASSWORD &&
    user === process.env.OWNERREZ_WEBHOOK_USER &&
    pass === process.env.OWNERREZ_WEBHOOK_PASSWORD
  );
}

// POST — OwnerRez pushes booking/entity change notifications here.
export async function POST(req: NextRequest) {
  if (!authorized(req)) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  // Acknowledge fast, then sync affected hosts. OwnerRez payloads vary; rather
  // than parse every shape, re-sync active OAuth integrations (low volume).
  await req.text().catch(() => "");

  const { data: integrations } = await supabaseAdmin
    .from("host_integrations")
    .select("host_id")
    .eq("provider", "ownerrez")
    .eq("auth_method", "oauth")
    .eq("status", "active");

  for (const it of integrations ?? []) {
    await syncOwnerRezForHost(it.host_id).catch(() => {});
  }

  return NextResponse.json({ ok: true });
}

// OwnerRez may probe the endpoint with a GET during setup — respond 200.
export async function GET() {
  return NextResponse.json({ ok: true });
}
