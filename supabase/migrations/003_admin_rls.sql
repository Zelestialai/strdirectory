-- ============================================================
-- Migration 003 — Admin RLS policies
-- ============================================================

-- Allow admins to see ALL vendors (including inactive)
create policy "Admins can view all vendors" on public.vendors
  for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Allow admins to update any vendor
create policy "Admins can update any vendor" on public.vendors
  for update using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Allow admins to view all profiles
create policy "Admins can view all profiles" on public.profiles
  for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Allow admins to update any profile (e.g. change role)
create policy "Admins can update any profile" on public.profiles
  for update using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Allow admins to view all inquiries
create policy "Admins can view all inquiries" on public.inquiries
  for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- GRANT YOURSELF ADMIN — replace the email below with yours
-- Run this separately after finding your user ID:
--
--   update public.profiles
--   set role = 'admin'
--   where id = (select id from auth.users where email = 'your@email.com');
--
-- ============================================================
