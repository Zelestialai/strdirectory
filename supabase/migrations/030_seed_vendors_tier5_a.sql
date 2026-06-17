-- ============================================================
-- Migration 030 — Tier 5 Vendors A
-- Cleaning & Turnover + Photography & Design
-- 2 vendors × 2 categories × 30 markets = 120 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- CLEANING & TURNOVER
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Cleaning Co', 'clearwater-str-cleaning-co', 'Tampa Bay Gulf Coast vacation rental turnovers',
  'Clearwater STR Cleaning Co provides professional vacation rental turnover services across Clearwater Beach, St. Pete Beach, and the greater Tampa Bay Gulf Coast. We specialize in beachfront condo turnovers, linen service, and same-day scheduling.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater Beach Turnover Pros', 'clearwater-beach-turnover-pros', 'Reliable STR cleaning across Pinellas County',
  'Clearwater Beach Turnover Pros serves vacation rental owners from Clearwater to St. Pete with dependable turnover cleaning. Our teams handle beachfront high-rises, Gulf-view condos, and Intracoastal properties with full linen service and photo-verified checklists.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Cleaning', 'fort-lauderdale-str-cleaning', 'South Florida vacation rental turnover specialists',
  'Fort Lauderdale STR Cleaning provides professional vacation rental turnover services for STR owners across Fort Lauderdale, Pompano Beach, and Hollywood. We specialize in waterway condos, beachfront properties, and fast-turnaround cleaning for South Florida''s active rental market.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broward Beach Turnover Team', 'broward-beach-turnover-team', 'STR cleaning across Broward County',
  'Broward Beach Turnover Team serves vacation rental owners across Fort Lauderdale, Deerfield Beach, and Lauderdale-by-the-Sea. We deliver consistent, guest-ready turnovers with same-day availability and comprehensive linen service.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Cleaning Co', 'nantucket-str-cleaning-co', 'Island vacation rental turnover specialists',
  'Nantucket STR Cleaning Co provides professional vacation rental turnover services for STR owners across Nantucket Island. We understand the island''s premium rental standards and deliver consistently excellent turnovers for grey-shingle cottages, town homes, and oceanfront estates.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island Clean Nantucket', 'island-clean-nantucket', 'Premium STR cleaning for Nantucket vacation rentals',
  'Island Clean Nantucket provides white-glove vacation rental turnover services for discerning STR owners on Nantucket. We specialize in luxury island property cleaning with hotel-quality linens, premium restocking, and photo documentation.',
  c.id, 'Nantucket', 'MA', p.id, true, false, 4.8, 243 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Cleaning Co', 'vineyard-str-cleaning-co', 'Martha''s Vineyard vacation rental turnover experts',
  'Vineyard STR Cleaning Co provides professional vacation rental turnover services for STR owners across Martha''s Vineyard. We serve the entire island — from Edgartown Captain''s houses to Aquinnah cliffside homes — with premium cleaning and reliable same-day turnovers.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 298 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MV Island Turnover Team', 'mv-island-turnover-team', 'STR cleaning across Martha''s Vineyard',
  'MV Island Turnover Team serves vacation rental owners from Vineyard Haven to Oak Bluffs with dependable turnover cleaning. We specialize in the island''s diverse STR inventory — from Oak Bluffs gingerbread cottages to West Tisbury farmhouses.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Cleaning', 'bar-harbor-str-cleaning', 'Acadia gateway vacation rental turnover specialists',
  'Bar Harbor STR Cleaning provides professional vacation rental turnover services for STR owners across Mount Desert Island. We serve Bar Harbor, Southwest Harbor, and Northeast Harbor with reliable summer-season turnovers, linen service, and damage reporting.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mount Desert Turnover Pros', 'mount-desert-turnover-pros', 'STR cleaning across Mount Desert Island',
  'Mount Desert Turnover Pros serves vacation rental owners across Mount Desert Island with dependable turnover cleaning. We handle Bar Harbor in-town properties, Acadia National Park-adjacent cabins, and Southwest Harbor waterfront homes with consistent high standards.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast MS STR Cleaning', 'gulf-coast-ms-str-cleaning', 'Mississippi Gulf Coast vacation rental turnovers',
  'Gulf Coast MS STR Cleaning provides professional vacation rental turnover services for STR owners across Biloxi, Gulfport, and Ocean Springs. We specialize in beachfront condos, casino-adjacent properties, and Gulf island vacation rentals with reliable scheduling.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Biloxi Beach Turnover Team', 'biloxi-beach-turnover-team', 'STR cleaning across the MS Gulf Coast',
  'Biloxi Beach Turnover Team serves vacation rental owners from Bay St. Louis to Pascagoula with dependable turnover cleaning. We handle beach houses, waterfront condos, and Gulf Coast vacation rentals with full linen service and same-day availability.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Cleaning', 'crystal-coast-str-cleaning', 'NC Crystal Coast vacation rental turnover specialists',
  'Crystal Coast STR Cleaning provides professional vacation rental turnover services for STR owners across Emerald Isle, Atlantic Beach, and the Crystal Coast. We specialize in island beach house turnovers, Outer Banks-style properties, and Bogue Banks condos.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bogue Banks Turnover Pros', 'bogue-banks-turnover-pros', 'STR cleaning across NC''s Crystal Coast',
  'Bogue Banks Turnover Pros serves vacation rental owners from Emerald Isle to Atlantic Beach with dependable turnover cleaning. We handle beachfront homes, Intracoastal canal properties, and Crystal Coast cottages with reliable scheduling and linen service.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Cleaning Co', 'newport-str-cleaning-co', 'Rhode Island vacation rental turnover specialists',
  'Newport STR Cleaning Co provides professional vacation rental turnover services for STR owners across Newport and Aquidneck Island. We specialize in historic mansions converted to vacation rentals, Gilded Age properties, and Newport''s diverse STR inventory.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 213 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aquidneck Island Turnover Team', 'aquidneck-island-turnover-team', 'STR cleaning across Newport and Middletown',
  'Aquidneck Island Turnover Team serves vacation rental owners across Newport, Middletown, and Portsmouth with dependable turnover cleaning. We handle Newport''s historic architecture, waterfront condos, and diverse STR properties with premium cleaning standards.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Cleaning', 'port-aransas-str-cleaning', 'Texas island beach town vacation rental turnovers',
  'Port Aransas STR Cleaning provides professional vacation rental turnover services for STR owners on Mustang Island and across Port Aransas. We specialize in beachfront condos, beach house turnovers, and Gulf-front properties with same-day scheduling.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.9, 187 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mustang Island Turnover Pros', 'mustang-island-turnover-pros', 'STR cleaning for Port Aransas and Rockport',
  'Mustang Island Turnover Pros serves vacation rental owners from Port Aransas to Rockport with dependable turnover cleaning. We handle Gulf-front condos, fishing cabin turnovers, and Coastal Bend vacation rentals with full linen service.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Cleaning', 'amelia-island-str-cleaning', 'Florida barrier island vacation rental turnovers',
  'Amelia Island STR Cleaning provides professional vacation rental turnover services for STR owners on Amelia Island. We specialize in Fernandina Beach Victorian homes, oceanfront condos, and plantation-style resort properties with reliable scheduling and linen service.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nassau County Turnover Team', 'nassau-county-turnover-team', 'STR cleaning for Amelia Island vacation rentals',
  'Nassau County Turnover Team serves vacation rental owners across Amelia Island and Nassau County with dependable turnover cleaning. We handle beachfront homes, historic district properties, and resort community vacation rentals with comprehensive cleaning and photo checklists.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Cleaning Co', 'blue-ridge-str-cleaning-co', 'North Georgia mountain vacation rental turnovers',
  'Blue Ridge STR Cleaning Co provides professional vacation rental turnover services for STR owners across Blue Ridge, Ellijay, and the North Georgia mountains. We specialize in cabin turnovers, hot-tub-equipped mountain rentals, and creekside property cleaning.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian STR Turnover Team', 'appalachian-str-turnover-team', 'STR cleaning across North Georgia mountains',
  'Appalachian STR Turnover Team serves vacation rental owners from Blue Ridge to Dahlonega with dependable cabin turnover cleaning. We specialize in the North Georgia mountain cabin market — hot tub cleaning, fireplace ash removal, and comprehensive restocking.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Cleaning Co', 'pocono-str-cleaning-co', 'Pennsylvania mountain vacation rental turnovers',
  'Pocono STR Cleaning Co provides professional vacation rental turnover services for STR owners across the Pocono Mountains. We specialize in lake house turnovers, ski cabin cleaning, and resort community vacation rentals throughout Monroe and Pike Counties.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono Lakes Turnover Pros', 'pocono-lakes-turnover-pros', 'STR cleaning across the Pocono Mountains',
  'Pocono Lakes Turnover Pros serves vacation rental owners from Jim Thorpe to Lake Harmony with dependable turnover cleaning. We handle lakefront properties, ski resort cabins, and Pocono resort community vacation rentals with reliable scheduling.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.7, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Cleaning Co', 'flagstaff-str-cleaning-co', 'Northern Arizona mountain vacation rental turnovers',
  'Flagstaff STR Cleaning Co provides professional vacation rental turnover services for STR owners across Flagstaff and the Sedona corridor. We specialize in ponderosa pine cabin turnovers, Sedona red rock retreat cleaning, and high-altitude mountain property turnovers.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Turnover Pros', 'sedona-str-turnover-pros', 'STR cleaning for Flagstaff and Sedona',
  'Sedona STR Turnover Pros serves vacation rental owners from Flagstaff to Sedona with dependable turnover cleaning. We handle Sedona red rock view properties, Flagstaff mountain cabins, and Verde Valley vacation rentals with thorough cleaning and restocking.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Cleaning Co', 'durango-str-cleaning-co', 'Southwest Colorado vacation rental turnovers',
  'Durango STR Cleaning Co provides professional vacation rental turnover services for STR owners in Durango and the San Juan Mountains. We specialize in ski season cabin turnovers, river adventure cabins near the Animas, and full-service mountain property cleaning.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.9, 176 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Basin Turnover Team', 'san-juan-basin-turnover-team', 'STR cleaning for Durango and Purgatory',
  'San Juan Basin Turnover Team serves vacation rental owners in Durango and the surrounding San Juan Basin with dependable cabin and condo turnover cleaning. We handle Purgatory Resort properties, Animas River cabins, and downtown Durango STR units.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone STR Cleaning Co', 'boone-str-cleaning-co', 'North Carolina High Country vacation rental turnovers',
  'Boone STR Cleaning Co provides professional vacation rental turnover services for STR owners across Boone, Banner Elk, and the NC High Country. We specialize in ski chalet turnovers at Beech Mountain and Sugar Mountain, mountain cabin cleaning, and fall-foliage season scheduling.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 213 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Country Turnover Pros', 'high-country-turnover-pros', 'STR cleaning across the NC High Country',
  'High Country Turnover Pros serves vacation rental owners from Banner Elk to Blowing Rock with dependable turnover cleaning. We handle ski chalet turnovers, Grandfather Mountain-view cabins, and High Country vacation rentals with hot tub service and comprehensive restocking.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Cleaning', 'door-county-str-cleaning', 'Wisconsin peninsula vacation rental turnovers',
  'Door County STR Cleaning provides professional vacation rental turnover services for STR owners across the Door Peninsula. We specialize in lakefront cottage turnovers, Fish Creek vacation rental cleaning, and Door County''s charming village STR properties throughout the summer and fall seasons.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Peninsula Turnover Team WI', 'peninsula-turnover-team-wi', 'STR cleaning across Door County',
  'Peninsula Turnover Team WI serves vacation rental owners from Sturgeon Bay to Sister Bay with dependable turnover cleaning. We handle Green Bay and Lake Michigan waterfront cottages, orchard-adjacent farmhouses, and Door County village vacation rentals.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Cleaning', 'traverse-city-str-cleaning', 'Northern Michigan vacation rental turnovers',
  'Traverse City STR Cleaning provides professional vacation rental turnover services for STR owners across Traverse City and the Leelanau Peninsula. We specialize in Lake Michigan waterfront cottage turnovers, wine country B&B cleaning, and Sleeping Bear Dunes area vacation rentals.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Leelanau Peninsula Turnover', 'leelanau-peninsula-turnover', 'STR cleaning across Traverse City and Leelanau',
  'Leelanau Peninsula Turnover serves vacation rental owners from Traverse City to Leland with dependable turnover cleaning. We handle lakefront cottages, cherry orchard farmhouses, and Glen Arbor vacation rentals near Sleeping Bear Dunes National Lakeshore.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.8, 176 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Cleaning', 'joshua-tree-str-cleaning', 'Mojave Desert vacation rental turnover specialists',
  'Joshua Tree STR Cleaning provides professional vacation rental turnover services for STR owners in Joshua Tree, Twentynine Palms, and Yucca Valley. We specialize in desert-modern cabin turnovers, off-grid property cleaning, and the unique demands of high-design desert retreat STRs.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Turnover Pros', 'high-desert-turnover-pros', 'STR cleaning for Joshua Tree and Yucca Valley',
  'High Desert Turnover Pros serves vacation rental owners across Joshua Tree National Park gateway communities. We handle Airstream turnover cleaning, geodome STRs, and desert compound properties with the specialty skills this unique market demands.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.8, 245 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Cleaning Co', 'palm-springs-str-cleaning-co', 'Desert resort vacation rental turnover specialists',
  'Palm Springs STR Cleaning Co provides professional vacation rental turnover services for STR owners across Palm Springs and the Coachella Valley. We specialize in mid-century modern home turnovers, pool villa cleaning, and same-day scheduling for the high-volume Desert resort market.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 289 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coachella Valley Turnover Team', 'coachella-valley-turnover-team', 'STR cleaning across the Coachella Valley',
  'Coachella Valley Turnover Team serves vacation rental owners from Palm Springs to La Quinta with dependable turnover cleaning. We handle pool homes, gated community condos, and Coachella Valley festival-season rentals with fast turnovers and comprehensive restocking.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.8, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Cleaning', 'napa-valley-str-cleaning', 'Wine country vacation rental turnover specialists',
  'Napa Valley STR Cleaning provides professional vacation rental turnover services for STR owners across Napa, Yountville, and Sonoma County wine country. We specialize in vineyard cottage turnovers, winery estate cleaning, and high-end wine country STR properties.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wine Country Turnover Pros', 'wine-country-turnover-pros', 'STR cleaning across Napa and Sonoma wine country',
  'Wine Country Turnover Pros serves vacation rental owners from Yountville to Healdsburg with dependable turnover cleaning. We handle vineyard estate properties, Napa downtown lofts, and Sonoma wine country vacation rentals with premium cleaning standards.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Cleaning', 'san-francisco-str-cleaning', 'Bay Area vacation rental turnover specialists',
  'San Francisco STR Cleaning provides professional vacation rental turnover services for STR owners across San Francisco and the Bay Area. We specialize in Victorian home turnovers, condo cleaning, and the diverse STR inventory of San Francisco''s neighborhoods from Pacific Heights to the Mission.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bay Area STR Turnover Team', 'bay-area-str-turnover-team', 'STR cleaning across the San Francisco Bay Area',
  'Bay Area STR Turnover Team serves vacation rental owners from San Francisco to Berkeley and Sausalito with dependable turnover cleaning. We handle Victorian flats, Sausalito houseboat cleaning, and diverse Bay Area vacation rental properties with comprehensive service.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.8, 245 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Cleaning Co', 'seattle-str-cleaning-co', 'Pacific Northwest urban vacation rental turnovers',
  'Seattle STR Cleaning Co provides professional vacation rental turnover services for STR owners across Seattle and the greater Puget Sound. We specialize in Capitol Hill loft turnovers, waterfront condo cleaning, and Bainbridge Island ferry-accessible vacation rentals.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 289 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Puget Sound Turnover Pros', 'puget-sound-turnover-pros', 'STR cleaning across Seattle and Puget Sound',
  'Puget Sound Turnover Pros serves vacation rental owners from Seattle to Bainbridge Island with dependable turnover cleaning. We handle waterfront properties, urban condos, and Eastside vacation rentals across King and Kitsap Counties.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Cleaning Co', 'dallas-str-cleaning-co', 'DFW vacation rental turnover specialists',
  'Dallas STR Cleaning Co provides professional vacation rental turnover services for STR owners across the Dallas–Fort Worth metroplex. We specialize in Deep Ellum loft turnovers, Uptown condo cleaning, and suburban vacation rental properties across the DFW Metroplex.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DFW Vacation Rental Cleaners', 'dfw-vacation-rental-cleaners', 'STR cleaning across Dallas-Fort Worth',
  'DFW Vacation Rental Cleaners serves STR owners across the Dallas–Fort Worth metroplex with dependable turnover cleaning. We handle downtown Dallas condos, Grapevine lakefront vacation rentals, and suburban Airbnb properties across Collin and Tarrant Counties.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.7, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Cleaning Co', 'houston-str-cleaning-co', 'Houston vacation rental turnover specialists',
  'Houston STR Cleaning Co provides professional vacation rental turnover services for STR owners across Houston and Harris County. We specialize in Montrose and Heights craftsman home turnovers, Medical Center-adjacent condo cleaning, and diverse Houston STR inventory.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.8, 256 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston Metro Turnover Pros', 'houston-metro-turnover-pros', 'STR cleaning across Greater Houston',
  'Houston Metro Turnover Pros serves vacation rental owners across Greater Houston with dependable turnover cleaning. We handle Heights bungalows, Midtown lofts, and Woodlands suburban vacation rentals with reliable scheduling and comprehensive linen service.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Cleaning Co', 'atlanta-str-cleaning-co', 'Atlanta vacation rental turnover specialists',
  'Atlanta STR Cleaning Co provides professional vacation rental turnover services for STR owners across Atlanta and the metro area. We specialize in Inman Park bungalow turnovers, Buckhead luxury condo cleaning, and Old Fourth Ward vacation rental properties.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 289 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'ATL Metro Turnover Team', 'atl-metro-turnover-team', 'STR cleaning across Greater Atlanta',
  'ATL Metro Turnover Team serves vacation rental owners across Atlanta, Decatur, and Sandy Springs with dependable turnover cleaning. We handle Virginia-Highland Craftsman homes, Midtown high-rise condos, and diverse Atlanta neighborhood vacation rentals.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.8, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Cleaning Co', 'boston-str-cleaning-co', 'Boston vacation rental turnover specialists',
  'Boston STR Cleaning Co provides professional vacation rental turnover services for STR owners across Boston and Greater Boston. We specialize in Back Bay brownstone turnovers, Beacon Hill townhome cleaning, and Cambridge vacation rental properties.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Greater Boston STR Cleaners', 'greater-boston-str-cleaners', 'STR cleaning across Boston and Cambridge',
  'Greater Boston STR Cleaners serves vacation rental owners across Boston, Cambridge, and Somerville with dependable turnover cleaning. We handle historic rowhouses, MIT-area apartments, and diverse Greater Boston vacation rental properties with reliable same-day service.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.8, 245 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Cleaning Co', 'dc-str-cleaning-co', 'Washington DC vacation rental turnover specialists',
  'DC STR Cleaning Co provides professional vacation rental turnover services for STR owners across Washington DC and the DMV. We specialize in Capitol Hill rowhouse turnovers, Georgetown townhome cleaning, and diverse DC neighborhood vacation rental properties.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 289 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DMV Vacation Rental Cleaners', 'dmv-vacation-rental-cleaners', 'STR cleaning across DC, Maryland, and Virginia',
  'DMV Vacation Rental Cleaners serves vacation rental owners across Washington DC, Arlington, and Alexandria with dependable turnover cleaning. We handle DC rowhouses, Northern Virginia condos, and Maryland suburb vacation rentals with reliable scheduling.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Cleaning', 'philadelphia-str-cleaning', 'Philly vacation rental turnover specialists',
  'Philadelphia STR Cleaning provides professional vacation rental turnover services for STR owners across Philadelphia. We specialize in Old City loft turnovers, Society Hill townhome cleaning, and Fishtown and Northern Liberties vacation rental properties.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 267 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philly Neighborhood STR Cleaners', 'philly-neighborhood-str-cleaners', 'STR cleaning across Philadelphia neighborhoods',
  'Philly Neighborhood STR Cleaners serves vacation rental owners across Philadelphia''s diverse neighborhoods with dependable turnover cleaning. We handle Fishtown rowhouses, Rittenhouse Square condos, and diverse Philly vacation rental inventory with same-day availability.',
  c.id, 'Philadelphia', 'PA', p.id, true, false, 4.7, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Cleaning Co', 'tampa-str-cleaning-co', 'Tampa Bay vacation rental turnover specialists',
  'Tampa STR Cleaning Co provides professional vacation rental turnover services for STR owners across Tampa and the Tampa Bay area. We specialize in Ybor City loft turnovers, South Tampa bungalow cleaning, and St. Petersburg vacation rental properties.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.9, 278 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa Bay STR Turnover Team', 'tampa-bay-str-turnover-team', 'STR cleaning across Tampa and St. Pete',
  'Tampa Bay STR Turnover Team serves vacation rental owners across Tampa, St. Petersburg, and the Tampa Bay region with dependable turnover cleaning. We handle downtown condos, Hyde Park historic homes, and St. Pete beach-area vacation rentals.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Cleaning Co', 'portland-str-cleaning-co', 'Portland Oregon vacation rental turnovers',
  'Portland STR Cleaning Co provides professional vacation rental turnover services for STR owners across Portland and the Portland metro. We specialize in Pearl District loft turnovers, Hawthorne bungalow cleaning, and diverse Portland neighborhood vacation rental properties.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.9, 256 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rose City STR Turnover Team', 'rose-city-str-turnover-team', 'STR cleaning across Portland Oregon',
  'Rose City STR Turnover Team serves vacation rental owners across Portland and Hood River with dependable turnover cleaning. We handle Portland bungalows, Alberta Arts District homes, and Columbia Gorge vacation rental properties with reliable scheduling.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- PHOTOGRAPHY & DESIGN
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Clearwater STR Photography', 'clearwater-str-photography', 'Tampa Bay beach vacation rental photography',
  'Clearwater STR Photography provides professional vacation rental photography and design consultation for STR owners across Clearwater Beach and Tampa Bay. We specialize in capturing Gulf sunset views, pool areas, and beachfront condo interiors that drive bookings.',
  c.id, 'Clearwater', 'FL', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pinellas Coast STR Photos', 'pinellas-coast-str-photos', 'STR photography across the Tampa Bay Gulf Coast',
  'Pinellas Coast STR Photos provides vacation rental photography for STR owners across Clearwater, St. Pete Beach, and Treasure Island. We capture the turquoise Gulf waters, beach access, and interior spaces that make Tampa Bay vacation rentals stand out online.',
  c.id, 'Clearwater Beach', 'FL', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Fort Lauderdale STR Photography', 'fort-lauderdale-str-photography', 'South Florida vacation rental photography',
  'Fort Lauderdale STR Photography provides professional vacation rental photography for STR owners across Fort Lauderdale and Broward County. We specialize in waterway and yachting lifestyle photography, beachfront property imagery, and Intracoastal view shots that attract premium renters.',
  c.id, 'Fort Lauderdale', 'FL', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broward STR Photo Studio', 'broward-str-photo-studio', 'STR photography across Fort Lauderdale and Hollywood',
  'Broward STR Photo Studio provides vacation rental photography for STR owners throughout Broward County. We capture Fort Lauderdale''s famous canal lifestyle, beachfront views, and luxury property interiors that drive bookings across Airbnb and VRBO.',
  c.id, 'Pompano Beach', 'FL', p.id, true, false, 4.7, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nantucket STR Photography', 'nantucket-str-photography', 'Island vacation rental photography specialists',
  'Nantucket STR Photography provides premium vacation rental photography for STR owners across Nantucket Island. We capture the island''s iconic grey-shingle architecture, cobblestone street-front cottages, and pristine beach views that justify Nantucket''s premium rental rates.',
  c.id, 'Nantucket', 'MA', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grey Lady STR Photo Studio', 'grey-lady-str-photo-studio', 'Premium STR photography for Nantucket',
  'Grey Lady STR Photo Studio provides luxury vacation rental photography for discerning STR owners on Nantucket. We create aspirational imagery of Nantucket''s unique architectural character, private beach access, and interior spaces that attract high-end weekly renters.',
  c.id, 'Nantucket', 'MA', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vineyard STR Photography', 'vineyard-str-photography', 'Martha''s Vineyard vacation rental photography',
  'Vineyard STR Photography provides professional vacation rental photography for STR owners across Martha''s Vineyard. We capture the island''s diverse architecture — from Edgartown Captain''s houses to Chilmark cliffside estates — with lifestyle imagery that drives premium bookings.',
  c.id, 'Edgartown', 'MA', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'MV STR Photo Studio', 'mv-str-photo-studio', 'STR photography across Martha''s Vineyard',
  'MV STR Photo Studio provides vacation rental photography for STR owners throughout Martha''s Vineyard. We create beautiful imagery of the island''s varied landscapes and architectural styles — from Oak Bluffs gingerbread cottages to West Tisbury farmhouses.',
  c.id, 'Vineyard Haven', 'MA', p.id, true, false, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bar Harbor STR Photography', 'bar-harbor-str-photography', 'Acadia gateway vacation rental photography',
  'Bar Harbor STR Photography provides professional vacation rental photography for STR owners across Mount Desert Island. We specialize in capturing Acadia''s dramatic coastal scenery, Bar Harbor village charm, and diverse STR interiors that inspire bookings year-round.',
  c.id, 'Bar Harbor', 'ME', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Acadia STR Photo Studio', 'acadia-str-photo-studio', 'STR photography for Bar Harbor and MDI',
  'Acadia STR Photo Studio provides vacation rental photography for STR owners on Mount Desert Island. We capture Bar Harbor''s iconic coastal scenery, Acadia National Park proximity, and the island''s diverse vacation rental interiors to drive bookings.',
  c.id, 'Southwest Harbor', 'ME', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast MS STR Photography', 'gulf-coast-ms-str-photography', 'Mississippi Gulf Coast vacation rental photography',
  'Gulf Coast MS STR Photography provides professional vacation rental photography for STR owners across Biloxi, Gulfport, and Ocean Springs. We capture Gulf waterfront views, beachside property exteriors, and STR interiors that attract bookings to the Mississippi Gulf Coast.',
  c.id, 'Biloxi', 'MS', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mississippi STR Photo Studio', 'mississippi-str-photo-studio', 'STR photography for the MS Gulf Coast',
  'Mississippi STR Photo Studio provides vacation rental photography for STR owners across the Mississippi Gulf Coast. We create compelling imagery of beachfront properties, Gulf views, and STR interiors that showcase the coast''s laid-back Southern hospitality.',
  c.id, 'Gulfport', 'MS', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crystal Coast STR Photography', 'crystal-coast-str-photography', 'NC Crystal Coast vacation rental photography',
  'Crystal Coast STR Photography provides professional vacation rental photography for STR owners across Emerald Isle and the Crystal Coast. We capture the NC coast''s crystal-clear waters, undeveloped beach scenery, and vacation rental interiors that drive bookings.',
  c.id, 'Emerald Isle', 'NC', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bogue Banks STR Photo Studio', 'bogue-banks-str-photo-studio', 'STR photography across NC''s Crystal Coast',
  'Bogue Banks STR Photo Studio provides vacation rental photography for STR owners from Emerald Isle to Atlantic Beach. We create stunning imagery of undeveloped Crystal Coast beaches, Cape Lookout views, and STR interiors that showcase this hidden gem of the NC coast.',
  c.id, 'Atlantic Beach', 'NC', p.id, true, false, 4.7, 123 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Newport STR Photography', 'newport-str-photography', 'Rhode Island vacation rental photography specialists',
  'Newport STR Photography provides professional vacation rental photography for STR owners across Newport and Aquidneck Island. We specialize in capturing Gilded Age mansion aesthetics, harbor views, and the atmospheric Newport streetscapes that make vacation rental imagery compelling.',
  c.id, 'Newport', 'RI', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean State STR Photo Studio', 'ocean-state-str-photo-studio', 'STR photography for Newport and Rhode Island',
  'Ocean State STR Photo Studio provides vacation rental photography for STR owners across Newport and coastal Rhode Island. We capture the Gilded Age charm, sailing culture, and Atlantic waterfront views that make Newport vacation rentals stand out.',
  c.id, 'Middletown', 'RI', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Port Aransas STR Photography', 'port-aransas-str-photography', 'Texas island beach town vacation rental photos',
  'Port Aransas STR Photography provides professional vacation rental photography for STR owners on Mustang Island and Port Aransas. We capture Gulf-front views, beachside exteriors, and STR interiors that showcase the laid-back Texas island lifestyle to prospective renters.',
  c.id, 'Port Aransas', 'TX', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Bend STR Photo Studio', 'coastal-bend-str-photo-studio', 'STR photography for Port Aransas and Rockport',
  'Coastal Bend STR Photo Studio provides vacation rental photography for STR owners from Port Aransas to Rockport. We create beautiful imagery of Mustang Island beaches, Copano Bay waterfront properties, and Coastal Bend STR interiors.',
  c.id, 'Rockport', 'TX', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Amelia Island STR Photography', 'amelia-island-str-photography', 'Florida barrier island vacation rental photography',
  'Amelia Island STR Photography provides professional vacation rental photography for STR owners on Amelia Island. We capture Victorian-era Fernandina Beach architecture, Atlantic beachfront views, and plantation resort aesthetics that drive bookings for this unique Florida island.',
  c.id, 'Fernandina Beach', 'FL', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Nassau County STR Photo Studio', 'nassau-county-str-photo-studio', 'STR photography for Amelia Island rentals',
  'Nassau County STR Photo Studio provides vacation rental photography for STR owners across Amelia Island and Nassau County. We create compelling imagery of beachfront estates, Victorian architecture, and STR interiors that showcase Amelia Island''s unique character.',
  c.id, 'Amelia Island', 'FL', p.id, true, false, 4.8, 124 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Photography', 'blue-ridge-str-photography', 'North Georgia mountain vacation rental photos',
  'Blue Ridge STR Photography provides professional vacation rental photography for STR owners across Blue Ridge and the North Georgia mountains. We specialize in mountain cabin photography — capturing fire pit areas, hot tub settings, mountain views, and warm interior spaces that attract renters.',
  c.id, 'Blue Ridge', 'GA', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Georgia Mountains STR Photos', 'georgia-mountains-str-photos', 'STR photography across North Georgia cabins',
  'Georgia Mountains STR Photos provides vacation rental photography for cabin owners across Blue Ridge, Ellijay, and the North Georgia mountains. We create stunning imagery of mountain views, creekside settings, and cozy cabin interiors that consistently drive bookings.',
  c.id, 'Ellijay', 'GA', p.id, true, false, 4.7, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono STR Photography', 'pocono-str-photography', 'Pennsylvania mountain vacation rental photography',
  'Pocono STR Photography provides professional vacation rental photography for STR owners across the Pocono Mountains. We specialize in lakefront property photography, ski chalet imagery, and cozy mountain interior shots that make Pocono vacation rentals stand out online.',
  c.id, 'Mount Pocono', 'PA', p.id, true, true, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pocono Lakes STR Photo Studio', 'pocono-lakes-str-photo-studio', 'STR photography for the Pocono Mountains',
  'Pocono Lakes STR Photo Studio provides vacation rental photography for STR owners across the Pocono Mountains. We create beautiful imagery of lakefront cottages, Delaware Water Gap scenery, and warm mountain interiors that attract bookings year-round.',
  c.id, 'Stroudsburg', 'PA', p.id, true, false, 4.7, 123 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flagstaff STR Photography', 'flagstaff-str-photography', 'Northern Arizona vacation rental photography',
  'Flagstaff STR Photography provides professional vacation rental photography for STR owners across Flagstaff and Sedona. We specialize in ponderosa pine forest cabin photography, Sedona red rock view properties, and high-desert retreat imagery that drives strong bookings.',
  c.id, 'Flagstaff', 'AZ', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Photo Studio', 'red-rock-str-photo-studio', 'STR photography for Flagstaff and Sedona',
  'Red Rock STR Photo Studio provides vacation rental photography for STR owners in Flagstaff and Sedona. We capture Sedona''s world-famous red rock scenery, forest cabin interiors, and the dramatic Arizona mountain landscapes that inspire vacation bookings.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Durango STR Photography', 'durango-str-photography', 'Southwest Colorado vacation rental photography',
  'Durango STR Photography provides professional vacation rental photography for STR owners in Durango and the San Juan Mountains. We capture dramatic mountain scenery, Animas River views, and the cozy mountain town interiors that attract adventure travelers to Durango.',
  c.id, 'Durango', 'CO', p.id, true, true, 4.9, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Basin STR Photos', 'san-juan-basin-str-photos', 'STR photography for Durango and Purgatory',
  'San Juan Basin STR Photos provides vacation rental photography for STR owners in Durango and the surrounding San Juan Basin. We create compelling imagery of mountain scenery, ski resort proximity, and STR interiors that showcase Durango''s outdoor adventure appeal.',
  c.id, 'Bayfield', 'CO', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boone STR Photography', 'boone-str-photography', 'NC High Country vacation rental photography',
  'Boone STR Photography provides professional vacation rental photography for STR owners across Boone, Banner Elk, and the NC High Country. We specialize in ski chalet photography, mountain view captures, and warm cabin interior imagery that drives High Country bookings.',
  c.id, 'Boone', 'NC', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Country STR Photo Studio', 'high-country-str-photo-studio', 'STR photography across the NC High Country',
  'High Country STR Photo Studio provides vacation rental photography for STR owners from Boone to Beech Mountain. We create beautiful imagery of ski resort proximity, Blue Ridge Parkway scenery, and cozy mountain cabin interiors that attract year-round NC High Country bookings.',
  c.id, 'Banner Elk', 'NC', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Door County STR Photography', 'door-county-str-photography', 'Wisconsin peninsula vacation rental photography',
  'Door County STR Photography provides professional vacation rental photography for STR owners across Door County. We capture the peninsula''s orchard scenery, Lake Michigan and Green Bay waterfront views, and charming cottage interiors that inspire bookings to this beloved Wisconsin destination.',
  c.id, 'Fish Creek', 'WI', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Peninsula STR Photo Studio WI', 'peninsula-str-photo-studio-wi', 'STR photography across Door County',
  'Peninsula STR Photo Studio WI provides vacation rental photography for STR owners across Door County''s charming villages. We create stunning imagery of waterfront cottages, cherry orchard settings, and Great Lakes views that drive Door County bookings.',
  c.id, 'Sturgeon Bay', 'WI', p.id, true, false, 4.7, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Traverse City STR Photography', 'traverse-city-str-photography', 'Northern Michigan vacation rental photography',
  'Traverse City STR Photography provides professional vacation rental photography for STR owners across Traverse City and the Leelanau Peninsula. We capture Lake Michigan blue waters, cherry orchard landscapes, and warm cottage interiors that attract bookings to this beloved Michigan destination.',
  c.id, 'Traverse City', 'MI', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Leelanau STR Photo Studio', 'leelanau-str-photo-studio', 'STR photography for Traverse City and Leelanau',
  'Leelanau STR Photo Studio provides vacation rental photography for STR owners across Traverse City and the Leelanau Peninsula. We create beautiful imagery of Sleeping Bear Dunes, wine country vineyards, and lakefront cottage interiors that drive strong Northern Michigan bookings.',
  c.id, 'Glen Arbor', 'MI', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Joshua Tree STR Photography', 'joshua-tree-str-photography', 'Mojave Desert vacation rental photography specialists',
  'Joshua Tree STR Photography provides professional vacation rental photography for STR owners in Joshua Tree and the High Desert. We specialize in capturing the surreal desert landscape, stargazing potential, and the design-forward interiors that define the Joshua Tree STR aesthetic.',
  c.id, 'Joshua Tree', 'CA', p.id, true, true, 4.9, 278 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Photo Studio', 'high-desert-str-photo-studio', 'STR photography for Joshua Tree and Yucca Valley',
  'High Desert STR Photo Studio provides vacation rental photography for STR owners across Joshua Tree, Yucca Valley, and Pioneertown. We create Instagram-worthy imagery of desert modernist interiors, boulder landscapes, and Joshua Tree''s otherworldly scenery.',
  c.id, 'Twentynine Palms', 'CA', p.id, true, false, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palm Springs STR Photography', 'palm-springs-str-photography', 'Desert resort vacation rental photography',
  'Palm Springs STR Photography provides professional vacation rental photography for STR owners across Palm Springs and the Coachella Valley. We specialize in mid-century modern home photography, pool scene captures, and mountain backdrop imagery that define the Palm Springs aesthetic.',
  c.id, 'Palm Springs', 'CA', p.id, true, true, 4.9, 256 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Desert Modern STR Photo Studio', 'desert-modern-str-photo-studio', 'STR photography across the Coachella Valley',
  'Desert Modern STR Photo Studio provides vacation rental photography for STR owners from Palm Springs to La Quinta. We create stunning imagery of pool homes, mountain views, and the distinctive mid-century modern interiors that attract Coachella Valley vacation renters.',
  c.id, 'Palm Desert', 'CA', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Napa Valley STR Photography', 'napa-valley-str-photography', 'Wine country vacation rental photography specialists',
  'Napa Valley STR Photography provides professional vacation rental photography for STR owners across Napa and Sonoma wine country. We capture vineyard views, estate property exteriors, and luxurious interior spaces that justify premium Napa Valley rental rates.',
  c.id, 'Napa', 'CA', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wine Country STR Photo Studio', 'wine-country-str-photo-studio', 'STR photography for Napa and Sonoma wine country',
  'Wine Country STR Photo Studio provides vacation rental photography for STR owners from Yountville to Healdsburg. We create aspirational wine country imagery — vineyard vistas, outdoor entertaining areas, and elegant interiors that attract discerning Napa Valley vacation renters.',
  c.id, 'Yountville', 'CA', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Francisco STR Photography', 'san-francisco-str-photography', 'Bay Area vacation rental photography specialists',
  'San Francisco STR Photography provides professional vacation rental photography for STR owners across San Francisco. We specialize in Victorian architecture, bay view properties, and the diverse neighborhood aesthetics of SF — from Painted Ladies exteriors to sleek SoMa loft interiors.',
  c.id, 'San Francisco', 'CA', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bay Area STR Photo Studio', 'bay-area-str-photo-studio', 'STR photography across the San Francisco Bay Area',
  'Bay Area STR Photo Studio provides vacation rental photography for STR owners across San Francisco, Oakland, and Sausalito. We capture Bay Area views, Victorian and craftsman architecture, and diverse neighborhood aesthetics that attract visitors to this world-class destination.',
  c.id, 'Oakland', 'CA', p.id, true, false, 4.7, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seattle STR Photography Co', 'seattle-str-photography-co', 'Pacific Northwest vacation rental photography',
  'Seattle STR Photography Co provides professional vacation rental photography for STR owners across Seattle and the Puget Sound. We specialize in capturing Seattle''s dramatic mountain and water views, modern condo interiors, and the Pacific Northwest aesthetic that defines the city.',
  c.id, 'Seattle', 'WA', p.id, true, true, 4.9, 245 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Puget Sound STR Photo Studio', 'puget-sound-str-photo-studio', 'STR photography across Seattle and Puget Sound',
  'Puget Sound STR Photo Studio provides vacation rental photography for STR owners from Seattle to Bainbridge Island. We capture Olympic Mountain views, Puget Sound waterfront properties, and Seattle neighborhood aesthetics that inspire bookings to the Pacific Northwest.',
  c.id, 'Bainbridge Island', 'WA', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dallas STR Photography Co', 'dallas-str-photography-co', 'DFW vacation rental photography specialists',
  'Dallas STR Photography Co provides professional vacation rental photography for STR owners across the Dallas–Fort Worth metroplex. We specialize in Dallas modern design aesthetics, Uptown high-rise views, and suburban vacation rental photography that drives DFW bookings.',
  c.id, 'Dallas', 'TX', p.id, true, true, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DFW STR Photo Studio', 'dfw-str-photo-studio', 'STR photography across Dallas-Fort Worth',
  'DFW STR Photo Studio provides vacation rental photography for STR owners across the Dallas–Fort Worth metro. We create compelling imagery of DFW vacation rentals — modern interiors, rooftop views, and suburban family-friendly spaces that attract bookings.',
  c.id, 'Plano', 'TX', p.id, true, false, 4.7, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston STR Photography', 'houston-str-photography', 'Houston vacation rental photography specialists',
  'Houston STR Photography provides professional vacation rental photography for STR owners across Houston. We specialize in capturing Heights craftsman home character, Montrose eclectic interiors, and diverse Houston neighborhood aesthetics that attract Airbnb and VRBO renters.',
  c.id, 'Houston', 'TX', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Houston Metro STR Photo Studio', 'houston-metro-str-photo-studio', 'STR photography across Greater Houston',
  'Houston Metro STR Photo Studio provides vacation rental photography for STR owners across Houston and Greater Harris County. We create compelling imagery of Houston''s diverse neighborhoods — from Midtown modern to Woodlands suburban — that drives vacation rental bookings.',
  c.id, 'The Woodlands', 'TX', p.id, true, false, 4.7, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlanta STR Photography Co', 'atlanta-str-photography-co', 'Atlanta vacation rental photography specialists',
  'Atlanta STR Photography Co provides professional vacation rental photography for STR owners across Atlanta and the metro area. We specialize in capturing the character of Atlanta''s intown neighborhoods — Inman Park bungalows, Buckhead estates, and Midtown high-rises.',
  c.id, 'Atlanta', 'GA', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'ATL STR Photo Studio', 'atl-str-photo-studio', 'STR photography across Greater Atlanta',
  'ATL STR Photo Studio provides vacation rental photography for STR owners across Atlanta, Decatur, and Sandy Springs. We create compelling imagery of Atlanta''s diverse architectural styles and neighborhood character that drives strong vacation rental bookings.',
  c.id, 'Decatur', 'GA', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Boston STR Photography Co', 'boston-str-photography-co', 'Boston vacation rental photography specialists',
  'Boston STR Photography Co provides professional vacation rental photography for STR owners across Boston and Greater Boston. We specialize in capturing Back Bay brownstones, Beacon Hill charm, and Cambridge Harvard Square-area aesthetics that drive bookings to this historic city.',
  c.id, 'Boston', 'MA', p.id, true, true, 4.9, 256 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Greater Boston STR Photo Studio', 'greater-boston-str-photo-studio', 'STR photography across Boston and Cambridge',
  'Greater Boston STR Photo Studio provides vacation rental photography for STR owners across Boston, Cambridge, and Somerville. We create compelling imagery of Boston''s historic architecture, waterfront neighborhoods, and vibrant neighborhoods that inspire vacation bookings.',
  c.id, 'Cambridge', 'MA', p.id, true, false, 4.7, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DC STR Photography Co', 'dc-str-photography-co', 'Washington DC vacation rental photography',
  'DC STR Photography Co provides professional vacation rental photography for STR owners across Washington DC. We specialize in Capitol Hill rowhouse photography, Georgetown cobblestone street aesthetics, and diverse DC neighborhood imagery that attracts visitors to the nation''s capital.',
  c.id, 'Washington', 'DC', p.id, true, true, 4.9, 245 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'DMV STR Photo Studio', 'dmv-str-photo-studio', 'STR photography across DC, Maryland, and Virginia',
  'DMV STR Photo Studio provides vacation rental photography for STR owners across Washington DC, Arlington, and Alexandria. We capture the DMV''s historic architecture, monument views, and diverse neighborhood aesthetics that drive vacation rental bookings.',
  c.id, 'Arlington', 'VA', p.id, true, false, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philadelphia STR Photography', 'philadelphia-str-photography', 'Philly vacation rental photography specialists',
  'Philadelphia STR Photography provides professional vacation rental photography for STR owners across Philadelphia. We specialize in capturing Old City''s cobblestone character, Society Hill historic homes, and Fishtown and Northern Liberties''s eclectic modern aesthetic.',
  c.id, 'Philadelphia', 'PA', p.id, true, true, 4.8, 223 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Philly Neighborhoods STR Photos', 'philly-neighborhoods-str-photos', 'STR photography across Philadelphia neighborhoods',
  'Philly Neighborhoods STR Photos provides vacation rental photography for STR owners across Philadelphia''s diverse neighborhoods. We create compelling imagery of Rittenhouse townhomes, Manayunk row homes, and Fishtown lofts that drive bookings to this historic American city.',
  c.id, 'Philadelphia', 'PA', p.id, true, false, 4.7, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa STR Photography Co', 'tampa-str-photography-co', 'Tampa Bay vacation rental photography specialists',
  'Tampa STR Photography Co provides professional vacation rental photography for STR owners across Tampa and the Tampa Bay area. We capture Ybor City historic character, South Tampa waterfront views, and St. Pete''s vibrant arts district aesthetics that drive bookings.',
  c.id, 'Tampa', 'FL', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tampa Bay STR Photo Studio', 'tampa-bay-str-photo-studio', 'STR photography across Tampa and St. Pete',
  'Tampa Bay STR Photo Studio provides vacation rental photography for STR owners across Tampa, St. Petersburg, and the Tampa Bay region. We create compelling imagery of waterfront properties, downtown views, and the diverse STR interiors that make Tampa Bay a top vacation destination.',
  c.id, 'St. Petersburg', 'FL', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Portland STR Photography Co', 'portland-str-photography-co', 'Portland Oregon vacation rental photography',
  'Portland STR Photography Co provides professional vacation rental photography for STR owners across Portland. We capture Portland''s eclectic neighborhood character — Pearl District lofts, Hawthorne craftsman bungalows, and Alberta Arts District colorful homes — that inspire bookings.',
  c.id, 'Portland', 'OR', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rose City STR Photo Studio', 'rose-city-str-photo-studio', 'STR photography across Portland Oregon',
  'Rose City STR Photo Studio provides vacation rental photography for STR owners across Portland and Hood River. We create beautiful imagery of Portland''s diverse architecture, Columbia Gorge views, and the Pacific Northwest outdoor lifestyle that drives vacation rental bookings.',
  c.id, 'Hood River', 'OR', p.id, true, false, 4.7, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;
