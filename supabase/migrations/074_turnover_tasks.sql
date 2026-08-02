-- Migration 074: Turnover cleaning tasks (Turno-style)
-- Hosts create/auto-generate turnover cleaning tasks. If they have a cleaner on
-- their team the task is auto-assigned (cleaner accepts/declines); otherwise it
-- is broadcast as an "open" job that cleaners bid on and the host awards.

-- ─── turnover_tasks ──────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.turnover_tasks (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  host_id            uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  property_id        uuid REFERENCES public.properties(id) ON DELETE SET NULL,
  calendar_event_id  uuid REFERENCES public.calendar_events(id) ON DELETE SET NULL,
  title              text NOT NULL,
  notes              text,
  scheduled_date     date NOT NULL,               -- the turnover / checkout date
  status             text NOT NULL DEFAULT 'open'
                       CHECK (status IN ('open','assigned','scheduled','completed','cancelled')),
  assigned_vendor_id uuid REFERENCES public.vendors(id) ON DELETE SET NULL,
  price_cents        integer,                      -- host-set (assigned) or accepted bid amount
  market_slug        text,                         -- for open-job discovery by cleaners
  created_at         timestamptz NOT NULL DEFAULT now(),
  updated_at         timestamptz NOT NULL DEFAULT now(),
  UNIQUE (calendar_event_id)                       -- one task per synced checkout
);

CREATE INDEX IF NOT EXISTS turnover_tasks_host_idx    ON public.turnover_tasks (host_id, scheduled_date);
CREATE INDEX IF NOT EXISTS turnover_tasks_vendor_idx  ON public.turnover_tasks (assigned_vendor_id, scheduled_date);
CREATE INDEX IF NOT EXISTS turnover_tasks_open_idx    ON public.turnover_tasks (status, market_slug) WHERE status = 'open';

ALTER TABLE public.turnover_tasks ENABLE ROW LEVEL SECURITY;

-- Hosts manage their own tasks
CREATE POLICY "hosts manage own turnover tasks"
  ON public.turnover_tasks FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());

-- Cleaners can read tasks assigned to them, or any open task (marketplace)
CREATE POLICY "cleaners read assigned or open tasks"
  ON public.turnover_tasks FOR SELECT
  USING (
    status = 'open'
    OR assigned_vendor_id IN (SELECT id FROM public.vendors WHERE user_id = auth.uid())
  );

-- Assigned cleaners can update their task (accept/decline/complete)
CREATE POLICY "cleaners update assigned tasks"
  ON public.turnover_tasks FOR UPDATE
  USING (assigned_vendor_id IN (SELECT id FROM public.vendors WHERE user_id = auth.uid()))
  WITH CHECK (assigned_vendor_id IN (SELECT id FROM public.vendors WHERE user_id = auth.uid()));

CREATE POLICY "service role manages turnover tasks"
  ON public.turnover_tasks FOR ALL
  USING (auth.role() = 'service_role');

-- ─── turnover_bids ───────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.turnover_bids (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  task_id      uuid NOT NULL REFERENCES public.turnover_tasks(id) ON DELETE CASCADE,
  vendor_id    uuid NOT NULL REFERENCES public.vendors(id) ON DELETE CASCADE,
  price_cents  integer NOT NULL CHECK (price_cents >= 0),
  message      text,
  status       text NOT NULL DEFAULT 'pending'
                 CHECK (status IN ('pending','accepted','rejected')),
  created_at   timestamptz NOT NULL DEFAULT now(),
  UNIQUE (task_id, vendor_id)
);

CREATE INDEX IF NOT EXISTS turnover_bids_task_idx   ON public.turnover_bids (task_id);
CREATE INDEX IF NOT EXISTS turnover_bids_vendor_idx ON public.turnover_bids (vendor_id);

ALTER TABLE public.turnover_bids ENABLE ROW LEVEL SECURITY;

-- Cleaners manage their own bids
CREATE POLICY "cleaners manage own bids"
  ON public.turnover_bids FOR ALL
  USING (vendor_id IN (SELECT id FROM public.vendors WHERE user_id = auth.uid()))
  WITH CHECK (vendor_id IN (SELECT id FROM public.vendors WHERE user_id = auth.uid()));

-- Hosts can read bids on their own tasks
CREATE POLICY "hosts read bids on own tasks"
  ON public.turnover_bids FOR SELECT
  USING (task_id IN (SELECT id FROM public.turnover_tasks WHERE host_id = auth.uid()));

CREATE POLICY "service role manages bids"
  ON public.turnover_bids FOR ALL
  USING (auth.role() = 'service_role');
