-- Scope a team member (cleaner) to specific host properties.
-- Rule used by the app: if a team member has ANY rows here, they cover exactly
-- those properties. If they have NONE, they cover all the host's properties
-- (backward-compatible default for teams created before this feature).
create table if not exists public.team_member_properties (
  team_member_id uuid not null references public.team_members(id) on delete cascade,
  property_id    uuid not null references public.properties(id)    on delete cascade,
  created_at     timestamptz not null default now(),
  primary key (team_member_id, property_id)
);

alter table public.team_member_properties enable row level security;

-- Host can manage the scope for their own team members.
create policy "host manages team member properties"
  on public.team_member_properties for all
  using (
    exists (
      select 1 from public.team_members tm
      where tm.id = team_member_id and tm.host_id = auth.uid()
    )
  )
  with check (
    exists (
      select 1 from public.team_members tm
      where tm.id = team_member_id and tm.host_id = auth.uid()
    )
  );

-- The cleaner can read which properties they're scoped to.
create policy "cleaner reads own scoped properties"
  on public.team_member_properties for select
  using (
    exists (
      select 1 from public.team_members tm
      where tm.id = team_member_id and tm.vendor_user_id = auth.uid()
    )
  );
