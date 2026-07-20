-- Migration 067: Host team feature
-- team_members: invite/accept relationship between host and vendor
-- team_messages: persistent message thread per relationship

-- ─── 1. team_members ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.team_members (
  id              uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  host_id         uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  vendor_id       uuid REFERENCES public.vendors(id) ON DELETE CASCADE NOT NULL,
  vendor_user_id  uuid REFERENCES public.profiles(id) ON DELETE SET NULL,  -- denormalized for RLS
  status          text NOT NULL DEFAULT 'pending'
                    CHECK (status IN ('pending', 'accepted', 'declined')),
  host_notes      text,
  invited_at      timestamptz DEFAULT now(),
  responded_at    timestamptz,
  UNIQUE(host_id, vendor_id)
);

ALTER TABLE public.team_members ENABLE ROW LEVEL SECURITY;

-- Host can fully manage their team rows
CREATE POLICY "Hosts manage their team"
  ON public.team_members FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());

-- Vendors can see invites addressed to them and update status
CREATE POLICY "Vendors see their invites"
  ON public.team_members FOR SELECT
  USING (vendor_user_id = auth.uid());

CREATE POLICY "Vendors respond to invites"
  ON public.team_members FOR UPDATE
  USING (vendor_user_id = auth.uid())
  WITH CHECK (vendor_user_id = auth.uid());

-- ─── 2. team_messages ────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.team_messages (
  id              uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  team_member_id  uuid REFERENCES public.team_members(id) ON DELETE CASCADE NOT NULL,
  host_id         uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  vendor_user_id  uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  sender_id       uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  body            text NOT NULL,
  is_read         boolean DEFAULT false,
  created_at      timestamptz DEFAULT now()
);

ALTER TABLE public.team_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team parties can read messages"
  ON public.team_messages FOR SELECT
  USING (host_id = auth.uid() OR vendor_user_id = auth.uid());

CREATE POLICY "Team parties can send messages"
  ON public.team_messages FOR INSERT
  WITH CHECK (
    sender_id = auth.uid()
    AND (host_id = auth.uid() OR vendor_user_id = auth.uid())
  );

CREATE POLICY "Team parties can mark read"
  ON public.team_messages FOR UPDATE
  USING (host_id = auth.uid() OR vendor_user_id = auth.uid())
  WITH CHECK (host_id = auth.uid() OR vendor_user_id = auth.uid());

-- ─── 3. Indexes ───────────────────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS team_members_host_id_idx ON public.team_members(host_id);
CREATE INDEX IF NOT EXISTS team_members_vendor_user_id_idx ON public.team_members(vendor_user_id);
CREATE INDEX IF NOT EXISTS team_members_status_idx ON public.team_members(status);
CREATE INDEX IF NOT EXISTS team_messages_team_member_id_idx ON public.team_messages(team_member_id);
CREATE INDEX IF NOT EXISTS team_messages_created_at_idx ON public.team_messages(created_at);
