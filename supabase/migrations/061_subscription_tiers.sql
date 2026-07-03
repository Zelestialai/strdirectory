-- Migration 061: Subscription tiers + Stripe fields on vendors

alter table public.vendors
  add column if not exists subscription_tier text not null default 'free'
    check (subscription_tier in ('free', 'pro', 'featured')),
  add column if not exists stripe_customer_id text,
  add column if not exists stripe_subscription_id text,
  add column if not exists subscription_expires_at timestamptz;

-- Backfill existing is_featured=true vendors into the 'featured' tier
update public.vendors
  set subscription_tier = 'featured'
  where is_featured = true;

-- Index for fast tier-based filtering/sorting
create index if not exists vendors_subscription_tier_idx
  on public.vendors(subscription_tier);
