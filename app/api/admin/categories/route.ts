import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { supabaseAdmin } from "@/lib/supabase/admin";

async function isAdmin() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return false;
  const { data: profile } = await supabase
    .from("profiles").select("role").eq("id", user.id).single();
  return profile?.role === "admin";
}

function slugify(s: string) {
  return s.toLowerCase().trim()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9\s-]/g, "")
    .replace(/\s+/g, "-").replace(/-+/g, "-").replace(/^-|-$/g, "");
}

// POST /api/admin/categories — create a new service category (admin only).
export async function POST(req: Request) {
  if (!(await isAdmin())) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }
  const body = await req.json().catch(() => ({}));
  const name = typeof body.name === "string" ? body.name.trim() : "";
  if (!name) return NextResponse.json({ error: "Name is required." }, { status: 400 });

  const slug = (typeof body.slug === "string" && body.slug.trim()) ? slugify(body.slug) : slugify(name);

  const { data, error } = await supabaseAdmin
    .from("categories")
    .insert({
      name,
      slug,
      description: body.description?.trim() || null,
      icon: body.icon?.trim() || null,
      color: body.color?.trim() || null,
    })
    .select("id, slug")
    .single();

  if (error) {
    const msg = /duplicate|unique/i.test(error.message)
      ? "A category with that name or slug already exists."
      : error.message;
    return NextResponse.json({ error: msg }, { status: 400 });
  }
  return NextResponse.json({ ok: true, category: data }, { status: 201 });
}
