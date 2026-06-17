-- ============================================================
-- Migration 042 — Disable all dummy/seed vendors
-- Sets is_active = false for every vendor where is_claimed = false
-- (all seeded vendors are unclaimed; real registered vendors are claimed).
-- Safe to run multiple times — only affects unclaimed vendors.
-- ============================================================

update public.vendors
set is_active = false
where is_claimed = false;
