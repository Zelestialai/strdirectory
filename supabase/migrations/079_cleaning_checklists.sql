-- Migration 079: Cleaning checklists (templates + per-turnover snapshot)
-- Hosts get a default cleaning checklist they can edit, plus optional per-property
-- overrides. When a turnover task is created, the applicable checklist is
-- snapshotted onto the task so cleaners can check items off (with optional photos)
-- and edits to templates never rewrite historical jobs.

-- ─── Templates ───────────────────────────────────────────────────────────────
-- One checklist per (host, property). property_id NULL = the account default.
CREATE TABLE IF NOT EXISTS public.cleaning_checklists (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  host_id      uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  property_id  uuid REFERENCES public.properties(id) ON DELETE CASCADE,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- One account default per host, and at most one override per property.
CREATE UNIQUE INDEX IF NOT EXISTS cleaning_checklists_default_uidx
  ON public.cleaning_checklists (host_id) WHERE property_id IS NULL;
CREATE UNIQUE INDEX IF NOT EXISTS cleaning_checklists_property_uidx
  ON public.cleaning_checklists (host_id, property_id) WHERE property_id IS NOT NULL;

CREATE TABLE IF NOT EXISTS public.cleaning_checklist_sections (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  checklist_id  uuid NOT NULL REFERENCES public.cleaning_checklists(id) ON DELETE CASCADE,
  title         text NOT NULL,
  position      integer NOT NULL DEFAULT 0
);
CREATE INDEX IF NOT EXISTS cleaning_sections_checklist_idx
  ON public.cleaning_checklist_sections (checklist_id, position);

CREATE TABLE IF NOT EXISTS public.cleaning_checklist_items (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  section_id  uuid NOT NULL REFERENCES public.cleaning_checklist_sections(id) ON DELETE CASCADE,
  label       text NOT NULL,
  position    integer NOT NULL DEFAULT 0
);
CREATE INDEX IF NOT EXISTS cleaning_items_section_idx
  ON public.cleaning_checklist_items (section_id, position);

-- ─── Per-turnover snapshot ───────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.turnover_checklist_items (
  id                uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  turnover_task_id  uuid NOT NULL REFERENCES public.turnover_tasks(id) ON DELETE CASCADE,
  section_title     text NOT NULL,
  label             text NOT NULL,
  position          integer NOT NULL DEFAULT 0,
  is_done           boolean NOT NULL DEFAULT false,
  done_at           timestamptz,
  done_by           uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  photo_url         text,
  created_at        timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS turnover_checklist_task_idx
  ON public.turnover_checklist_items (turnover_task_id, position);

-- ─── RLS ─────────────────────────────────────────────────────────────────────
ALTER TABLE public.cleaning_checklists         ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cleaning_checklist_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cleaning_checklist_items    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.turnover_checklist_items    ENABLE ROW LEVEL SECURITY;

-- Templates: hosts fully manage their own
CREATE POLICY "host manages own checklists"
  ON public.cleaning_checklists FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());
CREATE POLICY "service role manages checklists"
  ON public.cleaning_checklists FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "host manages own checklist sections"
  ON public.cleaning_checklist_sections FOR ALL
  USING (EXISTS (SELECT 1 FROM public.cleaning_checklists c
                 WHERE c.id = checklist_id AND c.host_id = auth.uid()))
  WITH CHECK (EXISTS (SELECT 1 FROM public.cleaning_checklists c
                      WHERE c.id = checklist_id AND c.host_id = auth.uid()));
CREATE POLICY "service role manages checklist sections"
  ON public.cleaning_checklist_sections FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "host manages own checklist items"
  ON public.cleaning_checklist_items FOR ALL
  USING (EXISTS (SELECT 1 FROM public.cleaning_checklist_sections s
                 JOIN public.cleaning_checklists c ON c.id = s.checklist_id
                 WHERE s.id = section_id AND c.host_id = auth.uid()))
  WITH CHECK (EXISTS (SELECT 1 FROM public.cleaning_checklist_sections s
                      JOIN public.cleaning_checklists c ON c.id = s.checklist_id
                      WHERE s.id = section_id AND c.host_id = auth.uid()));
CREATE POLICY "service role manages checklist items"
  ON public.cleaning_checklist_items FOR ALL
  USING (auth.role() = 'service_role');

-- Snapshot: host of the parent task can read; assigned cleaner can read + update
CREATE POLICY "host reads own turnover checklist"
  ON public.turnover_checklist_items FOR SELECT
  USING (EXISTS (SELECT 1 FROM public.turnover_tasks t
                 WHERE t.id = turnover_task_id AND t.host_id = auth.uid()));
CREATE POLICY "cleaner reads assigned turnover checklist"
  ON public.turnover_checklist_items FOR SELECT
  USING (EXISTS (SELECT 1 FROM public.turnover_tasks t
                 JOIN public.vendors v ON v.id = t.assigned_vendor_id
                 WHERE t.id = turnover_task_id AND v.user_id = auth.uid()));
CREATE POLICY "cleaner updates assigned turnover checklist"
  ON public.turnover_checklist_items FOR UPDATE
  USING (EXISTS (SELECT 1 FROM public.turnover_tasks t
                 JOIN public.vendors v ON v.id = t.assigned_vendor_id
                 WHERE t.id = turnover_task_id AND v.user_id = auth.uid()))
  WITH CHECK (EXISTS (SELECT 1 FROM public.turnover_tasks t
                      JOIN public.vendors v ON v.id = t.assigned_vendor_id
                      WHERE t.id = turnover_task_id AND v.user_id = auth.uid()));
CREATE POLICY "service role manages turnover checklist"
  ON public.turnover_checklist_items FOR ALL
  USING (auth.role() = 'service_role');
