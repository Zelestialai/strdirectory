-- Migration 038: Tier 6 vendor seeds — real-estate + interior-design
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: real-estate
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Realty Group', 'maui-str-realty-group', 'Vacation rental investment properties on Maui',
  'Maui STR Realty Group specializes in helping investors find and acquire short-term rental properties across West and South Maui. Transient Vacation Rental permit expertise and ROI analysis.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.9, 67
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Investment Realty', 'kihei-investment-realty', 'South Maui vacation rental acquisitions',
  'Kihei Investment Realty helps buyers find permitted vacation rental condos and homes throughout South Maui. TVR permit transfer expertise and short-term rental ROI projections.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.8, 51
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Investment Realty', 'oahu-str-investment-realty', 'Honolulu vacation rental property sales',
  'Oahu STR Investment Realty guides investors through Honolulu''s complex STR permitting landscape. DPP-compliant property identification, NonConforming Use Certificate analysis, and cash flow modeling.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua Coastal Realty HI', 'kailua-coastal-realty-hi', 'Windward Oahu STR property specialists',
  'Kailua Coastal Realty helps investors find vacation rental opportunities along the Windward Coast. Kailua beach house expertise and Honolulu short-term rental regulation navigation.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Investment Realty', 'kauai-str-investment-realty', 'Garden Isle vacation rental acquisitions',
  'Kauai STR Investment Realty specializes in finding TVR-permitted vacation rental properties throughout Kauai. North Shore and South Shore market expertise with comprehensive ROI analysis.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 63
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu Beach Realty Kauai', 'poipu-beach-realty-kauai', 'South Shore Kauai investment properties',
  'Poipu Beach Realty Kauai helps investors acquire vacation rental condos and homes in Poipu and Koloa. TVR permit analysis and Kauai County STR compliance guidance.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 47
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Realty', 'big-island-str-realty', 'Hawaii Island vacation rental investments',
  'Big Island STR Realty guides investors through the Big Island market from Kona coffee country to Kohala Coast resorts. Lava zone risk assessment and short-term rental revenue modeling.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Investment Realty', 'hilo-str-investment-realty', 'East Hawaii vacation rental properties',
  'Hilo STR Investment Realty helps buyers find affordable vacation rental opportunities on the Big Island''s east side. Rainforest retreat and eco-lodge investment specialists.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Realty UT', 'moab-str-realty-ut', 'Canyon country vacation rental investments',
  'Moab STR Realty helps investors acquire vacation rental properties in Grand County. Nightly rate analysis, Grand County STR permit guidance, and outdoor adventure market ROI projections.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Investment Realty', 'red-rock-investment-realty', 'Moab area STR property specialists',
  'Red Rock Investment Realty specializes in Moab vacation rental acquisitions from canyon rim properties to downtown condos. STR cash flow modeling and Grand County regulation expertise.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Realty', 'santa-fe-str-realty', 'City Different vacation rental acquisitions',
  'Santa Fe STR Realty guides investors through the competitive Santa Fe vacation rental market. Adobe home expertise, City of Santa Fe STR permit process, and luxury property ROI analysis.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Investment Realty NM', 'high-desert-investment-realty-nm', 'Northern NM STR property specialists',
  'High Desert Investment Realty NM covers Santa Fe County with vacation rental investment guidance. Casita and hacienda acquisition specialists with New Mexico STR regulation expertise.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Realty NM', 'taos-str-realty-nm', 'Ski and art colony investment properties',
  'Taos STR Realty helps investors acquire ski chalets, mountain casitas, and vacation rentals throughout Taos County. Ski-season revenue modeling and local STR regulation guidance.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Mountain Investment Realty', 'taos-mountain-investment-realty', 'Taos area vacation rental properties',
  'Taos Mountain Investment Realty covers Taos and El Prado with vacation rental acquisition expertise. Mountain cabin and pueblo-style property specialists with ROI analysis.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Realty VT', 'stowe-str-realty-vt', 'Vermont ski lodge investment properties',
  'Stowe STR Realty guides investors through ski chalet and mountain vacation rental acquisitions in Lamoille County. Ski-season vs. foliage-season revenue analysis and Vermont Act 250 compliance.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.9, 81
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Realty', 'green-mountain-str-realty', 'Stowe area vacation rental acquisitions',
  'Green Mountain STR Realty covers Stowe and surrounding Lamoille County with vacation rental investment expertise. Four-season Vermont market analysis and ski property ROI projections.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Realty NY', 'catskills-str-realty-ny', 'Upstate NY vacation rental investments',
  'Catskills STR Realty guides investors through A-frame, farmhouse, and mountain cabin acquisitions across Ulster and Sullivan Counties. NYC weekend market revenue modeling and local STR regs.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Esopus Valley Investment Realty', 'esopus-valley-investment-realty', 'Southern Catskills STR property specialists',
  'Esopus Valley Investment Realty covers Phoenicia and the southern Catskills corridor with vacation rental acquisition expertise. Cabin and farmhouse investment specialists.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Realty NY', 'finger-lakes-str-realty-ny', 'Wine country vacation rental investments',
  'Finger Lakes STR Realty guides investors through lakefront cottage and winery guesthouse acquisitions across the Finger Lakes region. Wine tourism market analysis and Airbnb revenue projections.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake Investment Realty', 'seneca-lake-investment-realty', 'Schuyler County STR property specialists',
  'Seneca Lake Investment Realty covers Watkins Glen and the southern Finger Lakes with vacation rental acquisition expertise. Gorge-view and lakefront property ROI analysis.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Realty', 'hudson-valley-str-realty', 'River valley vacation rental investments',
  'Hudson Valley STR Realty guides investors through farmhouse, barn, and historic home acquisitions from Kingston to Hudson. NYC escape market analysis and STR cash flow modeling.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Realty', 'dutchess-county-str-realty', 'Rhinebeck area investment properties',
  'Dutchess County STR Realty covers the Rhinebeck and mid-Hudson Valley market with vacation rental investment expertise. Estate property STR potential analysis and Dutchess County compliance.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Realty OK', 'broken-bow-str-realty-ok', 'Oklahoma cabin investment specialists',
  'Broken Bow STR Realty helps investors find log cabins, luxury retreats, and undeveloped land for STR development throughout McCurtain County. One of the highest-ROI STR markets in the South.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Realty Group', 'hochatown-realty-group', 'Broken Bow area STR property acquisitions',
  'Hochatown Realty Group covers Hochatown and McCurtain County with vacation rental investment guidance. Cabin and land acquisition specialists in Oklahoma''s premier outdoor destination.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Realty', 'ozarks-lake-str-realty', 'Missouri lake house investment properties',
  'Ozarks Lake STR Realty guides investors through lake house and condo acquisitions across Lake of the Ozarks. Summer rental revenue projections, dock rights analysis, and Missouri STR guidance.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark Investment Realty', 'lake-ozark-investment-realty', 'Lake Ozark area STR acquisitions',
  'Lake Ozark Investment Realty covers the mid-lake area with vacation rental acquisition expertise. Lake house ROI analysis and Missouri vacation rental market knowledge.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Realty', 'smoky-mountain-str-realty', 'Pigeon Forge cabin investment specialists',
  'Smoky Mountain STR Realty helps investors acquire high-performing cabins and chalets throughout Sevier County. One of America''s top STR markets with strong year-round demand.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 118
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Realty', 'sevier-county-str-realty', 'Gatlinburg area vacation rental investments',
  'Sevier County STR Realty covers the Gatlinburg and Pigeon Forge corridor with cabin and chalet acquisition expertise. Revenue projections, HOA analysis, and Tennessee STR compliance.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Realty FL', 'sarasota-str-realty-fl', 'Gulf Coast vacation rental investments',
  'Sarasota STR Realty guides investors through beachfront condo and luxury home acquisitions across Sarasota County. Florida SB 280 compliance and high-season revenue modeling.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key Investment Realty', 'siesta-key-investment-realty', 'Siesta Key STR property specialists',
  'Siesta Key Investment Realty helps investors find vacation rental condos and homes on Siesta and Lido Keys. Florida vacation rental cash flow analysis and Sarasota County STR licensing guidance.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Realty', 'st-augustine-str-realty', 'Ancient city vacation rental investments',
  'St Augustine STR Realty guides investors through historic home and beach rental acquisitions in St. Johns County. Florida vacation rental licensing and St. Augustine market revenue projections.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Realty FL', 'ponte-vedra-str-realty-fl', 'Northeast Florida investment properties',
  'Ponte Vedra STR Realty covers beach rental acquisitions from Ponte Vedra to St. Augustine Beach. Ocean-view property ROI analysis and Northeast Florida STR market expertise.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Realty FL', 'pensacola-str-realty-fl', 'Northwest Florida vacation rental investments',
  'Pensacola STR Realty guides investors through beachfront and Intracoastal vacation rental acquisitions in Escambia and Santa Rosa Counties. Emerald Coast market ROI analysis.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze Investment Realty', 'gulf-breeze-investment-realty', 'Pensacola area STR property specialists',
  'Gulf Breeze Investment Realty covers the greater Pensacola market with vacation rental investment expertise. Military relocation market analysis and Northwest Florida STR guidance.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Realty OR', 'cannon-beach-str-realty-or', 'Oregon Coast vacation rental investments',
  'Cannon Beach STR Realty helps investors acquire beach houses and coastal properties on the North Oregon Coast. Clatsop County STR permit guidance and ocean-view property ROI analysis.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast Realty', 'north-oregon-coast-realty', 'Seaside and Cannon Beach STR investments',
  'North Oregon Coast Realty covers Seaside and the northern Oregon Coast with vacation rental acquisition expertise. Coastal vacation rental market analysis and Oregon STR compliance.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Realty', 'tybee-island-str-realty', 'Georgia coast vacation rental investments',
  'Tybee Island STR Realty guides investors through beach cottage and vacation property acquisitions on Tybee Island. Chatham County STR licensing and coastal Georgia market ROI analysis.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah Coastal STR Realty', 'savannah-coastal-str-realty', 'Savannah and Tybee investment properties',
  'Savannah Coastal STR Realty covers downtown Savannah vacation homes and Tybee Island beach properties. Historic district investment analysis and coastal Georgia STR revenue modeling.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Realty', 'kiawah-island-str-realty', 'Luxury Lowcountry investment properties',
  'Kiawah Island STR Realty specializes in luxury vacation rental acquisitions on Kiawah and Seabrook Islands. Golf villa, oceanfront estate, and private resort property investment expertise.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 89
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Realty SC', 'lowcountry-str-realty-sc', 'Charleston Sea Islands investment properties',
  'Lowcountry STR Realty SC covers Johns Island and the Charleston Sea Islands with vacation rental acquisition guidance. Plantation property and coastal cottage STR investment analysis.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Realty', 'golden-isles-str-realty', 'St. Simons vacation rental investments',
  'Golden Isles STR Realty guides investors through vacation property acquisitions on St. Simons Island, Sea Island, and Jekyll Island. Coastal Georgia barrier island investment expertise.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Realty', 'brunswick-ga-str-realty', 'Glynn County vacation rental acquisitions',
  'Brunswick GA STR Realty covers the Golden Isles market with vacation rental investment expertise. Remote owner services and Golden Isles STR cash flow projections.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Realty TN', 'chattanooga-str-realty-tn', 'Tennessee River city rental investments',
  'Chattanooga STR Realty guides investors through downtown loft, mountain cabin, and waterfront vacation rental acquisitions throughout Hamilton County. Tennessee STR compliance and ROI analysis.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Realty', 'scenic-city-str-realty', 'Greater Chattanooga investment properties',
  'Scenic City STR Realty covers the Chattanooga metro and surrounding mountain communities with vacation rental acquisition expertise. Outdoor adventure market and urban getaway property analysis.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Realty TX', 'hill-country-str-realty-tx', 'Fredericksburg vacation rental investments',
  'Hill Country STR Realty guides investors through wine country cottage, ranch, and luxury retreat acquisitions throughout Gillespie County. One of Texas''s top STR investment markets.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.9, 98
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Realty TX', 'kerrville-str-realty-tx', 'Kerr County vacation rental acquisitions',
  'Kerrville STR Realty covers Kerrville and the Guadalupe Valley with vacation rental acquisition expertise. River cabin and cedar ranch investment analysis with Texas STR compliance.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Realty', 'comal-county-str-realty', 'New Braunfels vacation rental investments',
  'Comal County STR Realty guides investors through river house and vacation property acquisitions in New Braunfels. Comal River corridor revenue modeling and Comal County STR compliance.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Realty TX', 'gruene-str-realty-tx', 'Gruene and New Braunfels investment properties',
  'Gruene STR Realty covers the Gruene neighborhood and greater New Braunfels with vacation rental investment expertise. River view and Texas Hill Country aesthetic property specialists.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Realty', 'lake-cda-str-realty', 'Coeur d Alene vacation rental investments',
  'Lake CDA STR Realty guides investors through lakefront home and waterfront condo acquisitions in Kootenai County. Idaho STR compliance and North Idaho market revenue projections.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Realty', 'north-idaho-str-realty', 'Kootenai County vacation rental acquisitions',
  'North Idaho STR Realty covers Coeur d''Alene and Post Falls with vacation rental investment expertise. Mountain lake property ROI analysis and Idaho short-term rental market guidance.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Realty WI', 'lake-geneva-str-realty-wi', 'Walworth County vacation rental investments',
  'Lake Geneva STR Realty guides investors through lake cottage and vacation home acquisitions along Geneva Lake. Chicago weekend market revenue modeling and Walworth County STR compliance.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake Investment Realty', 'geneva-lake-investment-realty', 'Lake Geneva area STR acquisitions',
  'Geneva Lake Investment Realty covers Williams Bay and the western Geneva Lake shoreline with vacation rental acquisition expertise. Wisconsin lake cottage investment specialists.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: interior-design
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Interior Design', 'maui-str-interior-design', 'Hawaiian luxury vacation rental styling',
  'Maui STR Interior Design creates island-chic interiors that attract premium guests to Maui vacation rentals. Lanai living spaces, tropical-modern aesthetics, and resort-quality furnishing packages.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.9, 58
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental Design', 'kihei-vacation-rental-design', 'South Maui STR interior styling',
  'Kihei Vacation Rental Design specializes in South Maui beachfront condo and home interiors. Coastal Hawaiian style, premium amenities curation, and guest-experience-focused design.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.8, 44
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Interior Design', 'oahu-str-interior-design', 'Honolulu vacation rental styling',
  'Oahu STR Interior Design creates contemporary Hawaiian interiors for Honolulu condos and vacation homes. Breezy indoor-outdoor living spaces and island-modern aesthetics that earn 5-star reviews.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Design Studio', 'kailua-str-design-studio', 'Windward Oahu rental interior design',
  'Kailua STR Design Studio creates relaxed beach house interiors for Windward Oahu vacation rentals. Casual coastal Hawaiian style and premium amenities that command top nightly rates.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Interior Design', 'kauai-str-interior-design', 'Garden Isle vacation rental styling',
  'Kauai STR Interior Design creates lush, tropical interiors for vacation rentals across Princeville and the North Shore. Rainforest-inspired palettes and resort-level amenities for premium Kauai properties.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 52
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu Beach STR Design', 'poipu-beach-str-design', 'South Kauai rental interior styling',
  'Poipu Beach STR Design specializes in South Shore Kauai vacation rental interiors. Sun-drenched island style, outdoor living space optimization, and resort-quality guest experience.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 39
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Design Co', 'big-island-str-design-co', 'Hawaii Island vacation rental interiors',
  'Big Island STR Design Co creates interiors for Kona Coast vacation rentals that celebrate the Big Island''s diverse landscapes. Volcano-inspired art, lava stone features, and tropical-luxury aesthetics.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 49
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Interior Design HI', 'hilo-str-interior-design-hi', 'East Hawaii rental design studio',
  'Hilo STR Interior Design creates lush, organic interiors for rainforest retreats and eco-lodges around Hilo. Natural materials, botanical inspiration, and authentic Hawaii Island character.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 36
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Interior Design', 'moab-str-interior-design', 'Desert modern vacation rental styling',
  'Moab STR Interior Design creates desert-modern interiors that reflect the canyon country landscape. Earth tones, natural stone accents, and outdoor living spaces that maximize Moab''s dramatic setting.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Design Studio UT', 'red-rock-design-studio-ut', 'Moab area STR interior styling',
  'Red Rock Design Studio UT specializes in the aesthetic Moab guests expect — rugged natural materials, warm desert palettes, and stargazing-focused outdoor spaces for vacation rentals.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Design Studio', 'santa-fe-str-design-studio', 'Adobe home vacation rental interiors',
  'Santa Fe STR Design Studio creates authentic Southwest interiors for vacation rentals in the City Different. Handcrafted furniture, Pueblo-inspired tiles, and curated local art for premium properties.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.9, 71
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Design NM', 'high-desert-str-design-nm', 'Northern New Mexico rental interior styling',
  'High Desert STR Design NM covers Santa Fe vacation rentals with Southwest interior design. Adobe textures, vigas and latillas, and terracotta palettes that guests love photographing.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Interior Design NM', 'taos-str-interior-design-nm', 'Mountain art colony rental styling',
  'Taos STR Interior Design creates interiors that capture the spirit of this art-world destination. Locally sourced Taos art, hand-plastered walls, and mountain-modern furniture for standout vacation rentals.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Mountain Design Studio', 'taos-mountain-design-studio', 'Taos area vacation rental interiors',
  'Taos Mountain Design Studio covers Taos and El Prado with vacation rental interior design. Ski chalet cozy aesthetics and pueblo-style casita styling for premium guest experiences.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 42
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Interior Design VT', 'stowe-str-interior-design-vt', 'Vermont ski lodge vacation rental styling',
  'Stowe STR Interior Design creates cozy, sophisticated mountain interiors for ski chalets and Vermont farmhouses. Classic New England aesthetics — flannel textures, wood beams, and fireplace vignettes.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.9, 69
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Design', 'green-mountain-str-design', 'Stowe area rental interior styling',
  'Green Mountain STR Design covers Stowe and Morrisville with vacation rental interior design. Warm Vermont cabin aesthetics and ski-season staging that drives repeat bookings.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Design Studio', 'catskills-str-design-studio', 'Upstate NY cabin interior styling',
  'Catskills STR Design Studio creates the moody, Instagram-worthy interiors that drive Catskills bookings — A-frame warmth, reclaimed wood, and just the right amount of wit for the NYC creative crowd.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Interior Design', 'phoenicia-str-interior-design', 'Southern Catskills rental design',
  'Phoenicia STR Interior Design covers the Esopus Valley and southern Catskills with vacation rental interior design. Rustic-modern cabin aesthetics and distinctive styling for the weekend rental market.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Design', 'finger-lakes-str-design', 'Wine country vacation rental interiors',
  'Finger Lakes STR Design creates vineyard-inspired interiors for lakefront cottages and winery guesthouses. Wine-country palettes, warm farmhouse aesthetics, and lake-view staging packages.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Design Studio', 'seneca-lake-str-design-studio', 'Schuyler County rental interior styling',
  'Seneca Lake STR Design Studio covers the Watkins Glen area with vacation rental interior design. Lakefront cottage charm, harvest-inspired palettes, and gorge-view staging for top ratings.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Design', 'hudson-valley-str-design', 'Historic river valley rental interiors',
  'Hudson Valley STR Design creates sophisticated farmhouse and converted barn interiors for the weekend rental market. Antique-modern mix, Hudson Valley artist collaborations, and handcrafted details.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rhinebeck STR Interior Design', 'rhinebeck-str-interior-design', 'Dutchess County vacation rental styling',
  'Rhinebeck STR Interior Design covers the mid-Hudson Valley with vacation rental interior design. Estate and manor aesthetics, curated vintage finds, and sophisticated country-house styling.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Design OK', 'broken-bow-str-design-ok', 'Oklahoma cabin interior styling',
  'Broken Bow STR Design creates rustic-luxury interiors for log cabins and high-end retreats throughout McCurtain County. Faux fur throws, industrial-rustic furniture, and game rooms that get five stars.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Cabin Design Studio', 'hochatown-cabin-design-studio', 'Broken Bow area STR interior design',
  'Hochatown Cabin Design Studio covers Hochatown and the greater Broken Bow market with vacation rental interior design. Cabin-luxe aesthetics and hot tub deck staging for maximum appeal.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Design', 'ozarks-lake-str-design', 'Missouri lake house interior styling',
  'Ozarks Lake STR Design creates fun, functional lake house interiors for vacation rentals across Lake of the Ozarks. Nautical-modern style, party-ready spaces, and indoor-outdoor living optimization.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Interior Design', 'lake-ozark-str-interior-design', 'Lake Ozark rental design studio',
  'Lake Ozark STR Interior Design covers the mid-lake area with vacation rental interior design. Lake house aesthetics, game room layouts, and waterfront deck staging for top-booking rentals.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Design', 'smoky-mountain-str-design', 'Pigeon Forge cabin interior styling',
  'Smoky Mountain STR Design creates the mountain-cozy interiors Smoky Mountain guests expect. Plaid accents, bear motifs used tastefully, fire pits, and game rooms that drive five-star reviews.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 117
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gatlinburg Cabin Design TN', 'gatlinburg-cabin-design-tn', 'Sevier County STR interior design',
  'Gatlinburg Cabin Design TN covers the Gatlinburg and Wears Valley area with vacation rental interior design. Rustic-luxe cabin aesthetics and full furniture packages for new STR investors.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Design Studio', 'sarasota-str-design-studio', 'Gulf Coast vacation rental interiors',
  'Sarasota STR Design Studio creates coastal-luxury interiors for vacation rentals across Sarasota County. Sophisticated beach aesthetics, outdoor living spaces, and resort-level amenities.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Interior Design', 'siesta-key-str-interior-design', 'Siesta Key rental design studio',
  'Siesta Key STR Interior Design specializes in beachfront condo and vacation home interiors on Siesta and Lido Keys. White sand-inspired palettes and breezy coastal living spaces.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Design Studio', 'st-augustine-str-design-studio', 'Historic city vacation rental interiors',
  'St Augustine STR Design Studio creates vacation rental interiors that honor the city''s Spanish colonial heritage. Handmade tiles, warm earth tones, and courtyard living spaces for historic homes.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Interior Design', 'ponte-vedra-str-interior-design', 'Northeast Florida rental design',
  'Ponte Vedra STR Interior Design covers beach rentals from Ponte Vedra to St. Augustine with vacation rental interior design. Upscale coastal aesthetics and amenities that justify premium rates.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Interior Design', 'pensacola-str-interior-design', 'Emerald Coast vacation rental styling',
  'Pensacola STR Interior Design creates bright, beach-inspired interiors for vacation rentals across Pensacola Beach and Gulf Breeze. White and turquoise palettes, outdoor shower staging, and resort-quality linens.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Design FL', 'gulf-breeze-str-design-fl', 'Pensacola area rental interior design',
  'Gulf Breeze STR Design covers the greater Pensacola market with vacation rental interior design. Coastal Florida aesthetics, outdoor entertainment spaces, and full furnishing packages.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Design OR', 'cannon-beach-str-design-or', 'Oregon Coast vacation rental interiors',
  'Cannon Beach STR Design creates cozy Pacific Northwest interiors for beach houses and coastal cottages. Natural wood, storm-watching window seats, and warm textiles for Oregon Coast rentals.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Design', 'north-oregon-coast-str-design', 'Seaside area rental interior styling',
  'North Oregon Coast STR Design covers Seaside and the northern Oregon Coast with vacation rental interior design. Beachcomber-modern aesthetics and cozy indoor retreats for Pacific Coast rentals.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 50
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Design', 'tybee-island-str-design', 'Georgia coast vacation rental interiors',
  'Tybee Island STR Design creates charming, laid-back beach house interiors for Tybee Island vacation rentals. Southern coastal style, front porch staging, and breezy guest-ready spaces.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Interior Design', 'savannah-str-interior-design', 'Savannah and coastal Georgia design',
  'Savannah STR Interior Design covers downtown Savannah vacation homes and Tybee Island beach cottages with interior design. Historic Savannah elegance and coastal Georgia casual beautifully blended.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Design', 'kiawah-island-str-design', 'Luxury Lowcountry rental interior styling',
  'Kiawah Island STR Design specializes in luxury vacation rental interiors for Kiawah and Seabrook Islands. Resort-level furnishings, Lowcountry art, and pristine golf villa aesthetics.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 83
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Design SC', 'lowcountry-str-design-sc', 'Charleston Sea Islands rental design',
  'Lowcountry STR Design SC covers Johns Island and the Charleston Sea Islands with vacation rental interior design. Plantation aesthetic, live oak motifs, and Southern coastal sophistication.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Interior Design', 'golden-isles-str-interior-design', 'St. Simons vacation rental styling',
  'Golden Isles STR Interior Design creates interiors for vacation rentals on St. Simons Island that celebrate the Golden Isles coastal character. Moss oak motifs, soft sand tones, and maritime details.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Design', 'brunswick-ga-str-design', 'Glynn County vacation rental interiors',
  'Brunswick GA STR Design covers the Golden Isles market with vacation rental interior design. Coastal Georgia charm, barrier island aesthetics, and guest-experience-first styling.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Interior Design', 'chattanooga-str-interior-design', 'Scenic city vacation rental styling',
  'Chattanooga STR Interior Design creates sophisticated interiors for downtown lofts, mountain retreats, and waterfront vacation rentals. Industrial-modern and outdoor-adventure aesthetics.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lookout Mountain STR Design', 'lookout-mountain-str-design', 'Greater Chattanooga rental design studio',
  'Lookout Mountain STR Design covers the mountain communities above Chattanooga with vacation rental interior design. Ridge-view staging and Tennessee mountain-modern aesthetics.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Design TX', 'hill-country-str-design-tx', 'Fredericksburg vacation rental interiors',
  'Hill Country STR Design creates wine-country interiors for vacation rentals throughout Gillespie County. German heritage details, vineyard views framed beautifully, and Texas Hill Country modern aesthetic.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.9, 93
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Design Studio TX', 'kerrville-str-design-studio-tx', 'Kerr County rental interior styling',
  'Kerrville STR Design Studio creates Texas Hill Country cabin and river retreat interiors for Kerrville area vacation rentals. Natural cedar, limestone accents, and river-view staging.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal River STR Design TX', 'comal-river-str-design-tx', 'New Braunfels vacation rental interiors',
  'Comal River STR Design creates fun, durable interiors for New Braunfels river house vacation rentals. Waterproof-friendly materials, Texas Hill Country palettes, and spaces guests want to share on Instagram.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 107
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Interior Design TX', 'gruene-str-interior-design-tx', 'Gruene and New Braunfels design studio',
  'Gruene STR Interior Design covers the Gruene neighborhood and greater New Braunfels with vacation rental interior design. Historic Texas charm blended with modern guest comfort standards.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Interior Design', 'lake-cda-str-interior-design', 'Coeur d Alene vacation rental styling',
  'Lake CDA STR Interior Design creates mountain-modern interiors for lakefront homes and condos throughout Coeur d''Alene. Pacific Northwest materials, lake views maximized, and resort-quality furnishings.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Design', 'north-idaho-str-design', 'Kootenai County rental interior design',
  'North Idaho STR Design covers Coeur d''Alene and Post Falls with vacation rental interior design. Idaho mountain lodge aesthetics and lake property staging for premium guest experiences.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Design WI', 'lake-geneva-str-design-wi', 'Walworth County vacation rental interiors',
  'Lake Geneva STR Design creates charming Midwestern lake cottage interiors for vacation rentals along Geneva Lake. Victorian summer house aesthetics and lakeside living spaces for the Chicago getaway market.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Interior Design', 'geneva-lake-str-interior-design', 'Lake Geneva area rental design studio',
  'Geneva Lake STR Interior Design covers Williams Bay and the western Geneva Lake shoreline with vacation rental interior design. Wisconsin lake cottage charm and premium guest-ready staging.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;
