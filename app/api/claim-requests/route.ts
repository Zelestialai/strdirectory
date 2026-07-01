import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { sendClaimVerificationEmail, SITE_URL } from "@/lib/email";
import { z } from "zod";

const schema = z.object({
  vendor_id:    z.string().uuid(),
  email:        z.string().email(),
  contact_name: z.string().min(2).max(100),
  message:      z.string().max(1000).optional(),
});

export async function POST(req: NextRequest) {
  const supabase = createClient();

  const body = await req.json();
  const parsed = schema.safeParse(body);
  if (!parsed.success) {
    return NextResponse.json({ error: "Invalid request", details: parsed.error.flatten() }, { status: 400 });
  }
  const { vendor_id, email, contact_name, message } = parsed.data;

  // Verify vendor exists and is not already claimed
  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name, is_claimed, slug")
    .eq("id", vendor_id)
    .single();

  if (!vendor) {
    return NextResponse.json({ error: "Vendor not found" }, { status: 404 });
  }
  if (vendor.is_claimed) {
    return NextResponse.json({ error: "This listing has already been claimed" }, { status: 409 });
  }

  // Insert claim request — DB enforces one pending claim per vendor via unique index
  const { data: claim, error: insertError } = await supabase
    .from("claim_requests")
    .insert({ vendor_id, email, contact_name, message: message ?? null })
    .select("token")
    .single();

  if (insertError) {
    if (insertError.code === "23505") {
      // Unique violation on vendor_id + pending — a claim is already in flight
      return NextResponse.json(
        { error: "A claim request for this listing is already pending. Please check your email." },
        { status: 409 }
      );
    }
    return NextResponse.json({ error: insertError.message }, { status: 500 });
  }

  const verifyUrl = `${SITE_URL}/api/claim-requests/verify?token=${claim.token}`;

  // Send verification email (non-blocking — don't fail the request if email fails)
  await sendClaimVerificationEmail({
    contactName: contact_name,
    vendorName:  vendor.business_name,
    email,
    verifyUrl,
  }).catch(console.error);

  return NextResponse.json({ ok: true });
}
