-- Migration 037: Tier 6 vendor seeds — maintenance-repairs + property-management
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: maintenance-repairs
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Maintenance Co', 'maui-str-maintenance-co', 'Valley Isle vacation rental repair pros',
  'Maui STR Maintenance Co handles HVAC service, plumbing repairs, and appliance fixes for short-term rentals across West and South Maui. Licensed contractors with rapid response.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Property Fix Maui', 'kihei-property-fix-maui', 'South Maui rental property repairs',
  'Kihei Property Fix Maui covers South Maui short-term rentals with fast maintenance response. Salt-air corrosion specialists, AC repairs, and hurricane preparedness inspections.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Repair Crew', 'oahu-str-repair-crew', 'Honolulu vacation rental maintenance',
  'Oahu STR Repair Crew serves short-term rental owners across Honolulu with licensed plumbing, electrical, and HVAC services. Island building code expertise and fast turnaround.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windward Oahu Property Repair', 'windward-oahu-property-repair', 'Kailua STR maintenance services',
  'Windward Oahu Property Repair covers Kailua and Kaneohe rental properties with comprehensive maintenance. Ocean-air weatherproofing, roof inspections, and appliance repair.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai Rental Maintenance', 'kauai-rental-maintenance', 'Garden Isle STR repair experts',
  'Kauai Rental Maintenance handles plumbing, electrical, and structural repairs for vacation rentals across Princeville, Poipu, and the North Shore. Tropical climate specialists.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Fix Team', 'poipu-str-fix-team', 'South Kauai rental property repairs',
  'Poipu STR Fix Team covers South Shore Kauai vacation rentals with fast repair response. AC maintenance, oceanfront deck repairs, and emergency plumbing for rental owners.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Maintenance', 'big-island-str-maintenance', 'Hawaii Island rental repair services',
  'Big Island STR Maintenance covers Kona Coast vacation rentals with licensed plumbing, electrical, and HVAC maintenance. Lava zone building expertise and off-grid system repairs.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo Property Repair HI', 'hilo-property-repair-hi', 'East Hawaii STR maintenance',
  'Hilo Property Repair HI serves vacation rental owners in the Hilo and Puna districts with comprehensive maintenance. High-rainfall climate specialists and emergency storm repairs.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.6, 49
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Maintenance UT', 'moab-str-maintenance-ut', 'Canyon country rental repair pros',
  'Moab STR Maintenance UT handles repairs for vacation rentals in the desert Southwest. AC and swamp cooler service, well pump repairs, and off-grid system maintenance for remote properties.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Property Fix', 'red-rock-property-fix', 'Moab area vacation rental repairs',
  'Red Rock Property Fix covers Moab and surrounding canyon country with fast vacation rental maintenance. Desert climate HVAC, septic systems, and structural repairs for remote glamping sites.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Maintenance', 'santa-fe-str-maintenance', 'Adobe home vacation rental repairs',
  'Santa Fe STR Maintenance specializes in adobe structure maintenance, radiant heat systems, and traditional New Mexico building repairs for vacation rental properties throughout the City Different.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Repair NM', 'high-desert-repair-nm', 'Northern New Mexico STR maintenance',
  'High Desert Repair NM covers Santa Fe and surrounding areas with licensed plumbing, electrical, and HVAC services. High-altitude freeze protection and radiant heating specialists.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Maintenance NM', 'taos-str-maintenance-nm', 'Mountain vacation rental repairs',
  'Taos STR Maintenance NM handles repairs for ski chalets, mountain cabins, and adobe casitas throughout Taos County. Snowload roof inspections, boiler service, and freeze-pipe prevention.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Mountain Fix Co', 'taos-mountain-fix-co', 'Taos area rental property repairs',
  'Taos Mountain Fix Co covers Taos and El Prado with vacation rental maintenance and repair. High-altitude climate expertise, wood stove service, and emergency winter repairs.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.6, 47
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Maintenance VT', 'stowe-str-maintenance-vt', 'Vermont ski lodge repair experts',
  'Stowe STR Maintenance VT handles ski season emergencies and year-round maintenance for vacation rentals throughout the Stowe corridor. Boiler service, snowmelt systems, and freeze prevention.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain Repair VT', 'green-mountain-repair-vt', 'Lamoille Valley STR maintenance',
  'Green Mountain Repair VT covers Stowe and Morrisville with vacation rental maintenance. Vermont winter specialists — furnace repair, pipe freeze prevention, and roof snow load management.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Maintenance', 'catskills-str-maintenance', 'Upstate NY cabin repair services',
  'Catskills STR Maintenance handles repairs for A-frames, farmhouses, and mountain retreats throughout Ulster and Sullivan Counties. Well pumps, septic systems, and heating repair.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia Property Fix NY', 'phoenicia-property-fix-ny', 'Southern Catskills rental repairs',
  'Phoenicia Property Fix NY covers the Esopus Valley and surrounding Catskills with vacation rental maintenance. Remote cabin specialists with emergency response service.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Maintenance', 'finger-lakes-str-maintenance', 'Wine country rental property repairs',
  'Finger Lakes STR Maintenance covers lakefront cottages, winery guesthouses, and vacation rentals throughout the Finger Lakes region. Lake house dock repairs and winterization specialists.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Schuyler County Property Fix', 'schuyler-county-property-fix', 'Southern Finger Lakes STR repairs',
  'Schuyler County Property Fix covers Watkins Glen and the southern Finger Lakes with vacation rental maintenance. Dock repair, boathouse maintenance, and heating system service.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Maintenance', 'hudson-valley-str-maintenance', 'Historic home vacation rental repairs',
  'Hudson Valley STR Maintenance handles repairs for historic farmhouses, converted barns, and estate homes throughout Ulster and Dutchess Counties. Old-house specialists with modern solutions.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County Property Fix', 'dutchess-county-property-fix', 'Rhinebeck area STR maintenance',
  'Dutchess County Property Fix covers Rhinebeck and mid-Hudson Valley vacation rentals with comprehensive maintenance. Historic estate and converted barn specialists with licensed contractors.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Beavers Bend STR Maintenance', 'beavers-bend-str-maintenance', 'Broken Bow cabin repair experts',
  'Beavers Bend STR Maintenance handles repairs for log cabins, glamping sites, and luxury retreats throughout McCurtain County. Hot tub repair, generator service, and storm damage recovery.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Property Repair', 'hochatown-property-repair', 'McCurtain County rental maintenance',
  'Hochatown Property Repair covers the Broken Bow and Hochatown area with vacation rental maintenance. Cabin HVAC, septic service, and outdoor living structure repairs.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Maintenance', 'ozarks-lake-str-maintenance', 'Missouri lake house repair services',
  'Ozarks Lake STR Maintenance handles dock repairs, boat lift maintenance, and full property upkeep for lake house vacation rentals across Lake of the Ozarks. Fast summer-season response.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark Property Fix MO', 'lake-ozark-property-fix-mo', 'Lake Ozark STR repair pros',
  'Lake Ozark Property Fix MO covers the mid-lake corridor with vacation rental maintenance. Waterfront structure specialists, HVAC service, and emergency repair for lake house owners.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Repair', 'smoky-mountain-str-repair', 'Pigeon Forge cabin maintenance experts',
  'Smoky Mountain STR Repair handles maintenance for cabins, chalets, and vacation rentals throughout the Pigeon Forge and Gatlinburg corridor. Hot tub repair, AC service, and emergency fixes.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County Property Repair', 'sevier-county-property-repair', 'Gatlinburg area STR maintenance',
  'Sevier County Property Repair covers the entire Gatlinburg to Pigeon Forge corridor with vacation rental maintenance. Mountain cabin specialists with surge capacity during peak season.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Maintenance FL', 'sarasota-str-maintenance-fl', 'Gulf Coast vacation rental repairs',
  'Sarasota STR Maintenance FL handles AC service, pool equipment repair, and property maintenance for vacation rentals across Sarasota, Siesta Key, and Longboat Key.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key Property Fix', 'siesta-key-property-fix', 'Siesta Key STR maintenance pros',
  'Siesta Key Property Fix covers beachfront condo and home repairs throughout Siesta and Lido Keys. Saltwater corrosion management, AC repair, and hurricane shutter installation.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Maintenance', 'st-augustine-str-maintenance', 'Historic city vacation rental repairs',
  'St Augustine STR Maintenance specializes in older home systems, cast iron plumbing, and historic structure repairs for vacation rentals in America''s oldest city. Respectful, code-compliant work.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Repair', 'ponte-vedra-str-repair', 'Northeast Florida rental maintenance',
  'Ponte Vedra STR Repair covers beach rentals from Ponte Vedra to St. Augustine Beach with comprehensive maintenance. Oceanfront home specialists with hurricane preparation packages.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Maintenance FL', 'pensacola-str-maintenance-fl', 'Northwest Florida rental repair services',
  'Pensacola STR Maintenance FL handles AC service, storm damage repair, and property maintenance for vacation rentals across Pensacola Beach, Gulf Breeze, and Perdido Key.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze Property Repair', 'gulf-breeze-property-repair', 'Pensacola area STR maintenance',
  'Gulf Breeze Property Repair covers the greater Pensacola market with vacation rental maintenance. Hurricane impact window installation, HVAC service, and flood damage repair.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Maintenance', 'cannon-beach-str-maintenance', 'Oregon Coast rental repair experts',
  'Cannon Beach STR Maintenance handles repairs for beach houses and coastal cottages on the North Oregon Coast. Storm damage response, moisture management, and coastal weatherproofing.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seaside OR Property Fix', 'seaside-or-property-fix', 'Northern Oregon Coast STR repairs',
  'Seaside OR Property Fix covers Seaside and the Clatsop County coast with vacation rental maintenance. Pacific storm repairs, waterproofing, and saltwater corrosion management.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Maintenance', 'tybee-island-str-maintenance', 'Georgia coast rental repair pros',
  'Tybee Island STR Maintenance handles beach cottage repairs, hurricane preparation, and property maintenance for vacation rentals on Tybee Island. Coastal Georgia specialists.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Property Repair', 'savannah-str-property-repair', 'Savannah area vacation rental maintenance',
  'Savannah STR Property Repair covers downtown Savannah historic rentals and Tybee Island beach properties with comprehensive maintenance. Historic home systems and coastal repair expertise.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Maintenance', 'kiawah-island-str-maintenance', 'Luxury Lowcountry rental repairs',
  'Kiawah Island STR Maintenance provides white-glove maintenance for luxury vacation rentals on Kiawah and Seabrook Islands. Golf villa systems, pool equipment, and oceanfront home repairs.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 88
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Johns Island Property Fix SC', 'johns-island-property-fix-sc', 'Charleston Sea Islands STR repair',
  'Johns Island Property Fix SC covers Johns Island and the greater Charleston Sea Islands with vacation rental maintenance. Lowcountry home specialists and hurricane preparation services.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Maintenance', 'golden-isles-str-maintenance', 'St. Simons rental repair experts',
  'Golden Isles STR Maintenance handles repairs for vacation rentals on St. Simons Island, Sea Island, and Jekyll Island. Barrier island climate specialists with storm response service.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA Property Repair', 'brunswick-ga-property-repair', 'Glynn County vacation rental maintenance',
  'Brunswick GA Property Repair covers the Golden Isles market with comprehensive STR maintenance. Coastal Georgia building specialists, AC service, and flood mitigation.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.6, 54
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Maintenance TN', 'chattanooga-str-maintenance-tn', 'Tennessee River city rental repairs',
  'Chattanooga STR Maintenance TN handles repairs for downtown lofts, mountain-view homes, and waterfront vacation rentals. HVAC, plumbing, and electrical for the greater Chattanooga market.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Signal Mountain Property Fix', 'signal-mountain-property-fix', 'Greater Chattanooga STR repairs',
  'Signal Mountain Property Fix covers mountain communities above Chattanooga with vacation rental maintenance. Ridgeline home specialists, generator service, and emergency storm repairs.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Repair TX', 'hill-country-str-repair-tx', 'Fredericksburg vacation rental maintenance',
  'Hill Country STR Repair TX handles maintenance for wine country cottages, ranch vacation rentals, and luxury retreats throughout Gillespie County. Propane systems and well pump specialists.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Maintenance TX', 'kerrville-str-maintenance-tx', 'Kerr County rental property repairs',
  'Kerrville STR Maintenance TX covers Kerrville and the Guadalupe River valley with vacation rental maintenance. River property specialists, AC service, and fence and deck repairs.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Maintenance', 'comal-county-str-maintenance', 'New Braunfels rental property repairs',
  'Comal County STR Maintenance handles repairs for river house rentals, resort properties, and vacation homes throughout New Braunfels. Water damage specialists for the tubing corridor.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Property Fix', 'gruene-str-property-fix', 'New Braunfels area rental maintenance',
  'Gruene STR Property Fix covers the Gruene neighborhood and greater New Braunfels with vacation rental maintenance. Historic structure repairs and Comal River flood recovery specialists.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Maintenance', 'lake-cda-str-maintenance', 'Coeur d Alene rental repair experts',
  'Lake CDA STR Maintenance handles repairs for lakefront homes, waterfront condos, and resort properties throughout Coeur d''Alene. Dock repair, winterization, and emergency response.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Repair', 'north-idaho-str-repair', 'Kootenai County vacation rental maintenance',
  'North Idaho STR Repair covers Coeur d''Alene and Post Falls with comprehensive STR maintenance. Mountain lake property specialists, heating systems, and winter storm preparation.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Maintenance WI', 'lake-geneva-str-maintenance-wi', 'Walworth County rental repair services',
  'Lake Geneva STR Maintenance WI handles repairs for lake cottages, vacation homes, and resort properties along Geneva Lake. Dock maintenance, boathouse repairs, and winterization.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Williams Bay Property Fix WI', 'williams-bay-property-fix-wi', 'Geneva Lake STR maintenance',
  'Williams Bay Property Fix WI covers the western Geneva Lake shoreline with vacation rental maintenance. Wisconsin winter specialists — furnace service, pipe protection, and dock winterization.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: property-management
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Property Managers', 'maui-str-property-managers', 'Full-service Maui vacation rental management',
  'Maui STR Property Managers provides full-service short-term rental management across West and South Maui. Dynamic pricing, guest communication, maintenance coordination, and compliance with Hawaii STR regulations.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental Mgmt', 'kihei-vacation-rental-mgmt', 'South Maui STR management services',
  'Kihei Vacation Rental Mgmt handles full-service property management for South Maui vacation rentals. Revenue optimization, cleaning coordination, and Maui County permit compliance.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu Vacation Rental Managers', 'oahu-vacation-rental-managers', 'Honolulu STR full-service management',
  'Oahu Vacation Rental Managers provides comprehensive short-term rental management across Honolulu. DPP permit assistance, dynamic pricing, and 24/7 guest support for Oahu property owners.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 103
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windward Side Property Mgmt', 'windward-side-property-mgmt', 'Kailua vacation rental management',
  'Windward Side Property Mgmt manages short-term rentals across the Kailua and Kaneohe market. Hawaii STR compliance, revenue management, and full-service guest relations.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 79
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Management Co', 'kauai-str-management-co', 'Garden Isle vacation rental managers',
  'Kauai STR Management Co provides full-service property management for vacation rentals across Princeville, Poipu, and the North Shore. Kauai County TVR compliance and revenue optimization.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 87
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Shore Kauai Property Mgmt', 'south-shore-kauai-property-mgmt', 'Poipu STR management services',
  'South Shore Kauai Property Mgmt handles Poipu and Koloa vacation rental management. Full-service from licensing to guest checkout, with Hawaii GET/TAT remittance included.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Management', 'big-island-str-management', 'Hawaii Island vacation rental managers',
  'Big Island STR Management provides full-service short-term rental management across the Kona Coast and beyond. Dynamic pricing, Hawaii County compliance, and property care for absentee owners.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Rental Managers', 'hilo-str-rental-managers', 'East Hawaii vacation rental management',
  'Hilo STR Rental Managers covers vacation rental properties in the Hilo and Puna districts with full-service management. Hawaii STR regulations, GET/TAT remittance, and 24/7 guest support.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Management UT', 'moab-str-management-ut', 'Canyon country vacation rental managers',
  'Moab STR Management UT handles full-service short-term rental management in Grand County. Revenue optimization, Grand County STR permit compliance, and maintenance coordination for remote owners.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Rental Managers', 'red-rock-rental-managers', 'Moab area STR property management',
  'Red Rock Rental Managers provides comprehensive vacation rental management for Moab and surrounding canyon country. Dynamic pricing, guest screening, and regulatory compliance.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Management', 'santa-fe-str-management', 'City Different vacation rental managers',
  'Santa Fe STR Management handles full-service short-term rental management across Santa Fe County. City permit compliance, luxury property expertise, and maximum revenue generation.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Property Mgmt NM', 'high-desert-property-mgmt-nm', 'Northern New Mexico STR managers',
  'High Desert Property Mgmt NM manages vacation rentals across Santa Fe and surrounding communities. Adobe home expertise, STR licensing assistance, and full-service guest management.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Management NM', 'taos-str-management-nm', 'Mountain vacation rental managers',
  'Taos STR Management NM provides full-service short-term rental management for ski chalets, casitas, and mountain retreats throughout Taos County. Year-round revenue optimization.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley Rental Mgmt', 'taos-valley-rental-mgmt', 'Taos area STR property management',
  'Taos Valley Rental Mgmt covers Taos and El Prado with full-service vacation rental management. Ski season surge pricing, annual STR permit renewals, and cleaning team coordination.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Management VT', 'stowe-str-management-vt', 'Vermont ski resort rental managers',
  'Stowe STR Management VT handles full-service short-term rental management for ski chalets and mountain vacation homes. Ski-season dynamic pricing and Vermont Act 250 compliance.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lamoille Valley Property Mgmt', 'lamoille-valley-property-mgmt', 'Stowe area STR management',
  'Lamoille Valley Property Mgmt covers Stowe and Morrisville with full-service vacation rental management. Foliage and ski season revenue maximization, property care, and 24/7 guest relations.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Management', 'catskills-str-management', 'Upstate NY vacation rental managers',
  'Catskills STR Management provides full-service property management for A-frames, cabins, and farmhouses across Ulster and Sullivan Counties. NYC weekend market optimization and local regulation compliance.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 106
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia Valley Property Mgmt', 'phoenicia-valley-property-mgmt', 'Southern Catskills STR managers',
  'Phoenicia Valley Property Mgmt covers Phoenicia and the Esopus corridor with full-service vacation rental management. Weekend surge pricing, cleaning coordination, and guest screening.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Management', 'finger-lakes-str-management', 'Wine country vacation rental managers',
  'Finger Lakes STR Management provides full-service property management for lakefront cottages and winery guesthouses across the Finger Lakes region. Revenue optimization for the wine tourism market.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake Rental Mgmt', 'seneca-lake-rental-mgmt', 'Schuyler County STR property management',
  'Seneca Lake Rental Mgmt covers the Watkins Glen area with full-service vacation rental management. Wine trail event surge pricing, dock rental add-ons, and guest experience management.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Management', 'hudson-valley-str-management', 'River valley vacation rental managers',
  'Hudson Valley STR Management provides full-service property management for farmhouses, barns, and historic estates throughout Ulster and Dutchess Counties. NYC weekend market experts.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 101
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Managers', 'dutchess-county-str-managers', 'Rhinebeck area STR management',
  'Dutchess County STR Managers covers the Rhinebeck and mid-Hudson Valley market with full-service vacation rental management. Estate and boutique property specialists.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Management', 'broken-bow-str-management', 'Oklahoma cabin vacation rental managers',
  'Broken Bow STR Management provides full-service property management for log cabins and luxury retreats throughout McCurtain County. Dynamic pricing, guest vetting, and maintenance coordination.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 121
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Property Managers', 'hochatown-property-managers', 'McCurtain County STR management',
  'Hochatown Property Managers covers Hochatown and the Broken Bow market with full-service vacation rental management. Cabin property experts maximizing revenue in Oklahoma''s top STR destination.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 94
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Management', 'ozarks-lake-str-management', 'Missouri lake house rental managers',
  'Ozarks Lake STR Management provides full-service property management for lake houses and vacation rentals across Lake of the Ozarks. Revenue optimization for the summer boating market.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark Rental Managers MO', 'lake-ozark-rental-managers-mo', 'Lake Ozark STR management services',
  'Lake Ozark Rental Managers MO covers the mid-lake area with full-service vacation rental management. Boat slip rental coordination, party house policies, and dynamic summer pricing.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Rental Mgmt', 'smoky-mountain-rental-mgmt', 'Pigeon Forge STR property managers',
  'Smoky Mountain Rental Mgmt provides full-service vacation rental management throughout the Pigeon Forge and Gatlinburg corridor. Revenue optimization for one of America''s top STR markets.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 128
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Managers', 'sevier-county-str-managers', 'Gatlinburg area vacation rental management',
  'Sevier County STR Managers handles full-service management for Smoky Mountain cabins and chalets. Dynamic peak-season pricing, maintenance coordination, and 24/7 guest communication.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 107
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Management FL', 'sarasota-str-management-fl', 'Gulf Coast vacation rental managers',
  'Sarasota STR Management FL provides full-service property management for beachfront homes and luxury vacation rentals across Sarasota County. Revenue optimization for the seasonal Florida market.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key Property Managers', 'siesta-key-property-managers', 'Siesta Key STR management services',
  'Siesta Key Property Managers specializes in beachfront condo and vacation home management on Siesta and Lido Keys. Florida SB 280 compliance, hurricane preparation, and season-based pricing.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Management', 'st-augustine-str-management', 'Ancient city vacation rental managers',
  'St Augustine STR Management handles full-service property management for historic homes, beach rentals, and vacation properties in St. Johns County. Florida STR compliance and revenue optimization.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Managers', 'ponte-vedra-str-managers', 'Northeast Florida rental management',
  'Ponte Vedra STR Managers covers beach rentals from Ponte Vedra to St. Augustine with full-service property management. Ocean-view property specialists and seasonal pricing experts.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Management FL', 'pensacola-str-management-fl', 'Northwest Florida vacation rental managers',
  'Pensacola STR Management FL provides full-service property management for beach rentals across Pensacola Beach, Gulf Breeze, and Perdido Key. Summer surge pricing and hurricane preparation.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze Rental Managers', 'gulf-breeze-rental-managers', 'Pensacola area STR management services',
  'Gulf Breeze Rental Managers covers the greater Pensacola market with full-service vacation rental management. Military relocation and vacation home management specialists.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Management', 'cannon-beach-str-management', 'Oregon Coast vacation rental managers',
  'Cannon Beach STR Management provides full-service property management for beach houses and coastal rentals on the North Oregon Coast. Clatsop County STR permit compliance and revenue optimization.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Coast Oregon Rental Mgmt', 'north-coast-oregon-rental-mgmt', 'Seaside area STR property management',
  'North Coast Oregon Rental Mgmt covers Seaside and the northern Oregon Coast with full-service vacation rental management. Off-season optimization and storm-season maintenance coordination.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Management', 'tybee-island-str-management', 'Georgia coast vacation rental managers',
  'Tybee Island STR Management provides full-service property management for beach cottages and vacation rentals on Tybee Island. Chatham County compliance and summer season optimization.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah Coastal STR Managers', 'savannah-coastal-str-managers', 'Savannah and Tybee rental management',
  'Savannah Coastal STR Managers covers downtown Savannah vacation homes and Tybee Island beach rentals with full-service property management. Historic and coastal property specialists.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Management', 'kiawah-island-str-management', 'Luxury Lowcountry rental managers',
  'Kiawah Island STR Management specializes in luxury vacation rental management for Kiawah and Seabrook Islands. White-glove service for golf villas and oceanfront estates with maximum revenue generation.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 97
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Managers SC', 'lowcountry-str-managers-sc', 'Charleston Sea Islands rental management',
  'Lowcountry STR Managers SC covers Johns Island and the greater Charleston Sea Islands with full-service vacation rental management. Charleston County STR compliance and revenue optimization.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Management', 'golden-isles-str-management', 'St. Simons vacation rental managers',
  'Golden Isles STR Management provides full-service property management for vacation rentals on St. Simons Island, Sea Island, and Jekyll Island. Glynn County compliance and coastal property expertise.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA Rental Managers', 'brunswick-ga-rental-managers', 'Glynn County STR management services',
  'Brunswick GA Rental Managers covers the Golden Isles market from the mainland with full-service vacation rental management. Remote owner specialists and Golden Isles market expertise.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Management TN', 'chattanooga-str-management-tn', 'Scenic city vacation rental managers',
  'Chattanooga STR Management TN provides full-service property management for downtown lofts, mountain cabins, and waterfront vacation rentals. Hamilton County compliance and revenue optimization.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City Rental Managers', 'scenic-city-rental-managers', 'Greater Chattanooga STR management',
  'Scenic City Rental Managers covers the Chattanooga metro and surrounding mountain communities with full-service vacation rental management. Outdoor adventure market revenue optimization.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Management TX', 'hill-country-str-management-tx', 'Fredericksburg vacation rental managers',
  'Hill Country STR Management TX provides full-service property management for wine country cottages and ranch vacation rentals throughout Gillespie County. Texas STR compliance and revenue optimization.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Managers TX', 'kerrville-str-managers-tx', 'Kerr County vacation rental management',
  'Kerrville STR Managers TX covers Kerrville and the Guadalupe Valley with full-service vacation rental management. River retreat and ranch property specialists with Texas Hill Country expertise.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Management', 'comal-county-str-management', 'New Braunfels vacation rental managers',
  'Comal County STR Management provides full-service property management for river houses and vacation rentals in the New Braunfels market. Summer tubing surge pricing and Comal County compliance.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Rental Managers', 'gruene-str-rental-managers', 'Gruene and New Braunfels STR management',
  'Gruene STR Rental Managers covers the Gruene historic district and greater New Braunfels with full-service vacation rental management. River property specialists and Texas short-term rental experts.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Management', 'lake-cda-str-management', 'Coeur d Alene vacation rental managers',
  'Lake CDA STR Management provides full-service property management for lakefront homes and waterfront condos throughout Coeur d''Alene. Idaho STR compliance and North Idaho market expertise.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho Rental Managers', 'north-idaho-rental-managers', 'Kootenai County STR management services',
  'North Idaho Rental Managers covers Coeur d''Alene and Post Falls with full-service vacation rental management. Mountain lake property specialists and Spokane overflow market experts.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Management WI', 'lake-geneva-str-management-wi', 'Walworth County vacation rental managers',
  'Lake Geneva STR Management WI provides full-service property management for lake cottages and vacation homes along Geneva Lake. Wisconsin STR compliance and Chicago weekend market optimization.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake Rental Managers WI', 'geneva-lake-rental-managers-wi', 'Lake Geneva area STR management',
  'Geneva Lake Rental Managers WI covers Williams Bay and the western Geneva Lake shoreline with full-service vacation rental management. Lakefront property specialists and Walworth County compliance.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;
