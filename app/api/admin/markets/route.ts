import { createClient } from "@/lib/supabase/server";
import { NextResponse } from "next/server";

async function requireAdmin() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return null;
  const { data: profile } = await supabase.from("profiles").select("role").eq("id", user.id).single();
  if (profile?.role !== "admin") return null;
  return supabase;
}

export async function POST(req: Request) {
  const supabase = await requireAdmin();
  if (!supabase) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json();
  const { name, slug, state, cities, tagline, description } = body;

  if (!name || !slug || !state) {
    return NextResponse.json({ error: "name, slug, and state are required" }, { status: 400 });
  }

  const citiesArray = Array.isArray(cities)
    ? cities
    : String(cities).split(",").map((c: string) => c.trim()).filter(Boolean);

  const { data, error } = await supabase
    .from("markets")
    .insert({ name, slug, state, cities: citiesArray, tagline, description, is_active: true })
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json(data, { status: 201 });
}
