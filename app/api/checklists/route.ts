import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import {
  getEditableChecklist,
  saveChecklist,
  deletePropertyOverride,
  type ChecklistSection,
} from "@/lib/checklist";

export const runtime = "nodejs";

// GET /api/checklists?propertyId=UUID  (omit propertyId for the account default)
// Returns the editable template, seeding it if needed. Also lists the host's
// properties so the editor can offer per-property overrides.
export async function GET(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const propertyId = req.nextUrl.searchParams.get("propertyId") || null;

  const checklist = await getEditableChecklist(user.id, propertyId);

  const { data: properties } = await supabase
    .from("properties")
    .select("id, name")
    .eq("host_id", user.id)
    .order("created_at", { ascending: true });

  // Which properties already have their own override?
  const { data: overrides } = await supabase
    .from("cleaning_checklists")
    .select("property_id")
    .eq("host_id", user.id)
    .not("property_id", "is", null);

  return NextResponse.json({
    checklist,
    properties: properties ?? [],
    overriddenPropertyIds: (overrides ?? []).map((o) => o.property_id),
  });
}

// PUT /api/checklists  Body: { propertyId: string|null, sections: [...] }
export async function PUT(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json().catch(() => ({}));
  const propertyId: string | null = body.propertyId ?? null;
  const sections: ChecklistSection[] = Array.isArray(body.sections) ? body.sections : [];

  if (!sections.length) {
    return NextResponse.json({ error: "Add at least one room with items." }, { status: 400 });
  }

  // If a propertyId was given, confirm the host owns it
  if (propertyId) {
    const { data: prop } = await supabase
      .from("properties")
      .select("id")
      .eq("id", propertyId)
      .eq("host_id", user.id)
      .maybeSingle();
    if (!prop) return NextResponse.json({ error: "Property not found" }, { status: 404 });
  }

  await saveChecklist(user.id, propertyId, sections);
  return NextResponse.json({ ok: true });
}

// DELETE /api/checklists?propertyId=UUID — remove a property override
export async function DELETE(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const propertyId = req.nextUrl.searchParams.get("propertyId");
  if (!propertyId) {
    return NextResponse.json({ error: "propertyId required" }, { status: 400 });
  }
  await deletePropertyOverride(user.id, propertyId);
  return NextResponse.json({ ok: true });
}
