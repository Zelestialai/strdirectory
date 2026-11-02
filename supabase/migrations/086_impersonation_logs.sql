-- Audit trail for admin "view as user" (impersonation) sessions.
create table if not exists public.impersonation_logs (
  id          uuid primary key default gen_random_uuid(),
  admin_id    uuid not null references auth.users(id) on delete cascade,
  target_id   uuid not null references auth.users(id) on delete cascade,
  started_at  timestamptz not null default now(),
  ended_at    timestamptz
);

create index if not exists impersonation_logs_admin_idx  on public.impersonation_logs (admin_id);
create index if not exists impersonation_logs_target_idx on public.impersonation_logs (target_id);

-- Locked down: only the service role (used by the admin API routes) may read or
-- write. No client ever touches this table directly.
alter table public.impersonation_logs enable row level security;
