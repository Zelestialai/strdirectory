-- 069_stripe_connect.sql
-- Add Stripe Connect fields to host profiles

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS stripe_account_id         TEXT,
  ADD COLUMN IF NOT EXISTS stripe_onboarding_complete BOOLEAN NOT NULL DEFAULT FALSE;

-- Index for webhook lookups (stripe account id → supabase user)
CREATE INDEX IF NOT EXISTS profiles_stripe_account_id_idx
  ON profiles (stripe_account_id)
  WHERE stripe_account_id IS NOT NULL;
