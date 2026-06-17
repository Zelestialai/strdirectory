-- Migration 023: Add is_claimed flag to vendors
-- Claimed vendors are those who registered their own account and created their listing.
-- Seed vendors (created by admin) are unclaimed by default.

alter table public.vendors
  add column if not exists is_claimed boolean not null default false;

-- Also add a notification_email column so vendors can set a separate
-- address for message alerts (defaults to null, falls back to auth email in app logic)
alter table public.vendors
  add column if not exists notification_email text;

-- Mark existing vendor accounts that belong to a real (non-admin) user as claimed.
-- Seed vendors were all inserted with the admin profile's user_id so they stay false.
update public.vendors v
set is_claimed = true
from public.profiles p
where v.user_id = p.id
  and p.role = 'vendor';
