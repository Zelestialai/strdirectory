-- Migration 032: Tier 5 Vendor Seeds C
-- Categories: real-estate, interior-design
-- Markets: all 30 Tier 5 markets (120 vendors total)

-- ============================================================
-- REAL ESTATE & PROPERTY FINDERS — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Realty FL', 'clearwater-str-realty-fl', 'Pinellas Peninsula STR investment experts',
  'Clearwater STR Realty FL helps investors identify and acquire high-yielding vacation rental properties on the Pinellas Peninsula, with in-depth market analytics and closing support.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach Investment Realty', 'clearwater-beach-investment-realty', 'Beach STR acquisition specialists',
  'Clearwater Beach Investment Realty specializes in locating and acquiring vacation rental investment properties along Clearwater Beach, with ROI analysis and STR income projections.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Realty', 'fort-lauderdale-str-realty', 'Broward County vacation rental investments',
  'Fort Lauderdale STR Realty guides investors through the Broward County vacation rental market, identifying properties with strong Airbnb income potential and clear regulatory pathways.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach STR Investment Group', 'pompano-beach-str-investment-group', 'South Florida STR property finders',
  'Pompano Beach STR Investment Group identifies vacation rental investment opportunities in Pompano Beach and surrounding South Florida communities, with detailed income analysis and local market expertise.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket Island STR Realty', 'nantucket-island-str-realty', 'Island vacation rental investments',
  'Nantucket Island STR Realty specializes in vacation rental property acquisitions on Nantucket, navigating the island''s unique real estate market to find high-performing investment properties.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 83
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset Property Advisors MA', 'siasconset-property-advisors-ma', 'East Nantucket STR property experts',
  'Siasconset Property Advisors MA offers buyer representation and investment consulting for those seeking vacation rental properties on the quieter eastern shores of Nantucket.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Property Group', 'vineyard-str-property-group', 'MV vacation rental investment advisors',
  'Vineyard STR Property Group helps buyers identify and acquire high-performing vacation rental properties across Martha''s Vineyard, with deep island market knowledge and rental income analysis.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven Realty STR', 'vineyard-haven-realty-str', 'Martha Vineyard STR property finders',
  'Vineyard Haven Realty STR connects vacation rental investors with high-potential properties across Martha''s Vineyard, providing detailed STR income projections and permit guidance.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Realty ME', 'bar-harbor-str-realty-me', 'Acadia area vacation rental investments',
  'Bar Harbor STR Realty ME helps vacation rental investors find the right Acadia-region properties, with seasonal income projections and guidance on Bar Harbor STR licensing requirements.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI Property Advisors ME', 'mdi-property-advisors-me', 'Mount Desert Island STR investments',
  'MDI Property Advisors ME provides buyer representation and investment consulting for vacation rental properties across Mount Desert Island, with expertise in the island''s real estate market dynamics.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mississippi Coast STR Realty', 'mississippi-coast-str-realty', 'Gulf Coast MS rental investment pros',
  'Mississippi Coast STR Realty identifies vacation rental investment opportunities throughout the Mississippi Gulf Coast, with market analytics and income projections tailored to the local tourism economy.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Property Finders MS', 'gulfport-str-property-finders-ms', 'Harrison County vacation rental investments',
  'Gulfport STR Property Finders MS assists investors in acquiring short-term rental properties along the Mississippi Gulf Coast, with detailed due diligence and local regulatory guidance.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 39
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Realty NC', 'crystal-coast-str-realty-nc', 'Bogue Banks vacation rental investments',
  'Crystal Coast STR Realty NC specializes in helping investors acquire vacation rental properties along the Crystal Coast, with Bogue Banks market expertise and STR income analysis.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach Property Advisors NC', 'atlantic-beach-property-advisors-nc', 'Crystal Coast STR property finders',
  'Atlantic Beach Property Advisors NC provides buyer representation for vacation rental investors along the Crystal Coast, with in-depth market knowledge and seasonal revenue projections.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 52
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Realty RI', 'newport-str-realty-ri', 'Historic Newport vacation rental investments',
  'Newport STR Realty RI helps investors identify and acquire high-yielding vacation rental properties in Newport, with expertise in historic preservation requirements and RI STR regulations.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island STR Property Group', 'aquidneck-island-str-property-group', 'Newport County rental investments',
  'Aquidneck Island STR Property Group provides investment advisory and buyer representation for vacation rental acquisitions across Newport County, Rhode Island.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Realty TX', 'port-aransas-str-realty-tx', 'Mustang Island vacation rental investments',
  'Port Aransas STR Realty TX specializes in STR investment properties on Mustang Island, with detailed market analytics and income projections for Texas coastal vacation rentals.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Property Advisors', 'rockport-tx-str-property-advisors', 'Aransas Bay investment property experts',
  'Rockport TX STR Property Advisors provides buyer representation and investment consulting for vacation rental acquisitions in the Rockport-Fulton area and greater Aransas Bay region.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 56
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Realty FL', 'amelia-island-str-realty-fl', 'Nassau County vacation rental investments',
  'Amelia Island STR Realty FL helps investors find and acquire high-performing vacation rental properties on Amelia Island, with STR income analysis and local permitting guidance.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island Investment Properties', 'amelia-island-investment-properties', 'Island STR property finders',
  'Amelia Island Investment Properties connects buyers with short-term rental investment opportunities on Amelia Island, providing detailed ROI projections and buyer representation.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Realty GA', 'blue-ridge-str-realty-ga', 'North Georgia mountain cabin investments',
  'Blue Ridge STR Realty GA helps investors find high-yielding vacation rental cabins in the North Georgia Highlands, with market analytics, income projections, and local cabin expertise.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay STR Property Group GA', 'ellijay-str-property-group-ga', 'Gilmer County cabin investment advisors',
  'Ellijay STR Property Group GA provides buyer representation and STR investment consulting for mountain cabin properties in Ellijay and surrounding Gilmer County.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Realty PA', 'pocono-str-realty-pa', 'Pocono Mountains rental investment pros',
  'Pocono STR Realty PA assists investors in finding and acquiring vacation rental properties throughout the Pocono Mountains, with Airbnb income projections and closing support.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Property Advisors', 'stroudsburg-str-property-advisors', 'Delaware Water Gap investment properties',
  'Stroudsburg STR Property Advisors provides investment advisory services for vacation rental acquisitions in the greater Stroudsburg area, with data-driven income projections and due diligence.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 62
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Realty AZ', 'flagstaff-str-realty-az', 'Northern Arizona vacation rental investments',
  'Flagstaff STR Realty AZ helps investors identify high-performing vacation rental properties in Flagstaff and northern Arizona, capturing demand from Grand Canyon and ski tourism.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Property Group AZ', 'sedona-str-property-group-az', 'Red rock country investment specialists',
  'Sedona STR Property Group AZ specializes in vacation rental investment properties in the Sedona area, with vortex and red rock views commanding premium STR rates year-round.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 85
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Realty CO', 'durango-str-realty-co', 'Southwest Colorado vacation rental investments',
  'Durango STR Realty CO helps investors acquire high-yielding vacation rental properties in La Plata County, with market expertise spanning ski season, mountain biking, and Durango-Silverton Railroad tourism.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO STR Property Advisors', 'bayfield-co-str-property-advisors', 'Animas Valley investment properties',
  'Bayfield CO STR Property Advisors provides buyer representation for vacation rental acquisitions in the Bayfield and greater Durango corridor, with detailed income projections.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 46
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Realty', 'boone-nc-str-realty', 'High Country NC vacation rental investments',
  'Boone NC STR Realty helps investors find and acquire high-performing vacation rental properties in the Boone/Blowing Rock area, with mountain market analytics and income projections.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 99
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Property Group NC', 'banner-elk-str-property-group-nc', 'Ski country investment property advisors',
  'Banner Elk STR Property Group NC provides investment consulting and buyer representation for vacation rental acquisitions near Sugar and Beech mountains in Avery County.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Realty WI', 'door-county-str-realty-wi', 'Peninsula vacation rental investments',
  'Door County STR Realty WI specializes in identifying and acquiring high-performing vacation rental properties throughout the Door Peninsula, with local market expertise and income projections.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Property Advisors', 'sturgeon-bay-str-property-advisors', 'Door County investment property finders',
  'Sturgeon Bay STR Property Advisors provides buyer representation and investment consulting for vacation rental acquisitions throughout Door County, Wisconsin.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 54
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Realty MI', 'traverse-city-str-realty-mi', 'Northern Michigan vacation rental investments',
  'Traverse City STR Realty MI helps investors find and acquire high-performing vacation rental properties around Grand Traverse Bay, with cherry country market expertise and income projections.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Property Group MI', 'glen-arbor-str-property-group-mi', 'Sleeping Bear Dunes investment properties',
  'Glen Arbor STR Property Group MI provides buyer representation for vacation rental acquisitions near Sleeping Bear Dunes National Lakeshore, with detailed Airbnb income projections.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Realty CA', 'joshua-tree-str-realty-ca', 'High desert vacation rental investments',
  'Joshua Tree STR Realty CA specializes in desert vacation rental investment properties near JTNP, with expertise in the booming JT Airbnb market and land/compound acquisition opportunities.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Property Group', 'twentynine-palms-str-property-group', 'San Bernardino desert STR investments',
  'Twentynine Palms STR Property Group connects investors with affordable desert vacation rental opportunities near Joshua Tree National Park, with strong Airbnb income projections.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 77
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Realty CA', 'palm-springs-str-realty-ca', 'Coachella Valley rental investment specialists',
  'Palm Springs STR Realty CA helps investors acquire luxury pool homes and condos in the Coachella Valley, with deep market analytics and Airbnb income projections for desert vacation rentals.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 121
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Property Advisors', 'palm-desert-str-property-advisors', 'Desert resort investment properties',
  'Palm Desert STR Property Advisors provides investment consulting and buyer representation for vacation rental acquisitions throughout Palm Desert and the greater Coachella Valley.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 84
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Realty CA', 'napa-valley-str-realty-ca', 'Wine country vacation rental investments',
  'Napa Valley STR Realty CA guides investors to premium vacation rental properties in wine country, with market analytics and projected returns from the lucrative wine tourism accommodation market.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 108
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Property Group CA', 'yountville-str-property-group-ca', 'Upper Napa Valley investment specialists',
  'Yountville STR Property Group CA specializes in premium vacation rental investment properties in Yountville and the heart of Napa Valley wine country.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Realty CA', 'san-francisco-str-realty-ca', 'Bay Area vacation rental investments',
  'San Francisco STR Realty CA helps investors navigate the complex SF real estate market to acquire compliant, high-performing vacation rental properties in one of the world''s most visited cities.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 115
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Property Group CA', 'oakland-str-property-group-ca', 'East Bay vacation rental investments',
  'Oakland STR Property Group CA identifies high-yielding vacation rental investment opportunities across Oakland and the East Bay, with competitive pricing relative to San Francisco.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 69
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Realty WA', 'seattle-str-realty-wa', 'Emerald City vacation rental investments',
  'Seattle STR Realty WA guides investors in acquiring high-performing vacation rental properties throughout Seattle and the Puget Sound region, with STR regulatory expertise and income analytics.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 117
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Realty WA', 'bainbridge-island-str-realty-wa', 'Puget Sound island investment properties',
  'Bainbridge Island STR Realty WA connects vacation rental investors with island properties offering Seattle ferry proximity, strong occupancy, and premium nightly rates.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Realty TX', 'dallas-str-realty-tx', 'DFW vacation rental investment experts',
  'Dallas STR Realty TX helps investors identify and acquire high-performing vacation rental properties across the DFW metroplex, with data-driven income projections and local market expertise.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Property Advisors', 'plano-tx-str-property-advisors', 'North Dallas rental investment specialists',
  'Plano TX STR Property Advisors provides investment consulting and buyer representation for vacation rental acquisitions in Plano and across Collin County.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 68
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Realty TX', 'houston-str-realty-tx', 'Bayou City vacation rental investments',
  'Houston STR Realty TX guides investors in acquiring vacation rental properties across Houston, with expertise in medical center, energy corridor, and event-driven demand areas.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 111
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Property Group', 'woodlands-tx-str-property-group', 'North Houston investment properties',
  'Woodlands TX STR Property Group identifies vacation rental investment opportunities in The Woodlands and north Houston suburbs, with income projections and buyer representation.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Realty GA', 'atlanta-str-realty-ga', 'ATL metro vacation rental investments',
  'Atlanta STR Realty GA helps investors find and acquire high-performing vacation rental properties across metro Atlanta, with neighborhood-level analytics and STR income projections.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Property Advisors', 'decatur-ga-str-property-advisors', 'Intown Atlanta investment properties',
  'Decatur GA STR Property Advisors provides buyer representation and STR investment consulting for vacation rental acquisitions in Decatur and surrounding intown Atlanta neighborhoods.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Realty MA', 'boston-str-realty-ma', 'Historic Boston vacation rental investments',
  'Boston STR Realty MA specializes in STR investment acquisitions across Boston, with expertise in navigating complex city regulations and identifying neighborhoods with the strongest rental returns.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 122
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Property Group', 'cambridge-ma-str-property-group', 'Greater Boston rental investment advisors',
  'Cambridge MA STR Property Group helps investors acquire vacation rental properties in Cambridge and greater Boston, with income projections anchored to university and tourism demand.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 83
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Realty Co', 'dc-str-realty-co', 'Capital region vacation rental investments',
  'DC STR Realty Co guides investors in acquiring vacation rental properties throughout the Washington DC metro area, capturing consistent demand from government, tourism, and diplomatic travelers.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 124
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Property Advisors', 'arlington-va-str-property-advisors', 'Northern Virginia investment properties',
  'Arlington VA STR Property Advisors provides investment consulting and buyer representation for vacation rental acquisitions in Arlington and throughout Northern Virginia.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Realty PA', 'philadelphia-str-realty-pa', 'Philly vacation rental investment experts',
  'Philadelphia STR Realty PA helps investors navigate the Philadelphia real estate market to acquire compliant vacation rental properties in top-performing neighborhoods near historic attractions.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Property Group', 'cherry-hill-nj-str-property-group', 'South Jersey investment properties',
  'Cherry Hill NJ STR Property Group identifies vacation rental investment opportunities in Cherry Hill and greater South Jersey, with proximity to Philadelphia attractions driving strong demand.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.6, 64
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Realty FL', 'tampa-str-realty-fl', 'Tampa Bay vacation rental investments',
  'Tampa STR Realty FL helps investors find and acquire high-performing vacation rental properties across Hillsborough County, with income projections and regulatory guidance for Florida STRs.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 113
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Property Group', 'st-petersburg-fl-str-property-group', 'Pinellas County rental investments',
  'St Petersburg FL STR Property Group identifies vacation rental investment opportunities in St. Pete and Pinellas County, capturing arts district and beach proximity demand.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 80
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Realty OR', 'portland-str-realty-or', 'Rose City vacation rental investments',
  'Portland STR Realty OR guides investors in acquiring vacation rental properties in Portland, with STR regulatory expertise and income projections for the Pacific Northwest tourism market.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 105
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Property Advisors', 'hood-river-or-str-property-advisors', 'Columbia Gorge vacation rental investments',
  'Hood River OR STR Property Advisors specializes in vacation rental investment properties in the Columbia River Gorge, with windsports and outdoor adventure tourism driving strong year-round demand.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 57
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- INTERIOR DESIGN & STAGING — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Interior Design FL', 'clearwater-str-interior-design-fl', 'Gulf Coast vacation rental styling',
  'Clearwater STR Interior Design FL creates inviting coastal interiors for vacation rental properties on the Pinellas Peninsula, maximizing guest appeal and review scores with beach-inspired designs.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach Rental Staging', 'clearwater-beach-rental-staging', 'Beach house vacation rental design',
  'Clearwater Beach Rental Staging transforms vacation rental properties with coastal-inspired interiors that photograph beautifully and create memorable guest experiences on Clearwater Beach.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 51
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Design Studio', 'fort-lauderdale-str-design-studio', 'South Florida vacation rental interiors',
  'Fort Lauderdale STR Design Studio creates stylish, guest-optimized interiors for vacation rental properties throughout Broward County, with tropical modern and luxury coastal design specialties.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach Rental Interiors FL', 'pompano-beach-rental-interiors-fl', 'Broward coast STR interior design',
  'Pompano Beach Rental Interiors FL designs vacation rental spaces that stand out on Airbnb and VRBO with curated furniture, coastal color palettes, and professional staging.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Interior Design MA', 'nantucket-str-interior-design-ma', 'Island cottage and estate styling',
  'Nantucket STR Interior Design MA creates timeless, nautical-inspired interiors for island vacation rentals, blending classic New England charm with modern amenities guests expect.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset Rental Staging MA', 'siasconset-rental-staging-ma', 'East Nantucket vacation rental design',
  'Siasconset Rental Staging MA provides interior design and staging services for Nantucket vacation rental cottages, creating authentic island aesthetics that command premium rates.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Interior Design MA', 'vineyard-str-interior-design-ma', 'MV vacation rental styling experts',
  'Vineyard STR Interior Design MA creates stunning interiors for Martha''s Vineyard vacation rentals, blending island character with modern comfort to maximize guest appeal and booking revenue.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven Rental Staging MA', 'vineyard-haven-rental-staging-ma', 'Martha Vineyard STR interior design',
  'Vineyard Haven Rental Staging MA transforms vacation rental spaces across Martha''s Vineyard with curated island-inspired designs that photograph beautifully and elevate guest experience.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Interior Design ME', 'bar-harbor-str-interior-design-me', 'Acadia area vacation rental styling',
  'Bar Harbor STR Interior Design ME creates warm, inviting interiors for vacation rentals near Acadia National Park, blending Maine coastal character with the amenities modern guests expect.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MDI Rental Staging & Design ME', 'mdi-rental-staging-design-me', 'Mount Desert Island STR interiors',
  'MDI Rental Staging & Design ME provides interior design services for vacation rental properties across Mount Desert Island, creating spaces that reflect the natural beauty of the Maine coast.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Design MS', 'gulf-coast-str-design-ms', 'Mississippi coast rental interior styling',
  'Gulf Coast STR Design MS creates appealing vacation rental interiors throughout the Mississippi Gulf Coast, with coastal and Southern hospitality design aesthetics that resonate with guests.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport STR Interior Staging MS', 'gulfport-str-interior-staging-ms', 'Harrison County vacation rental design',
  'Gulfport STR Interior Staging MS provides interior design and staging services for vacation rental properties along the Mississippi Gulf Coast, creating guest-friendly spaces that boost bookings.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 38
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Interior Design', 'crystal-coast-str-interior-design', 'Bogue Banks vacation rental styling',
  'Crystal Coast STR Interior Design creates beautiful, coastal-inspired interiors for vacation rental properties along the Crystal Coast, with designs that maximize guest satisfaction and reviews.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach Rental Design NC', 'atlantic-beach-rental-design-nc', 'Crystal Coast STR interior staging',
  'Atlantic Beach Rental Design NC provides interior design and staging for vacation rental properties along the Crystal Coast, creating photogenic spaces that attract premium bookings.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 53
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Interior Design RI', 'newport-str-interior-design-ri', 'Historic Newport vacation rental styling',
  'Newport STR Interior Design RI creates sophisticated interiors for vacation rental properties throughout Newport County, blending historic New England elegance with modern guest expectations.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island Rental Staging RI', 'aquidneck-island-rental-staging-ri', 'Newport area STR interior design',
  'Aquidneck Island Rental Staging RI provides premium interior design services for vacation rental properties across Newport County, creating spaces that command top nightly rates.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Interior Design TX', 'port-aransas-str-interior-design-tx', 'Mustang Island vacation rental styling',
  'Port Aransas STR Interior Design TX creates fun, vibrant coastal interiors for vacation rental properties on Mustang Island, maximizing curb appeal in listing photos and guest satisfaction.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX Rental Staging Design', 'rockport-tx-rental-staging-design', 'Aransas Bay area STR interior design',
  'Rockport TX Rental Staging Design provides interior design services for vacation rental properties in the Rockport-Fulton area, creating coastal-inspired spaces that guests love.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 52
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Interior Design', 'amelia-island-str-interior-design', 'Nassau County vacation rental styling',
  'Amelia Island STR Interior Design creates beautiful coastal and historic-inspired interiors for vacation rental properties on Amelia Island, boosting guest satisfaction and repeat bookings.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island Rental Staging FL', 'amelia-island-rental-staging-fl', 'Island STR interior design experts',
  'Amelia Island Rental Staging FL provides professional staging and interior design for vacation rental properties on Amelia Island, creating spaces that stand out in listing photos.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Interior Design GA', 'blue-ridge-str-interior-design-ga', 'North Georgia cabin interior styling',
  'Blue Ridge STR Interior Design GA creates warm, rustic-modern interiors for mountain vacation rental cabins throughout the North Georgia Highlands, maximizing listing photo appeal and guest reviews.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay Cabin Staging & Design GA', 'ellijay-cabin-staging-design-ga', 'Gilmer County vacation rental interiors',
  'Ellijay Cabin Staging & Design GA provides interior design and staging for vacation rental cabins in Ellijay and surroundings, with cozy mountain aesthetics that command premium nightly rates.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Interior Design PA', 'pocono-str-interior-design-pa', 'Pocono Mountains rental styling experts',
  'Pocono STR Interior Design PA creates inviting mountain-inspired interiors for vacation rental properties throughout the Pocono region, combining rustic charm with modern amenities guests expect.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg STR Staging Design PA', 'stroudsburg-str-staging-design-pa', 'Delaware Water Gap rental design',
  'Stroudsburg STR Staging Design PA provides interior design services for vacation rental properties in the Stroudsburg area, creating photogenic spaces that drive bookings and great reviews.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 58
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Interior Design AZ', 'flagstaff-str-interior-design-az', 'Northern Arizona rental styling',
  'Flagstaff STR Interior Design AZ creates southwestern and mountain-inspired interiors for vacation rental properties, blending local artistic traditions with modern comfort and guest appeal.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Interior Staging AZ', 'sedona-str-interior-staging-az', 'Red rock country rental design',
  'Sedona STR Interior Staging AZ creates breathtaking interiors that complement the iconic red rock views, with Southwestern artisan designs that make vacation rentals truly memorable.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Interior Design CO', 'durango-str-interior-design-co', 'Southwest Colorado rental styling',
  'Durango STR Interior Design CO creates mountain-western interiors for vacation rental properties in La Plata County, with locally-sourced art and furnishings that reflect Colorado''s character.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO Rental Staging Design', 'bayfield-co-rental-staging-design', 'Animas Valley STR interior design',
  'Bayfield CO Rental Staging Design provides interior design services for vacation rental properties in the Bayfield and Durango corridor, creating warm mountain-style spaces guests adore.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 44
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Interior Design', 'boone-nc-str-interior-design', 'High Country cabin styling experts',
  'Boone NC STR Interior Design creates cozy, mountain-inspired interiors for vacation rental cabins throughout the High Country, with designs that maximize Airbnb listing appeal and guest satisfaction.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Staging Design NC', 'banner-elk-str-staging-design-nc', 'Avery County vacation rental interiors',
  'Banner Elk STR Staging Design NC provides interior design and staging for mountain vacation rental properties near Sugar and Beech mountains, creating inviting spaces that command premium rates.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Interior Design WI', 'door-county-str-interior-design-wi', 'Peninsula vacation rental styling',
  'Door County STR Interior Design WI creates charming, orchard-and-lake-inspired interiors for vacation rental properties throughout the Door Peninsula, maximizing listing appeal and guest reviews.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay STR Staging Design WI', 'sturgeon-bay-str-staging-design-wi', 'Door County rental interior design',
  'Sturgeon Bay STR Staging Design WI provides interior design services for vacation rental properties throughout Door County, creating spaces that reflect the peninsula''s maritime and rural character.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 53
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Interior Design MI', 'traverse-city-str-interior-design-mi', 'Northern Michigan rental styling',
  'Traverse City STR Interior Design MI creates beautiful Great Lakes-inspired interiors for vacation rental properties around Grand Traverse Bay, elevating listings and boosting guest satisfaction.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor STR Staging Design MI', 'glen-arbor-str-staging-design-mi', 'Sleeping Bear Dunes rental design',
  'Glen Arbor STR Staging Design MI provides interior design for vacation rental properties near Sleeping Bear Dunes, creating lake and dune-inspired spaces that guests rave about.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Interior Design CA', 'joshua-tree-str-interior-design-ca', 'Desert modern vacation rental styling',
  'Joshua Tree STR Interior Design CA creates the iconic desert modern aesthetic that makes JT vacation rentals go viral on Instagram, with mineral palettes, natural textures, and stargazing designs.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 118
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms STR Design CA', 'twentynine-palms-str-design-ca', 'High desert vacation rental interiors',
  'Twentynine Palms STR Design CA creates distinctive desert-inspired vacation rental interiors near Joshua Tree National Park, helping hosts stand out in one of the most competitive STR markets.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 81
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Interior Design CA', 'palm-springs-str-interior-design-ca', 'Mid-century modern rental styling',
  'Palm Springs STR Interior Design CA specializes in mid-century modern and desert contemporary interiors for Coachella Valley vacation rentals, creating showstopper listings that command top rates.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 124
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert STR Staging Design CA', 'palm-desert-str-staging-design-ca', 'Desert resort vacation rental design',
  'Palm Desert STR Staging Design CA provides premium interior design for vacation rental properties throughout the Coachella Valley, creating luxurious desert oasis aesthetics guests love.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Interior Design CA', 'napa-valley-str-interior-design-ca', 'Wine country rental styling experts',
  'Napa Valley STR Interior Design CA creates sophisticated wine country interiors for vacation rental properties, blending Californian warmth with European elegance to appeal to premium guests.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 111
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville STR Staging Design CA', 'yountville-str-staging-design-ca', 'Upper Napa Valley rental interiors',
  'Yountville STR Staging Design CA provides premium interior design for wine country vacation rental properties, creating refined spaces that attract luxury travelers to Napa Valley.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Interior Design CA', 'san-francisco-str-interior-design-ca', 'Bay Area vacation rental styling',
  'San Francisco STR Interior Design CA creates stylish urban interiors for SF vacation rentals, celebrating the city''s Victorian architecture and eclectic design culture to maximize guest appeal.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 113
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Interior Staging CA', 'oakland-str-interior-staging-ca', 'East Bay vacation rental design',
  'Oakland STR Interior Staging CA provides interior design for vacation rental properties across Oakland, creating hip, arts-influenced spaces that resonate with the city''s diverse visitor base.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 70
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Interior Design WA', 'seattle-str-interior-design-wa', 'Pacific Northwest rental styling',
  'Seattle STR Interior Design WA creates warm, Pacific Northwest-inspired interiors for vacation rental properties throughout Seattle, with natural materials and cozy hygge aesthetics that guests love.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island STR Design WA', 'bainbridge-island-str-design-wa', 'Puget Sound island rental interiors',
  'Bainbridge Island STR Design WA provides interior design for vacation rental properties on Bainbridge Island, creating nautical and Pacific Northwest-inspired spaces that wow Seattle visitors.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Interior Design TX', 'dallas-str-interior-design-tx', 'DFW vacation rental styling experts',
  'Dallas STR Interior Design TX creates contemporary, luxurious interiors for vacation rental properties across the DFW metroplex, with designs that appeal to business and leisure travelers alike.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 102
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Interior Staging', 'plano-tx-str-interior-staging', 'North Dallas rental design',
  'Plano TX STR Interior Staging provides interior design and staging for vacation rental properties in Plano and Collin County, creating spaces that attract premium corporate and family guests.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 66
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Interior Design TX', 'houston-str-interior-design-tx', 'Bayou City vacation rental styling',
  'Houston STR Interior Design TX creates stylish, guest-optimized interiors for vacation rental properties across Houston, with designs that stand out in listing photos and earn 5-star reviews.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 109
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Interior Staging', 'woodlands-tx-str-interior-staging', 'North Houston rental design',
  'Woodlands TX STR Interior Staging provides interior design services for vacation rental properties in The Woodlands and north Houston, creating inviting spaces that attract repeat bookings.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Interior Design GA', 'atlanta-str-interior-design-ga', 'ATL metro vacation rental styling',
  'Atlanta STR Interior Design GA creates contemporary Southern-influenced interiors for vacation rental properties across metro Atlanta, maximizing listing photos and guest satisfaction scores.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 115
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Interior Staging', 'decatur-ga-str-interior-staging', 'Intown Atlanta rental design',
  'Decatur GA STR Interior Staging provides interior design for vacation rental properties in Decatur and intown Atlanta, celebrating the area''s eclectic character with designs that drive bookings.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Interior Design MA', 'boston-str-interior-design-ma', 'Historic Boston vacation rental styling',
  'Boston STR Interior Design MA creates refined, New England-inspired interiors for vacation rental properties throughout Boston, honoring the city''s heritage while delivering modern guest expectations.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 119
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Interior Staging', 'cambridge-ma-str-interior-staging', 'Greater Boston rental design',
  'Cambridge MA STR Interior Staging provides interior design for vacation rental properties in Cambridge and greater Boston, creating smart, sophisticated spaces that attract academic and cultural travelers.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 81
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Interior Design Co', 'dc-str-interior-design-co', 'Capital region vacation rental styling',
  'DC STR Interior Design Co creates classic yet contemporary interiors for vacation rental properties throughout the Washington DC metro area, appealing to government, tourist, and diplomatic guests.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.8, 107
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Interior Staging', 'arlington-va-str-interior-staging', 'Northern Virginia rental design',
  'Arlington VA STR Interior Staging provides interior design services for vacation rental properties in Arlington and Northern Virginia, creating polished spaces close to DC attractions.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.7, 77
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Interior Design PA', 'philadelphia-str-interior-design-pa', 'Philly vacation rental styling experts',
  'Philadelphia STR Interior Design PA creates historically-inspired yet modern interiors for vacation rental properties across the city, capturing the charm of Philly neighborhoods and driving premium bookings.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 106
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Interior Staging', 'cherry-hill-nj-str-interior-staging', 'South Jersey vacation rental design',
  'Cherry Hill NJ STR Interior Staging provides interior design for vacation rental properties in Cherry Hill and greater South Jersey, creating welcoming spaces for Philadelphia-area visitors.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.5, 62
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Interior Design FL', 'tampa-str-interior-design-fl', 'Tampa Bay vacation rental styling',
  'Tampa STR Interior Design FL creates vibrant, Florida-inspired interiors for vacation rental properties across Hillsborough County, maximizing listing photo appeal and guest experience.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL STR Interior Staging', 'st-petersburg-fl-str-interior-staging', 'Pinellas County rental design',
  'St Petersburg FL STR Interior Staging provides interior design for vacation rental properties in St. Pete and Pinellas County, creating colorful, arts-district-inspired spaces guests adore.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Interior Design OR', 'portland-str-interior-design-or', 'Rose City vacation rental styling',
  'Portland STR Interior Design OR creates distinctive, Pacific Northwest-influenced interiors for vacation rental properties in Portland, celebrating the city''s arts culture and natural surroundings.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR STR Interior Staging', 'hood-river-or-str-interior-staging', 'Columbia Gorge rental design',
  'Hood River OR STR Interior Staging provides interior design for vacation rental properties in the Columbia River Gorge area, creating adventure-inspired spaces that appeal to outdoor travelers.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;
