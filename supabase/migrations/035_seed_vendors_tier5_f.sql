-- Migration 035: Tier 5 Vendor Seeds F
-- Categories: smart-home-tech, legal-regulations
-- Markets: all 30 Tier 5 markets (120 vendors total)

-- ============================================================
-- SMART HOME & TECHNOLOGY — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Smart Home FL', 'clearwater-str-smart-home-fl', 'Gulf Coast vacation rental tech installs',
  'Clearwater STR Smart Home FL installs and configures smart locks, noise monitors, keyless entry, and full smart home systems for vacation rental properties on the Pinellas Peninsula.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Tech Services', 'clearwater-beach-str-tech-services', 'Beach rental smart home installations',
  'Clearwater Beach STR Tech Services provides smart lock installation, WiFi optimization, and vacation rental automation for STR properties along Clearwater Beach, maximizing security and guest convenience.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 39
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Smart Home', 'fort-lauderdale-str-smart-home', 'Broward County vacation rental automation',
  'Fort Lauderdale STR Smart Home installs comprehensive smart home systems for vacation rentals throughout Broward County, including keyless entry, noise monitoring, pool automation, and remote management.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Tech FL', 'pompano-beach-str-tech-fl', 'South Florida rental smart home pros',
  'Pompano Beach STR Tech FL provides smart home installations and vacation rental technology solutions for properties throughout South Florida, with remote monitoring and guest access management.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Smart Home MA', 'nantucket-str-smart-home-ma', 'Island vacation rental tech installs',
  'Nantucket STR Smart Home MA provides smart lock installation, noise monitoring, and vacation rental technology for island properties on Nantucket, supporting remote management for off-island owners.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 67
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Tech Services MA', 'siasconset-str-tech-services-ma', 'Nantucket vacation rental automation',
  'Siasconset STR Tech Services MA offers smart home technology installations for Nantucket vacation rental properties, including keyless entry, WiFi mesh systems, and remote property monitoring.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 43
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Smart Home MA', 'vineyard-str-smart-home-ma', 'MV vacation rental technology',
  'Vineyard STR Smart Home MA installs and supports smart home systems for Martha''s Vineyard vacation rental properties, enabling remote management, guest access control, and noise monitoring for island owners.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 72
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Tech MA', 'vineyard-haven-str-tech-ma', 'Martha Vineyard rental smart home installs',
  'Vineyard Haven STR Tech MA provides vacation rental technology solutions across Martha''s Vineyard, including smart locks, cameras, WiFi optimization, and automated guest check-in systems.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Smart Home ME', 'bar-harbor-str-smart-home-me', 'Acadia area vacation rental tech',
  'Bar Harbor STR Smart Home ME installs smart home technology for vacation rental properties near Acadia National Park, with keyless entry, noise monitoring, and remote management for off-season owners.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 55
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Tech Services ME', 'mdi-str-tech-services-me', 'Mount Desert Island rental automation',
  'MDI STR Tech Services ME provides smart home installations for vacation rental properties across Mount Desert Island, supporting remote property management and automated guest access.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 34
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Smart Home MS', 'gulf-coast-str-smart-home-ms', 'Mississippi coast rental tech installs',
  'Gulf Coast STR Smart Home MS installs smart lock systems, noise monitors, and vacation rental automation for properties along the Mississippi Gulf Coast, supporting remote owner management.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Tech Services MS', 'gulfport-str-tech-services-ms', 'Harrison County vacation rental automation',
  'Gulfport STR Tech Services MS provides smart home technology installations and vacation rental automation for properties throughout the Gulfport-Biloxi corridor.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 31
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Smart Home NC', 'crystal-coast-str-smart-home-nc', 'Bogue Banks vacation rental tech',
  'Crystal Coast STR Smart Home NC provides smart home installations for vacation rental properties along the Crystal Coast, with keyless entry, noise monitoring, and remote management solutions.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Tech NC', 'atlantic-beach-str-tech-nc', 'Crystal Coast rental smart home installs',
  'Atlantic Beach STR Tech NC offers smart lock installation, WiFi optimization, and vacation rental automation for Crystal Coast properties, maximizing security and remote management capability.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 42
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Smart Home RI', 'newport-str-smart-home-ri', 'Rhode Island vacation rental technology',
  'Newport STR Smart Home RI installs smart home systems for vacation rental properties throughout Newport County, with keyless entry, noise monitoring, and historic property-compatible tech solutions.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 75
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Tech RI', 'aquidneck-island-str-tech-ri', 'Newport area rental smart home installs',
  'Aquidneck Island STR Tech RI provides smart home technology installations and vacation rental automation for properties across Newport County, supporting guest self check-in and remote management.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Smart Home TX', 'port-aransas-str-smart-home-tx', 'Texas coast vacation rental tech',
  'Port Aransas STR Smart Home TX installs smart home systems for vacation rental properties on Mustang Island, including storm-rated smart locks, noise monitoring, and remote management platforms.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 65
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Tech Services', 'rockport-tx-str-tech-services', 'Aransas Bay rental smart home installs',
  'Rockport TX STR Tech Services provides smart lock installation, WiFi optimization, and vacation rental automation for properties in the Rockport-Fulton area, supporting remote owner management.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 43
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Smart Home FL', 'amelia-island-str-smart-home-fl', 'Nassau County vacation rental tech',
  'Amelia Island STR Smart Home FL provides smart home technology installations for vacation rental properties on Amelia Island, with keyless entry, noise monitoring, and full remote management support.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 69
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Tech Services FL', 'amelia-island-str-tech-services-fl', 'Island rental smart home automation',
  'Amelia Island STR Tech Services FL offers smart lock installation, WiFi mesh systems, and vacation rental technology for Nassau County properties, enabling seamless guest check-in and owner oversight.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Smart Home GA', 'blue-ridge-str-smart-home-ga', 'North Georgia cabin tech installs',
  'Blue Ridge STR Smart Home GA installs smart home systems for mountain vacation rental cabins throughout the North Georgia Highlands, including keyless entry, noise monitoring, and security cameras.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Tech Services GA', 'ellijay-str-tech-services-ga', 'Gilmer County cabin vacation rental tech',
  'Ellijay STR Tech Services GA provides smart home installations and vacation rental automation for cabin properties in the Ellijay area, supporting remote management for Atlanta-based owners.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Smart Home PA', 'pocono-str-smart-home-pa', 'Pocono Mountains vacation rental tech',
  'Pocono STR Smart Home PA installs smart home systems for vacation rental properties throughout the Pocono region, including keyless entry, noise monitoring, and freeze detection for winter properties.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Tech Services PA', 'stroudsburg-str-tech-services-pa', 'Delaware Water Gap rental automation',
  'Stroudsburg STR Tech Services PA provides smart home technology installations and vacation rental automation for properties in the greater Stroudsburg area, with remote management solutions.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Smart Home AZ', 'flagstaff-str-smart-home-az', 'Northern Arizona vacation rental tech',
  'Flagstaff STR Smart Home AZ installs smart home systems for vacation rental properties in Flagstaff and northern Arizona, including freeze detection, smart locks, and remote management platforms.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Tech Services AZ', 'sedona-str-tech-services-az', 'Red rock country rental smart home installs',
  'Sedona STR Tech Services AZ provides smart home installations for vacation rental properties in the Sedona area, with keyless entry, noise monitoring, and solar-integrated smart home systems.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Smart Home CO', 'durango-str-smart-home-co', 'Southwest Colorado vacation rental tech',
  'Durango STR Smart Home CO installs smart home systems for vacation rental properties in La Plata County, including freeze detection, keyless entry, noise monitoring, and remote management.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Tech Services', 'bayfield-co-str-tech-services', 'Animas Valley rental smart home installs',
  'Bayfield CO STR Tech Services provides smart home technology installations for vacation rental properties in the Bayfield and Durango corridor, supporting remote Colorado mountain property management.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 37
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Smart Home', 'boone-nc-str-smart-home', 'High Country vacation rental tech',
  'Boone NC STR Smart Home installs smart home systems for mountain vacation rental properties throughout the High Country, including freeze detection, keyless entry, and remote management platforms.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Tech NC', 'banner-elk-str-tech-nc', 'Avery County rental smart home installs',
  'Banner Elk STR Tech NC provides smart home installations and vacation rental automation for mountain properties near Sugar and Beech mountains, supporting ski season remote management.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Smart Home WI', 'door-county-str-smart-home-wi', 'Peninsula vacation rental tech installs',
  'Door County STR Smart Home WI provides smart home installations for vacation rental properties throughout the Door Peninsula, with winter freeze detection, keyless entry, and remote management.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 65
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Tech WI', 'sturgeon-bay-str-tech-wi', 'Door County rental smart home automation',
  'Sturgeon Bay STR Tech WI offers smart home technology installations and vacation rental automation for properties throughout Door County, Wisconsin, with four-season monitoring solutions.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 42
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Smart Home MI', 'traverse-city-str-smart-home-mi', 'Northern Michigan vacation rental tech',
  'Traverse City STR Smart Home MI installs smart home systems for vacation rental properties around Grand Traverse Bay, including freeze detection, keyless entry, and remote management for seasonal rentals.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Tech MI', 'glen-arbor-str-tech-mi', 'Sleeping Bear Dunes rental automation',
  'Glen Arbor STR Tech MI provides smart home installations for vacation rental properties near Sleeping Bear Dunes, supporting remote management from anywhere for Michigan lakeside cottage owners.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Smart Home CA', 'joshua-tree-str-smart-home-ca', 'Desert vacation rental tech installs',
  'Joshua Tree STR Smart Home CA provides smart home installations for desert vacation rental properties near JTNP, including solar-integrated smart systems, keyless entry, and remote temperature monitoring.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Tech CA', 'twentynine-palms-str-tech-ca', 'High desert rental smart home installs',
  'Twentynine Palms STR Tech CA offers smart home technology installations for desert vacation rental properties near Joshua Tree National Park, with off-grid compatible and solar-smart systems.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Smart Home CA', 'palm-springs-str-smart-home-ca', 'Coachella Valley vacation rental tech',
  'Palm Springs STR Smart Home CA installs premium smart home systems for luxury vacation rental properties throughout the Coachella Valley, including pool automation, smart locks, and full remote management.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Tech CA', 'palm-desert-str-tech-ca', 'Desert resort rental smart home installs',
  'Palm Desert STR Tech CA provides premium smart home technology installations for vacation rental properties throughout the Coachella Valley, with full property automation and remote management.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Smart Home CA', 'napa-valley-str-smart-home-ca', 'Wine country vacation rental tech',
  'Napa Valley STR Smart Home CA provides smart home installations for wine country vacation rental properties, with keyless entry, noise monitoring, smart irrigation, and full remote management.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 92
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Tech CA', 'yountville-str-tech-ca', 'Upper Napa Valley rental automation',
  'Yountville STR Tech CA offers premium smart home technology installations for vacation rental properties in the heart of Napa Valley, supporting sophisticated remote management and guest automation.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Smart Home CA', 'san-francisco-str-smart-home-ca', 'Bay Area vacation rental tech installs',
  'San Francisco STR Smart Home CA provides smart home installations for SF vacation rental properties, with keyless entry, noise monitoring, and smart home systems compatible with Victorian architecture.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Tech Services CA', 'oakland-str-tech-services-ca', 'East Bay vacation rental automation',
  'Oakland STR Tech Services CA offers smart home technology installations for vacation rental properties across Oakland and the East Bay, with keyless entry, noise monitoring, and remote management.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 59
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Smart Home WA', 'seattle-str-smart-home-wa', 'Pacific Northwest vacation rental tech',
  'Seattle STR Smart Home WA installs smart home systems for vacation rental properties across Seattle, with keyless entry, noise monitoring, water leak detection, and full remote management platforms.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Tech WA', 'bainbridge-island-str-tech-wa', 'Puget Sound island rental automation',
  'Bainbridge Island STR Tech WA provides smart home technology installations for vacation rental properties on Bainbridge Island, with ferry-coordinated setup support and remote management.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Smart Home TX', 'dallas-str-smart-home-tx', 'DFW vacation rental tech installs',
  'Dallas STR Smart Home TX provides smart home technology installations for vacation rental properties across the DFW metroplex, with keyless entry, noise monitoring, and full remote management.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Tech Services', 'plano-tx-str-tech-services', 'North Dallas rental smart home installs',
  'Plano TX STR Tech Services offers smart home installations and vacation rental automation for properties in Plano and Collin County, with full keyless entry and remote management systems.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Smart Home TX', 'houston-str-smart-home-tx', 'Bayou City vacation rental tech',
  'Houston STR Smart Home TX installs smart home systems for vacation rental properties across Houston, with flood sensors, keyless entry, noise monitoring, and comprehensive remote management.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Tech Services', 'woodlands-tx-str-tech-services', 'North Houston rental smart home installs',
  'Woodlands TX STR Tech Services provides smart home technology installations for vacation rental properties in The Woodlands and north Houston suburbs, enabling remote management and guest automation.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Smart Home GA', 'atlanta-str-smart-home-ga', 'ATL metro vacation rental tech installs',
  'Atlanta STR Smart Home GA provides smart home installations for vacation rental properties across metro Atlanta, with keyless entry, noise monitoring, and remote management for urban STR owners.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Tech Services', 'decatur-ga-str-tech-services', 'Intown Atlanta rental automation',
  'Decatur GA STR Tech Services offers smart home technology installations for vacation rental properties in Decatur and intown Atlanta, with full keyless entry and remote property management systems.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Smart Home MA', 'boston-str-smart-home-ma', 'Historic Boston vacation rental tech',
  'Boston STR Smart Home MA installs smart home systems for vacation rental properties throughout Boston, with historic building-compatible smart locks, noise monitoring, and freeze detection for old homes.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 105
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Tech Services', 'cambridge-ma-str-tech-services', 'Greater Boston rental smart home installs',
  'Cambridge MA STR Tech Services provides smart home technology installations for vacation rental properties in Cambridge and greater Boston, supporting remote management and guest automation.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Smart Home Co', 'dc-str-smart-home-co', 'Capital region vacation rental tech',
  'DC STR Smart Home Co provides smart home installations for vacation rental properties throughout the Washington DC metro area, with historic rowhouse-compatible systems and full remote management.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Tech Services', 'arlington-va-str-tech-services', 'Northern Virginia rental automation',
  'Arlington VA STR Tech Services offers smart home technology installations for vacation rental properties in Arlington and Northern Virginia, supporting remote management for DC-area STR owners.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Smart Home PA', 'philadelphia-str-smart-home-pa', 'Philly vacation rental tech installs',
  'Philadelphia STR Smart Home PA provides smart home installations for vacation rental properties across the city, with historic building-compatible smart locks, noise monitoring, and remote management.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Tech Services', 'cherry-hill-nj-str-tech-services', 'South Jersey rental smart home installs',
  'Cherry Hill NJ STR Tech Services offers smart home technology installations for vacation rental properties in Cherry Hill and greater South Jersey, with keyless entry and remote management solutions.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 49
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Smart Home FL', 'tampa-str-smart-home-fl', 'Tampa Bay vacation rental tech installs',
  'Tampa STR Smart Home FL installs smart home systems for vacation rental properties across Hillsborough County, with storm monitoring, keyless entry, pool automation, and full remote management.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Tech', 'st-petersburg-fl-str-tech', 'Pinellas County rental smart home installs',
  'St Petersburg FL STR Tech provides smart home technology installations for vacation rental properties in St. Pete and Pinellas County, with keyless entry, noise monitoring, and remote management.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Smart Home OR', 'portland-str-smart-home-or', 'Rose City vacation rental tech installs',
  'Portland STR Smart Home OR provides smart home installations for vacation rental properties in Portland and the Pacific Northwest, with water leak detection, keyless entry, and full remote management.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Tech Services', 'hood-river-or-str-tech-services', 'Columbia Gorge rental automation',
  'Hood River OR STR Tech Services offers smart home technology installations for vacation rental properties in the Columbia River Gorge, supporting remote management for outdoor-focused STR owners.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- LEGAL & REGULATIONS — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Legal FL', 'clearwater-str-legal-fl', 'Gulf Coast vacation rental compliance',
  'Clearwater STR Legal FL provides legal consulting and STR compliance services for vacation rental owners on the Pinellas Peninsula, including licensing assistance and local ordinance guidance.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 56
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Compliance', 'clearwater-beach-str-compliance', 'Beach rental legal and licensing',
  'Clearwater Beach STR Compliance offers STR licensing assistance, lease drafting, and regulatory compliance consulting for vacation rental owners along Clearwater Beach.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 37
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Legal Services', 'fort-lauderdale-str-legal-services', 'Broward County vacation rental law',
  'Fort Lauderdale STR Legal Services provides comprehensive legal consulting for vacation rental owners throughout Broward County, navigating Florida STR laws, licensing requirements, and guest agreements.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 74
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Compliance FL', 'pompano-beach-str-compliance-fl', 'South Florida rental legal experts',
  'Pompano Beach STR Compliance FL offers STR licensing, regulatory guidance, and legal consulting for vacation rental owners throughout South Florida, ensuring compliance with local and state regulations.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Legal Advisors MA', 'nantucket-str-legal-advisors-ma', 'Island vacation rental compliance',
  'Nantucket STR Legal Advisors MA provides specialized legal consulting for vacation rental owners on Nantucket, navigating island-specific STR regulations, licensing requirements, and Massachusetts law.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 64
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Compliance MA', 'siasconset-str-compliance-ma', 'Nantucket vacation rental legal services',
  'Siasconset STR Compliance MA offers STR licensing assistance and regulatory consulting for vacation rental owners across Nantucket, ensuring full compliance with island and Massachusetts regulations.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Legal Services MA', 'vineyard-str-legal-services-ma', 'MV vacation rental compliance experts',
  'Vineyard STR Legal Services MA provides specialized legal consulting for vacation rental owners on Martha''s Vineyard, navigating island STR regulations, licensing, and Massachusetts short-term rental laws.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 69
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Compliance MA', 'vineyard-haven-str-compliance-ma', 'Martha Vineyard rental legal advisors',
  'Vineyard Haven STR Compliance MA offers STR licensing assistance and regulatory guidance for vacation rental owners across Martha''s Vineyard, ensuring complete legal compliance.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 45
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Legal Services ME', 'bar-harbor-str-legal-services-me', 'Acadia area vacation rental compliance',
  'Bar Harbor STR Legal Services ME provides STR licensing assistance and legal consulting for vacation rental owners near Acadia National Park, navigating Maine STR regulations and local ordinances.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 53
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Compliance Services ME', 'mdi-str-compliance-services-me', 'Mount Desert Island rental legal',
  'MDI STR Compliance Services ME offers vacation rental legal consulting and licensing assistance for properties across Mount Desert Island, ensuring compliance with Maine STR regulations.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 32
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Legal Services MS', 'gulf-coast-str-legal-services-ms', 'Mississippi coast rental compliance',
  'Gulf Coast STR Legal Services MS provides STR licensing assistance and legal consulting for vacation rental owners along the Mississippi Gulf Coast, navigating Mississippi STR regulations.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 42
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Compliance MS', 'gulfport-str-compliance-ms', 'Harrison County vacation rental legal',
  'Gulfport STR Compliance MS offers regulatory guidance and STR licensing assistance for vacation rental owners throughout the Gulfport-Biloxi area, ensuring compliance with local ordinances.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 29
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Legal Services NC', 'crystal-coast-str-legal-services-nc', 'Bogue Banks vacation rental compliance',
  'Crystal Coast STR Legal Services NC provides STR legal consulting and licensing assistance for vacation rental owners along the Crystal Coast, navigating North Carolina STR regulations and local ordinances.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 59
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Compliance NC', 'atlantic-beach-str-compliance-nc', 'Crystal Coast rental legal advisors',
  'Atlantic Beach STR Compliance NC offers STR licensing assistance and regulatory guidance for vacation rental owners along the Crystal Coast, with Carteret County ordinance expertise.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 39
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Legal Services RI', 'newport-str-legal-services-ri', 'Rhode Island vacation rental compliance',
  'Newport STR Legal Services RI provides specialized legal consulting for vacation rental owners throughout Newport County, navigating Rhode Island STR regulations, licensing requirements, and historic property rules.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 71
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Compliance RI', 'aquidneck-island-str-compliance-ri', 'Newport area rental legal advisors',
  'Aquidneck Island STR Compliance RI offers STR licensing assistance and regulatory consulting for vacation rental owners across Newport County, Rhode Island, ensuring full legal compliance.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Legal Services TX', 'port-aransas-str-legal-services-tx', 'Texas coast vacation rental compliance',
  'Port Aransas STR Legal Services TX provides STR legal consulting and licensing assistance for vacation rental owners on Mustang Island, navigating Nueces County ordinances and Texas STR laws.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Compliance', 'rockport-tx-str-compliance', 'Aransas Bay vacation rental legal',
  'Rockport TX STR Compliance offers regulatory guidance and licensing assistance for vacation rental owners in the Rockport-Fulton area, with Aransas County STR ordinance expertise.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 41
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Legal Services FL', 'amelia-island-str-legal-services-fl', 'Nassau County vacation rental compliance',
  'Amelia Island STR Legal Services FL provides STR legal consulting and licensing assistance for vacation rental owners on Amelia Island, navigating Nassau County regulations and Florida STR laws.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 66
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Compliance FL', 'amelia-island-str-compliance-fl', 'Island rental legal advisors',
  'Amelia Island STR Compliance FL offers regulatory consulting and licensing assistance for vacation rental owners across Nassau County, ensuring complete compliance with Florida and local STR rules.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Legal Services GA', 'blue-ridge-str-legal-services-ga', 'North Georgia cabin rental compliance',
  'Blue Ridge STR Legal Services GA provides STR legal consulting and licensing assistance for vacation rental cabin owners in the North Georgia Highlands, navigating Fannin County and Georgia STR laws.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Compliance Services GA', 'ellijay-str-compliance-services-ga', 'Gilmer County vacation rental legal',
  'Ellijay STR Compliance Services GA offers regulatory guidance and STR licensing assistance for vacation rental cabin owners in the Ellijay area, with Gilmer County ordinance expertise.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Legal Services PA', 'pocono-str-legal-services-pa', 'Pocono Mountains rental compliance',
  'Pocono STR Legal Services PA provides STR legal consulting and licensing assistance for vacation rental owners throughout the Pocono region, navigating Pennsylvania STR regulations and local township rules.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Compliance PA', 'stroudsburg-str-compliance-pa', 'Delaware Water Gap rental legal advisors',
  'Stroudsburg STR Compliance PA offers STR licensing assistance and regulatory consulting for vacation rental owners in the greater Stroudsburg area, ensuring Pennsylvania STR compliance.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Legal Services AZ', 'flagstaff-str-legal-services-az', 'Northern Arizona vacation rental compliance',
  'Flagstaff STR Legal Services AZ provides STR legal consulting and licensing assistance for vacation rental owners in Flagstaff and northern Arizona, navigating Arizona STR preemption laws and local ordinances.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Compliance Services AZ', 'sedona-str-compliance-services-az', 'Red rock country rental legal experts',
  'Sedona STR Compliance Services AZ offers regulatory guidance and licensing assistance for vacation rental owners in the Sedona area, with expertise in Yavapai County STR ordinances.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Legal Services CO', 'durango-str-legal-services-co', 'Southwest Colorado rental compliance',
  'Durango STR Legal Services CO provides STR legal consulting and licensing assistance for vacation rental owners in La Plata County, navigating Colorado STR regulations and local ordinances.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Compliance', 'bayfield-co-str-compliance', 'Animas Valley vacation rental legal',
  'Bayfield CO STR Compliance offers STR licensing assistance and regulatory consulting for vacation rental owners in the Bayfield and Durango corridor, ensuring Colorado mountain property compliance.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 35
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Legal Services', 'boone-nc-str-legal-services', 'High Country vacation rental compliance',
  'Boone NC STR Legal Services provides STR legal consulting and licensing assistance for vacation rental owners throughout the High Country, navigating Watauga County and North Carolina STR regulations.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 75
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Compliance NC', 'banner-elk-str-compliance-nc', 'Avery County rental legal advisors',
  'Banner Elk STR Compliance NC offers STR licensing assistance and regulatory guidance for vacation rental owners near Sugar and Beech mountains, with Avery County ordinance expertise.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Legal Services WI', 'door-county-str-legal-services-wi', 'Peninsula vacation rental compliance',
  'Door County STR Legal Services WI provides STR legal consulting and licensing assistance for vacation rental owners throughout the Door Peninsula, navigating Wisconsin STR regulations and local ordinances.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Compliance WI', 'sturgeon-bay-str-compliance-wi', 'Door County rental legal advisors',
  'Sturgeon Bay STR Compliance WI offers STR licensing assistance and regulatory consulting for vacation rental owners throughout Door County, Wisconsin, ensuring full compliance with local rules.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 41
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Legal Services MI', 'traverse-city-str-legal-services-mi', 'Northern Michigan vacation rental compliance',
  'Traverse City STR Legal Services MI provides STR legal consulting and licensing assistance for vacation rental owners around Grand Traverse Bay, navigating Michigan STR regulations and local ordinances.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Compliance MI', 'glen-arbor-str-compliance-mi', 'Sleeping Bear Dunes rental legal',
  'Glen Arbor STR Compliance MI offers STR licensing assistance and regulatory guidance for vacation rental owners near Sleeping Bear Dunes, with Leelanau County ordinance expertise.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Legal Services CA', 'joshua-tree-str-legal-services-ca', 'Desert vacation rental compliance',
  'Joshua Tree STR Legal Services CA provides specialized STR legal consulting for vacation rental owners near JTNP, navigating San Bernardino County regulations and California STR permit requirements.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Compliance CA', 'twentynine-palms-str-compliance-ca', 'High desert rental legal advisors',
  'Twentynine Palms STR Compliance CA offers STR licensing assistance and regulatory guidance for vacation rental owners near Joshua Tree National Park, with California desert county expertise.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.6, 63
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Legal Services CA', 'palm-springs-str-legal-services-ca', 'Coachella Valley vacation rental compliance',
  'Palm Springs STR Legal Services CA provides comprehensive STR legal consulting for vacation rental owners throughout the Coachella Valley, navigating Palm Springs STR caps, permits, and California regulations.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 99
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Compliance CA', 'palm-desert-str-compliance-ca', 'Desert resort rental legal experts',
  'Palm Desert STR Compliance CA offers STR licensing assistance and regulatory consulting for vacation rental owners across Palm Desert and the Coachella Valley, ensuring California STR compliance.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Legal Services CA', 'napa-valley-str-legal-services-ca', 'Wine country vacation rental compliance',
  'Napa Valley STR Legal Services CA provides specialized STR legal consulting for wine country vacation rental owners, navigating Napa County STR regulations and California permit requirements.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Compliance CA', 'yountville-str-compliance-ca', 'Upper Napa Valley rental legal advisors',
  'Yountville STR Compliance CA offers STR licensing assistance and regulatory guidance for vacation rental owners in Yountville and surrounding Napa Valley wine country communities.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Legal Services CA', 'san-francisco-str-legal-services-ca', 'Bay Area vacation rental compliance',
  'San Francisco STR Legal Services CA provides expert legal consulting for SF vacation rental owners, navigating the city''s strict STR permit requirements, primary residence rules, and complaint response.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Compliance Services CA', 'oakland-str-compliance-services-ca', 'East Bay vacation rental legal',
  'Oakland STR Compliance Services CA offers STR licensing assistance and regulatory consulting for vacation rental owners across Oakland and the East Bay, navigating California and local STR ordinances.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 64
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Legal Services WA', 'seattle-str-legal-services-wa', 'Pacific Northwest vacation rental compliance',
  'Seattle STR Legal Services WA provides comprehensive STR legal consulting for vacation rental owners in Seattle, navigating the city''s licensing requirements, operational standards, and Washington State laws.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Compliance WA', 'bainbridge-island-str-compliance-wa', 'Puget Sound island rental legal',
  'Bainbridge Island STR Compliance WA offers STR licensing assistance and regulatory guidance for vacation rental owners on Bainbridge Island, with Kitsap County ordinance expertise.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Legal Services TX', 'dallas-str-legal-services-tx', 'DFW vacation rental compliance experts',
  'Dallas STR Legal Services TX provides comprehensive STR legal consulting for vacation rental owners across the DFW metroplex, navigating Dallas and surrounding municipal STR ordinances and Texas law.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Compliance Services', 'plano-tx-str-compliance-services', 'North Dallas rental legal advisors',
  'Plano TX STR Compliance Services offers STR licensing assistance and regulatory guidance for vacation rental owners in Plano and Collin County, ensuring Texas and local STR compliance.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 53
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Legal Services TX', 'houston-str-legal-services-tx', 'Bayou City vacation rental compliance',
  'Houston STR Legal Services TX provides STR legal consulting and licensing assistance for vacation rental owners across Houston, navigating Harris County regulations and Texas short-term rental laws.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Compliance', 'woodlands-tx-str-compliance', 'North Houston rental legal advisors',
  'Woodlands TX STR Compliance offers regulatory guidance and STR licensing assistance for vacation rental owners in The Woodlands and north Houston suburbs, ensuring full Texas compliance.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Legal Services GA', 'atlanta-str-legal-services-ga', 'ATL metro vacation rental compliance',
  'Atlanta STR Legal Services GA provides comprehensive STR legal consulting for vacation rental owners across metro Atlanta, navigating Atlanta and Fulton County STR ordinances and Georgia regulations.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Compliance Services', 'decatur-ga-str-compliance-services', 'Intown Atlanta rental legal advisors',
  'Decatur GA STR Compliance Services offers STR licensing assistance and regulatory guidance for vacation rental owners in Decatur and intown Atlanta neighborhoods, with DeKalb County expertise.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Legal Services MA', 'boston-str-legal-services-ma', 'Historic Boston vacation rental compliance',
  'Boston STR Legal Services MA provides expert STR legal consulting for vacation rental owners throughout Boston, navigating the city''s strict owner-occupancy requirements, permits, and Massachusetts STR laws.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Compliance Services', 'cambridge-ma-str-compliance-services', 'Greater Boston rental legal advisors',
  'Cambridge MA STR Compliance Services offers STR licensing assistance and regulatory consulting for vacation rental owners in Cambridge and greater Boston, with Massachusetts STR compliance expertise.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Legal Services Co', 'dc-str-legal-services-co', 'Capital region vacation rental compliance',
  'DC STR Legal Services Co provides comprehensive STR legal consulting for vacation rental owners throughout the Washington DC metro area, navigating DC, Maryland, and Virginia STR regulations.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 115
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Compliance Services', 'arlington-va-str-compliance-services', 'Northern Virginia rental legal advisors',
  'Arlington VA STR Compliance Services offers STR licensing assistance and regulatory guidance for vacation rental owners in Arlington and Northern Virginia, with multi-state compliance expertise.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Legal Services PA', 'philadelphia-str-legal-services-pa', 'Philly vacation rental compliance',
  'Philadelphia STR Legal Services PA provides comprehensive STR legal consulting for vacation rental owners across the city, navigating Philadelphia''s registration requirements and Pennsylvania STR laws.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Compliance', 'cherry-hill-nj-str-compliance', 'South Jersey vacation rental legal',
  'Cherry Hill NJ STR Compliance offers STR licensing assistance and regulatory guidance for vacation rental owners in Cherry Hill and greater South Jersey, with New Jersey STR ordinance expertise.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 47
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Legal Services FL', 'tampa-str-legal-services-fl', 'Tampa Bay vacation rental compliance',
  'Tampa STR Legal Services FL provides STR legal consulting and licensing assistance for vacation rental owners across Hillsborough County, navigating Tampa STR ordinances and Florida state regulations.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Compliance', 'st-petersburg-fl-str-compliance', 'Pinellas County rental legal advisors',
  'St Petersburg FL STR Compliance offers STR licensing assistance and regulatory consulting for vacation rental owners in St. Pete and Pinellas County, ensuring Florida and local compliance.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 70
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Legal Services OR', 'portland-str-legal-services-or', 'Rose City vacation rental compliance',
  'Portland STR Legal Services OR provides STR legal consulting and licensing assistance for vacation rental owners in Portland, navigating Portland''s STR permit requirements and Oregon state regulations.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Compliance', 'hood-river-or-str-compliance', 'Columbia Gorge rental legal advisors',
  'Hood River OR STR Compliance offers STR licensing assistance and regulatory guidance for vacation rental owners in the Columbia River Gorge, with Hood River County ordinance expertise.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
