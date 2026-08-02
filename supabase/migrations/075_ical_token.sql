-- Migration 075: per-user iCal export token
-- Powers subscribe-able .ics feeds (cleaner turnover schedule, host reservations).
-- The token is the only credential in the feed URL, so it must be unguessable
-- and regeneratable (which instantly invalidates old feed URLs).

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS ical_token uuid NOT NULL DEFAULT gen_random_uuid();

CREATE UNIQUE INDEX IF NOT EXISTS profiles_ical_token_idx
  ON public.profiles (ical_token);

COMMENT ON COLUMN public.profiles.ical_token IS 'Secret token embedded in the user''s .ics subscribe URLs';
