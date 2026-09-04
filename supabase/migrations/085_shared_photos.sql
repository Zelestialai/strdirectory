-- Migration 085: Shared photos between a host and the vendor working their job.
-- Two scopes:
--   • property album  → turnover_task_id IS NULL (general documentation)
--   • job photos      → turnover_task_id set    (before/after a specific turnover)
-- Access is enforced in API routes (service role), so RLS stays locked down and
-- reads/writes go through authorized handlers. Files live in a private
-- `shared-photos` bucket; the app serves them via short-lived signed URLs.

create table if not exists public.shared_photos (
  id                 uuid primary key default gen_random_uuid(),
  property_id        uuid not null references public.properties(id) on delete cascade,
  turnover_task_id   uuid references public.turnover_tasks(id) on delete cascade,
  host_id            uuid not null references public.profiles(id) on delete cascade,
  uploaded_by        uuid not null references public.profiles(id) on delete cascade,
  uploader_role      text not null check (uploader_role in ('host', 'vendor')),
  vendor_id          uuid references public.vendors(id) on delete set null,
  storage_path       text not null,
  caption            text,
  created_at         timestamptz not null default now()
);

create index if not exists shared_photos_property_idx
  on public.shared_photos (property_id, created_at desc);
create index if not exists shared_photos_task_idx
  on public.shared_photos (turnover_task_id, created_at desc);

alter table public.shared_photos enable row level security;
-- No permissive policies: all access is brokered by API routes using the
-- service role. This prevents any direct client read/write.

-- Private bucket for the image files.
insert into storage.buckets (id, name, public)
values ('shared-photos', 'shared-photos', false)
on conflict (id) do nothing;
