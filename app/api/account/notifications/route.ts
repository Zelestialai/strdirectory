import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

const ALLOWED_KEYS = [
  "email_on_inquiry",
  "email_on_review",
  "email_weekly_digest",
  "email_product_updates",
] as const;

type PrefKey = (typeof ALLOWED_KEYS)[number];

// PATCH — update notification preferences for the current user
export async function PATCH(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));

  // Whitelist + coerce to boolean; ignore anything unexpected
  const update: Partial<Record<PrefKey, boolean>> = {};
  for (const key of ALLOWED_KEYS) {
    if (key in body) update[key] = Boolean(body[key]);
  }

  if (Object.keys(update).length === 0) {
    return NextResponse.json({ error: "No valid preferences provided" }, { status: 400 });
  }

  const { error } = await supabase
    .from("profiles")
    .update({ ...update, updated_at: new Date().toISOString() })
    .eq("id", user.id);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true, updated: update });
}
