-- Migration 036: Tier 6 vendor seeds — cleaning-turnover + photography-design
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: cleaning-turnover
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui Vacation Cleaners', 'maui-vacation-cleaners', 'Expert STR turnover across the Valley Isle',
  'Maui Vacation Cleaners handles same-day turnovers for condos, cottages, and oceanfront estates throughout West and South Maui. Hotel-quality presentation keeps your listings at 5 stars.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.9, 118
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Clean Team', 'kihei-clean-team', 'South Maui STR cleaning specialists',
  'Kihei Clean Team serves short-term rental owners from Kihei to Wailea with fast, thorough turnovers. Linen service, restocking, and damage documentation included.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aloha STR Cleaners', 'aloha-str-cleaners', 'Oahu vacation rental turnover pros',
  'Aloha STR Cleaners serves Honolulu and the North Shore with reliable same-day turnovers. Hotel-trained staff, eco-friendly products, and real-time status updates.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 107
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua Sparkle Services', 'kailua-sparkle-services', 'Windward Oahu STR cleaning experts',
  'Kailua Sparkle Services specializes in beachfront and suburban short-term rental turnovers across the Windward side. Same-day availability, linen management, and guest-ready restocking.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 82
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Garden Isle Turnover Co', 'garden-isle-turnover-co', 'Kauai STR cleaning from north to south',
  'Garden Isle Turnover Co covers Princeville, Hanalei, and the South Shore with meticulous turnover service. Oceanfront villa expertise and reliable same-day scheduling.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 99
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu Property Clean', 'poipu-property-clean', 'South Shore Kauai rental turnover',
  'Poipu Property Clean handles vacation rental turnovers across Poipu and Koloa with attention to detail that earns 5-star reviews. Resort-quality cleaning every time.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kona STR Cleaning Crew', 'kona-str-cleaning-crew', 'West Hawaii vacation rental turnover',
  'Kona STR Cleaning Crew covers oceanfront condos and coffee-country cottages across the Kona Coast. Quick turnovers, linen service, and restocking keep your ratings high.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.7, 88
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo Rental Refresh', 'hilo-rental-refresh', 'East Hawaii STR cleaning specialists',
  'Hilo Rental Refresh serves the Hilo and Puna districts with dependable vacation rental turnovers. Rainforest retreat and volcano-view property specialists.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.6, 61
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Rentals Cleaning', 'red-rock-rentals-cleaning', 'Moab STR turnover in canyon country',
  'Red Rock Rentals Cleaning specializes in vacation rental turnovers for Moab''s busy outdoor adventure market. Desert dust management, linen service, and same-day scheduling.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Castle Valley Clean Co', 'castle-valley-clean-co', 'Remote Moab area rental turnover',
  'Castle Valley Clean Co handles turnovers for remote glamping sites, canyon cabins, and off-grid rentals near Moab. Reliable service where others won''t go.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Cleaners', 'santa-fe-str-cleaners', 'Adobe home and casita turnover pros',
  'Santa Fe STR Cleaners specializes in adobe homes, casitas, and luxury vacation rentals throughout the City Different. Careful handling of artisan furnishings and tile work.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Turnover NM', 'high-desert-turnover-nm', 'Northern New Mexico rental cleaning',
  'High Desert Turnover NM covers Santa Fe and surrounding communities including Tesuque and Pojoaque. Eco-friendly products and bilingual staff for your rental property.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Vacation Clean', 'taos-vacation-clean', 'Ski and art town STR turnover',
  'Taos Vacation Clean handles turnovers for ski chalets, pueblo-style casitas, and mountain retreats throughout the Taos area. Year-round availability for this popular destination.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'El Prado STR Services', 'el-prado-str-services', 'Taos area vacation rental cleaning',
  'El Prado STR Services covers Taos and El Prado with dependable turnover cleaning and linen management. Mountain property specialists with ski-season surge capacity.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.6, 52
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Cleaning Co', 'stowe-str-cleaning-co', 'Vermont ski chalet turnover experts',
  'Stowe STR Cleaning Co serves ski chalets, farmhouse rentals, and luxury lodges throughout the Stowe area. Deep cleans between ski-season guests and foliage-season transitions.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain Turnover VT', 'green-mountain-turnover-vt', 'Lamoille Valley STR cleaning',
  'Green Mountain Turnover VT covers Stowe and Morrisville with reliable vacation rental turnovers. Cozy Vermont cabin specialists with linen and restocking packages.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills Clean Collective', 'catskills-clean-collective', 'Upstate NY STR turnover experts',
  'Catskills Clean Collective handles turnovers for A-frame cabins, farmhouses, and creative retreats throughout Ulster and Sullivan Counties. NYC-weekend crowd specialists.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 111
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia Rental Refresh', 'phoenicia-rental-refresh', 'Southern Catskills vacation cleaning',
  'Phoenicia Rental Refresh covers the Esopus Valley corridor from Phoenicia to Woodstock. A-frame and modern cabin specialists with fast turnovers between weekend guests.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 84
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Cleaning', 'finger-lakes-str-cleaning', 'Wine country vacation rental turnover',
  'Finger Lakes STR Cleaning serves lakefront cottages, winery guest houses, and waterfront rentals across Seneca, Cayuga, and Keuka Lakes. Wine country property specialists.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Watkins Glen Rental Clean', 'watkins-glen-rental-clean', 'Southern Finger Lakes STR turnover',
  'Watkins Glen Rental Clean covers Schuyler County and the southern lakes region. Gorge-view cabin and lakefront cottage turnovers with same-day availability in peak season.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley Clean Team', 'hudson-valley-clean-team', 'Historic river valley STR cleaning',
  'Hudson Valley Clean Team handles turnovers for historic farmhouses, converted barns, and modern retreats from Kingston to Hudson. NYC weekend getaway specialists.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 108
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rhinebeck Rental Turnover', 'rhinebeck-rental-turnover', 'Dutchess County STR cleaning pros',
  'Rhinebeck Rental Turnover serves Dutchess County vacation rentals from Rhinebeck to Millbrook. Estate home and charming cottage specialists with reliable same-day scheduling.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Beavers Bend STR Clean', 'beavers-bend-str-clean', 'Broken Bow cabin turnover specialists',
  'Beavers Bend STR Clean handles turnovers for the booming Broken Bow cabin market. Log cabin deep cleans, hot tub prep, and fire pit restocking between each guest.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 127
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Clean Crew', 'hochatown-clean-crew', 'McCurtain County vacation cabin cleaning',
  'Hochatown Clean Crew covers Hochatown and surrounding areas with fast, thorough cabin turnovers. Hot tub sanitization, outdoor living area cleanup, and same-day service.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake Rental Clean', 'ozarks-lake-rental-clean', 'Missouri lake house STR turnover',
  'Ozarks Lake Rental Clean handles turnovers for lake houses, condo rentals, and waterfront cabins across Lake of the Ozarks. Boat dock cleanup and water toy restocking available.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark Turnover Team', 'lake-ozark-turnover-team', 'Lake Ozark area STR cleaning',
  'Lake Ozark Turnover Team serves the Lake Ozark corridor with reliable vacation rental cleaning. Waterfront property specialists with party-aftermath recovery service.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Clean', 'smoky-mountain-str-clean', 'Pigeon Forge and Gatlinburg cabin turnover',
  'Smoky Mountain STR Clean covers the entire Pigeon Forge and Gatlinburg corridor with expert cabin turnovers. Hot tub prep, game room reset, and mountain-view deck cleaning.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 134
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gatlinburg Rental Refresh', 'gatlinburg-rental-refresh', 'Sevier County vacation cabin cleaning',
  'Gatlinburg Rental Refresh handles same-day turnovers for cabins from Gatlinburg to Wears Valley. Linen service, restocking, and hot tub chemical management included.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 112
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Cleaners', 'sarasota-str-cleaners', 'Gulf Coast vacation rental turnover',
  'Sarasota STR Cleaners covers Siesta Key, Longboat Key, and downtown Sarasota with meticulous turnover service. White-glove cleaning for luxury beachfront properties.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.9, 121
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key Clean Team', 'siesta-key-clean-team', 'Siesta Key STR turnover specialists',
  'Siesta Key Clean Team specializes in beachfront condo and home turnovers on Siesta and Lido Keys. Sand management, linen service, and pool deck cleaning between each guest.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ancient City STR Clean', 'ancient-city-str-clean', 'St. Augustine vacation rental turnover',
  'Ancient City STR Clean handles turnovers for historic homes, beach cottages, and vacation rentals throughout St. Augustine and St. Johns County. Delicate old-home specialists.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra Rental Clean', 'ponte-vedra-rental-clean', 'Northeast Florida STR cleaning',
  'Ponte Vedra Rental Clean covers beach rentals from Ponte Vedra to Vilano Beach. Oceanfront and Intracoastal property turnovers with linen management and restocking.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola Beach STR Clean', 'pensacola-beach-str-clean', 'Emerald Coast vacation rental turnover',
  'Pensacola Beach STR Clean covers Pensacola Beach, Gulf Breeze, and Perdido Key with expert vacation rental turnovers. White sand beach property specialists.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola Rental Refresh', 'pensacola-rental-refresh', 'Northwest Florida STR cleaning pros',
  'Pensacola Rental Refresh serves the greater Pensacola area with reliable turnover cleaning and linen service. Military-adjacent market specialists with flexible scheduling.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Cleaners', 'cannon-beach-str-cleaners', 'Oregon Coast vacation rental turnover',
  'Cannon Beach STR Cleaners handles turnovers for beach houses, cozy cottages, and vacation rentals along the North Oregon Coast. Haystack Rock views kept pristine.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seaside OR Rental Clean', 'seaside-or-rental-clean', 'Northern Oregon Coast STR cleaning',
  'Seaside OR Rental Clean covers Seaside and the Clatsop County coast with dependable vacation rental turnovers. Beach town property specialists with storm-season availability.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island Clean Pros', 'tybee-island-clean-pros', 'Georgia coast STR turnover experts',
  'Tybee Island Clean Pros handles same-day turnovers for beach cottages, oceanfront homes, and vacation rentals on Tybee Island. Sand-aware cleaning for coastal Georgia properties.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah Coastal Rentals Clean', 'savannah-coastal-rentals-clean', 'Savannah and Tybee STR cleaning',
  'Savannah Coastal Rentals Clean serves both downtown Savannah vacation properties and Tybee Island beach rentals. Historic home and beach cottage specialists.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 77
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island Turnover Co', 'kiawah-island-turnover-co', 'Luxury Lowcountry STR cleaning',
  'Kiawah Island Turnover Co specializes in high-end vacation rental turnovers on Kiawah and Seabrook Islands. White-glove service for luxury villas, golf cottages, and beachfront homes.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Johns Island STR Clean', 'johns-island-str-clean', 'Charleston area vacation rental turnover',
  'Johns Island STR Clean covers Johns Island and the Sea Islands corridor with reliable vacation rental turnovers. Charleston market specialists for plantation homes and coastal cottages.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Cleaners', 'golden-isles-str-cleaners', 'St. Simons vacation rental turnover',
  'Golden Isles STR Cleaners handles turnovers for beach cottages, luxury homes, and condos on St. Simons Island, Sea Island, and Jekyll Island. Coastal Georgia specialists.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA Rental Clean', 'brunswick-ga-rental-clean', 'Glynn County STR cleaning services',
  'Brunswick GA Rental Clean serves the Golden Isles market from the mainland, covering Brunswick, St. Simons, and Jekyll Island with dependable turnover cleaning.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.6, 59
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Clean Co', 'chattanooga-str-clean-co', 'Tennessee River city vacation rental cleaning',
  'Chattanooga STR Clean Co handles turnovers for downtown lofts, mountain-view cabins, and waterfront rentals throughout the Chattanooga market. Lookout Mountain to Chickamauga Lake coverage.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 95
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Signal Mountain Rental Clean', 'signal-mountain-rental-clean', 'Greater Chattanooga STR turnover',
  'Signal Mountain Rental Clean covers the mountain communities above Chattanooga with fast vacation rental turnovers. Mountain cabin and ridge-view home specialists.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Clean TX', 'hill-country-str-clean-tx', 'Texas Hill Country vacation rental turnover',
  'Hill Country STR Clean TX handles turnovers for wine country cottages, ranch-style vacation rentals, and luxury retreats throughout Fredericksburg and Gillespie County.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville Rental Refresh TX', 'kerrville-rental-refresh-tx', 'Kerr County STR cleaning services',
  'Kerrville Rental Refresh TX covers Kerrville and the surrounding Hill Country with reliable vacation rental turnovers. River cabin and ranch retreat specialists.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal River STR Cleaners', 'comal-river-str-cleaners', 'New Braunfels vacation rental turnover',
  'Comal River STR Cleaners specializes in river house turnovers for the New Braunfels tubing corridor. Water sports cleanup, sandy floor management, and rapid same-day service.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 122
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene District Clean Co', 'gruene-district-clean-co', 'Gruene and New Braunfels STR cleaning',
  'Gruene District Clean Co covers the historic Gruene neighborhood and greater New Braunfels with vacation rental turnovers. River retreat and historic home specialists.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Cleaners', 'lake-cda-str-cleaners', 'Coeur d Alene vacation rental turnover',
  'Lake CDA STR Cleaners handles turnovers for lakefront homes, waterfront condos, and resort-area rentals throughout Coeur d''Alene and the North Idaho corridor.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Post Falls Rental Clean ID', 'post-falls-rental-clean-id', 'Kootenai County STR cleaning services',
  'Post Falls Rental Clean ID covers Post Falls and the Spokane Valley corridor with vacation rental turnovers. North Idaho and eastern Washington market specialists.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Clean', 'lake-geneva-str-clean', 'Walworth County vacation rental turnover',
  'Lake Geneva STR Clean handles turnovers for lakefront cottages, Airbnb rentals, and vacation homes throughout the Lake Geneva and Geneva Lake shoreline. Chicago weekend market specialists.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 92
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Williams Bay Rental Refresh', 'williams-bay-rental-refresh', 'Geneva Lake STR cleaning services',
  'Williams Bay Rental Refresh covers the western Geneva Lake shoreline from Williams Bay to Fontana. Lakefront vacation home turnovers with boat dock and pier cleanup included.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: photography-design
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui Listing Photography', 'maui-listing-photography', 'Luxury Hawaiian STR photography',
  'Maui Listing Photography creates stunning images for vacation rentals across the Valley Isle. Ocean-view lanai shots, twilight exteriors, and aerial drone work that converts browsers to bookers.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei STR Photo Studio', 'kihei-str-photo-studio', 'South Maui vacation rental imaging',
  'Kihei STR Photo Studio specializes in South Maui beachfront and resort-adjacent rentals. HDR interior photography, ocean panoramas, and virtual tours that showcase island living.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu Vacation Rental Photos', 'oahu-vacation-rental-photos', 'Honolulu STR photography pros',
  'Oahu Vacation Rental Photos delivers professional images for Honolulu condos, North Shore beach houses, and everything in between. Drone permits secured, ocean views maximized.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windward Oahu Rental Imaging', 'windward-oahu-rental-imaging', 'Kailua and Kaneohe STR photography',
  'Windward Oahu Rental Imaging captures the lush green mountains and turquoise waters of the windward side. Kailua beachfront homes and mountain-view cottages our specialty.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Photography Co', 'kauai-str-photography-co', 'Garden Isle vacation rental imaging',
  'Kauai STR Photography Co captures the Na Pali cliffs, Hanalei Bay, and lush tropical settings that make Kauai properties irresistible. FAA-licensed drone operator for aerial shots.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Shore Kauai Photos', 'south-shore-kauai-photos', 'Poipu beach rental photography',
  'South Shore Kauai Photos covers Poipu, Koloa, and the south shore with professional vacation rental photography. Sunset pool shots and oceanfront vistas that drive direct bookings.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Photography', 'big-island-str-photography', 'Hawaii Island vacation rental imaging',
  'Big Island STR Photography captures the diverse landscapes of the Big Island — from Kona coffee country to Hilo rainforest to volcano-view retreats. Twilight and drone packages available.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo Rental Photo Studio', 'hilo-rental-photo-studio', 'East Hawaii STR photography',
  'Hilo Rental Photo Studio specializes in lush tropical vacation rental photography for the Hilo and Puna districts. Rainforest settings, waterfall backdrops, and lava flow vistas captured beautifully.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab Rental Photography', 'moab-rental-photography', 'Canyon country STR imaging',
  'Moab Rental Photography captures the dramatic red rock landscape that guests come to experience. Arches National Park backdrops, stargazing deck shots, and Milky Way night photography.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Canyon Photo Studio UT', 'red-canyon-photo-studio-ut', 'Moab area vacation rental design',
  'Red Canyon Photo Studio UT combines vacation rental photography with interior styling consultation. Desert-modern aesthetic expertise and drone shots of canyon rim properties.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Photography', 'santa-fe-str-photography', 'Adobe and art district rental imaging',
  'Santa Fe STR Photography captures the adobe architecture, vibrant art spaces, and mountain-view courtyards that define New Mexico rentals. Twilight photography and lifestyle staging.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.9, 81
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Rental Images NM', 'high-desert-rental-images-nm', 'Northern NM vacation rental photography',
  'High Desert Rental Images NM covers Santa Fe and surrounding villages with professional STR photography. Adobe casita and hacienda specialists with understanding of the unique SW aesthetic.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 59
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Photo Studio', 'taos-str-photo-studio', 'Ski and art colony rental photography',
  'Taos STR Photo Studio captures ski chalets, pueblo-style casitas, and mountain retreats with professional photography that emphasizes dramatic Sangre de Cristo backdrops and authentic New Mexico style.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Mountain Rental Images', 'taos-mountain-rental-images', 'Taos area vacation rental imaging',
  'Taos Mountain Rental Images covers Taos and El Prado with professional vacation rental photography. Mountain and mesa views, adobe architecture, and ski resort proximity highlighted.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe Vermont Rental Photos', 'stowe-vermont-rental-photos', 'Vermont ski lodge STR photography',
  'Stowe Vermont Rental Photos captures cozy ski lodges, charming farmhouses, and foliage-season mountain views. Fire-lit interior shots and snowy exterior photography that fills your calendar.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.9, 77
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Images', 'green-mountain-str-images', 'Lamoille Valley vacation rental imaging',
  'Green Mountain STR Images covers Stowe and Morrisville with four-season vacation rental photography. Vermont charm captured in every season — fall foliage to ski season snowscapes.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Photography', 'catskills-str-photography', 'Upstate NY A-frame and cabin imaging',
  'Catskills STR Photography specializes in the aesthetic that draws NYC weekenders north — A-frames, converted barns, and mountain retreats. Moody, atmospheric images that convert.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Esopus Valley Rental Photos', 'esopus-valley-rental-photos', 'Southern Catskills STR imaging',
  'Esopus Valley Rental Photos covers Phoenicia and the upper Catskills with professional vacation rental photography. Autumn color, creek-side settings, and cozy interior shots.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes Rental Photos', 'finger-lakes-rental-photos', 'Wine country vacation rental imaging',
  'Finger Lakes Rental Photos captures lakefront cottages, winery guesthouses, and vineyard-view properties across all eleven lakes. Sunset dock shots and harvest-season exteriors.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Images', 'seneca-lake-str-images', 'Schuyler County rental photography',
  'Seneca Lake STR Images covers the Watkins Glen area with professional vacation rental photography. Gorge-view properties, lakefront cottages, and wine trail homes photographed beautifully.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley Rental Photos', 'hudson-valley-rental-photos', 'Historic river valley STR photography',
  'Hudson Valley Rental Photos captures barns, farmhouses, and historic estates that attract New York City visitors. Drone shots over rolling hills and river-valley panoramas.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Images', 'dutchess-county-str-images', 'Rhinebeck area vacation rental imaging',
  'Dutchess County STR Images covers Rhinebeck and the mid-Hudson Valley with professional vacation rental photography. Manor house estates, charming village homes, and farm retreats.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Beavers Bend Rental Photos', 'beavers-bend-rental-photos', 'Oklahoma cabin STR photography',
  'Beavers Bend Rental Photos captures log cabin exteriors, wraparound porch sunsets, and hot tub deck shots that make Broken Bow properties stand out. Twilight and forest drone packages.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 114
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Cabin Imaging', 'hochatown-cabin-imaging', 'McCurtain County vacation rental photos',
  'Hochatown Cabin Imaging specializes in the rustic-luxury aesthetic that defines Broken Bow vacation rentals. Giant log cabins, treehouse rentals, and forest-view hot tub shots.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake Rental Photos', 'ozarks-lake-rental-photos', 'Missouri lake house STR photography',
  'Ozarks Lake Rental Photos captures waterfront homes, party barges, and cove retreats across Lake of the Ozarks. Sunrise dock shots and aerial lake views that book fast.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Images MO', 'lake-ozark-str-images-mo', 'Lake of the Ozarks rental imaging',
  'Lake Ozark STR Images MO covers the mid-lake area with professional vacation rental photography. Boat docks, lake-view decks, and interior party room shots included in every package.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Rental Photos', 'smoky-mountain-rental-photos', 'Pigeon Forge STR photography pros',
  'Smoky Mountain Rental Photos captures mountain-view cabins, hot tub decks at sunset, and cozy interior game rooms throughout the Pigeon Forge and Gatlinburg corridor.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 128
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gatlinburg Cabin Imaging TN', 'gatlinburg-cabin-imaging-tn', 'Sevier County vacation rental photos',
  'Gatlinburg Cabin Imaging TN specializes in the cabin aesthetic that makes Smoky Mountain rentals irresistible. Misty mountain backdrops, covered porch portraits, and hot tub twilight shots.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 104
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota Rental Photography', 'sarasota-rental-photography', 'Siesta Key and Gulf Coast STR imaging',
  'Sarasota Rental Photography captures luxury beachfront homes, Siesta Key condos, and bayfront estates with award-winning photography. Sunset Gulf shots that sell properties instantly.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.9, 106
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Images FL', 'gulf-coast-str-images-fl', 'Southwest Florida vacation rental photos',
  'Gulf Coast STR Images FL covers Sarasota, Siesta Key, and Longboat Key with professional vacation rental photography. Pool and lanai staging, drone aerials, and twilight packages.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ancient City Rental Photos', 'ancient-city-rental-photos', 'St. Augustine STR photography',
  'Ancient City Rental Photos captures historic homes, beach cottages, and Spanish colonial architecture that make St. Augustine rentals unique. Cobblestone streets and sunset shots included.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Images', 'ponte-vedra-str-images', 'Northeast Florida vacation rental imaging',
  'Ponte Vedra STR Images covers the beaches from Ponte Vedra to Vilano Beach with professional vacation rental photography. Oceanfront home and Intracoastal property specialists.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola Beach Rental Photos', 'pensacola-beach-rental-photos', 'Emerald Coast STR photography',
  'Pensacola Beach Rental Photos captures the sugar-white sands and emerald waters that define Northwest Florida vacation rentals. Beachfront home aerials and sunset Gulf panoramas.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze Rental Imaging', 'gulf-breeze-rental-imaging', 'Pensacola area STR photography',
  'Gulf Breeze Rental Imaging covers Gulf Breeze, Pensacola Beach, and Perdido Key with professional vacation rental photography. Military market and vacation home specialists.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach Rental Photos', 'cannon-beach-rental-photos', 'Oregon Coast STR photography',
  'Cannon Beach Rental Photos captures Haystack Rock, dramatic Pacific cliffs, and cozy coastal interiors that make Oregon Coast rentals unforgettable. Moody fog and golden-hour specialists.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.9, 87
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Images', 'north-oregon-coast-str-images', 'Seaside and Cannon Beach rental imaging',
  'North Oregon Coast STR Images covers the northern Oregon Coast from Astoria to Lincoln City with professional vacation rental photography. Beach house and coastal cottage specialists.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island Rental Photos', 'tybee-island-rental-photos', 'Georgia coast STR photography',
  'Tybee Island Rental Photos captures beach cottages, oceanfront homes, and lighthouse-view properties with photography that showcases Georgia''s charming coastal character.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Photo Studio', 'savannah-str-photo-studio', 'Savannah and coastal Georgia rental imaging',
  'Savannah STR Photo Studio covers downtown Savannah vacation homes and Tybee Island beach rentals. Historic district charm and coastal beauty captured in every shoot.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island Rental Photos', 'kiawah-island-rental-photos', 'Luxury Lowcountry STR photography',
  'Kiawah Island Rental Photos specializes in luxury vacation rental photography for Kiawah and Seabrook Islands. Ocean Course views, beachfront villa exteriors, and wildlife-rich Lowcountry settings.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 93
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Images SC', 'lowcountry-str-images-sc', 'Charleston Sea Islands rental imaging',
  'Lowcountry STR Images SC covers Johns Island and the greater Charleston Sea Islands with professional vacation rental photography. Plantation aesthetic and coastal Lowcountry charm.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles Rental Photos', 'golden-isles-rental-photos', 'St. Simons STR photography pros',
  'Golden Isles Rental Photos captures the moss-draped oaks, beach cottages, and oceanfront estates that define St. Simons Island. Drone aerials of the entire Golden Isles chain.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Images', 'brunswick-ga-str-images', 'Glynn County vacation rental photography',
  'Brunswick GA STR Images covers the Golden Isles market from St. Simons to Jekyll Island. Coastal Georgia charm, historic lighthouse settings, and barrier island aerials.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga Rental Photos', 'chattanooga-rental-photos', 'Tennessee River city STR photography',
  'Chattanooga Rental Photos captures downtown lofts, mountain-view homes, and waterfront properties with photography that showcases the city''s stunning natural setting and vibrant culture.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lookout Mountain STR Images', 'lookout-mountain-str-images', 'Greater Chattanooga rental imaging',
  'Lookout Mountain STR Images covers the mountain communities and river valley below with professional vacation rental photography. Ridgeline views, Tennessee River panoramas, and twilight shots.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Rental Photos TX', 'hill-country-rental-photos-tx', 'Fredericksburg STR photography',
  'Hill Country Rental Photos TX captures wine country cottages, ranch-style retreats, and luxury vacation homes throughout Gillespie County. Vineyard backdrops and stargazing deck shots.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Images TX', 'kerrville-str-images-tx', 'Kerr County vacation rental photography',
  'Kerrville STR Images TX covers Kerrville and the Guadalupe River valley with professional vacation rental photography. River cabin and cedar ranch specialists.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County Rental Photos', 'comal-county-rental-photos', 'New Braunfels STR photography pros',
  'Comal County Rental Photos captures river houses, Schlitterbahn-adjacent vacation rentals, and Hill Country retreats. Summer tubing energy and year-round lifestyle imagery.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 118
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Photo Studio', 'gruene-str-photo-studio', 'Gruene and New Braunfels rental imaging',
  'Gruene STR Photo Studio covers the Gruene historic district and greater New Braunfels with professional vacation rental photography. River view and Texas Hill Country aesthetic specialists.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA Rental Photography', 'lake-cda-rental-photography', 'Coeur d Alene STR imaging pros',
  'Lake CDA Rental Photography captures lakefront homes, water-view condos, and resort properties throughout Coeur d''Alene. Drone shots over Idaho''s most beautiful lake included.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Images', 'north-idaho-str-images', 'Kootenai County vacation rental photography',
  'North Idaho STR Images covers Coeur d''Alene and Post Falls with professional vacation rental photography. Mountain lake views, cedar home interiors, and four-season exterior packages.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva Rental Photos', 'lake-geneva-rental-photos', 'Wisconsin lake cottage STR photography',
  'Lake Geneva Rental Photos captures lakefront cottages, Victorian vacation homes, and resort properties along Geneva Lake. Sunset boat dock shots and fall color exteriors for the Chicago market.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Images WI', 'geneva-lake-str-images-wi', 'Walworth County vacation rental imaging',
  'Geneva Lake STR Images WI covers Williams Bay and the western shoreline with professional vacation rental photography. Lakefront home and vintage cottage specialists.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;
