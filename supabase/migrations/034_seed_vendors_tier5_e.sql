-- Migration 034: Tier 5 Vendor Seeds E
-- Categories: insurance, furniture-supplies
-- Markets: all 30 Tier 5 markets (120 vendors total)

-- ============================================================
-- INSURANCE — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Insurance FL', 'clearwater-str-insurance-fl', 'Gulf Coast vacation rental coverage',
  'Clearwater STR Insurance FL provides specialized short-term rental insurance for vacation properties on the Pinellas Peninsula, with hurricane coverage, liability protection, and income loss policies.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Insurance', 'clearwater-beach-str-insurance', 'Coastal rental insurance specialists',
  'Clearwater Beach STR Insurance offers comprehensive insurance solutions for vacation rental properties along Clearwater Beach, with wind, flood, and guest liability coverage options.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Insurance', 'fort-lauderdale-str-insurance', 'Broward County vacation rental coverage',
  'Fort Lauderdale STR Insurance provides comprehensive short-term rental insurance throughout Broward County, with hurricane, flood, liability, and income replacement coverage for coastal vacation rentals.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Insurance FL', 'pompano-beach-str-insurance-fl', 'South Florida vacation rental protection',
  'Pompano Beach STR Insurance FL offers tailored short-term rental insurance solutions for vacation property owners throughout South Florida, covering all major risk factors for coastal properties.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Insurance MA', 'nantucket-str-insurance-ma', 'Island vacation rental coverage experts',
  'Nantucket STR Insurance MA provides specialized insurance for high-value island vacation rental properties, with hurricane, flood, liability, and historic property coverage options.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Insurance Services MA', 'siasconset-str-insurance-services-ma', 'Nantucket vacation rental protection',
  'Siasconset STR Insurance Services MA offers comprehensive short-term rental insurance for Nantucket vacation properties, with coverage tailored to the unique risks of island ownership.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Insurance MA', 'vineyard-str-insurance-ma', 'MV vacation rental coverage specialists',
  'Vineyard STR Insurance MA provides specialized short-term rental insurance for Martha''s Vineyard vacation properties, with comprehensive coverage for island risk factors and high-season liability.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Insurance MA', 'vineyard-haven-str-insurance-ma', 'Martha Vineyard rental protection',
  'Vineyard Haven STR Insurance MA offers tailored vacation rental insurance for Martha''s Vineyard property owners, ensuring full protection during the busy summer season and year-round.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Insurance ME', 'bar-harbor-str-insurance-me', 'Acadia area vacation rental coverage',
  'Bar Harbor STR Insurance ME provides comprehensive short-term rental insurance for vacation properties near Acadia National Park, with Maine coastal coverage and seasonal income protection.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Insurance Services ME', 'mdi-str-insurance-services-me', 'Mount Desert Island rental protection',
  'MDI STR Insurance Services ME offers vacation rental insurance for properties across Mount Desert Island, with coverage tailored to Maine island property risks and seasonal occupancy patterns.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 39
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Insurance MS', 'gulf-coast-str-insurance-ms', 'Mississippi coast rental coverage',
  'Gulf Coast STR Insurance MS provides specialized short-term rental insurance for vacation properties along the Mississippi Gulf Coast, with hurricane, flood, and comprehensive liability coverage.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Insurance Services MS', 'gulfport-str-insurance-services-ms', 'Harrison County vacation rental protection',
  'Gulfport STR Insurance Services MS offers tailored vacation rental insurance for properties throughout the Gulfport-Biloxi area, with storm and guest liability coverage for Gulf Coast properties.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 33
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Insurance NC', 'crystal-coast-str-insurance-nc', 'Bogue Banks vacation rental coverage',
  'Crystal Coast STR Insurance NC provides specialized short-term rental insurance for vacation properties along the Crystal Coast, with hurricane, wind, and comprehensive liability coverage options.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Insurance NC', 'atlantic-beach-str-insurance-nc', 'Crystal Coast rental protection',
  'Atlantic Beach STR Insurance NC offers comprehensive short-term rental insurance for Crystal Coast vacation properties, ensuring full coverage during peak season and off-season months.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Insurance RI', 'newport-str-insurance-ri', 'Rhode Island vacation rental coverage',
  'Newport STR Insurance RI provides comprehensive short-term rental insurance for vacation properties throughout Newport County, with historic property coverage and full liability protection for high-value rentals.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 81
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Insurance RI', 'aquidneck-island-str-insurance-ri', 'Newport area vacation rental protection',
  'Aquidneck Island STR Insurance RI offers specialized vacation rental insurance for properties across Newport County, Rhode Island, covering all major risks for coastal and historic vacation rentals.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Insurance TX', 'port-aransas-str-insurance-tx', 'Texas coast vacation rental coverage',
  'Port Aransas STR Insurance TX provides specialized insurance for coastal vacation rental properties on Mustang Island, with hurricane, wind, flood, and liability coverage for Texas Gulf Coast rentals.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Insurance Services', 'rockport-tx-str-insurance-services', 'Aransas Bay rental protection',
  'Rockport TX STR Insurance Services offers comprehensive vacation rental insurance for properties in the Rockport-Fulton area, with hurricane hardening discounts and income protection options.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Insurance FL', 'amelia-island-str-insurance-fl', 'Nassau County vacation rental coverage',
  'Amelia Island STR Insurance FL provides comprehensive short-term rental insurance for vacation properties on Amelia Island, with Florida coastal coverage, liability, and income protection options.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Insurance Services', 'amelia-island-str-insurance-services', 'Island vacation rental protection',
  'Amelia Island STR Insurance Services offers tailored vacation rental insurance for Nassau County properties, ensuring STR owners have appropriate coverage for every guest stay.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Insurance GA', 'blue-ridge-str-insurance-ga', 'North Georgia cabin rental coverage',
  'Blue Ridge STR Insurance GA provides specialized insurance for mountain vacation rental cabins throughout the North Georgia Highlands, with coverage for fire, weather, and guest liability risks.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 92
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Insurance Services GA', 'ellijay-str-insurance-services-ga', 'Gilmer County vacation rental protection',
  'Ellijay STR Insurance Services GA offers comprehensive insurance for vacation rental cabin owners in the Ellijay area, with mountain property coverage and STR-specific liability protection.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Insurance PA', 'pocono-str-insurance-pa', 'Pocono Mountains vacation rental coverage',
  'Pocono STR Insurance PA provides comprehensive short-term rental insurance for vacation properties throughout the Pocono region, with four-season coverage including snow, ice, and summer storm risks.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Insurance Services PA', 'stroudsburg-str-insurance-services-pa', 'Delaware Water Gap rental protection',
  'Stroudsburg STR Insurance Services PA offers vacation rental insurance for properties in the greater Stroudsburg area, with comprehensive coverage options for Pocono Mountain STR owners.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 51
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Insurance AZ', 'flagstaff-str-insurance-az', 'Northern Arizona vacation rental coverage',
  'Flagstaff STR Insurance AZ provides specialized insurance for vacation rental properties in Flagstaff and northern Arizona, with wildfire, snow, and liability coverage tailored to the high desert.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Insurance Services AZ', 'sedona-str-insurance-services-az', 'Red rock country rental protection',
  'Sedona STR Insurance Services AZ offers comprehensive vacation rental insurance for properties in the Sedona area, with wildfire risk coverage and liability protection for high-traffic STR destinations.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Insurance CO', 'durango-str-insurance-co', 'Southwest Colorado vacation rental coverage',
  'Durango STR Insurance CO provides specialized short-term rental insurance for vacation properties in La Plata County, with mountain risk coverage including wildfire, snow, and avalanche policies.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Insurance Services', 'bayfield-co-str-insurance-services', 'Animas Valley rental protection',
  'Bayfield CO STR Insurance Services offers vacation rental insurance for properties in the Bayfield and Durango corridor, with comprehensive coverage for southwest Colorado mountain risks.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 40
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Insurance', 'boone-nc-str-insurance', 'High Country vacation rental coverage',
  'Boone NC STR Insurance provides specialized short-term rental insurance for mountain vacation properties throughout the High Country, with comprehensive coverage for ice, snow, and fire risks.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Insurance Services NC', 'banner-elk-str-insurance-services-nc', 'Avery County rental protection',
  'Banner Elk STR Insurance Services NC offers comprehensive vacation rental insurance for mountain properties near Sugar and Beech mountains, covering ski season and year-round risks.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Insurance WI', 'door-county-str-insurance-wi', 'Peninsula vacation rental coverage',
  'Door County STR Insurance WI provides comprehensive short-term rental insurance for vacation properties throughout the Door Peninsula, with four-season Wisconsin coverage and liability protection.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Insurance WI', 'sturgeon-bay-str-insurance-wi', 'Door County rental protection',
  'Sturgeon Bay STR Insurance WI offers specialized vacation rental insurance for properties throughout Door County, Wisconsin, with winter weather and waterfront property coverage options.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Insurance MI', 'traverse-city-str-insurance-mi', 'Northern Michigan vacation rental coverage',
  'Traverse City STR Insurance MI provides specialized short-term rental insurance for vacation properties around Grand Traverse Bay, with Michigan four-season and waterfront property coverage.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Insurance MI', 'glen-arbor-str-insurance-mi', 'Sleeping Bear Dunes rental protection',
  'Glen Arbor STR Insurance MI offers comprehensive vacation rental insurance for properties near Sleeping Bear Dunes, with Michigan lakeside and dune area property coverage options.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Insurance CA', 'joshua-tree-str-insurance-ca', 'Desert vacation rental coverage',
  'Joshua Tree STR Insurance CA provides specialized insurance for desert vacation rental properties near JTNP, with wildfire, earthquake, and high-volume Airbnb guest liability coverage.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Insurance CA', 'twentynine-palms-str-insurance-ca', 'San Bernardino desert rental protection',
  'Twentynine Palms STR Insurance CA offers vacation rental insurance for desert properties near Joshua Tree National Park, with California wildfire, earthquake, and STR liability coverage.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.6, 63
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Insurance CA', 'palm-springs-str-insurance-ca', 'Coachella Valley vacation rental coverage',
  'Palm Springs STR Insurance CA provides premium insurance solutions for luxury vacation rental properties throughout the Coachella Valley, with high-value property, pool, and event liability coverage.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 101
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Insurance CA', 'palm-desert-str-insurance-ca', 'Desert resort rental protection',
  'Palm Desert STR Insurance CA offers comprehensive vacation rental insurance for properties throughout Palm Desert and the greater Coachella Valley, with earthquake and desert climate coverage.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Insurance CA', 'napa-valley-str-insurance-ca', 'Wine country vacation rental coverage',
  'Napa Valley STR Insurance CA provides specialized insurance for wine country vacation rental properties, with wildfire, earthquake, high-value contents, and event liability coverage options.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 95
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Insurance Services CA', 'yountville-str-insurance-services-ca', 'Upper Napa Valley rental protection',
  'Yountville STR Insurance Services CA offers premium vacation rental insurance for wine country properties in the heart of Napa Valley, with coverage tailored to high-value California STR assets.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Insurance CA', 'san-francisco-str-insurance-ca', 'Bay Area vacation rental coverage',
  'San Francisco STR Insurance CA provides comprehensive short-term rental insurance for SF vacation properties, with earthquake, fire, high-value contents, and STR-specific liability coverage.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Insurance Services CA', 'oakland-str-insurance-services-ca', 'East Bay vacation rental protection',
  'Oakland STR Insurance Services CA offers specialized vacation rental insurance for properties across Oakland and the East Bay, with California earthquake and fire risk coverage.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 62
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Insurance WA', 'seattle-str-insurance-wa', 'Pacific Northwest vacation rental coverage',
  'Seattle STR Insurance WA provides comprehensive short-term rental insurance for vacation properties across Seattle and the Puget Sound region, with earthquake, water damage, and STR liability coverage.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 106
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Insurance WA', 'bainbridge-island-str-insurance-wa', 'Puget Sound island rental protection',
  'Bainbridge Island STR Insurance WA offers specialized vacation rental insurance for island properties, covering waterfront risks, ferry damage, and STR guest liability for Bainbridge owners.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Insurance TX', 'dallas-str-insurance-tx', 'DFW vacation rental coverage experts',
  'Dallas STR Insurance TX provides comprehensive short-term rental insurance for vacation properties across the DFW metroplex, with hail, tornado, and liability coverage tailored to Texas STR owners.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Insurance Services', 'plano-tx-str-insurance-services', 'North Dallas vacation rental protection',
  'Plano TX STR Insurance Services offers specialized vacation rental insurance for properties in Plano and Collin County, with Texas weather risk and STR guest liability coverage.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 59
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Insurance TX', 'houston-str-insurance-tx', 'Bayou City vacation rental coverage',
  'Houston STR Insurance TX provides specialized insurance for vacation rental properties across Houston, with flood, hurricane, hail, and comprehensive STR liability coverage for Texas Gulf Coast risks.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Insurance Services', 'woodlands-tx-str-insurance-services', 'North Houston rental protection',
  'Woodlands TX STR Insurance Services offers vacation rental insurance for properties in The Woodlands and north Houston suburbs, with flood and comprehensive liability coverage options.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Insurance GA', 'atlanta-str-insurance-ga', 'ATL metro vacation rental coverage',
  'Atlanta STR Insurance GA provides comprehensive short-term rental insurance for vacation properties across metro Atlanta, with Georgia weather coverage and full STR guest liability protection.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Insurance Services', 'decatur-ga-str-insurance-services', 'Intown Atlanta vacation rental protection',
  'Decatur GA STR Insurance Services offers specialized vacation rental insurance for properties in Decatur and intown Atlanta neighborhoods, with comprehensive coverage for urban STR owners.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Insurance MA', 'boston-str-insurance-ma', 'Historic Boston vacation rental coverage',
  'Boston STR Insurance MA provides specialized insurance for Boston vacation rental properties, with historic building coverage, freeze damage, and comprehensive STR guest liability protection.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Insurance Services', 'cambridge-ma-str-insurance-services', 'Greater Boston rental protection',
  'Cambridge MA STR Insurance Services offers comprehensive vacation rental insurance for properties in Cambridge and greater Boston, with Massachusetts-specific STR coverage requirements addressed.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 75
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Insurance Co', 'dc-str-insurance-co', 'Capital region vacation rental coverage',
  'DC STR Insurance Co provides comprehensive short-term rental insurance for vacation properties throughout the Washington DC metro area, with DC, Maryland, and Virginia coverage options.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 113
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Insurance Services', 'arlington-va-str-insurance-services', 'Northern Virginia rental protection',
  'Arlington VA STR Insurance Services offers specialized vacation rental insurance for properties in Arlington and Northern Virginia, with comprehensive STR liability and property coverage.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Insurance PA', 'philadelphia-str-insurance-pa', 'Philly vacation rental coverage',
  'Philadelphia STR Insurance PA provides comprehensive short-term rental insurance for vacation properties across the city, with historic building, flood, and comprehensive STR liability coverage.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Insurance Services', 'cherry-hill-nj-str-insurance-services', 'South Jersey rental protection',
  'Cherry Hill NJ STR Insurance Services offers vacation rental insurance for properties in Cherry Hill and greater South Jersey, with New Jersey coastal and urban STR coverage options.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 54
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Insurance FL', 'tampa-str-insurance-fl', 'Tampa Bay vacation rental coverage',
  'Tampa STR Insurance FL provides comprehensive short-term rental insurance for vacation properties across Hillsborough County, with hurricane, flood, and full STR liability coverage for Florida rentals.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 103
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Insurance', 'st-petersburg-fl-str-insurance', 'Pinellas County rental protection',
  'St Petersburg FL STR Insurance offers specialized vacation rental insurance for properties in St. Pete and Pinellas County, with Florida coastal and hurricane coverage tailored to STR owners.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Insurance OR', 'portland-str-insurance-or', 'Rose City vacation rental coverage',
  'Portland STR Insurance OR provides comprehensive short-term rental insurance for vacation properties in Portland and the Pacific Northwest, with earthquake, water damage, and STR liability coverage.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Insurance Services', 'hood-river-or-str-insurance-services', 'Columbia Gorge rental protection',
  'Hood River OR STR Insurance Services offers vacation rental insurance for properties in the Columbia River Gorge, with wind event, water damage, and comprehensive STR liability coverage.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- FURNITURE & SUPPLIES — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Furnishings FL', 'clearwater-str-furnishings-fl', 'Gulf Coast vacation rental furniture',
  'Clearwater STR Furnishings FL provides furniture packages, coastal decor, and essential supplies for vacation rental properties on the Pinellas Peninsula, with turnkey setup and delivery.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Supplies', 'clearwater-beach-str-supplies', 'Beach rental furniture and essentials',
  'Clearwater Beach STR Supplies offers complete furniture packages and vacation rental supplies for beach properties on Clearwater Beach, including coastal-themed decor and guest amenity kits.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 42
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Furnishings', 'fort-lauderdale-str-furnishings', 'Broward County rental furniture packages',
  'Fort Lauderdale STR Furnishings provides turnkey furniture and supply packages for vacation rental properties throughout Broward County, with tropical-luxury styling and fast delivery.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Supplies FL', 'pompano-beach-str-supplies-fl', 'South Florida vacation rental furnishings',
  'Pompano Beach STR Supplies FL offers furniture packages, linens, and essential supplies for vacation rental properties in South Florida, with full white-glove setup and delivery services.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Furnishings MA', 'nantucket-str-furnishings-ma', 'Island vacation rental furniture',
  'Nantucket STR Furnishings MA provides premium furniture packages and island-inspired supplies for vacation rental properties on Nantucket, with ferry-friendly delivery and expert setup.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 71
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Supplies MA', 'siasconset-str-supplies-ma', 'Nantucket vacation rental essentials',
  'Siasconset STR Supplies MA offers furniture and supply packages for vacation rental cottages across Nantucket, with classic New England styling and complete setup services.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Furnishings MA', 'vineyard-str-furnishings-ma', 'MV vacation rental furniture packages',
  'Vineyard STR Furnishings MA provides premium furniture packages and island supplies for Martha''s Vineyard vacation rental properties, with island-inspired styling and full setup services.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Supplies MA', 'vineyard-haven-str-supplies-ma', 'Martha Vineyard rental furnishings',
  'Vineyard Haven STR Supplies MA offers furniture and essential supply packages for vacation rental properties across Martha''s Vineyard, with classic MV decor and complete setup services.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Furnishings ME', 'bar-harbor-str-furnishings-me', 'Acadia area vacation rental furniture',
  'Bar Harbor STR Furnishings ME provides furniture packages and Maine-inspired supplies for vacation rental properties near Acadia National Park, with full setup and delivery on Mount Desert Island.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Supplies Services ME', 'mdi-str-supplies-services-me', 'Mount Desert Island rental furnishings',
  'MDI STR Supplies Services ME offers vacation rental furniture and essential supply packages for properties across Mount Desert Island, with New England cottage styling and professional setup.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 37
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Furnishings MS', 'gulf-coast-str-furnishings-ms', 'Mississippi coast rental furniture',
  'Gulf Coast STR Furnishings MS provides furniture packages and coastal supplies for vacation rental properties along the Mississippi Gulf Coast, with Southern hospitality styling and delivery.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Supplies MS', 'gulfport-str-supplies-ms', 'Harrison County vacation rental furnishings',
  'Gulfport STR Supplies MS offers furniture packages and essential vacation rental supplies throughout the Gulfport-Biloxi corridor, with full setup and restocking services for STR owners.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 32
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Furnishings NC', 'crystal-coast-str-furnishings-nc', 'Bogue Banks vacation rental furniture',
  'Crystal Coast STR Furnishings NC provides coastal-inspired furniture packages and supplies for vacation rental properties along the Crystal Coast, with full delivery and setup services.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 65
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Supplies NC', 'atlantic-beach-str-supplies-nc', 'Crystal Coast rental furnishings',
  'Atlantic Beach STR Supplies NC offers vacation rental furniture and essential supplies for Crystal Coast properties, with beach-inspired decor and complete turnkey setup options.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Furnishings RI', 'newport-str-furnishings-ri', 'Historic Newport vacation rental furniture',
  'Newport STR Furnishings RI provides premium furniture packages and classic New England supplies for vacation rental properties throughout Newport County, with complete setup and delivery.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Supplies RI', 'aquidneck-island-str-supplies-ri', 'Newport area rental furnishings',
  'Aquidneck Island STR Supplies RI offers furniture packages and essential vacation rental supplies for Newport County properties, with nautical-inspired styling and professional setup services.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Furnishings TX', 'port-aransas-str-furnishings-tx', 'Mustang Island vacation rental furniture',
  'Port Aransas STR Furnishings TX provides beach-inspired furniture packages and essential supplies for vacation rental properties on Mustang Island, with full delivery and setup services.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Supplies', 'rockport-tx-str-supplies', 'Aransas Bay vacation rental furnishings',
  'Rockport TX STR Supplies offers furniture and essential supply packages for vacation rental properties in the Rockport-Fulton area, with Texas coastal styling and delivery services.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 45
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Furnishings FL', 'amelia-island-str-furnishings-fl', 'Nassau County vacation rental furniture',
  'Amelia Island STR Furnishings FL provides premium furniture packages and island-inspired supplies for vacation rental properties on Amelia Island, with complete turnkey setup services.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Supplies Co FL', 'amelia-island-str-supplies-co-fl', 'Island rental furnishings and essentials',
  'Amelia Island STR Supplies Co FL offers vacation rental furniture and essential supply packages for Nassau County properties, with coastal styling and professional delivery services.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Furnishings GA', 'blue-ridge-str-furnishings-ga', 'North Georgia cabin furniture packages',
  'Blue Ridge STR Furnishings GA provides rustic-luxury furniture packages and mountain cabin supplies for vacation rental properties throughout the North Georgia Highlands, with full setup services.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Supplies GA', 'ellijay-str-supplies-ga', 'Gilmer County cabin rental furnishings',
  'Ellijay STR Supplies GA offers furniture packages and essential vacation rental supplies for cabin properties in the Ellijay area, with mountain-inspired styling and delivery services.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Furnishings PA', 'pocono-str-furnishings-pa', 'Pocono Mountains vacation rental furniture',
  'Pocono STR Furnishings PA provides mountain-inspired furniture packages and essential supplies for vacation rental properties throughout the Pocono region, with full setup and delivery.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Supplies PA', 'stroudsburg-str-supplies-pa', 'Delaware Water Gap rental furnishings',
  'Stroudsburg STR Supplies PA offers vacation rental furniture and essential supply packages for properties in the greater Stroudsburg area, with Pocono mountain styling and setup services.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Furnishings AZ', 'flagstaff-str-furnishings-az', 'Northern Arizona vacation rental furniture',
  'Flagstaff STR Furnishings AZ provides Southwestern-inspired furniture packages and mountain supplies for vacation rental properties in Flagstaff and northern Arizona, with full setup services.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Supplies AZ', 'sedona-str-supplies-az', 'Red rock country rental furnishings',
  'Sedona STR Supplies AZ offers artisan-influenced furniture packages and desert-inspired supplies for vacation rental properties in the Sedona area, with professional setup and delivery.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Furnishings CO', 'durango-str-furnishings-co', 'Southwest Colorado vacation rental furniture',
  'Durango STR Furnishings CO provides mountain-western furniture packages and essential supplies for vacation rental properties in La Plata County, with locally-sourced decor and setup services.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Supplies', 'bayfield-co-str-supplies', 'Animas Valley rental furnishings',
  'Bayfield CO STR Supplies offers vacation rental furniture and essential supply packages for properties in the Bayfield and Durango corridor, with Colorado mountain styling and delivery.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 38
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Furnishings', 'boone-nc-str-furnishings', 'High Country vacation rental furniture',
  'Boone NC STR Furnishings provides cozy mountain furniture packages and essential supplies for vacation rental cabins throughout the High Country, with rustic-chic styling and full setup services.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 83
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Supplies NC', 'banner-elk-str-supplies-nc', 'Avery County vacation rental furnishings',
  'Banner Elk STR Supplies NC offers furniture and essential supply packages for mountain vacation rental properties near Sugar and Beech mountains, with ski lodge styling and delivery services.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Furnishings WI', 'door-county-str-furnishings-wi', 'Peninsula vacation rental furniture',
  'Door County STR Furnishings WI provides charming cottage furniture packages and peninsula-inspired supplies for vacation rental properties throughout the Door Peninsula, with full setup services.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Supplies WI', 'sturgeon-bay-str-supplies-wi', 'Door County rental furnishings',
  'Sturgeon Bay STR Supplies WI offers vacation rental furniture and essential supplies for properties throughout Door County, Wisconsin, with four-season setup and restocking services.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Furnishings MI', 'traverse-city-str-furnishings-mi', 'Northern Michigan vacation rental furniture',
  'Traverse City STR Furnishings MI provides Great Lakes-inspired furniture packages and essential supplies for vacation rental properties around Grand Traverse Bay, with full setup and delivery.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 81
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Supplies MI', 'glen-arbor-str-supplies-mi', 'Sleeping Bear Dunes rental furnishings',
  'Glen Arbor STR Supplies MI offers vacation rental furniture and supply packages for properties near Sleeping Bear Dunes, with lakeside cottage styling and professional setup services.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Furnishings CA', 'joshua-tree-str-furnishings-ca', 'Desert modern vacation rental furniture',
  'Joshua Tree STR Furnishings CA provides desert-modern furniture packages and supplies for vacation rental properties near JTNP, with the iconic mineral-palette styling that drives Instagram bookings.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Supplies CA', 'twentynine-palms-str-supplies-ca', 'High desert vacation rental furnishings',
  'Twentynine Palms STR Supplies CA offers furniture packages and desert-inspired supplies for vacation rental properties near Joshua Tree National Park, with full setup and delivery services.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Furnishings CA', 'palm-springs-str-furnishings-ca', 'Coachella Valley luxury rental furniture',
  'Palm Springs STR Furnishings CA provides premium mid-century modern furniture packages and desert luxury supplies for vacation rental properties throughout the Coachella Valley, with white-glove setup.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 117
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Supplies CA', 'palm-desert-str-supplies-ca', 'Desert resort vacation rental furnishings',
  'Palm Desert STR Supplies CA offers premium furniture packages and luxury supplies for vacation rental properties throughout Palm Desert and the Coachella Valley, with complete setup and restocking.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 83
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Furnishings CA', 'napa-valley-str-furnishings-ca', 'Wine country vacation rental furniture',
  'Napa Valley STR Furnishings CA provides sophisticated wine country furniture packages and premium supplies for vacation rental properties in Napa Valley, with California-European styling and full setup.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Supplies CA', 'yountville-str-supplies-ca', 'Upper Napa Valley rental furnishings',
  'Yountville STR Supplies CA offers premium furniture and supply packages for vacation rental properties in the heart of Napa Valley, with refined wine country styling and white-glove delivery.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Furnishings CA', 'san-francisco-str-furnishings-ca', 'Bay Area vacation rental furniture',
  'San Francisco STR Furnishings CA provides curated furniture packages and urban-chic supplies for vacation rental properties throughout SF, with Victorian and modern styling options and full setup.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 106
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Supplies CA', 'oakland-str-supplies-ca', 'East Bay vacation rental furnishings',
  'Oakland STR Supplies CA offers furniture packages and urban-artisan supplies for vacation rental properties across Oakland and the East Bay, with eclectic East Bay styling and delivery services.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 61
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Furnishings WA', 'seattle-str-furnishings-wa', 'Pacific Northwest vacation rental furniture',
  'Seattle STR Furnishings WA provides Pacific Northwest-inspired furniture packages and essential supplies for vacation rental properties across Seattle, with natural materials and full setup services.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 108
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Supplies WA', 'bainbridge-island-str-supplies-wa', 'Puget Sound island rental furnishings',
  'Bainbridge Island STR Supplies WA offers nautical-inspired furniture packages and island supplies for vacation rental properties on Bainbridge Island, with ferry-coordinated delivery and setup.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Furnishings TX', 'dallas-str-furnishings-tx', 'DFW vacation rental furniture packages',
  'Dallas STR Furnishings TX provides contemporary furniture packages and essential supplies for vacation rental properties across the DFW metroplex, with full setup and fast delivery.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Supplies', 'plano-tx-str-supplies', 'North Dallas vacation rental furnishings',
  'Plano TX STR Supplies offers vacation rental furniture and supply packages for properties in Plano and Collin County, with modern Texas styling and professional setup services.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 57
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Furnishings TX', 'houston-str-furnishings-tx', 'Bayou City vacation rental furniture',
  'Houston STR Furnishings TX provides furniture packages and essential supplies for vacation rental properties across Houston, with contemporary styling and fast delivery throughout Harris County.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Supplies', 'woodlands-tx-str-supplies', 'North Houston vacation rental furnishings',
  'Woodlands TX STR Supplies offers furniture packages and essential vacation rental supplies for properties in The Woodlands and north Houston suburbs, with full setup and restocking services.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Furnishings GA', 'atlanta-str-furnishings-ga', 'ATL metro vacation rental furniture',
  'Atlanta STR Furnishings GA provides contemporary Southern-influenced furniture packages and essential supplies for vacation rental properties across metro Atlanta, with full setup and delivery.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Supplies', 'decatur-ga-str-supplies', 'Intown Atlanta vacation rental furnishings',
  'Decatur GA STR Supplies offers furniture packages and eclectic supplies for vacation rental properties in Decatur and intown Atlanta neighborhoods, with artsy-urban styling and professional setup.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Furnishings MA', 'boston-str-furnishings-ma', 'Historic Boston vacation rental furniture',
  'Boston STR Furnishings MA provides classic New England furniture packages and essential supplies for vacation rental properties throughout Boston, with historic styling and full setup services.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Supplies', 'cambridge-ma-str-supplies', 'Greater Boston vacation rental furnishings',
  'Cambridge MA STR Supplies offers furniture packages and smart-urban supplies for vacation rental properties in Cambridge and greater Boston, with academic-chic styling and professional setup.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 76
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Furnishings Co', 'dc-str-furnishings-co', 'Capital region vacation rental furniture',
  'DC STR Furnishings Co provides classic-contemporary furniture packages and essential supplies for vacation rental properties throughout the Washington DC metro area, with full setup and delivery.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Supplies', 'arlington-va-str-supplies', 'Northern Virginia vacation rental furnishings',
  'Arlington VA STR Supplies offers vacation rental furniture and essential supply packages for properties in Arlington and Northern Virginia, with clean contemporary styling and same-week setup.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.7, 76
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Furnishings PA', 'philadelphia-str-furnishings-pa', 'Philly vacation rental furniture packages',
  'Philadelphia STR Furnishings PA provides historically-inspired furniture packages and essential supplies for vacation rental properties across the city, with Philly neighborhood character and full setup.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Supplies', 'cherry-hill-nj-str-supplies', 'South Jersey vacation rental furnishings',
  'Cherry Hill NJ STR Supplies offers furniture packages and essential vacation rental supplies for properties in Cherry Hill and greater South Jersey, with full setup and fast delivery services.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 51
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Furnishings FL', 'tampa-str-furnishings-fl', 'Tampa Bay vacation rental furniture',
  'Tampa STR Furnishings FL provides vibrant Florida-inspired furniture packages and essential supplies for vacation rental properties across Hillsborough County, with full setup and delivery.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Supplies', 'st-petersburg-fl-str-supplies', 'Pinellas County vacation rental furnishings',
  'St Petersburg FL STR Supplies offers furniture packages and colorful arts-district-inspired supplies for vacation rental properties in St. Pete and Pinellas County, with complete setup services.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Furnishings OR', 'portland-str-furnishings-or', 'Rose City vacation rental furniture',
  'Portland STR Furnishings OR provides artisan-crafted furniture packages and Pacific Northwest-inspired supplies for vacation rental properties in Portland, with eco-conscious styling and full setup.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Supplies', 'hood-river-or-str-supplies', 'Columbia Gorge vacation rental furnishings',
  'Hood River OR STR Supplies offers adventure-inspired furniture packages and outdoor recreation supplies for vacation rental properties in the Columbia River Gorge, with full setup and delivery.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;
