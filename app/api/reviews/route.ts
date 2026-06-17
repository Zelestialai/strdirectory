import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { z } from "zod";

const reviewSchema = z.object({
  vendor_id: z.string().uuid(),
  rating:    z.number().int().min(1).max(5),
  title:     z.string().max(120).optional(),
  body:      z.string().min(10).max(2000).optional(),
});

export async function GET(req: NextRequest) {
  const supabase = createClient();
  const vendorId = new URL(req.url).searchParams.get("vendor_id");
  if (!vendorId) return NextResponse.json({ error: "vendor_id required" }, { status: 400 });

  const { data, error } = await supabase
    .from("reviews")
    .select("*, profiles(*)")
    .eq("vendor_id", vendorId)
    .order("created_at", { ascending: false });

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ data });
}

export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json();
  const parsed = reviewSchema.safeParse(body);
  if (!parsed.success) return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });

  const { data, error } = await supabase
    .from("reviews")
    .insert({ ...parsed.data, reviewer_id: user.id })
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ data }, { status: 201 });
}
