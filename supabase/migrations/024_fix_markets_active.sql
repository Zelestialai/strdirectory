-- Migration 024: Fix is_active on markets
-- The original column allowed NULL; the RLS policy "using (is_active = true)"
-- silently hides any row where is_active IS NULL.
-- Backfill nulls and tighten the column to NOT NULL.

update public.markets set is_active = true where is_active is null;

alter table public.markets
  alter column is_active set not null,
  alter column is_active set default true;

-- Drop and recreate the read policy to also expose is_active = false
-- rows to admins (they were blocked before).
drop policy if exists "Markets are publicly readable" on public.markets;
drop policy if exists "Admins can manage markets" on public.markets;

create policy "Markets are publicly readable"
  on public.markets for select
  using (
    is_active = true
    or exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'admin'
    )
  );

create policy "Admins can manage markets"
  on public.markets for all
  using (
    exists (
      select 1 from public.profiles
      where id = auth.uid() and role = 'admin'
    )
  );
