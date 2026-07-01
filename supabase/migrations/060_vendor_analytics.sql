-- Migration 060: Vendor analytics — profile view tracking

create table if not exists public.vendor_views (
  id         uuid default uuid_generate_v4() primary key,
  vendor_id  uuid references public.vendors(id) on delete cascade not null,
  viewed_at  timestamptz default now() not null
);

create index if not exists vendor_views_vendor_id_idx on public.vendor_views(vendor_id);
create index if not exists vendor_views_viewed_at_idx on public.vendor_views(viewed_at);

alter table public.vendor_views enable row level security;

-- Block direct reads (analytics only served via service-role or aggregated queries)
create policy "No public select on vendor_views"
  on public.vendor_views for select
  using (false);

-- Allow anonymous inserts (anyone visiting a profile creates a view)
create policy "Anyone can record a profile view"
  on public.vendor_views for insert
  with check (true);
