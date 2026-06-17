-- Migration 031: Tier 5 Vendor Seeds B
-- Categories: maintenance-repairs, property-management
-- Markets: all 30 Tier 5 markets (120 vendors total)

-- ============================================================
-- MAINTENANCE & REPAIRS — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Maintenance', 'clearwater-str-maintenance', 'Gulf Coast rental property repair pros',
  'Clearwater STR Maintenance handles everything from HVAC tune-ups to plumbing fixes for short-term rental owners on the Pinellas Peninsula. Fast response times keep your calendar full.',
  c.id, 'Clearwater', 'FL', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach Property Fix', 'clearwater-beach-property-fix', 'Beach rental repairs done right',
  'Clearwater Beach Property Fix specializes in salt-air corrosion repairs, deck maintenance, and appliance service for vacation rentals along the award-winning Clearwater Beach strip.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale Rental Repairs', 'fort-lauderdale-rental-repairs', 'South Florida STR maintenance experts',
  'Fort Lauderdale Rental Repairs serves Airbnb and VRBO hosts throughout Broward County with licensed plumbers, electricians, and AC technicians available on short notice.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach Fix-It Pros', 'pompano-beach-fix-it-pros', 'Reliable rental maintenance in Pompano',
  'Pompano Beach Fix-It Pros keeps vacation rentals guest-ready with preventive maintenance plans, emergency callouts, and full vendor coordination for STR owners along the coast.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.6, 57
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket Island Maintenance', 'nantucket-island-maintenance', 'Island property care year-round',
  'Nantucket Island Maintenance understands the unique challenges of island property ownership — seasonal weatherization, cedar shake repairs, and caretaking services for off-island STR owners.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 74
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset Property Services', 'siasconset-property-services', 'East end Nantucket rental repairs',
  'Siasconset Property Services provides trusted maintenance and repair work for Nantucket vacation rentals, with specialties in historic cottage restoration and summer-season prep.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Rental Maintenance', 'vineyard-rental-maintenance', 'MV property repair and upkeep',
  'Vineyard Rental Maintenance serves vacation rental owners across Martha''s Vineyard with carpentry, plumbing, electrical, and seasonal property prep services tailored to island life.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven Fix & Repair', 'vineyard-haven-fix-repair', 'Quick-response STR maintenance MV',
  'Vineyard Haven Fix & Repair provides fast-turnaround maintenance between guest stays, emergency repair callouts, and preventive care packages for Martha''s Vineyard rental properties.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.6, 44
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor Property Maintenance', 'bar-harbor-property-maintenance', 'Acadia region rental repairs',
  'Bar Harbor Property Maintenance keeps vacation rentals near Acadia National Park in top shape with seasonal opening/closing services, general repairs, and emergency response.',
  c.id, 'Bar Harbor', 'ME', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southwest Harbor STR Repairs', 'southwest-harbor-str-repairs', 'Quiet side Maine rental maintenance',
  'Southwest Harbor STR Repairs handles property maintenance for vacation rentals on the western side of Mount Desert Island, with expertise in older New England cottage systems.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.5, 38
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Maintenance MS', 'gulf-coast-str-maintenance-ms', 'Mississippi coast rental repair pros',
  'Gulf Coast STR Maintenance MS provides comprehensive repair and maintenance services for vacation rentals throughout the Mississippi Gulf Coast, including post-storm assessment and repair.',
  c.id, 'Biloxi', 'MS', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport Rental Fix Crew', 'gulfport-rental-fix-crew', 'Full-service STR repairs in Gulfport',
  'Gulfport Rental Fix Crew serves vacation rental owners with HVAC, plumbing, electrical, and general handyman services across the Gulfport-Biloxi corridor.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 34
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast Property Repairs', 'crystal-coast-property-repairs', 'Emerald Isle area STR maintenance',
  'Crystal Coast Property Repairs keeps vacation rentals in top condition along the Bogue Banks with fast turnarounds, licensed trades, and seasonal maintenance programs.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach Rental Maintenance', 'atlantic-beach-rental-maintenance', 'Crystal Coast rental repairs',
  'Atlantic Beach Rental Maintenance provides trusted repair work for Crystal Coast vacation properties, specializing in salt-air exterior maintenance, deck repairs, and HVAC service.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 51
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Maintenance RI', 'newport-str-maintenance-ri', 'Historic Newport rental repairs',
  'Newport STR Maintenance RI specializes in maintaining historic vacation rental properties throughout Newport County, with expertise in period-appropriate repairs and modern system upgrades.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 83
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Middletown RI Property Services', 'middletown-ri-property-services', 'Aquidneck Island rental maintenance',
  'Middletown RI Property Services keeps vacation rentals across Aquidneck Island guest-ready with comprehensive maintenance plans and 24/7 emergency repair response.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas Rental Maintenance', 'port-aransas-rental-maintenance', 'Texas coast STR property repairs',
  'Port Aransas Rental Maintenance serves vacation rental owners on Mustang Island with fast-response repairs, hurricane prep, and ongoing maintenance plans for coastal properties.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX STR Repairs', 'rockport-tx-str-repairs', 'Aransas Bay area rental maintenance',
  'Rockport TX STR Repairs provides dependable maintenance and repair services for vacation rentals in the Rockport-Fulton area, with specialties in waterfront property care.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 53
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island Property Maintenance', 'amelia-island-property-maintenance', 'Fernandina Beach STR repair pros',
  'Amelia Island Property Maintenance provides full-service care for vacation rentals on Amelia Island, including plumbing, HVAC, electrical, and exterior upkeep for coastal properties.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island Fix & Maintain', 'amelia-island-fix-maintain', 'Island rental repairs done right',
  'Amelia Island Fix & Maintain keeps Nassau County vacation rentals in perfect condition with scheduled maintenance visits, emergency repairs, and seasonal property checks.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.6, 46
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Mountain Maintenance', 'blue-ridge-mountain-maintenance', 'North Georgia cabin repair experts',
  'Blue Ridge Mountain Maintenance keeps mountain vacation rentals in the North Georgia highlands running smoothly with HVAC service, deck repairs, generator maintenance, and emergency callouts.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay Rental Repair Service', 'ellijay-rental-repair-service', 'Apple country cabin maintenance',
  'Ellijay Rental Repair Service provides reliable handyman and trade services for vacation rental cabins in Gilmer County, keeping properties ready for guests year-round.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Maintenance Co', 'pocono-str-maintenance-co', 'Pocono Mountains rental repair pros',
  'Pocono STR Maintenance Co provides comprehensive repair and maintenance services for vacation rentals throughout the Pocono Mountains, including winterization and spring opening packages.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg Rental Repairs PA', 'stroudsburg-rental-repairs-pa', 'Delaware Water Gap area maintenance',
  'Stroudsburg Rental Repairs PA serves vacation rental owners in the Stroudsburg area with licensed trades, fast response times, and seasonal maintenance programs.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 54
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Maintenance AZ', 'flagstaff-str-maintenance-az', 'High desert cabin repair experts',
  'Flagstaff STR Maintenance AZ keeps mountain vacation rentals near the Grand Canyon and Sedona in top shape with HVAC service, winterization, snow damage repairs, and emergency callouts.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona Rental Maintenance AZ', 'sedona-rental-maintenance-az', 'Red rock country STR repairs',
  'Sedona Rental Maintenance AZ provides trusted repair and upkeep services for vacation rentals in the Sedona area, with specialties in adobe and stucco exterior maintenance.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango Mountain Maintenance', 'durango-mountain-maintenance', 'Southwest Colorado rental repairs',
  'Durango Mountain Maintenance serves vacation rental owners in La Plata County with comprehensive repair services, seasonal maintenance programs, and 24/7 emergency response.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO Property Repairs', 'bayfield-co-property-repairs', 'Animas Valley rental maintenance',
  'Bayfield CO Property Repairs provides reliable maintenance and repair services for vacation rental properties in the Bayfield and Durango corridor of southwest Colorado.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.5, 41
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC Rental Maintenance', 'boone-nc-rental-maintenance', 'High Country NC cabin repairs',
  'Boone NC Rental Maintenance keeps vacation cabins and mountain homes in the High Country in peak condition with plumbing, HVAC, roofing, and general handyman services.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk STR Repairs NC', 'banner-elk-str-repairs-nc', 'Ski country rental maintenance',
  'Banner Elk STR Repairs NC serves vacation rental owners near Sugar and Beech mountains with quick-response repair services and seasonal property care programs.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County Rental Maintenance', 'door-county-rental-maintenance', 'Peninsula property repair experts',
  'Door County Rental Maintenance provides year-round maintenance and repair services for vacation rentals on the Door Peninsula, with specialties in winterization and spring property prep.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay Property Repairs WI', 'sturgeon-bay-property-repairs-wi', 'Door County STR maintenance',
  'Sturgeon Bay Property Repairs WI handles repairs and upkeep for vacation rentals throughout Door County, keeping guest-ready properties running smoothly across all four seasons.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 50
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Maintenance', 'traverse-city-str-maintenance', 'Northern Michigan rental repairs',
  'Traverse City STR Maintenance serves vacation rental owners around Grand Traverse Bay with comprehensive repair services, seasonal maintenance plans, and fast emergency response.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor Property Repairs MI', 'glen-arbor-property-repairs-mi', 'Sleeping Bear Dunes rental maintenance',
  'Glen Arbor Property Repairs MI keeps vacation rental properties near Sleeping Bear Dunes in excellent condition with trusted trades and seasonal maintenance packages.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Maintenance CA', 'joshua-tree-str-maintenance-ca', 'High desert vacation rental repairs',
  'Joshua Tree STR Maintenance CA provides specialized repair and maintenance services for desert vacation rentals, including HVAC service, solar system maintenance, and extreme heat prep.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms Rental Repairs', 'twentynine-palms-rental-repairs', 'San Bernardino desert STR maintenance',
  'Twentynine Palms Rental Repairs handles property upkeep for vacation rentals near Joshua Tree National Park, with expertise in desert climate challenges and remote property care.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Maintenance', 'palm-springs-str-maintenance', 'Desert luxury rental repair pros',
  'Palm Springs STR Maintenance keeps high-end vacation rentals in the Coachella Valley in impeccable condition with pool equipment service, HVAC maintenance, and rapid-response repairs.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert Property Repairs CA', 'palm-desert-property-repairs-ca', 'Coachella Valley rental maintenance',
  'Palm Desert Property Repairs CA serves vacation rental owners throughout the greater Palm Springs area with licensed trades, preventive maintenance programs, and 24/7 emergency service.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Maintenance CA', 'napa-valley-str-maintenance-ca', 'Wine country rental repair experts',
  'Napa Valley STR Maintenance CA provides upscale property maintenance for wine country vacation rentals, with specialties in pool/spa service, landscape irrigation, and smart home systems.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville Property Services CA', 'yountville-property-services-ca', 'Upper Napa Valley rental maintenance',
  'Yountville Property Services CA offers premium maintenance and repair services for vacation rental properties in the heart of Napa Valley, with white-glove attention to every detail.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Maintenance CA', 'san-francisco-str-maintenance-ca', 'Bay Area vacation rental repairs',
  'San Francisco STR Maintenance CA keeps urban vacation rentals in top condition with licensed plumbers, electricians, and HVAC technicians familiar with SF building codes and Victorian homes.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Repairs CA', 'oakland-str-repairs-ca', 'East Bay rental maintenance pros',
  'Oakland STR Repairs CA provides reliable maintenance and repair services for vacation rental properties across Oakland and the East Bay, with fast response times and competitive rates.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 63
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Maintenance WA', 'seattle-str-maintenance-wa', 'Pacific Northwest rental repair pros',
  'Seattle STR Maintenance WA keeps vacation rentals in the Emerald City in peak condition with comprehensive repair services, moisture management expertise, and 24/7 emergency callouts.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 102
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island Property Repairs', 'bainbridge-island-property-repairs', 'Island vacation rental maintenance',
  'Bainbridge Island Property Repairs serves STR owners on Bainbridge with ferry-accessible repair crews, seasonal maintenance packages, and trusted local trades familiar with island properties.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Maintenance TX', 'dallas-str-maintenance-tx', 'DFW vacation rental repair experts',
  'Dallas STR Maintenance TX provides comprehensive repair and maintenance services for vacation rental properties across the DFW metroplex, with licensed trades and fast response times.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX Rental Repairs', 'plano-tx-rental-repairs', 'North Dallas STR maintenance',
  'Plano TX Rental Repairs serves vacation rental owners in Plano and surrounding Collin County with HVAC service, plumbing, electrical, and general maintenance solutions.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 61
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Maintenance TX', 'houston-str-maintenance-tx', 'Bayou City rental repair pros',
  'Houston STR Maintenance TX provides dependable repair and maintenance services for vacation rental properties across Harris County, with specialties in humidity control and storm damage repair.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands STR Repairs TX', 'woodlands-str-repairs-tx', 'North Houston rental maintenance',
  'Woodlands STR Repairs TX keeps vacation rentals in The Woodlands and north Houston in excellent condition with comprehensive maintenance plans and rapid emergency response.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Maintenance GA', 'atlanta-str-maintenance-ga', 'ATL vacation rental repair experts',
  'Atlanta STR Maintenance GA provides full-service repair and maintenance for vacation rental properties across metro Atlanta, with licensed trades and 24/7 emergency availability.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA Rental Repairs', 'decatur-ga-rental-repairs', 'Intown Atlanta STR maintenance',
  'Decatur GA Rental Repairs serves vacation rental owners in Decatur and intown Atlanta neighborhoods with quick-response maintenance and repair services tailored to older homes.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.6, 64
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Maintenance MA', 'boston-str-maintenance-ma', 'Historic Boston rental repairs',
  'Boston STR Maintenance MA provides expert repair and maintenance services for vacation rentals in Boston and surrounding communities, with specialties in historic building systems and renovation.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA Rental Maintenance', 'cambridge-ma-rental-maintenance', 'Greater Boston STR repair pros',
  'Cambridge MA Rental Maintenance keeps vacation rentals in Cambridge and nearby Boston neighborhoods in top condition with licensed trades familiar with multi-family and historic buildings.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 75
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Maintenance Co', 'dc-str-maintenance-co', 'Capital region vacation rental repairs',
  'DC STR Maintenance Co provides comprehensive maintenance and repair services for vacation rentals throughout the Washington DC metro area, with expertise in rowhouses and historic properties.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Repairs', 'arlington-va-str-repairs', 'Northern Virginia rental maintenance',
  'Arlington VA STR Repairs keeps vacation rentals across Arlington and Northern Virginia in excellent condition with licensed contractors, preventive care plans, and emergency repair services.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Maintenance PA', 'philadelphia-str-maintenance-pa', 'Philly vacation rental repair experts',
  'Philadelphia STR Maintenance PA provides trusted repair and maintenance services for vacation rentals across Philadelphia, specializing in rowhome systems, HVAC, and historic plumbing upgrades.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 95
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Repairs', 'cherry-hill-nj-str-repairs', 'South Jersey rental maintenance',
  'Cherry Hill NJ STR Repairs serves vacation rental owners across South Jersey and the greater Philadelphia region with fast-response repairs and comprehensive maintenance programs.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.6, 58
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Maintenance FL', 'tampa-str-maintenance-fl', 'Tampa Bay vacation rental repairs',
  'Tampa STR Maintenance FL provides full-service repair and maintenance for vacation rental properties across Hillsborough County, with licensed trades and hurricane prep services.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg FL Rental Repairs', 'st-petersburg-fl-rental-repairs', 'Pinellas County STR maintenance',
  'St Petersburg FL Rental Repairs serves vacation rental owners across St. Pete and Pinellas County with comprehensive maintenance services, pool care, and rapid emergency response.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Maintenance OR', 'portland-str-maintenance-or', 'Rose City vacation rental repairs',
  'Portland STR Maintenance OR provides dependable repair and maintenance services for vacation rentals in Portland and surrounding areas, with expertise in older homes and wet climate upkeep.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR Rental Maintenance', 'hood-river-or-rental-maintenance', 'Columbia Gorge STR repairs',
  'Hood River OR Rental Maintenance keeps vacation rental properties in the Columbia River Gorge in top condition with reliable trades, wind damage repair expertise, and seasonal care programs.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.6, 53
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- PROPERTY MANAGEMENT — Tier 5 Markets
-- ============================================================

