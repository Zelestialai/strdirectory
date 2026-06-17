-- Migration 033: Tier 5 Vendor Seeds D
-- Categories: renovation, accounting-tax
-- Markets: all 30 Tier 5 markets (120 vendors total)

-- ============================================================
-- RENOVATION & CONSTRUCTION — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Renovation FL', 'clearwater-str-renovation-fl', 'Gulf Coast vacation rental remodels',
  'Clearwater STR Renovation FL upgrades vacation rental properties on the Pinellas Peninsula with kitchen and bath remodels, outdoor living spaces, and coastal-style improvements that boost nightly rates.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Remodel Co', 'clearwater-beach-str-remodel-co', 'Beach house vacation rental upgrades',
  'Clearwater Beach STR Remodel Co transforms vacation rental properties with deck additions, pool upgrades, and interior renovations that maximize guest appeal and listing revenue.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Renovation', 'fort-lauderdale-str-renovation', 'South Florida rental renovation experts',
  'Fort Lauderdale STR Renovation specializes in transforming Broward County vacation rentals with high-ROI upgrades including luxury bath remodels, outdoor kitchens, and smart home installations.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Remodel FL', 'pompano-beach-str-remodel-fl', 'Broward coast rental upgrades',
  'Pompano Beach STR Remodel FL provides vacation rental renovation services throughout South Florida, focusing on upgrades that increase nightly rates and guest satisfaction scores.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Renovation MA', 'nantucket-str-renovation-ma', 'Island vacation rental restoration and remodel',
  'Nantucket STR Renovation MA provides expert renovation services for island vacation rental properties, specializing in historic cottage restoration, modern additions, and premium guest amenity upgrades.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Remodel Services MA', 'siasconset-str-remodel-services-ma', 'East Nantucket cottage renovations',
  'Siasconset STR Remodel Services MA handles vacation rental renovations across Nantucket, with expertise in maintaining historic character while adding modern amenities for premium guests.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Renovation MA', 'vineyard-str-renovation-ma', 'MV vacation rental remodels',
  'Vineyard STR Renovation MA upgrades Martha''s Vineyard vacation rentals with island-character-preserving renovations, premium kitchen and bath upgrades, and outdoor living improvements.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Remodel MA', 'vineyard-haven-str-remodel-ma', 'Martha Vineyard rental renovation experts',
  'Vineyard Haven STR Remodel MA provides full renovation services for vacation rental properties across Martha''s Vineyard, from structural improvements to finish-level upgrades that maximize nightly rates.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Renovation ME', 'bar-harbor-str-renovation-me', 'Acadia area rental renovation specialists',
  'Bar Harbor STR Renovation ME transforms vacation rental properties near Acadia National Park with high-ROI renovations including scenic deck additions, kitchen upgrades, and energy-efficient improvements.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Remodel Services ME', 'mdi-str-remodel-services-me', 'Mount Desert Island rental renovations',
  'MDI STR Remodel Services ME provides vacation rental renovation services across Mount Desert Island, specializing in New England cottage upgrades and sustainable building practices.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.6, 43
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Renovation MS', 'gulf-coast-str-renovation-ms', 'Mississippi coast rental remodels',
  'Gulf Coast STR Renovation MS upgrades vacation rental properties along the Mississippi Gulf Coast with storm-resilient construction, coastal improvements, and interior renovations that drive bookings.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Remodel Services MS', 'gulfport-str-remodel-services-ms', 'Harrison County vacation rental renovations',
  'Gulfport STR Remodel Services MS provides renovation and construction services for vacation rental properties throughout the Gulfport-Biloxi area, with focus on maximizing guest appeal.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 37
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Renovation NC', 'crystal-coast-str-renovation-nc', 'Bogue Banks vacation rental remodels',
  'Crystal Coast STR Renovation NC upgrades vacation rental properties along the Crystal Coast with beach-resilient improvements, deck additions, and interior renovations that boost nightly rates.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Remodel NC', 'atlantic-beach-str-remodel-nc', 'Crystal Coast rental renovation experts',
  'Atlantic Beach STR Remodel NC provides vacation rental renovation services along the Crystal Coast, specializing in oceanfront property upgrades and high-return interior improvements.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Renovation RI', 'newport-str-renovation-ri', 'Historic Newport vacation rental remodels',
  'Newport STR Renovation RI specializes in renovating historic vacation rental properties in Newport County, preserving period character while adding modern amenities that command premium rates.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Remodel RI', 'aquidneck-island-str-remodel-ri', 'Newport area rental renovation pros',
  'Aquidneck Island STR Remodel RI handles vacation rental renovations throughout Newport County, from kitchen and bath upgrades to full property transformations that maximize booking revenue.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Renovation TX', 'port-aransas-str-renovation-tx', 'Mustang Island rental remodel specialists',
  'Port Aransas STR Renovation TX upgrades coastal vacation rental properties on Mustang Island with storm-resilient construction, outdoor entertaining spaces, and premium interior renovations.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Remodel Services', 'rockport-tx-str-remodel-services', 'Aransas Bay area vacation rental renovations',
  'Rockport TX STR Remodel Services provides vacation rental renovation and construction services in the Rockport-Fulton area, with expertise in coastal property upgrades and hurricane hardening.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 51
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Renovation FL', 'amelia-island-str-renovation-fl', 'Nassau County vacation rental remodels',
  'Amelia Island STR Renovation FL transforms vacation rental properties on Amelia Island with premium renovations, historic preservation work, and luxury amenity additions that drive higher rates.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Remodel Co FL', 'amelia-island-str-remodel-co-fl', 'Island rental renovation experts',
  'Amelia Island STR Remodel Co FL provides full renovation services for vacation rental properties across Nassau County, focusing on improvements that deliver the highest ROI for STR owners.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Renovation GA', 'blue-ridge-str-renovation-ga', 'North Georgia cabin renovations',
  'Blue Ridge STR Renovation GA transforms vacation rental cabins throughout the North Georgia Highlands with rustic-luxury upgrades, hot tub additions, fire features, and premium finishes.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 101
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Remodel Services GA', 'ellijay-str-remodel-services-ga', 'Gilmer County cabin renovations',
  'Ellijay STR Remodel Services GA provides renovation and construction services for vacation rental cabins in the Ellijay area, with specialty in mountain cabin upgrades that increase booking rates.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Renovation PA', 'pocono-str-renovation-pa', 'Pocono Mountains rental renovation experts',
  'Pocono STR Renovation PA upgrades vacation rental properties throughout the Pocono region with kitchen and bath remodels, game room additions, and outdoor deck and spa improvements.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Remodel Services PA', 'stroudsburg-str-remodel-services-pa', 'Delaware Water Gap rental renovations',
  'Stroudsburg STR Remodel Services PA provides vacation rental renovation and construction in the greater Stroudsburg area, with focus on upgrades that drive higher Airbnb nightly rates.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Renovation AZ', 'flagstaff-str-renovation-az', 'Northern Arizona vacation rental remodels',
  'Flagstaff STR Renovation AZ upgrades vacation rental properties in Flagstaff and northern Arizona with Southwestern-inspired renovations, outdoor living spaces, and energy-efficient improvements.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Remodel Services AZ', 'sedona-str-remodel-services-az', 'Red rock country rental renovations',
  'Sedona STR Remodel Services AZ transforms vacation rental properties in the Sedona area with adobe restoration, vortex-view patio additions, and luxury interior upgrades that command premium rates.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Renovation CO', 'durango-str-renovation-co', 'Southwest Colorado rental remodels',
  'Durango STR Renovation CO upgrades vacation rental properties throughout La Plata County with mountain-style improvements, hot tub and sauna additions, and premium interior renovations.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Remodel Services', 'bayfield-co-str-remodel-services', 'Animas Valley vacation rental renovations',
  'Bayfield CO STR Remodel Services provides vacation rental renovation services in the Bayfield and Durango corridor, with expertise in mountain property upgrades and energy efficiency.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 43
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Renovation', 'boone-nc-str-renovation', 'High Country cabin renovation experts',
  'Boone NC STR Renovation upgrades vacation rental cabins throughout the High Country with hot tub additions, game room buildouts, premium kitchen remodels, and rustic-luxury finishes.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 93
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Remodel NC', 'banner-elk-str-remodel-nc', 'Avery County vacation rental renovations',
  'Banner Elk STR Remodel NC provides renovation and construction services for ski country vacation rentals near Sugar and Beech mountains, with focus on high-ROI guest amenity upgrades.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Renovation WI', 'door-county-str-renovation-wi', 'Peninsula vacation rental remodels',
  'Door County STR Renovation WI upgrades vacation rental properties throughout the Door Peninsula with waterfront improvements, cottage restorations, and premium interior renovations.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Remodel WI', 'sturgeon-bay-str-remodel-wi', 'Door County rental renovation experts',
  'Sturgeon Bay STR Remodel WI provides vacation rental renovation services throughout Door County, with expertise in four-season property improvements and energy upgrades for Wisconsin winters.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Renovation MI', 'traverse-city-str-renovation-mi', 'Northern Michigan rental remodel pros',
  'Traverse City STR Renovation MI upgrades vacation rental properties around Grand Traverse Bay with waterfront enhancements, premium kitchen and bath remodels, and four-season improvements.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Remodel MI', 'glen-arbor-str-remodel-mi', 'Sleeping Bear Dunes rental renovations',
  'Glen Arbor STR Remodel MI provides vacation rental renovation services near Sleeping Bear Dunes, with focus on lakeside property upgrades and rustic-modern cabin transformations.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Renovation CA', 'joshua-tree-str-renovation-ca', 'Desert vacation rental remodels',
  'Joshua Tree STR Renovation CA transforms desert vacation rental properties with stargazing decks, plunge pools, outdoor shower installations, and modern desert architecture upgrades.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 108
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Remodel CA', 'twentynine-palms-str-remodel-ca', 'High desert rental renovation experts',
  'Twentynine Palms STR Remodel CA provides vacation rental renovation services near Joshua Tree National Park, with expertise in desert-appropriate building materials and off-grid amenity installations.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Renovation CA', 'palm-springs-str-renovation-ca', 'Coachella Valley luxury rental remodels',
  'Palm Springs STR Renovation CA specializes in upgrading desert luxury vacation rentals with pool additions, mid-century modern restorations, outdoor entertaining spaces, and smart home integrations.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Remodel CA', 'palm-desert-str-remodel-ca', 'Desert resort rental renovation pros',
  'Palm Desert STR Remodel CA provides premium renovation services for vacation rental properties throughout the Coachella Valley, delivering high-ROI upgrades that command top nightly rates.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 81
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Renovation CA', 'napa-valley-str-renovation-ca', 'Wine country vacation rental remodels',
  'Napa Valley STR Renovation CA upgrades wine country vacation rental properties with vineyard-view terraces, luxury kitchen remodels, wine cellar buildouts, and premium guest amenity additions.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Remodel Services CA', 'yountville-str-remodel-services-ca', 'Upper Napa Valley rental renovations',
  'Yountville STR Remodel Services CA provides high-end vacation rental renovation services in the heart of Napa Valley, with premium finishes and wine country-inspired design upgrades.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Renovation CA', 'san-francisco-str-renovation-ca', 'Bay Area vacation rental remodel experts',
  'San Francisco STR Renovation CA upgrades vacation rental properties throughout SF with Victorian restoration, modern kitchen and bath remodels, and ADU conversions for STR use.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 109
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Remodel Services CA', 'oakland-str-remodel-services-ca', 'East Bay vacation rental renovations',
  'Oakland STR Remodel Services CA provides renovation and construction for vacation rental properties across Oakland and the East Bay, focusing on high-ROI upgrades in a competitive rental market.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 65
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Renovation WA', 'seattle-str-renovation-wa', 'Pacific Northwest vacation rental remodels',
  'Seattle STR Renovation WA upgrades vacation rental properties throughout the greater Seattle area with modern kitchen and bath remodels, ADU conversions, and Pacific Northwest-inspired outdoor spaces.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Remodel WA', 'bainbridge-island-str-remodel-wa', 'Puget Sound island rental renovations',
  'Bainbridge Island STR Remodel WA provides vacation rental renovation services on Bainbridge Island, with expertise in ferry-accessible project management and sustainable Pacific NW construction.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Renovation TX', 'dallas-str-renovation-tx', 'DFW vacation rental remodel experts',
  'Dallas STR Renovation TX upgrades vacation rental properties across the DFW metroplex with contemporary interior remodels, outdoor entertaining additions, and smart home improvements.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Remodel Services', 'plano-tx-str-remodel-services', 'North Dallas vacation rental renovations',
  'Plano TX STR Remodel Services provides renovation and construction for vacation rental properties in Plano and Collin County, with focus on premium upgrades that attract corporate and family travelers.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 64
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Renovation TX', 'houston-str-renovation-tx', 'Bayou City vacation rental remodels',
  'Houston STR Renovation TX upgrades vacation rental properties across Houston with flood-resilient construction techniques, luxury interior remodels, and outdoor entertaining improvements.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 105
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Remodel Services', 'woodlands-tx-str-remodel-services', 'North Houston rental renovation experts',
  'Woodlands TX STR Remodel Services provides vacation rental renovation and construction for properties in The Woodlands and north Houston suburbs, delivering high-ROI improvements.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Renovation GA', 'atlanta-str-renovation-ga', 'ATL metro vacation rental remodels',
  'Atlanta STR Renovation GA upgrades vacation rental properties across metro Atlanta with modern interior remodels, ADU conversions, outdoor entertaining additions, and premium finishes.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Remodel Services', 'decatur-ga-str-remodel-services', 'Intown Atlanta rental renovations',
  'Decatur GA STR Remodel Services provides vacation rental renovation and construction in Decatur and intown Atlanta neighborhoods, specializing in historic home upgrades for the STR market.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Renovation MA', 'boston-str-renovation-ma', 'Historic Boston vacation rental remodels',
  'Boston STR Renovation MA specializes in renovating historic vacation rental properties throughout Boston, preserving architectural heritage while adding the modern amenities premium guests expect.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 117
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Remodel Services', 'cambridge-ma-str-remodel-services', 'Greater Boston rental renovation pros',
  'Cambridge MA STR Remodel Services provides vacation rental renovation and construction across Cambridge and greater Boston, with expertise in triple-decker and rowhouse STR upgrades.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Renovation Co', 'dc-str-renovation-co', 'Capital region vacation rental remodels',
  'DC STR Renovation Co upgrades vacation rental properties throughout the Washington DC metro area, with expertise in rowhouse renovations, historic home improvements, and premium interior remodels.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.8, 106
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Remodel Services', 'arlington-va-str-remodel-services', 'Northern Virginia rental renovations',
  'Arlington VA STR Remodel Services provides vacation rental renovation and construction for properties across Arlington and Northern Virginia, focusing on high-ROI improvements for urban STR markets.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Renovation PA', 'philadelphia-str-renovation-pa', 'Philly vacation rental remodel experts',
  'Philadelphia STR Renovation PA upgrades vacation rental properties across the city with rowhome restorations, kitchen and bath remodels, and neighborhood-character-preserving STR improvements.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 102
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Remodel Services', 'cherry-hill-nj-str-remodel-services', 'South Jersey vacation rental renovations',
  'Cherry Hill NJ STR Remodel Services provides renovation and construction for vacation rental properties in Cherry Hill and greater South Jersey, delivering quality upgrades at competitive prices.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 59
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Renovation FL', 'tampa-str-renovation-fl', 'Tampa Bay vacation rental remodels',
  'Tampa STR Renovation FL upgrades vacation rental properties across Hillsborough County with hurricane-resilient improvements, outdoor entertaining spaces, and premium interior renovations.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Remodel', 'st-petersburg-fl-str-remodel', 'Pinellas County vacation rental renovations',
  'St Petersburg FL STR Remodel provides renovation services for vacation rental properties throughout St. Pete and Pinellas County, with arts-district-inspired upgrades that attract premium guests.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 76
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Renovation OR', 'portland-str-renovation-or', 'Rose City vacation rental remodels',
  'Portland STR Renovation OR upgrades vacation rental properties in Portland and surrounding areas with ADU conversions, sustainable building improvements, and Pacific Northwest-style interior renovations.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Remodel Services', 'hood-river-or-str-remodel-services', 'Columbia Gorge rental renovations',
  'Hood River OR STR Remodel Services provides vacation rental renovation and construction for properties in the Columbia River Gorge, with expertise in outdoor adventure amenity buildouts.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 52
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- ACCOUNTING & TAX — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Accounting FL', 'clearwater-str-accounting-fl', 'Gulf Coast vacation rental tax specialists',
  'Clearwater STR Accounting FL provides tax preparation, bookkeeping, and financial planning services for vacation rental owners on the Pinellas Peninsula, maximizing deductions and ensuring compliance.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach STR Tax Services', 'clearwater-beach-str-tax-services', 'Beach rental tax and bookkeeping',
  'Clearwater Beach STR Tax Services offers specialized accounting and tax services for vacation rental property owners, with expertise in Florida STR tax laws and short-term rental deductions.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Accounting', 'fort-lauderdale-str-accounting', 'Broward County vacation rental CPAs',
  'Fort Lauderdale STR Accounting provides comprehensive accounting, tax preparation, and STR income analysis for vacation rental owners throughout Broward County, with proven tax savings strategies.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Tax Services FL', 'pompano-beach-str-tax-services-fl', 'South Florida rental tax specialists',
  'Pompano Beach STR Tax Services FL offers vacation rental-focused tax preparation and bookkeeping for South Florida STR owners, ensuring all available deductions are claimed and taxes minimized.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Tax Advisors MA', 'nantucket-str-tax-advisors-ma', 'Island vacation rental CPAs',
  'Nantucket STR Tax Advisors MA provides specialized tax and accounting services for Nantucket vacation rental owners, with expertise in Massachusetts STR laws and high-value island property taxation.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset STR Accounting Services MA', 'siasconset-str-accounting-services-ma', 'Nantucket rental tax and bookkeeping',
  'Siasconset STR Accounting Services MA offers tax preparation and bookkeeping for vacation rental property owners across Nantucket, helping island STR owners optimize their financial position.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Tax Advisors MA', 'vineyard-str-tax-advisors-ma', 'MV vacation rental accounting experts',
  'Vineyard STR Tax Advisors MA provides specialized accounting and tax services for Martha''s Vineyard vacation rental owners, with expertise in Massachusetts short-term rental taxation and island property finance.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven STR Accounting MA', 'vineyard-haven-str-accounting-ma', 'Martha Vineyard rental tax services',
  'Vineyard Haven STR Accounting MA provides tax preparation and bookkeeping for vacation rental owners across Martha''s Vineyard, navigating Massachusetts STR tax laws and maximizing owner returns.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Accounting ME', 'bar-harbor-str-accounting-me', 'Acadia area vacation rental tax pros',
  'Bar Harbor STR Accounting ME provides specialized accounting and tax preparation for vacation rental owners near Acadia National Park, with expertise in Maine STR regulations and seasonal income accounting.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI STR Tax Services ME', 'mdi-str-tax-services-me', 'Mount Desert Island rental accounting',
  'MDI STR Tax Services ME offers tax preparation and financial consulting for vacation rental property owners across Mount Desert Island, maximizing deductions for Maine island properties.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 41
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Accounting MS', 'gulf-coast-str-accounting-ms', 'Mississippi coast rental tax specialists',
  'Gulf Coast STR Accounting MS provides tax preparation and bookkeeping services for vacation rental owners along the Mississippi Gulf Coast, with knowledge of Mississippi STR tax laws.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Tax Services MS', 'gulfport-str-tax-services-ms', 'Harrison County vacation rental accounting',
  'Gulfport STR Tax Services MS offers STR-focused accounting and tax preparation for vacation rental owners throughout the Gulfport-Biloxi area, ensuring compliance and maximizing deductions.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 35
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Accounting NC', 'crystal-coast-str-accounting-nc', 'Bogue Banks vacation rental tax pros',
  'Crystal Coast STR Accounting NC provides specialized accounting and tax services for vacation rental owners along the Crystal Coast, with expertise in North Carolina STR taxation and beach property finance.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Tax Services NC', 'atlantic-beach-str-tax-services-nc', 'Crystal Coast rental accounting',
  'Atlantic Beach STR Tax Services NC offers tax preparation and bookkeeping for vacation rental owners along the Crystal Coast, maximizing deductions and ensuring North Carolina STR compliance.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Accounting RI', 'newport-str-accounting-ri', 'Rhode Island vacation rental CPAs',
  'Newport STR Accounting RI provides comprehensive accounting, tax preparation, and financial planning for vacation rental owners throughout Newport County, with Rhode Island STR tax expertise.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Tax Services', 'aquidneck-island-str-tax-services', 'Newport area rental accounting pros',
  'Aquidneck Island STR Tax Services provides tax preparation and bookkeeping for vacation rental owners across Newport County, Rhode Island, with proven strategies for minimizing STR tax liability.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Accounting TX', 'port-aransas-str-accounting-tx', 'Texas coast vacation rental tax pros',
  'Port Aransas STR Accounting TX provides specialized accounting and tax services for vacation rental owners on Mustang Island and the Texas coast, maximizing deductions in a no-income-tax state.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Tax Services', 'rockport-tx-str-tax-services', 'Aransas Bay vacation rental accounting',
  'Rockport TX STR Tax Services offers tax preparation and financial consulting for vacation rental owners in the Rockport-Fulton area, with Texas coastal property expertise.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Accounting FL', 'amelia-island-str-accounting-fl', 'Nassau County vacation rental tax experts',
  'Amelia Island STR Accounting FL provides comprehensive accounting and tax services for vacation rental owners on Amelia Island, with deep knowledge of Florida STR regulations and tax optimization.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Tax Services FL', 'amelia-island-str-tax-services-fl', 'Island rental accounting and bookkeeping',
  'Amelia Island STR Tax Services FL offers tax preparation and bookkeeping for vacation rental property owners across Nassau County, ensuring full compliance and maximum deductions.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Accounting GA', 'blue-ridge-str-accounting-ga', 'North Georgia cabin rental tax specialists',
  'Blue Ridge STR Accounting GA provides specialized accounting and tax services for mountain vacation rental cabin owners throughout the North Georgia Highlands, maximizing deductions and minimizing liability.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Tax Services GA', 'ellijay-str-tax-services-ga', 'Gilmer County vacation rental accounting',
  'Ellijay STR Tax Services GA offers tax preparation and bookkeeping for vacation rental cabin owners in the Ellijay area, with expertise in Georgia STR taxation and short-term rental deductions.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Accounting PA', 'pocono-str-accounting-pa', 'Pocono Mountains rental tax pros',
  'Pocono STR Accounting PA provides comprehensive accounting, tax preparation, and financial planning for vacation rental owners throughout the Pocono Mountains region of Pennsylvania.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Tax Services PA', 'stroudsburg-str-tax-services-pa', 'Delaware Water Gap rental accounting',
  'Stroudsburg STR Tax Services PA offers specialized tax preparation and bookkeeping for vacation rental property owners in the greater Stroudsburg area, maximizing all available STR deductions.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 54
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Accounting AZ', 'flagstaff-str-accounting-az', 'Northern Arizona vacation rental CPAs',
  'Flagstaff STR Accounting AZ provides specialized tax and accounting services for vacation rental owners in Flagstaff and northern Arizona, with expertise in Arizona STR tax laws and seasonal income.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Tax Services AZ', 'sedona-str-tax-services-az', 'Red rock country vacation rental accounting',
  'Sedona STR Tax Services AZ offers tax preparation and financial consulting for vacation rental owners in Sedona and the Verde Valley, maximizing deductions for one of Arizona''s top STR markets.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Accounting CO', 'durango-str-accounting-co', 'Southwest Colorado rental tax specialists',
  'Durango STR Accounting CO provides comprehensive accounting and tax services for vacation rental owners in La Plata County, with expertise in Colorado STR taxation and short-term rental deductions.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Tax Services', 'bayfield-co-str-tax-services', 'Animas Valley vacation rental accounting',
  'Bayfield CO STR Tax Services provides tax preparation and bookkeeping for vacation rental property owners in the Bayfield and Durango corridor, with Colorado mountain property tax expertise.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 42
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Accounting', 'boone-nc-str-accounting', 'High Country vacation rental tax pros',
  'Boone NC STR Accounting provides specialized accounting and tax preparation for vacation rental owners throughout the Boone/High Country area, with North Carolina mountain property expertise.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Tax Services NC', 'banner-elk-str-tax-services-nc', 'Avery County rental accounting',
  'Banner Elk STR Tax Services NC offers tax preparation and bookkeeping for mountain vacation rental owners near Sugar and Beech mountains, maximizing deductions for NC ski country properties.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Accounting WI', 'door-county-str-accounting-wi', 'Peninsula vacation rental tax specialists',
  'Door County STR Accounting WI provides comprehensive accounting and tax services for vacation rental owners throughout the Door Peninsula, with Wisconsin STR tax expertise and seasonal income planning.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Tax Services WI', 'sturgeon-bay-str-tax-services-wi', 'Door County rental accounting',
  'Sturgeon Bay STR Tax Services WI offers tax preparation and bookkeeping for vacation rental property owners throughout Door County, ensuring Wisconsin STR compliance and maximizing deductions.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Accounting MI', 'traverse-city-str-accounting-mi', 'Northern Michigan vacation rental tax pros',
  'Traverse City STR Accounting MI provides specialized accounting and tax services for vacation rental owners around Grand Traverse Bay, with Michigan STR tax expertise and proven deduction strategies.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Tax Services MI', 'glen-arbor-str-tax-services-mi', 'Sleeping Bear Dunes rental accounting',
  'Glen Arbor STR Tax Services MI offers tax preparation and bookkeeping for vacation rental owners near Sleeping Bear Dunes, with expertise in Michigan short-term rental taxation.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Accounting CA', 'joshua-tree-str-accounting-ca', 'High desert vacation rental tax experts',
  'Joshua Tree STR Accounting CA provides specialized accounting and tax services for desert vacation rental owners near JTNP, with expertise in California STR tax laws and high-revenue Airbnb income.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Tax Services', 'twentynine-palms-str-tax-services', 'San Bernardino desert rental accounting',
  'Twentynine Palms STR Tax Services offers tax preparation and financial consulting for vacation rental owners near Joshua Tree National Park, maximizing California STR deductions.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.6, 67
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Accounting CA', 'palm-springs-str-accounting-ca', 'Coachella Valley vacation rental CPAs',
  'Palm Springs STR Accounting CA provides premium accounting and tax services for vacation rental owners throughout the Coachella Valley, with expertise in California STR taxation and luxury rental income.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Tax Services CA', 'palm-desert-str-tax-services-ca', 'Desert resort rental accounting',
  'Palm Desert STR Tax Services CA offers specialized tax preparation and bookkeeping for vacation rental owners across Palm Desert and the greater Coachella Valley, maximizing available deductions.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Accounting CA', 'napa-valley-str-accounting-ca', 'Wine country vacation rental tax experts',
  'Napa Valley STR Accounting CA provides comprehensive accounting and tax services for wine country vacation rental owners, with expertise in California STR laws and high-value property taxation.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 99
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Tax Advisors CA', 'yountville-str-tax-advisors-ca', 'Upper Napa Valley rental accounting',
  'Yountville STR Tax Advisors CA offers premium tax preparation and financial advisory services for vacation rental owners in the heart of Napa Valley wine country.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Accounting CA', 'san-francisco-str-accounting-ca', 'Bay Area vacation rental CPAs',
  'San Francisco STR Accounting CA provides comprehensive accounting and tax services for SF vacation rental owners, navigating complex city regulations and maximizing deductions under California tax law.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Tax Services CA', 'oakland-str-tax-services-ca', 'East Bay vacation rental accounting',
  'Oakland STR Tax Services CA offers specialized tax preparation and bookkeeping for vacation rental owners across Oakland and the East Bay, with California STR taxation expertise.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 67
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Accounting WA', 'seattle-str-accounting-wa', 'Pacific Northwest vacation rental CPAs',
  'Seattle STR Accounting WA provides comprehensive accounting and tax services for vacation rental owners throughout the greater Seattle area, with Washington State STR tax expertise.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Tax Services', 'bainbridge-island-str-tax-services', 'Puget Sound island rental accounting',
  'Bainbridge Island STR Tax Services offers tax preparation and bookkeeping for vacation rental owners on Bainbridge Island, maximizing deductions while ensuring Washington State compliance.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Accounting TX', 'dallas-str-accounting-tx', 'DFW vacation rental tax specialists',
  'Dallas STR Accounting TX provides comprehensive accounting and tax services for vacation rental owners across the DFW metroplex, with expertise in Texas STR taxation and no-income-tax optimization.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Tax Services', 'plano-tx-str-tax-services', 'North Dallas rental accounting pros',
  'Plano TX STR Tax Services offers specialized tax preparation and bookkeeping for vacation rental owners in Plano and Collin County, maximizing deductions for Texas STR properties.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 63
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Accounting TX', 'houston-str-accounting-tx', 'Bayou City vacation rental CPAs',
  'Houston STR Accounting TX provides comprehensive accounting and tax services for vacation rental owners across Houston, with expertise in Texas property tax, short-term rental income, and entity structuring.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Tax Services', 'woodlands-tx-str-tax-services', 'North Houston rental accounting',
  'Woodlands TX STR Tax Services offers specialized tax preparation and financial planning for vacation rental owners in The Woodlands and north Houston suburbs.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Accounting GA', 'atlanta-str-accounting-ga', 'ATL metro vacation rental tax experts',
  'Atlanta STR Accounting GA provides comprehensive accounting, tax preparation, and financial planning for vacation rental owners across metro Atlanta, with Georgia STR tax expertise.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Tax Services', 'decatur-ga-str-tax-services', 'Intown Atlanta rental accounting',
  'Decatur GA STR Tax Services offers tax preparation and bookkeeping for vacation rental owners in Decatur and intown Atlanta neighborhoods, maximizing deductions and ensuring Georgia STR compliance.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Accounting MA', 'boston-str-accounting-ma', 'Historic Boston vacation rental CPAs',
  'Boston STR Accounting MA provides comprehensive accounting and tax services for vacation rental owners throughout Boston, with expertise in Massachusetts STR regulations and historic property tax benefits.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 114
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Tax Services', 'cambridge-ma-str-tax-services', 'Greater Boston rental accounting pros',
  'Cambridge MA STR Tax Services offers specialized tax preparation and bookkeeping for vacation rental owners in Cambridge and greater Boston, with Massachusetts STR compliance expertise.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Accounting Co', 'dc-str-accounting-co', 'Capital region vacation rental tax experts',
  'DC STR Accounting Co provides comprehensive accounting and tax services for vacation rental owners throughout the Washington DC metro area, with DC, Maryland, and Virginia STR tax expertise.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 119
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Tax Services', 'arlington-va-str-tax-services', 'Northern Virginia rental accounting',
  'Arlington VA STR Tax Services offers specialized tax preparation and financial planning for vacation rental owners in Arlington and Northern Virginia, ensuring multi-state STR compliance.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Accounting PA', 'philadelphia-str-accounting-pa', 'Philly vacation rental CPAs',
  'Philadelphia STR Accounting PA provides comprehensive accounting and tax services for vacation rental owners across the city, navigating Philadelphia STR licensing costs and maximizing Pennsylvania tax deductions.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 103
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Tax Services', 'cherry-hill-nj-str-tax-services', 'South Jersey vacation rental accounting',
  'Cherry Hill NJ STR Tax Services offers tax preparation and bookkeeping for vacation rental owners in Cherry Hill and greater South Jersey, with New Jersey STR tax compliance expertise.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 57
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Accounting FL', 'tampa-str-accounting-fl', 'Tampa Bay vacation rental tax specialists',
  'Tampa STR Accounting FL provides comprehensive accounting and tax services for vacation rental owners across Hillsborough County, with Florida STR tax expertise and proven deduction strategies.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 106
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Tax Services', 'st-petersburg-fl-str-tax-services', 'Pinellas County rental accounting',
  'St Petersburg FL STR Tax Services offers specialized tax preparation and bookkeeping for vacation rental owners in St. Pete and Pinellas County, maximizing all available Florida STR deductions.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Accounting OR', 'portland-str-accounting-or', 'Rose City vacation rental tax experts',
  'Portland STR Accounting OR provides comprehensive accounting and tax services for vacation rental owners in Portland and surrounding areas, with Oregon STR tax expertise and rental income planning.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Tax Services', 'hood-river-or-str-tax-services', 'Columbia Gorge vacation rental accounting',
  'Hood River OR STR Tax Services offers tax preparation and financial consulting for vacation rental owners in the Columbia River Gorge area, with Oregon STR compliance expertise.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 51
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;
