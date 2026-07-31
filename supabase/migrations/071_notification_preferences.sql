-- Migration 071: notification preferences
-- Per-user email notification toggles, surfaced in /dashboard/settings.

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS email_on_inquiry     boolean NOT NULL DEFAULT true,
  ADD COLUMN IF NOT EXISTS email_on_review      boolean NOT NULL DEFAULT true,
  ADD COLUMN IF NOT EXISTS email_weekly_digest  boolean NOT NULL DEFAULT true,
  ADD COLUMN IF NOT EXISTS email_product_updates boolean NOT NULL DEFAULT true;

-- Soft-deactivation flag so a user can close their account without a hard delete.
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS deactivated_at timestamptz;

COMMENT ON COLUMN public.profiles.email_on_inquiry IS 'Email me when a host sends a new inquiry';
COMMENT ON COLUMN public.profiles.email_on_review IS 'Email me when I receive a new review';
COMMENT ON COLUMN public.profiles.email_weekly_digest IS 'Send me the weekly performance digest';
COMMENT ON COLUMN public.profiles.email_product_updates IS 'Send me occasional product news and tips';
COMMENT ON COLUMN public.profiles.deactivated_at IS 'When set, the account is deactivated (soft delete)';
