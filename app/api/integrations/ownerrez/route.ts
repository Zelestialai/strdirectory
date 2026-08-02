import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { verifyOwnerRez, syncOwnerRezForHost } from "@/lib/ownerrez";

// GET — current OwnerRez integration status (never returns the token)
export async function GET() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { data } = await supabase
    .from("host_integrations")
    .select("status, api_username, last_synced_at, last_error")
    .eq("host_id", user.id)
    .eq("provider", "ownerrez")
    .maybeSingle();

  return NextResponse.json({ integration: data ?? null });
}

// POST — connect (or update) OwnerRez. Body: { username, token }
// Validates credentials, saves them, and runs an initial sync.
export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const username = typeof body.username === "string" ? body.username.trim() : "";
  const token = typeof body.token === "string" ? body.token.trim() : "";
  if (!username || !token) {
    return NextResponse.json({ error: "Username and API token are required" }, { status: 400 });
  }

  // Validate before saving
  const check = await verifyOwnerRez({ username, token });
  if (!check.ok) {
    return NextResponse.json(
      { error: `Couldn't connect to OwnerRez: ${check.error}` },
      { status: 400 }
    );
  }

  const { error } = await supabase.from("host_integrations").upsert(
    {
      host_id: user.id,
      provider: "ownerrez",
      api_username: username,
      api_token: token,
      status: "active",
      last_error: null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "host_id,provider" }
  );
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Run an initial sync now so the host sees results immediately
  const result = await syncOwnerRezForHost(user.id);
  return NextResponse.json({ ok: true, result });
}

// DELETE — disconnect OwnerRez
export async function DELETE() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  await supabase
    .from("host_integrations")
    .delete()
    .eq("host_id", user.id)
    .eq("provider", "ownerrez");

  return NextResponse.json({ ok: true });
}
