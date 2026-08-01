-- Migration 073: remembered market preference
-- Stores the market slug a logged-in user last selected, so their location
-- choice syncs across devices (anonymous users use a cookie instead).

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS preferred_market text;

COMMENT ON COLUMN public.profiles.preferred_market IS 'Slug of the market the user last selected (references markets.slug)';
