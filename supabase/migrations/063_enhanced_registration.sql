-- Migration 063: Enhanced registration — host profiles, vendor markets, role-aware trigger

-- ── 1. host_profiles table ────────────────────────────────────────────────────
create table if not exists public.host_profiles (
  id                  uuid primary key references public.profiles(id) on delete cascade,
  host_type           text not null default 'active'
                      check (host_type in ('active', 'potential')),
  airbnb_url          text,
  direct_booking_url  text,
  markets             text[] not null default '{}',
  -- Potential host fields
  agent_name          text,
  property_address    text,
  property_location   text,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);

alter table public.host_profiles enable row level security;

create policy "Host can view own profile"
  on public.host_profiles for select
  using (id = auth.uid());

create policy "Host can insert own profile"
  on public.host_profiles for insert
  with check (id = auth.uid());

create policy "Host can update own profile"
  on public.host_profiles for update
  using (id = auth.uid());

create index if not exists host_profiles_markets_idx
  on public.host_profiles using gin(markets);

-- ── 2. Add markets to vendors ─────────────────────────────────────────────────
alter table public.vendors
  add column if not exists markets text[] not null default '{}';

create index if not exists vendors_markets_idx
  on public.vendors using gin(markets);

-- ── 3. Update handle_new_user trigger ────────────────────────────────────────
-- Now sets role from metadata and creates host_profile when applicable.
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_meta_role  text;
  v_role       text;
  v_host_type  text;
begin
  v_meta_role := coalesce(new.raw_user_meta_data->>'role', 'user');

  -- Map signup role value to profiles.role constraint
  v_role := case v_meta_role
    when 'active_host'    then 'host'
    when 'potential_host' then 'host'
    when 'vendor'         then 'vendor'
    when 'host'           then 'host'
    when 'admin'          then 'admin'
    else 'user'
  end;

  -- Create base profile
  insert into public.profiles (id, full_name, avatar_url, role)
  values (
    new.id,
    new.raw_user_meta_data->>'full_name',
    new.raw_user_meta_data->>'avatar_url',
    v_role
  );

  -- Create host_profile for host account types
  if v_meta_role in ('active_host', 'potential_host') then
    v_host_type := case v_meta_role
      when 'potential_host' then 'potential'
      else 'active'
    end;

    insert into public.host_profiles (
      id, host_type, airbnb_url, direct_booking_url, markets,
      agent_name, property_address, property_location
    ) values (
      new.id,
      v_host_type,
      new.raw_user_meta_data->>'airbnb_url',
      new.raw_user_meta_data->>'direct_booking_url',
      array(
        select jsonb_array_elements_text(
          coalesce(new.raw_user_meta_data->'markets', '[]')::jsonb
        )
      ),
      new.raw_user_meta_data->>'agent_name',
      new.raw_user_meta_data->>'property_address',
      new.raw_user_meta_data->>'property_location'
    );
  end if;

  return new;
end;
$$;
