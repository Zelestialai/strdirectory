-- Migration 083: Set profiles.preferred_market from the markets a host/vendor
-- selects at registration, so their first visit lands on their own market
-- instead of falling back to IP-geo (which was defaulting people to Big Bear).

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_meta_role  text;
  v_role       text;
  v_host_type  text;
  v_market     text;
begin
  v_meta_role := coalesce(new.raw_user_meta_data->>'role', 'user');

  v_role := case v_meta_role
    when 'active_host'    then 'host'
    when 'potential_host' then 'host'
    when 'vendor'         then 'vendor'
    when 'host'           then 'host'
    when 'admin'          then 'admin'
    else 'user'
  end;

  -- First selected market slug from signup metadata (host or vendor), if any.
  v_market := new.raw_user_meta_data->'markets'->>0;

  insert into public.profiles (id, full_name, avatar_url, role, preferred_market)
  values (
    new.id,
    new.raw_user_meta_data->>'full_name',
    new.raw_user_meta_data->>'avatar_url',
    v_role,
    v_market
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

-- Backfill existing accounts whose preferred_market is null, from the markets
-- they already selected (hosts from host_profiles, vendors from vendors).
update public.profiles p
set preferred_market = hp.markets[1]
from public.host_profiles hp
where hp.id = p.id
  and p.preferred_market is null
  and coalesce(array_length(hp.markets, 1), 0) >= 1;

update public.profiles p
set preferred_market = v.markets[1]
from public.vendors v
where v.user_id = p.id
  and p.preferred_market is null
  and coalesce(array_length(v.markets, 1), 0) >= 1;
