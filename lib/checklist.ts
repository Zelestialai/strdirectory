import { supabaseAdmin } from "@/lib/supabase/admin";

// A solid built-in default turnover checklist, organized by room.
export const DEFAULT_CHECKLIST: { title: string; items: string[] }[] = [
  {
    title: "Kitchen",
    items: [
      "Wash, dry & put away all dishes",
      "Wipe counters, backsplash & table",
      "Clean sink & faucet",
      "Wipe stovetop, oven front & range hood",
      "Clean microwave inside & out",
      "Empty fridge of leftovers; wipe shelves",
      "Empty trash & recycling; replace liners",
      "Restock dish soap, sponge & paper towels",
      "Sweep & mop floor",
    ],
  },
  {
    title: "Bathrooms",
    items: [
      "Scrub toilet, tub/shower & sink",
      "Wipe mirrors, counters & fixtures",
      "Restock toilet paper, hand soap & shampoo",
      "Hang fresh, folded towels",
      "Empty trash",
      "Sweep & mop floor",
    ],
  },
  {
    title: "Bedrooms",
    items: [
      "Strip & launder all bed linens",
      "Make beds with fresh linens",
      "Dust nightstands, dressers & surfaces",
      "Check under beds & inside closets",
      "Vacuum floors / rugs",
      "Reset blinds & lighting",
    ],
  },
  {
    title: "Living & Common Areas",
    items: [
      "Dust surfaces, shelves & electronics",
      "Fluff & arrange cushions and throws",
      "Wipe coffee table & remotes",
      "Vacuum / sweep floors",
      "Reset thermostat & A/C",
      "Tidy entryway & shoes",
    ],
  },
  {
    title: "Whole Home & Exterior",
    items: [
      "Take all trash & recycling to bins",
      "Check all lights; replace dead bulbs",
      "Restock guest essentials (coffee, water, etc.)",
      "Lock all windows & doors",
      "Report any damage or missing items",
      "Final walkthrough & photos",
    ],
  },
];

export interface ChecklistSection {
  id?: string;
  title: string;
  items: { id?: string; label: string }[];
}

/**
 * Load a template checklist (sections + items) by checklist id.
 */
async function loadTemplate(checklistId: string): Promise<ChecklistSection[]> {
  const { data: sections } = await supabaseAdmin
    .from("cleaning_checklist_sections")
    .select("id, title, position")
    .eq("checklist_id", checklistId)
    .order("position", { ascending: true });

  if (!sections?.length) return [];

  const ids = sections.map((s) => s.id);
  const { data: items } = await supabaseAdmin
    .from("cleaning_checklist_items")
    .select("id, section_id, label, position")
    .in("section_id", ids)
    .order("position", { ascending: true });

  return sections.map((s) => ({
    id: s.id,
    title: s.title,
    items: (items ?? [])
      .filter((i) => i.section_id === s.id)
      .map((i) => ({ id: i.id, label: i.label })),
  }));
}

/**
 * Persist a set of sections/items as the full content of a checklist,
 * replacing whatever was there before.
 */
async function writeTemplate(checklistId: string, sections: ChecklistSection[]) {
  // Clear existing (items cascade from sections)
  await supabaseAdmin
    .from("cleaning_checklist_sections")
    .delete()
    .eq("checklist_id", checklistId);

  let sPos = 0;
  for (const section of sections) {
    const title = section.title?.trim();
    if (!title) continue;
    const { data: sec } = await supabaseAdmin
      .from("cleaning_checklist_sections")
      .insert({ checklist_id: checklistId, title, position: sPos++ })
      .select("id")
      .single();
    if (!sec) continue;
    const rows = section.items
      .map((i) => i.label?.trim())
      .filter(Boolean)
      .map((label, idx) => ({ section_id: sec.id, label: label as string, position: idx }));
    if (rows.length) {
      await supabaseAdmin.from("cleaning_checklist_items").insert(rows);
    }
  }
  await supabaseAdmin
    .from("cleaning_checklists")
    .update({ updated_at: new Date().toISOString() })
    .eq("id", checklistId);
}

/**
 * Ensure the host's account-default checklist exists, seeding it from the
 * built-in default the first time. Returns the checklist id.
 */
export async function getOrCreateAccountDefault(hostId: string): Promise<string> {
  const { data: existing } = await supabaseAdmin
    .from("cleaning_checklists")
    .select("id")
    .eq("host_id", hostId)
    .is("property_id", null)
    .maybeSingle();
  if (existing) return existing.id;

  const { data: created } = await supabaseAdmin
    .from("cleaning_checklists")
    .insert({ host_id: hostId, property_id: null })
    .select("id")
    .single();
  const id = created!.id;
  await writeTemplate(
    id,
    DEFAULT_CHECKLIST.map((s) => ({ title: s.title, items: s.items.map((label) => ({ label })) }))
  );
  return id;
}

