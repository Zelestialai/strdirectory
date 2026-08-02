import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

interface Params {
  params: { siteId: string };
}

async function resolveListing(
  supabase: ReturnType<typeof createClient>,
  siteId: string,
  userId: string
): Promise<string | null> {
  // Verify the site belongs to this host, then get its listing id
  const { data: site } = await supabase
    .from("booking_sites")
    .select("id, host_id")
    .eq("id", siteId)
    .maybeSingle();
  if (!site || site.host_id !== userId) return null;

  const { data: listing } = await supabase
    .from("booking_listings")
    .select("id")
    .eq("site_id", siteId)
    .maybeSingle();
  return listing?.id ?? null;
}

// GET — list seasonal rates for the site's listing
export async function GET(_req: NextRequest, { params }: Params) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const listingId = await resolveListing(supabase, params.siteId, user.id);
  if (!listingId) return NextResponse.json({ rates: [] });

  const { data } = await supabase
    .from("booking_seasonal_rates")
    .select("id, label, start_date, end_date, nightly_rate_cents, source")
    .eq("listing_id", listingId)
    .order("start_date");

  return NextResponse.json({ rates: data ?? [] });
}

// POST — add a seasonal rate. Body: { label, start_date, end_date, nightly_rate_cents }
export async function POST(req: NextRequest, { params }: Params) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const listingId = await resolveListing(supabase, params.siteId, user.id);
  if (!listingId) return NextResponse.json({ error: "Listing not found" }, { status: 404 });

  const body = await req.json().catch(() => ({}));
  const { label, start_date, end_date, nightly_rate_cents } = body;
  if (!start_date || !end_date || typeof nightly_rate_cents !== "number") {
    return NextResponse.json({ error: "start_date, end_date and rate are required" }, { status: 400 });
  }
  if (end_date < start_date) {
    return NextResponse.json({ error: "End date must be on or after start date" }, { status: 400 });
  }

  const { data, error } = await supabase
    .from("booking_seasonal_rates")
    .insert({
      listing_id: listingId,
      label: label || null,
      start_date,
      end_date,
      nightly_rate_cents: Math.max(0, Math.round(nightly_rate_cents)),
      source: "manual",
    })
    .select("id, label, start_date, end_date, nightly_rate_cents, source")
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ rate: data }, { status: 201 });
}

// DELETE — remove a seasonal rate. Query: ?id=
export async function DELETE(req: NextRequest, { params }: Params) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const id = new URL(req.url).searchParams.get("id");
  if (!id) return NextResponse.json({ error: "id required" }, { status: 400 });

  const listingId = await resolveListing(supabase, params.siteId, user.id);
  if (!listingId) return NextResponse.json({ error: "Not found" }, { status: 404 });

  // RLS also enforces ownership; scope by listing for good measure
  await supabase
    .from("booking_seasonal_rates")
    .delete()
    .eq("id", id)
    .eq("listing_id", listingId);

  return NextResponse.json({ ok: true });
}
