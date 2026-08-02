-- Migration 076: PMS integrations (OwnerRez to start)
-- Stores a host's connection credentials so we can auto-sync their reservations
-- in the background. Access is tightly restricted via RLS.

CREATE TABLE IF NOT EXISTS public.host_integrations (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  host_id         uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  provider        text NOT NULL,                 -- 'ownerrez'
  api_username    text,                           -- OwnerRez login/email (Basic auth user)
  api_token       text,                           -- Personal Access Token (secret)
  status          text NOT NULL DEFAULT 'active'  -- 'active' | 'error' | 'disabled'
                    CHECK (status IN ('active','error','disabled')),
  last_synced_at  timestamptz,
  last_error      text,
  created_at      timestamptz NOT NULL DEFAULT now(),
  updated_at      timestamptz NOT NULL DEFAULT now(),
  UNIQUE (host_id, provider)
);

CREATE INDEX IF NOT EXISTS host_integrations_host_idx ON public.host_integrations (host_id);

ALTER TABLE public.host_integrations ENABLE ROW LEVEL SECURITY;

-- Only the owner may see/manage their integration. Note: RLS lets a host read
-- their own row (incl. token). The cron worker uses the service role.
CREATE POLICY "hosts manage own integrations"
  ON public.host_integrations FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());

CREATE POLICY "service role manages integrations"
  ON public.host_integrations FOR ALL
  USING (auth.role() = 'service_role');

-- Map STRVend properties to an external PMS record so syncs are idempotent
ALTER TABLE public.properties
  ADD COLUMN IF NOT EXISTS external_source text,   -- 'ownerrez'
  ADD COLUMN IF NOT EXISTS external_id     text;   -- OwnerRez property id

CREATE UNIQUE INDEX IF NOT EXISTS properties_external_idx
  ON public.properties (host_id, external_source, external_id)
  WHERE external_source IS NOT NULL;
