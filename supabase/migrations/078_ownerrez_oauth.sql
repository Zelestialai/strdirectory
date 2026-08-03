-- Migration 078: OwnerRez OAuth support on host_integrations
-- Adds OAuth token storage alongside the existing Personal Access Token fields.

ALTER TABLE public.host_integrations
  ADD COLUMN IF NOT EXISTS auth_method     text NOT NULL DEFAULT 'token'
    CHECK (auth_method IN ('token','oauth')),
  ADD COLUMN IF NOT EXISTS access_token    text,   -- OAuth access token
  ADD COLUMN IF NOT EXISTS refresh_token   text,   -- OAuth refresh token
  ADD COLUMN IF NOT EXISTS token_expires_at timestamptz;

COMMENT ON COLUMN public.host_integrations.auth_method IS 'token = Personal Access Token, oauth = OAuth app';
