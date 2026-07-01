-- Migration 059: Vendor claiming
-- Allows pre-seeded vendors to claim their listing via email verification.

create table if not exists public.claim_requests (
  id           uuid default uuid_generate_v4() primary key,
  vendor_id    uuid references public.vendors(id) on delete cascade not null,
  email        text not null,
  contact_name text not null,
  message      text,
  token        uuid default uuid_generate_v4() not null unique,
  status       text not null default 'pending'
                 check (status in ('pending', 'completed', 'expired')),
  created_at   timestamptz default now(),
  expires_at   timestamptz default (now() + interval '24 hours'),
  completed_at timestamptz
);

-- Prevent multiple simultaneous pending claims for the same vendor
create unique index if not exists claim_requests_vendor_pending_idx
  on public.claim_requests(vendor_id)
  where (status = 'pending');

create index if not exists claim_requests_token_idx  on public.claim_requests(token);
create index if not exists claim_requests_vendor_idx on public.claim_requests(vendor_id);

alter table public.claim_requests enable row level security;

-- Anyone can submit a claim (public insert)
create policy "Anyone can submit a claim request"
  on public.claim_requests for select
  using (false);

create policy "Public insert for claim requests"
  on public.claim_requests for insert
  with check (true);
