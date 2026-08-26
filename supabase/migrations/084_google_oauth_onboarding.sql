-- Migration 084: Support "Continue with Google" (Supabase Google OAuth).
-- OAuth signups arrive with no `role` in metadata, so we track whether a user
-- has completed the account-type step. New Google users land on /welcome to
-- pick Host / Vendor / Browsing; email signups (which always carry a role) are
-- considered onboarded immediately.

-- 1. Track onboarding completion on the profile.
alter table public.profiles
  add column if not exists onboarded boolean not null default false;

-- 2. Recreate the signup trigger:
--    • sets preferred_market from selected markets (as in 083)
--    • marks onboarded = true only when the signup carried an explicit role
--      (i.e. the email wizard). OAuth signups have no 'role' key → onboarded = false.
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_meta_role   text;
  v_role        text;
  v_host_type   text;
  v_market      text;
  v_has_role    boolean;
begin
  v_has_role  := (new.raw_user_meta_data ? 'role');
  v_meta_role := coalesce(new.raw_user_meta_data->>'role', 'user');

  v_role := case v_meta_role
    when 'active_host'    then 'host'
    when 'potential_host' then 'host'
    when 'vendor'         then 'vendor'
    when 'host'           then 'host'
    when 'admin'          then 'admin'
    else 'user'
  end;

  v_market := new.raw_user_meta_data->'markets'->>0;

  insert into public.profiles (id, full_name, avatar_url, role, preferred_market, onboarded)
  values (
    new.id,
    new.raw_user_meta_data->>'full_name',
    new.raw_user_meta_data->>'avatar_url',
    v_role,
    v_market,
    v_has_role
  );

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

-- 3. Existing accounts have already chosen their role — mark them onboarded.
update public.profiles set onboarded = true where onboarded = false;