-- Clearwater FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Property Management', 'clearwater-str-property-management', 'Full-service Gulf Coast rental management',
  'Clearwater STR Property Management handles every aspect of vacation rental operations on the Pinellas Peninsula — from dynamic pricing and guest communication to cleaning coordination and owner reporting.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach Rental Managers', 'clearwater-beach-rental-managers', 'Award beach STR management',
  'Clearwater Beach Rental Managers specializes in maximizing revenue for vacation rental owners on one of America''s top-rated beaches, with full management services and owner transparency.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fort Lauderdale FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Management', 'fort-lauderdale-str-management', 'Broward County vacation rental pros',
  'Fort Lauderdale STR Management provides end-to-end vacation rental management across Broward County, optimizing listings on Airbnb, VRBO, and direct booking channels for maximum returns.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pompano Beach Rental Management', 'pompano-beach-rental-management', 'South Florida STR management',
  'Pompano Beach Rental Management offers comprehensive short-term rental management for Pompano Beach and surrounding coastal communities, with 24/7 guest support and transparent owner portals.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Nantucket MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket Vacation Rental Management', 'nantucket-vacation-rental-management', 'Island STR management specialists',
  'Nantucket Vacation Rental Management handles full-service management for island vacation rentals, from seasonal marketing and premium pricing to caretaker coordination for off-island owners.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siasconset Rental Managers MA', 'siasconset-rental-managers-ma', 'East Nantucket STR management',
  'Siasconset Rental Managers MA provides boutique vacation rental management services for the eastern shores of Nantucket, offering personalized owner service and premium guest experiences.',
  c.id, 'Siasconset', 'MA', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Martha's Vineyard MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Martha Vineyard STR Management', 'martha-vineyard-str-management', 'MV full-service rental management',
  'Martha Vineyard STR Management provides comprehensive vacation rental management across the island, maximizing seasonal revenue while giving off-island owners complete peace of mind.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard Haven Rental Managers', 'vineyard-haven-rental-managers', 'Oak Bluffs to Vineyard Haven management',
  'Vineyard Haven Rental Managers offers full-service STR management for Martha''s Vineyard vacation properties, with deep local expertise and relationships with island service providers.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Bar Harbor ME
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Management ME', 'bar-harbor-str-management-me', 'Acadia area vacation rental management',
  'Bar Harbor STR Management ME provides full-service management for vacation rental properties near Acadia National Park, with seasonal pricing optimization and year-round caretaking.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southwest Harbor Rental Management', 'southwest-harbor-rental-management', 'Western MDI STR management',
  'Southwest Harbor Rental Management provides personalized vacation rental management for properties on the quieter western side of Mount Desert Island, with attentive owner communication.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Mississippi Gulf Coast MS
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mississippi Coast STR Management', 'mississippi-coast-str-management', 'Gulf Coast MS rental management',
  'Mississippi Coast STR Management handles full-service vacation rental management throughout the Mississippi Gulf Coast, with revenue optimization and comprehensive guest support services.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulfport Vacation Rental Managers', 'gulfport-vacation-rental-managers', 'Harrison County STR management',
  'Gulfport Vacation Rental Managers provides end-to-end STR management for vacation properties along the Mississippi Gulf Coast, including listing optimization and local guest services.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.5, 41
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Crystal Coast NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast Rental Management NC', 'crystal-coast-rental-management-nc', 'Bogue Banks STR management pros',
  'Crystal Coast Rental Management NC provides full-service vacation rental management along the Crystal Coast, with local expertise, revenue optimization, and seamless owner communications.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Beach STR Managers NC', 'atlantic-beach-str-managers-nc', 'Crystal Coast vacation rental management',
  'Atlantic Beach STR Managers NC offers comprehensive vacation rental management for Crystal Coast properties, with dynamic pricing tools and local team support for guest services.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.6, 56
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Newport RI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Management RI', 'newport-str-management-ri', 'Ocean State vacation rental managers',
  'Newport STR Management RI provides premium vacation rental management for properties in Newport and throughout Aquidneck Island, maximizing revenue during the busy summer sailing season.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island Rental Managers', 'aquidneck-island-rental-managers', 'Newport area full STR management',
  'Aquidneck Island Rental Managers offers end-to-end vacation rental management for properties across Newport County, with local knowledge and a proven track record of maximizing owner returns.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Port Aransas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Management TX', 'port-aransas-str-management-tx', 'Texas coast vacation rental managers',
  'Port Aransas STR Management TX provides full-service management for vacation rental properties on Mustang Island, with revenue optimization, guest support, and storm preparedness planning.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rockport TX Rental Management', 'rockport-tx-rental-management', 'Aransas Bay area STR management',
  'Rockport TX Rental Management handles all aspects of vacation rental operations for coastal properties in the Rockport-Fulton area, from guest screening to maintenance coordination.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.6, 54
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Amelia Island FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Management', 'amelia-island-str-management', 'Fernandina Beach rental managers',
  'Amelia Island STR Management provides comprehensive vacation rental management for properties on Amelia Island, with full-service operations, revenue optimization, and dedicated owner reporting.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nassau County FL Rental Managers', 'nassau-county-fl-rental-managers', 'Amelia Island full-service management',
  'Nassau County FL Rental Managers offers end-to-end STR management for vacation rental properties on Amelia Island and throughout Nassau County, maximizing occupancy year-round.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Blue Ridge GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Management GA', 'blue-ridge-str-management-ga', 'North Georgia cabin management',
  'Blue Ridge STR Management GA provides full-service vacation rental management for mountain cabins and chalets throughout the North Georgia Highlands, with dynamic pricing and concierge guest services.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ellijay Rental Management GA', 'ellijay-rental-management-ga', 'Gilmer County cabin management',
  'Ellijay Rental Management GA handles end-to-end management for vacation cabin rentals in Ellijay and the surrounding apple country, with local knowledge and strong owner communication.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Poconos PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Management PA', 'pocono-str-management-pa', 'Pocono Mountains rental management',
  'Pocono STR Management PA provides comprehensive vacation rental management for properties throughout the Pocono region, with full-service operations from listing creation to owner distribution.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stroudsburg Vacation Rental Managers', 'stroudsburg-vacation-rental-managers', 'Delaware Water Gap STR management',
  'Stroudsburg Vacation Rental Managers offers full-service management for vacation rental properties in the greater Stroudsburg area, with revenue optimization and 24/7 guest support.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.6, 59
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Flagstaff AZ
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Management AZ', 'flagstaff-str-management-az', 'Northern Arizona vacation rental managers',
  'Flagstaff STR Management AZ handles all aspects of vacation rental management in Flagstaff and surrounding northern Arizona, with expertise in ski season and Grand Canyon visitor demand.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona Vacation Rental Management', 'sedona-vacation-rental-management', 'Red rock country STR managers',
  'Sedona Vacation Rental Management provides premium management services for vacation rentals in and around Sedona, capturing the strong demand from wellness and adventure travelers year-round.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Durango CO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Management CO', 'durango-str-management-co', 'Southwest Colorado vacation rental pros',
  'Durango STR Management CO provides full-service vacation rental management throughout La Plata County, maximizing returns from skiing, mountain biking, and scenic railroad tourism.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.8, 75
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayfield CO Rental Managers', 'bayfield-co-rental-managers', 'Animas Valley STR management',
  'Bayfield CO Rental Managers offers vacation rental management for properties in the Bayfield and greater Durango corridor, with transparent owner reporting and strong occupancy results.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.6, 48
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boone NC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone NC STR Management', 'boone-nc-str-management', 'High Country cabin management pros',
  'Boone NC STR Management provides comprehensive vacation rental management for mountain properties throughout the Boone/Blowing Rock area, capturing strong year-round tourism demand.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Banner Elk Rental Management NC', 'banner-elk-rental-management-nc', 'Sugar Mountain area STR management',
  'Banner Elk Rental Management NC handles full-service management for ski and mountain vacation rentals near Sugar and Beech mountains, with seasonal pricing expertise and guest concierge.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Door County WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Management WI', 'door-county-str-management-wi', 'Peninsula vacation rental managers',
  'Door County STR Management WI provides end-to-end management for vacation rental properties throughout the Door Peninsula, optimizing for summer peak season and growing shoulder season demand.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sturgeon Bay Rental Management WI', 'sturgeon-bay-rental-management-wi', 'Door County full-service STR management',
  'Sturgeon Bay Rental Management WI offers comprehensive vacation rental management for Door County properties, with local expertise and transparent owner portals for remote owners.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.6, 55
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Traverse City MI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Management MI', 'traverse-city-str-management-mi', 'Northern Michigan vacation rental pros',
  'Traverse City STR Management MI provides full-service management for vacation rentals around Grand Traverse Bay, maximizing revenue from cherry blossom season through fall color weekends.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glen Arbor Rental Management MI', 'glen-arbor-rental-management-mi', 'Sleeping Bear Dunes STR management',
  'Glen Arbor Rental Management MI offers boutique vacation rental management for properties near Sleeping Bear Dunes National Lakeshore, with personalized owner service and strong occupancy.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Joshua Tree CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Management CA', 'joshua-tree-str-management-ca', 'High desert vacation rental managers',
  'Joshua Tree STR Management CA provides expert management for desert vacation rental properties near JTNP, with specialties in luxury dome and glamping property operations.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Twentynine Palms Rental Management', 'twentynine-palms-rental-management', 'San Bernardino desert STR management',
  'Twentynine Palms Rental Management handles vacation rental operations for properties near Joshua Tree National Park, maximizing the strong Airbnb demand from LA and OC travelers.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Palm Springs CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Management CA', 'palm-springs-str-management-ca', 'Coachella Valley luxury rental managers',
  'Palm Springs STR Management CA specializes in managing luxury vacation rentals throughout the Coachella Valley, with expertise in pool-home operations, festival season pricing, and VIP guest services.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 118
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Desert Rental Management CA', 'palm-desert-rental-management-ca', 'Desert resort rental managers',
  'Palm Desert Rental Management CA provides comprehensive STR management for vacation properties across Palm Desert and the greater Coachella Valley, with proven revenue optimization strategies.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Napa Valley CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Management CA', 'napa-valley-str-management-ca', 'Wine country rental management pros',
  'Napa Valley STR Management CA provides upscale vacation rental management for wine country properties, capturing premium rates from culinary and wine tourism throughout the year.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yountville Rental Managers CA', 'yountville-rental-managers-ca', 'Upper valley wine country management',
  'Yountville Rental Managers CA offers premium STR management for vacation properties in the heart of Napa Valley, with white-glove guest services and targeted marketing to luxury travelers.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- San Francisco CA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Management CA', 'san-francisco-str-management-ca', 'Bay Area urban vacation rental managers',
  'San Francisco STR Management CA navigates the complex SF STR regulatory landscape to manage compliant, high-performing vacation rentals for hosts throughout the city.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oakland STR Management CA', 'oakland-str-management-ca', 'East Bay vacation rental management',
  'Oakland STR Management CA provides full-service vacation rental management for properties across Oakland and the East Bay, with expertise in neighborhood regulations and dynamic pricing.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.6, 71
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Seattle WA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Management WA', 'seattle-str-management-wa', 'Emerald City vacation rental managers',
  'Seattle STR Management WA provides comprehensive vacation rental management across Seattle and the greater Puget Sound, handling everything from STR licensing compliance to guest concierge.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 115
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bainbridge Island Rental Management', 'bainbridge-island-rental-management', 'Puget Sound island STR managers',
  'Bainbridge Island Rental Management offers full-service vacation rental management for island properties, serving off-island owners and optimizing revenue from Seattle proximity.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Dallas TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Management TX', 'dallas-str-management-tx', 'DFW vacation rental management pros',
  'Dallas STR Management TX provides end-to-end vacation rental management across the DFW metroplex, with revenue optimization, 24/7 guest support, and full regulatory compliance services.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Plano TX STR Management', 'plano-tx-str-management', 'North Dallas rental management',
  'Plano TX STR Management handles vacation rental operations for properties in Plano and Collin County, with strong performance on Airbnb and VRBO and transparent owner reporting.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.6, 67
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Houston TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Management TX', 'houston-str-management-tx', 'Bayou City vacation rental managers',
  'Houston STR Management TX provides comprehensive vacation rental management across Harris County, capitalizing on strong medical center, energy sector, and event-driven demand throughout the year.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Woodlands TX STR Management', 'woodlands-tx-str-management', 'North Houston rental management',
  'Woodlands TX STR Management provides full-service vacation rental management for properties in The Woodlands and north Houston suburbs, with transparent owner portals and strong occupancy.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Atlanta GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Management GA', 'atlanta-str-management-ga', 'ATL metro vacation rental managers',
  'Atlanta STR Management GA provides end-to-end vacation rental management across metro Atlanta, with expertise in the city''s diverse neighborhoods and strong convention and events demand calendar.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 114
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Decatur GA STR Management', 'decatur-ga-str-management', 'Intown Atlanta rental managers',
  'Decatur GA STR Management handles vacation rental operations for properties in Decatur and surrounding intown Atlanta neighborhoods, with neighborhood expertise and strong occupancy rates.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Boston MA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Management MA', 'boston-str-management-ma', 'Historic Boston vacation rental managers',
  'Boston STR Management MA navigates complex Boston STR regulations to manage compliant, high-performing vacation rentals throughout the city, capturing strong university and tourism demand.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 119
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cambridge MA STR Management', 'cambridge-ma-str-management', 'Greater Boston rental management',
  'Cambridge MA STR Management provides full-service vacation rental management for properties in Cambridge and surrounding Boston communities, specializing in university and conference-driven demand.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 82
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Washington DC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Management Co', 'dc-str-management-co', 'Capital region vacation rental managers',
  'DC STR Management Co provides expert vacation rental management for properties in Washington DC and surrounding suburbs, capturing strong government, tourism, and diplomatic traveler demand.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 122
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Arlington VA STR Management', 'arlington-va-str-management', 'Northern Virginia rental managers',
  'Arlington VA STR Management handles full-service vacation rental management for properties in Arlington and throughout Northern Virginia, with strong DC visitor demand and Metro proximity marketing.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Philadelphia PA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Management PA', 'philadelphia-str-management-pa', 'Philly vacation rental managers',
  'Philadelphia STR Management PA provides comprehensive vacation rental management across the City of Brotherly Love, navigating local STR regulations and capturing strong historical and events tourism.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 105
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cherry Hill NJ STR Management', 'cherry-hill-nj-str-management', 'South Jersey rental management',
  'Cherry Hill NJ STR Management offers end-to-end vacation rental management for properties in Cherry Hill and greater South Jersey, capturing overflow demand from Philadelphia visitors.',
  c.id, 'Cherry Hill', 'NJ', p.id, true, false, 4.6, 63
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tampa FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Management FL', 'tampa-str-management-fl', 'Tampa Bay vacation rental managers',
  'Tampa STR Management FL provides full-service vacation rental management throughout Hillsborough County, with strong Busch Gardens, sports events, and beach proximity demand optimization.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.8, 111
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Petersburg STR Management FL', 'st-petersburg-str-management-fl', 'Pinellas County rental managers',
  'St Petersburg STR Management FL handles vacation rental operations for properties throughout St. Pete and Pinellas County, with arts district expertise and strong seasonal occupancy.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Portland OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Management OR', 'portland-str-management-or', 'Rose City vacation rental managers',
  'Portland STR Management OR provides end-to-end management for vacation rentals in Portland and the greater metro area, navigating local STR licensing and maximizing revenue from year-round Pacific Northwest tourism.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.8, 103
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hood River OR Rental Management', 'hood-river-or-rental-management', 'Columbia Gorge STR managers',
  'Hood River OR Rental Management handles vacation rental operations for properties in the Columbia River Gorge, capturing strong windsports, skiing, and outdoor adventure visitor demand.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;
