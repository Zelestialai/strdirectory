import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { createClient as createAdmin } from "@supabase/supabase-js";
import { createNotification } from "@/lib/notifications";

function admin() {
  return createAdmin(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

// POST — a cleaner submits (or updates) a bid on an open task.
// Body: { price_cents: number, message?: string }
export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const priceCents = typeof body.price_cents === "number" ? Math.round(body.price_cents) : NaN;
  if (!Number.isFinite(priceCents) || priceCents < 0) {
    return NextResponse.json({ error: "A valid bid price is required" }, { status: 400 });
  }

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name")
    .eq("user_id", user.id)
    .maybeSingle();
  if (!vendor) return NextResponse.json({ error: "No vendor profile" }, { status: 403 });

  const db = admin();
  const { data: task } = await db
    .from("turnover_tasks")
    .select("id, host_id, title, status")
    .eq("id", params.id)
    .maybeSingle();

  if (!task || task.status !== "open") {
    return NextResponse.json({ error: "This job is not open for bids" }, { status: 400 });
  }

  const { error } = await db
    .from("turnover_bids")
    .upsert(
      {
        task_id: task.id,
        vendor_id: vendor.id,
        price_cents: priceCents,
        message: typeof body.message === "string" ? body.message : null,
        status: "pending",
      },
      { onConflict: "task_id,vendor_id" }
    );

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  await createNotification({
    userId: task.host_id,
    type: "system",
    title: "New turnover bid",
    body: `${vendor.business_name} bid $${(priceCents / 100).toFixed(0)} on "${task.title}".`,
    link: "/host/dashboard/turnovers",
  });

  return NextResponse.json({ ok: true }, { status: 201 });
}
