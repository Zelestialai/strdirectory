-- ============================================================
-- Migration 008 — Fix vendor unique(user_id) constraint
--
-- The original schema had unique(user_id) meaning one vendor
-- profile per user. This prevents seeding multiple vendors
-- from the same admin account, and also limits real users who
-- might legitimately run multiple service businesses.
--
-- We drop the constraint and replace it with a regular index
-- so queries on user_id stay fast.
-- ============================================================

-- Drop the unique constraint
alter table public.vendors drop constraint if exists vendors_user_id_key;

-- Keep a non-unique index for query performance
create index if not exists vendors_user_id_idx on public.vendors(user_id);