/**
 * Get the checklist template a host should edit for a given target, WITHOUT
 * side effects for property overrides:
 *  - account default (targetPropertyId null): created/seeded if missing.
 *  - property with an override: returns the override, isOverride = true.
 *  - property with no override: returns the account default content as a
 *    starting point, isOverride = false (nothing is created until saved).
 */
export async function getEditableChecklist(
  hostId: string,
  targetPropertyId: string | null
): Promise<{ checklistId: string | null; propertyId: string | null; sections: ChecklistSection[]; isOverride: boolean }> {
  if (!targetPropertyId) {
    const id = await getOrCreateAccountDefault(hostId);
    return { checklistId: id, propertyId: null, sections: await loadTemplate(id), isOverride: false };
  }

  const { data: override } = await supabaseAdmin
    .from("cleaning_checklists")
    .select("id")
    .eq("host_id", hostId)
    .eq("property_id", targetPropertyId)
    .maybeSingle();

  if (override) {
    return {
      checklistId: override.id,
      propertyId: targetPropertyId,
      sections: await loadTemplate(override.id),
      isOverride: true,
    };
  }

  // No override yet — show the account default content as the starting point.
  const defaultId = await getOrCreateAccountDefault(hostId);
  return {
    checklistId: null,
    propertyId: targetPropertyId,
    sections: await loadTemplate(defaultId),
    isOverride: false,
  };
}

/** Ensure a checklist row exists for (host, property|null); returns its id. */
async function ensureChecklistRow(hostId: string, propertyId: string | null): Promise<string> {
  if (!propertyId) return getOrCreateAccountDefault(hostId);
  const { data: existing } = await supabaseAdmin
    .from("cleaning_checklists")
    .select("id")
    .eq("host_id", hostId)
    .eq("property_id", propertyId)
    .maybeSingle();
  if (existing) return existing.id;
  const { data: created } = await supabaseAdmin
    .from("cleaning_checklists")
    .insert({ host_id: hostId, property_id: propertyId })
    .select("id")
    .single();
  return created!.id;
}

/**
 * Save edits to a host's checklist (account default or a property override).
 * Creates a per-property override the first time it's saved.
 */
export async function saveChecklist(
  hostId: string,
  targetPropertyId: string | null,
  sections: ChecklistSection[]
) {
  const checklistId = await ensureChecklistRow(hostId, targetPropertyId);
  await writeTemplate(checklistId, sections);
  return checklistId;
}

/**
 * Remove a per-property override, reverting that property to the account default.
 */
export async function deletePropertyOverride(hostId: string, propertyId: string) {
  await supabaseAdmin
    .from("cleaning_checklists")
    .delete()
    .eq("host_id", hostId)
    .eq("property_id", propertyId);
}

/**
 * Resolve the checklist that applies to a property (property override →
 * account default → built-in), returned as flat sections.
 */
async function resolveChecklistSections(
  hostId: string,
  propertyId: string | null
): Promise<ChecklistSection[]> {
  if (propertyId) {
    const { data: override } = await supabaseAdmin
      .from("cleaning_checklists")
      .select("id")
      .eq("host_id", hostId)
      .eq("property_id", propertyId)
      .maybeSingle();
    if (override) {
      const t = await loadTemplate(override.id);
      if (t.length) return t;
    }
  }
  const { data: def } = await supabaseAdmin
    .from("cleaning_checklists")
    .select("id")
    .eq("host_id", hostId)
    .is("property_id", null)
    .maybeSingle();
  if (def) {
    const t = await loadTemplate(def.id);
    if (t.length) return t;
  }
  // Built-in fallback
  return DEFAULT_CHECKLIST.map((s) => ({ title: s.title, items: s.items.map((label) => ({ label })) }));
}

/**
 * Snapshot the applicable checklist onto a turnover task so the cleaner has a
 * point-in-time list to complete. No-op if the task already has one.
 */
export async function snapshotChecklistToTurnover(
  turnoverTaskId: string,
  hostId: string,
  propertyId: string | null
) {
  const { data: existing } = await supabaseAdmin
    .from("turnover_checklist_items")
    .select("id")
    .eq("turnover_task_id", turnoverTaskId)
    .limit(1);
  if (existing?.length) return;

  const sections = await resolveChecklistSections(hostId, propertyId);
  const rows: {
    turnover_task_id: string;
    section_title: string;
    label: string;
    position: number;
  }[] = [];
  let pos = 0;
  for (const s of sections) {
    for (const item of s.items) {
      rows.push({
        turnover_task_id: turnoverTaskId,
        section_title: s.title,
        label: item.label,
        position: pos++,
      });
    }
  }
  if (rows.length) {
    await supabaseAdmin.from("turnover_checklist_items").insert(rows);
  }
}
