-- ============================================================
-- STR Service Provider Directory — Initial Schema
-- ============================================================

-- Enable extensions
create extension if not exists "uuid-ossp";
create extension if not exists "unaccent";

-- ============================================================
-- PROFILES (extends auth.users)
-- ============================================================
create table public.profiles (
  id           uuid primary key references auth.users(id) on delete cascade,
  full_name    text,
  avatar_url   text,
  role         text not null default 'user'  -- 'user' | 'vendor' | 'admin'
               check (role in ('user','vendor','admin')),
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

-- Auto-create profile on sign-up
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, avatar_url)
  values (
    new.id,
    new.raw_user_meta_data->>'full_name',
    new.raw_user_meta_data->>'avatar_url'
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ============================================================
-- CATEGORIES
-- ============================================================
create table public.categories (
  id          uuid primary key default uuid_generate_v4(),
  name        text not null unique,
  slug        text not null unique,
  description text,
  icon        text,   -- lucide icon name
  color       text,   -- tailwind color token e.g. "blue"
  created_at  timestamptz not null default now()
);

-- Seed categories
insert into public.categories (name, slug, description, icon, color) values
  ('Cleaning & Turnover',   'cleaning-turnover',   'Cleaning crews, linen services, and turnover specialists', 'Sparkles',   'sky'),
  ('Photography & Design',  'photography-design',  'Listing photographers, interior designers, and stagers',   'Camera',     'violet'),
  ('Maintenance & Repairs', 'maintenance-repairs', 'Handymen, plumbers, electricians, and HVAC technicians',  'Wrench',     'amber'),
  ('Property Management',   'property-management', 'Full-service PMs, co-hosts, and guest communication',      'Building2',  'emerald');

-- ============================================================
-- VENDORS
-- ============================================================
create table public.vendors (
  id              uuid primary key default uuid_generate_v4(),
  user_id         uuid not null references public.profiles(id) on delete cascade,
  category_id     uuid not null references public.categories(id),
  business_name   text not null,
  slug            text not null unique,
  tagline         text,
  description     text,
  website         text,
  phone           text,
  email           text,
  -- Location
  city            text,
  state           text,
  zip             text,
  country         text not null default 'US',
  service_radius  integer,          -- miles
  -- Media
  logo_url        text,
  cover_url       text,
  -- Listing status
  is_verified     boolean not null default false,
  is_featured     boolean not null default false,
  is_active       boolean not null default true,
  -- Computed (updated by trigger)
  avg_rating      numeric(3,2) default 0,
  review_count    integer not null default 0,

  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now(),

  unique(user_id)   -- one vendor profile per user for now
);

-- Full-text search index
create index vendors_fts_idx on public.vendors
  using gin(to_tsvector('english', coalesce(business_name,'') || ' ' || coalesce(city,'') || ' ' || coalesce(description,'')));

create index vendors_category_idx on public.vendors(category_id);
create index vendors_city_idx on public.vendors(city);
create index vendors_active_idx on public.vendors(is_active);

-- ============================================================
-- VENDOR SERVICES (optional tags)
-- ============================================================
create table public.vendor_services (
  id        uuid primary key default uuid_generate_v4(),
  vendor_id uuid not null references public.vendors(id) on delete cascade,
  name      text not null
);

-- ============================================================
-- REVIEWS
-- ============================================================
create table public.reviews (
  id          uuid primary key default uuid_generate_v4(),
  vendor_id   uuid not null references public.vendors(id) on delete cascade,
  reviewer_id uuid not null references public.profiles(id) on delete cascade,
  rating      integer not null check (rating between 1 and 5),
  title       text,
  body        text,
  is_verified boolean not null default false,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  unique(vendor_id, reviewer_id)   -- one review per vendor per user
);

create index reviews_vendor_idx on public.reviews(vendor_id);

-- Update vendor avg_rating + review_count on review insert/update/delete
create or replace function public.refresh_vendor_rating()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_id uuid;
begin
  v_id := coalesce(new.vendor_id, old.vendor_id);
  update public.vendors
  set
    avg_rating   = (select coalesce(avg(rating)::numeric(3,2), 0) from public.reviews where vendor_id = v_id),
    review_count = (select count(*) from public.reviews where vendor_id = v_id),
    updated_at   = now()
  where id = v_id;
  return coalesce(new, old);
end;
$$;

create trigger trg_refresh_vendor_rating
  after insert or update or delete on public.reviews
  for each row execute procedure public.refresh_vendor_rating();

-- ============================================================
-- INQUIRIES
-- ============================================================
create table public.inquiries (
  id          uuid primary key default uuid_generate_v4(),
  vendor_id   uuid not null references public.vendors(id) on delete cascade,
  sender_id   uuid references public.profiles(id) on delete set null,
  -- For guests (not logged in)
  sender_name  text,
  sender_email text,
  sender_phone text,
  message     text not null,
  status      text not null default 'new'   -- 'new' | 'read' | 'replied' | 'closed'
              check (status in ('new','read','replied','closed')),
  created_at  timestamptz not null default now()
);

create index inquiries_vendor_idx on public.inquiries(vendor_id);
create index inquiries_sender_idx on public.inquiries(sender_id);

-- ============================================================
-- ROW-LEVEL SECURITY
-- ============================================================

alter table public.profiles      enable row level security;
alter table public.categories    enable row level security;
alter table public.vendors       enable row level security;
alter table public.vendor_services enable row level security;
alter table public.reviews       enable row level security;
alter table public.inquiries     enable row level security;

-- PROFILES
create policy "Public profiles are viewable by everyone" on public.profiles
  for select using (true);
create policy "Users can update own profile" on public.profiles
  for update using (auth.uid() = id);

-- CATEGORIES (public read)
create policy "Categories are public" on public.categories
  for select using (true);

-- VENDORS
create policy "Active vendors are public" on public.vendors
  for select using (is_active = true);
create policy "Vendors can insert own listing" on public.vendors
  for insert with check (auth.uid() = user_id);
create policy "Vendors can update own listing" on public.vendors
  for update using (auth.uid() = user_id);

-- VENDOR SERVICES
create policy "Vendor services are public" on public.vendor_services
  for select using (true);
create policy "Vendors manage own services" on public.vendor_services
  for all using (
    exists (select 1 from public.vendors v where v.id = vendor_id and v.user_id = auth.uid())
  );

-- REVIEWS
create policy "Reviews are public" on public.reviews
  for select using (true);
create policy "Authenticated users can create reviews" on public.reviews
  for insert with check (auth.uid() = reviewer_id);
create policy "Users can update own review" on public.reviews
  for update using (auth.uid() = reviewer_id);
create policy "Users can delete own review" on public.reviews
  for delete using (auth.uid() = reviewer_id);

-- INQUIRIES
create policy "Vendors can view own inquiries" on public.inquiries
  for select using (
    exists (select 1 from public.vendors v where v.id = vendor_id and v.user_id = auth.uid())
    or auth.uid() = sender_id
  );
create policy "Anyone can create inquiry" on public.inquiries
  for insert with check (true);
create policy "Vendors can update inquiry status" on public.inquiries
  for update using (
    exists (select 1 from public.vendors v where v.id = vendor_id and v.user_id = auth.uid())
  );

-- ============================================================
-- HELPER FUNCTION: generate unique slug
-- ============================================================
create or replace function public.slugify(text)
returns text language sql immutable strict as $$
  select lower(regexp_replace(unaccent($1), '[^a-z0-9]+', '-', 'gi'))
$$;
