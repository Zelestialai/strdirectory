-- Migration 072: in-app notifications
-- Backs the navbar notification bell. Rows are created server-side (service role)
-- when events happen; users can read and mark their own notifications read.

CREATE TABLE IF NOT EXISTS public.notifications (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id    uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  type       text NOT NULL,            -- 'inquiry' | 'review' | 'reply' | 'subscription' | 'system'
  title      text NOT NULL,
  body       text,
  link       text,                     -- where clicking the notification navigates
  read_at    timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS notifications_user_created_idx
  ON public.notifications (user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS notifications_user_unread_idx
  ON public.notifications (user_id) WHERE read_at IS NULL;

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

-- Users can read their own notifications
CREATE POLICY "read own notifications"
  ON public.notifications FOR SELECT
  USING (user_id = auth.uid());

-- Users can update their own notifications (mark read)
CREATE POLICY "update own notifications"
  ON public.notifications FOR UPDATE
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- Service role has full access (for server-side inserts)
CREATE POLICY "service role full access on notifications"
  ON public.notifications FOR ALL
  USING (auth.role() = 'service_role');
