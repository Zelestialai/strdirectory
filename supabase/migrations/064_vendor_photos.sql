-- Migration 064: vendor photo gallery + storage bucket

-- ── 1. Create storage bucket ─────────────────────────────────────────────────
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'vendor-images',
  'vendor-images',
  true,
  5242880,  -- 5 MB per file
  array['image/jpeg','image/jpg','image/png','image/webp','image/gif']
)
on conflict (id) do nothing;

-- ── 2. Storage policies ───────────────────────────────────────────────────────
-- Public read
create policy "Public read vendor images"
  on storage.objects for select
  using (bucket_id = 'vendor-images');

-- Vendors can upload into their own folder (folder name = their vendor id)
create policy "Vendors can upload own images"
  on storage.objects for insert
  with check (
    bucket_id = 'vendor-images'
    and auth.role() = 'authenticated'
    and (storage.foldername(name))[1] = (
      select id::text from public.vendors where user_id = auth.uid() limit 1
    )
  );

create policy "Vendors can update own images"
  on storage.objects for update
  using (
    bucket_id = 'vendor-images'
    and auth.role() = 'authenticated'
    and (storage.foldername(name))[1] = (
      select id::text from public.vendors where user_id = auth.uid() limit 1
    )
  );

create policy "Vendors can delete own images"
  on storage.objects for delete
  using (
    bucket_id = 'vendor-images'
    and auth.role() = 'authenticated'
    and (storage.foldername(name))[1] = (
      select id::text from public.vendors where user_id = auth.uid() limit 1
    )
  );

-- ── 3. vendor_photos table ────────────────────────────────────────────────────
create table if not exists public.vendor_photos (
  id           uuid primary key default gen_random_uuid(),
  vendor_id    uuid not null references public.vendors(id) on delete cascade,
  url          text not null,
  storage_path text not null,
  sort_order   int  not null default 0,
  created_at   timestamptz not null default now()
);

create index if not exists vendor_photos_vendor_id_idx
  on public.vendor_photos(vendor_id, sort_order);

alter table public.vendor_photos enable row level security;

create policy "Anyone can view vendor photos"
  on public.vendor_photos for select
  using (true);

create policy "Vendor can insert own photos"
  on public.vendor_photos for insert
  with check (
    vendor_id in (select id from public.vendors where user_id = auth.uid())
  );

create policy "Vendor can delete own photos"
  on public.vendor_photos for delete
  using (
    vendor_id in (select id from public.vendors where user_id = auth.uid())
  );
