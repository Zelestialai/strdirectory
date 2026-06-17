import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

export async function GET(req: NextRequest) {
  const supabase = createClient();
  const { searchParams } = new URL(req.url);
  const q        = searchParams.get("q");
  const category = searchParams.get("category");
  const city     = searchParams.get("city");
  const minRating = searchParams.get("min_rating");
  const page     = Math.max(1, parseInt(searchParams.get("page") ?? "1"));
  const limit    = Math.min(50, parseInt(searchParams.get("limit") ?? "12"));
  const from     = (page - 1) * limit;

  let query = supabase
    .from("vendors")
    .select("*, category:categories(*)", { count: "exact" })
    .eq("is_active", true);

  if (q)         query = query.ilike("business_name", `%${q}%`);
  if (category)  query = query.eq("categories.slug", category);
  if (city)      query = query.ilike("city", `%${city}%`);
  if (minRating) query = query.gte("avg_rating", parseFloat(minRating));

  const { data, count, error } = await query
    .order("is_featured", { ascending: false })
    .order("avg_rating", { ascending: false })
    .range(from, from + limit - 1);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ data, count, page, limit });
}
