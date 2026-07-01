import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { z } from "zod";

const schema = z.object({
  vendor_response: z.string().min(1).max(2000),
});

export async function POST(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json();
  const parsed = schema.safeParse(body);
  if (!parsed.success) return NextResponse.json({ error: "Invalid request" }, { status: 400 });

  // Verify user owns the vendor that received this review
  const { data: review } = await supabase
    .from("reviews")
    .select("id, vendor_id, vendor:vendors(user_id)")
    .eq("id", params.id)
    .single();

  if (!review) return NextResponse.json({ error: "Review not found" }, { status: 404 });

  const vendorOwnerId = (review.vendor as any)?.user_id;
  if (vendorOwnerId !== user.id) {
    return NextResponse.json({ error: "Forbidden" }, { status: 403 });
  }

  const { error } = await supabase
    .from("reviews")
    .update({
      vendor_response: parsed.data.vendor_response,
      vendor_response_at: new Date().toISOString(),
    })
    .eq("id", params.id);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}
