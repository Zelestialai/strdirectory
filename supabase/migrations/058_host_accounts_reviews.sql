-- Migration 058: Host accounts, saved vendors, and review enhancements
-- Adds 'host' role, saved_vendors table, vendor_response on reviews, and updated RLS.

-- ─── 1. Add 'host' to profiles role enum ──────────────────────────────────────
alter table public.profiles
  drop constraint if exists profiles_role_check;

alter table public.profiles
  add constraint profiles_role_check
  check (role in ('user', 'vendor', 'admin', 'host'));

-- ─── 2. saved_vendors table ───────────────────────────────────────────────────
create table if not exists public.saved_vendors (
  id          uuid default uuid_generate_v4() primary key,
  host_id     uuid references public.profiles(id) on delete cascade not null,
  vendor_id   uuid references public.vendors(id) on delete cascade not null,
  notes       text,
  created_at  timestamptz default now(),
  unique(host_id, vendor_id)
);

alter table public.saved_vendors enable row level security;

create policy "Hosts can view their own saved vendors"
  on public.saved_vendors for select
  using (host_id = auth.uid());

create policy "Hosts can save vendors"
  on public.saved_vendors for insert
  with check (host_id = auth.uid());

create policy "Hosts can unsave vendors"
  on public.saved_vendors for delete
  using (host_id = auth.uid());

-- ─── 3. Review enhancements ───────────────────────────────────────────────────
-- Vendor response
alter table public.reviews
  add column if not exists vendor_response      text,
  add column if not exists vendor_response_at   timestamptz;

-- Photo array (URLs stored as text array)
alter table public.reviews
  add column if not exists photos  text[] default '{}';

-- Helpful count (future feature)
alter table public.reviews
  add column if not exists helpful_count  integer default 0;

-- ─── 4. Allow vendors to add/update responses on their reviews ────────────────
-- Drop stale policy if exists
drop policy if exists "Vendors can respond to their reviews" on public.reviews;

create policy "Vendors can respond to their reviews"
  on public.reviews for update
  using (
    exists (
      select 1 from public.vendors v
      where v.id = reviews.vendor_id
        and v.user_id = auth.uid()
    )
  )
  with check (
    exists (
      select 1 from public.vendors v
      where v.id = reviews.vendor_id
        and v.user_id = auth.uid()
    )
  );

-- ─── 5. Helper function: did this user inquire with this vendor? ───────────────
create or replace function public.user_has_inquiry_with_vendor(p_vendor_id uuid)
returns boolean
language sql
security definer
stable
as $$
  select exists (
    select 1 from public.inquiries
    where vendor_id = p_vendor_id
      and sender_id = auth.uid()
  );
$$;

-- ─── 6. Index for saved_vendors lookups ───────────────────────────────────────
create index if not exists saved_vendors_host_id_idx   on public.saved_vendors(host_id);
create index if not exists saved_vendors_vendor_id_idx on public.saved_vendors(vendor_id);
