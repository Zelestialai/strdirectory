-- Migration 041: Tier 6 vendor seeds — smart-home-tech + legal-regulations
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: smart-home-tech
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Smart Home Co', 'maui-str-smart-home-co', 'Hawaii vacation rental smart technology',
  'Maui STR Smart Home Co installs keyless entry, noise monitoring, occupancy sensors, and smart thermostats for vacation rentals across the Valley Isle. Remote management tools for offsite Hawaii owners.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei STR Tech Solutions', 'kihei-str-tech-solutions', 'South Maui vacation rental automation',
  'Kihei STR Tech Solutions provides smart lock installation, WiFi optimization, and automated check-in systems for South Maui vacation rentals. Remote monitoring for mainland owners.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 34
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Smart Home Tech', 'oahu-str-smart-home-tech', 'Honolulu vacation rental automation',
  'Oahu STR Smart Home Tech installs and manages smart home systems for vacation rentals across Honolulu. Keyless entry, noise monitoring, smart AC controls, and remote property management technology.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Tech HI', 'kailua-str-tech-hi', 'Windward Oahu rental smart technology',
  'Kailua STR Tech provides smart home installations for vacation rentals across the Windward Coast. Smart locks, noise sensors, and automated guest communication systems for Oahu property owners.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Smart Home', 'kauai-str-smart-home', 'Garden Isle vacation rental technology',
  'Kauai STR Smart Home installs keyless entry, noise monitoring, and remote management systems for vacation rentals across Princeville, Poipu, and the North Shore. Essential tools for remote Kauai owners.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 49
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Tech Kauai', 'poipu-str-tech-kauai', 'South Kauai vacation rental automation',
  'Poipu STR Tech provides smart home installations for South Shore Kauai vacation rentals. Smart locks, AC scheduling, and remote monitoring for absentee owners managing from the mainland.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 35
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Smart Tech', 'big-island-str-smart-tech', 'Hawaii Island vacation rental technology',
  'Big Island STR Smart Tech installs smart home systems for vacation rentals across the Kona Coast. Keyless entry, noise monitoring, off-grid solar monitoring, and remote management platforms.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 52
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Tech HI', 'hilo-str-tech-hi', 'East Hawaii vacation rental automation',
  'Hilo STR Tech provides smart home installations for vacation rentals in the Hilo and Puna districts. Smart locks, humidity monitoring for tropical climates, and remote management tools.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.6, 35
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Smart Home UT', 'moab-str-smart-home-ut', 'Canyon country vacation rental technology',
  'Moab STR Smart Home installs keyless entry, noise monitoring, and remote management systems for vacation rentals in Grand County. Desert climate AC scheduling and smart water leak detection.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Tech UT', 'red-rock-str-tech-ut', 'Moab area vacation rental automation',
  'Red Rock STR Tech covers Moab vacation rental owners with smart home installations. Swamp cooler automation, smart locks, and satellite internet solutions for remote canyon country properties.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 42
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Smart Home', 'santa-fe-str-smart-home', 'New Mexico vacation rental technology',
  'Santa Fe STR Smart Home installs keyless entry, smart thermostats for radiant heat systems, and remote monitoring for vacation rentals throughout Santa Fe County. Adobe home technology specialists.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Tech NM', 'high-desert-str-tech-nm', 'Northern NM vacation rental automation',
  'High Desert STR Tech covers Santa Fe vacation rental owners with smart home installations. Evaporative cooler controls, freeze-sensor alerts, and comprehensive remote property management.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Smart Home NM', 'taos-str-smart-home-nm', 'Mountain vacation rental technology',
  'Taos STR Smart Home installs smart locks, boiler monitoring, freeze alerts, and remote management systems for ski chalets and vacation rentals throughout Taos County. High-altitude tech specialists.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 53
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley STR Tech', 'taos-valley-str-tech', 'Taos area vacation rental automation',
  'Taos Valley STR Tech covers Taos and El Prado with smart home technology installations. Mountain property remote monitoring, smart fireplace controls, and keyless entry for ski property owners.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 38
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Smart Home VT', 'stowe-str-smart-home-vt', 'Vermont ski resort rental technology',
  'Stowe STR Smart Home installs boiler monitoring, freeze-pipe alerts, smart locks, and ski-season automation for vacation rentals throughout Lamoille County. Essential tech for Vermont ski property owners.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Tech VT', 'green-mountain-str-tech-vt', 'Stowe area vacation rental automation',
  'Green Mountain STR Tech covers Stowe and Morrisville with smart home installations. Vermont winter freeze protection technology, smart locks, and remote property monitoring for ski chalet owners.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Smart Home NY', 'catskills-str-smart-home-ny', 'Upstate NY vacation rental technology',
  'Catskills STR Smart Home installs smart locks, noise monitors, and remote management systems for A-frames and mountain rentals across Ulster and Sullivan Counties. Off-grid property tech specialists.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Tech NY', 'phoenicia-str-tech-ny', 'Southern Catskills vacation rental automation',
  'Phoenicia STR Tech covers the Esopus Valley and southern Catskills with smart home installations. Remote cabin monitoring, well pump alerts, and smart locks for weekend vacation rentals.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Smart Home', 'finger-lakes-str-smart-home', 'Wine country vacation rental technology',
  'Finger Lakes STR Smart Home provides smart lock installation, noise monitoring, and remote management systems for lakefront cottages and winery guesthouses throughout the Finger Lakes region.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Tech', 'seneca-lake-str-tech', 'Schuyler County vacation rental automation',
  'Seneca Lake STR Tech covers the Watkins Glen area with smart home installations. Lakefront property remote monitoring, dock access systems, and smart lock setup for Finger Lakes rental owners.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Smart Home', 'hudson-valley-str-smart-home', 'River valley vacation rental technology',
  'Hudson Valley STR Smart Home installs smart locks, noise monitors, and remote management systems for farmhouses and historic properties across Ulster and Dutchess Counties.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Tech', 'dutchess-county-str-tech', 'Rhinebeck area vacation rental automation',
  'Dutchess County STR Tech covers the Rhinebeck and mid-Hudson Valley area with smart home technology. Estate property remote monitoring, smart locks, and noise management for weekend rentals.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Smart Home OK', 'broken-bow-str-smart-home-ok', 'Oklahoma cabin vacation rental technology',
  'Broken Bow STR Smart Home installs smart locks, noise monitors, and remote management for log cabins throughout McCurtain County. Starlink installation for remote properties without reliable internet.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 91
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown STR Tech OK', 'hochatown-str-tech-ok', 'McCurtain County vacation rental automation',
  'Hochatown STR Tech covers Hochatown and the Broken Bow market with smart home technology. Cabin remote monitoring, smart locks, party-noise detection, and satellite internet for rural Oklahoma properties.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Smart Home', 'ozarks-lake-str-smart-home', 'Missouri lake house vacation rental tech',
  'Ozarks Lake STR Smart Home installs smart locks, noise monitors, and remote management systems for lake houses across Lake of the Ozarks. Water leak detection and dock access systems.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Tech MO', 'lake-ozark-str-tech-mo', 'Lake Ozark area vacation rental automation',
  'Lake Ozark STR Tech covers the mid-lake area with smart home installations. Lake house remote monitoring, party noise alerts, and smart lock setup for Missouri vacation rental owners.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Smart Home', 'smoky-mountain-str-smart-home', 'Tennessee cabin vacation rental technology',
  'Smoky Mountain STR Smart Home installs smart locks, noise monitors, and remote management systems for cabins throughout Sevier County. Hot tub monitoring and smart fireplace controls included.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 108
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Tech TN', 'sevier-county-str-tech-tn', 'Gatlinburg area vacation rental automation',
  'Sevier County STR Tech covers the Pigeon Forge and Gatlinburg corridor with smart home technology. Cabin noise monitoring, smart entry, and remote property management platforms for Smoky Mountain owners.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Smart Home FL', 'sarasota-str-smart-home-fl', 'Gulf Coast vacation rental technology',
  'Sarasota STR Smart Home installs smart locks, AC automation, noise monitors, and hurricane shutter controls for vacation rentals across Sarasota County. Remote management for seasonal Florida owners.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Tech FL', 'siesta-key-str-tech-fl', 'Siesta Key vacation rental automation',
  'Siesta Key STR Tech provides smart home installations for beachfront condos and vacation homes on Siesta and Lido Keys. Smart locks, noise monitoring, and pool/AC remote controls.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Smart Home', 'st-augustine-str-smart-home', 'Historic city vacation rental technology',
  'St Augustine STR Smart Home installs smart locks, noise monitors, and remote management systems for vacation rentals in St. Johns County. Historic home-compatible technology and keyless entry.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Tech FL', 'ponte-vedra-str-tech-fl', 'Northeast Florida vacation rental automation',
  'Ponte Vedra STR Tech covers beach rental owners from Ponte Vedra to St. Augustine with smart home installations. Coastal Florida smart systems, hurricane prep automation, and remote property management.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Smart Home FL', 'pensacola-str-smart-home-fl', 'Northwest Florida vacation rental technology',
  'Pensacola STR Smart Home installs smart locks, noise monitors, and hurricane preparation automation for vacation rentals across Escambia and Santa Rosa Counties. Remote management for absentee owners.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Tech FL', 'gulf-breeze-str-tech-fl', 'Pensacola area vacation rental automation',
  'Gulf Breeze STR Tech covers the greater Pensacola market with smart home technology. Coastal Florida STR automation, smart locks, and noise monitoring for military and vacation rental markets.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Smart Home OR', 'cannon-beach-str-smart-home-or', 'Oregon Coast vacation rental technology',
  'Cannon Beach STR Smart Home installs smart locks, noise monitors, and remote management systems for beach houses on the North Oregon Coast. Pacific storm alert systems and water leak detection.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Tech', 'north-oregon-coast-str-tech', 'Seaside area vacation rental automation',
  'North Oregon Coast STR Tech covers Seaside and the northern Oregon Coast with smart home installations. Coastal weather monitoring, smart locks, and remote property management platforms.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Smart Home', 'tybee-island-str-smart-home', 'Georgia coast vacation rental technology',
  'Tybee Island STR Smart Home installs smart locks, noise monitors, and hurricane preparation automation for vacation rentals on Tybee Island. Remote management for Georgia coastal property owners.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Tech GA', 'savannah-str-tech-ga', 'Savannah area vacation rental automation',
  'Savannah STR Tech covers downtown Savannah historic vacation homes and Tybee Island beach rentals with smart home technology. Historic-compatible keyless entry and noise monitoring.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Smart Home', 'kiawah-island-str-smart-home', 'Luxury Lowcountry vacation rental technology',
  'Kiawah Island STR Smart Home provides luxury smart home installations for vacation rentals on Kiawah and Seabrook Islands. Whole-home automation, resort-grade security, and remote property management.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 78
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Tech SC', 'lowcountry-str-tech-sc', 'Charleston Sea Islands vacation rental automation',
  'Lowcountry STR Tech covers Johns Island and the Charleston Sea Islands with smart home technology. Coastal South Carolina STR automation, smart locks, and hurricane prep systems.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 56
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Smart Home', 'golden-isles-str-smart-home', 'St. Simons vacation rental technology',
  'Golden Isles STR Smart Home installs smart locks, noise monitors, and remote management systems for vacation rentals on St. Simons Island, Sea Island, and Jekyll Island.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Tech', 'brunswick-ga-str-tech', 'Glynn County vacation rental automation',
  'Brunswick GA STR Tech covers the Golden Isles market with smart home technology. Coastal Georgia STR automation, smart locks, and remote monitoring for barrier island vacation rental owners.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 45
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Smart Home TN', 'chattanooga-str-smart-home-tn', 'Scenic city vacation rental technology',
  'Chattanooga STR Smart Home installs smart locks, noise monitors, and remote management systems for downtown lofts, mountain cabins, and waterfront vacation rentals throughout Hamilton County.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Tech TN', 'scenic-city-str-tech-tn', 'Greater Chattanooga vacation rental automation',
  'Scenic City STR Tech covers the Chattanooga metro and mountain communities with smart home technology. Outdoor adventure rental tech, remote monitoring, and smart lock systems for Tennessee STR owners.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Smart Home TX', 'hill-country-str-smart-home-tx', 'Fredericksburg vacation rental technology',
  'Hill Country STR Smart Home installs smart locks, outdoor security, and remote management systems for wine country cottages and ranch vacation rentals throughout Gillespie County.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Tech TX', 'kerrville-str-tech-tx', 'Kerr County vacation rental automation',
  'Kerrville STR Tech covers Kerrville and the Guadalupe Valley with smart home technology. River cabin remote monitoring, smart locks, and Texas Hill Country property automation.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal River STR Smart Home TX', 'comal-river-str-smart-home-tx', 'New Braunfels vacation rental technology',
  'Comal River STR Smart Home installs smart locks, noise monitors, and flood alert systems for river house vacation rentals in New Braunfels. Water level sensing and remote management for Comal River properties.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Tech TX', 'gruene-str-tech-tx', 'New Braunfels area vacation rental automation',
  'Gruene STR Tech covers the Gruene neighborhood and greater New Braunfels with smart home technology. River property smart systems, keyless entry, and remote management for Texas STR owners.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Smart Home', 'lake-cda-str-smart-home', 'Coeur d Alene vacation rental technology',
  'Lake CDA STR Smart Home installs smart locks, noise monitors, and remote management systems for lakefront homes and condos throughout Coeur d''Alene. Dock access systems and water level monitoring.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Tech', 'north-idaho-str-tech', 'Kootenai County vacation rental automation',
  'North Idaho STR Tech covers Coeur d''Alene and Post Falls with smart home technology. Mountain lake property remote monitoring, smart locks, and Idaho vacation rental automation systems.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 45
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Smart Home WI', 'lake-geneva-str-smart-home-wi', 'Walworth County vacation rental technology',
  'Lake Geneva STR Smart Home installs smart locks, noise monitors, and remote management systems for lake cottages and vacation homes along Geneva Lake. Dock access systems and Wisconsin winter freeze alerts.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Tech WI', 'geneva-lake-str-tech-wi', 'Lake Geneva area vacation rental automation',
  'Geneva Lake STR Tech covers Williams Bay and the western Geneva Lake shoreline with smart home technology. Wisconsin lake cottage remote monitoring and smart lock systems for Chicago-market rental owners.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 43
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: legal-regulations
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Legal Advisors', 'maui-str-legal-advisors', 'Hawaii vacation rental law specialists',
  'Maui STR Legal Advisors guides vacation rental owners through Maui County''s TVR permitting process, HAR compliance, and short-term rental litigation. Hawaii STR regulatory experts since the 2012 restrictions.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.9, 61
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental Law', 'kihei-vacation-rental-law', 'South Maui STR compliance counsel',
  'Kihei Vacation Rental Law provides TVR permit applications, compliance counsel, and STR litigation defense for vacation rental owners throughout South Maui. Maui County HAR 19-21 specialists.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.8, 43
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Legal Services', 'oahu-str-legal-services', 'Honolulu vacation rental law specialists',
  'Oahu STR Legal Services guides property owners through Honolulu''s complex STR permitting, DPP NonConforming Use Certificate applications, and vacation rental compliance. Hawaii STR law authorities.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Law HI', 'kailua-str-law-hi', 'Windward Oahu vacation rental counsel',
  'Kailua STR Law provides vacation rental compliance counsel for Windward Oahu property owners. Honolulu DPP permit guidance, NUC applications, and STR enforcement defense.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Legal Advisors', 'kauai-str-legal-advisors', 'Garden Isle vacation rental law',
  'Kauai STR Legal Advisors guides vacation rental owners through Kauai County TVR permitting, HAR compliance, and STR enforcement defense. Among Hawaii''s most regulated vacation rental markets.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.9, 67
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Law Kauai', 'poipu-str-law-kauai', 'South Kauai vacation rental compliance',
  'Poipu STR Law provides Kauai County TVR permit applications and compliance counsel for South Shore vacation rental owners. Comprehensive Hawaii STR regulatory guidance.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.8, 48
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Legal', 'big-island-str-legal', 'Hawaii Island vacation rental law',
  'Big Island STR Legal guides vacation rental owners through Hawaii County TVR permitting, lava zone compliance, and short-term rental regulatory issues. Big Island-specific legal expertise.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Law HI', 'hilo-str-law-hi', 'East Hawaii vacation rental compliance',
  'Hilo STR Law provides vacation rental compliance counsel for Hilo and Puna district property owners. Hawaii County STR permitting, HAR compliance, and regulatory enforcement defense.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 39
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Legal Advisors UT', 'moab-str-legal-advisors-ut', 'Grand County vacation rental law',
  'Moab STR Legal Advisors guides vacation rental owners through Grand County STR permitting, Utah short-term rental compliance, and regulatory enforcement defense. Moab''s growing regulatory landscape navigated.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Law UT', 'red-rock-str-law-ut', 'Moab area vacation rental compliance',
  'Red Rock STR Law provides vacation rental compliance counsel for Moab property owners. Grand County STR permits, Utah regulatory guidance, and enforcement defense for canyon country rentals.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Legal Services', 'santa-fe-str-legal-services', 'New Mexico vacation rental law',
  'Santa Fe STR Legal Services guides vacation rental owners through Santa Fe City and County STR licensing, New Mexico GRT compliance, and short-term rental enforcement defense.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Law NM', 'high-desert-str-law-nm', 'Northern NM vacation rental compliance',
  'High Desert STR Law covers Santa Fe vacation rental owners with New Mexico STR regulatory guidance. City permit applications, GRT compliance counsel, and enforcement defense.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Legal Advisors NM', 'taos-str-legal-advisors-nm', 'Taos vacation rental law specialists',
  'Taos STR Legal Advisors guides vacation rental owners through Taos County and Town of Taos STR permitting, New Mexico regulatory compliance, and enforcement defense for mountain rental properties.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley STR Law', 'taos-valley-str-law', 'Taos area vacation rental compliance',
  'Taos Valley STR Law provides STR compliance counsel for Taos and El Prado vacation rental owners. New Mexico short-term rental regulatory guidance and permit application assistance.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Legal Advisors VT', 'stowe-str-legal-advisors-vt', 'Vermont vacation rental law specialists',
  'Stowe STR Legal Advisors guides vacation rental owners through Vermont Act 250 compliance, Lamoille County STR regulations, and Vermont meals and rooms tax legal issues.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Law VT', 'green-mountain-str-law-vt', 'Stowe area vacation rental compliance',
  'Green Mountain STR Law covers Stowe and Morrisville vacation rental owners with Vermont regulatory guidance. STR permit applications, zoning compliance, and enforcement defense.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Legal Services', 'catskills-str-legal-services', 'Upstate NY vacation rental law',
  'Catskills STR Legal Services guides vacation rental owners through Ulster and Sullivan County STR regulations, New York State compliance, and local zoning enforcement defense.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Law NY', 'phoenicia-str-law-ny', 'Southern Catskills vacation rental compliance',
  'Phoenicia STR Law provides STR compliance counsel for vacation rental owners throughout the Esopus Valley and southern Catskills. New York town-level STR regulation navigation.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Legal', 'finger-lakes-str-legal', 'Wine country vacation rental law',
  'Finger Lakes STR Legal guides vacation rental owners through New York State STR regulations, local town permits across multiple counties, and short-term rental compliance and enforcement defense.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Law', 'seneca-lake-str-law', 'Schuyler County vacation rental compliance',
  'Seneca Lake STR Law covers vacation rental owners in the Watkins Glen area with New York STR regulatory guidance. Schuyler County permit applications and enforcement defense.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Legal', 'hudson-valley-str-legal', 'River valley vacation rental law',
  'Hudson Valley STR Legal guides vacation rental owners from Kingston to Hudson through New York STR regulations, Ulster and Dutchess County permits, and zoning enforcement defense.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Law', 'dutchess-county-str-law', 'Rhinebeck area vacation rental compliance',
  'Dutchess County STR Law covers the Rhinebeck and mid-Hudson Valley area with vacation rental compliance counsel. New York STR permit navigation and local town regulation guidance.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Legal OK', 'broken-bow-str-legal-ok', 'Oklahoma vacation rental law specialists',
  'Broken Bow STR Legal guides cabin owners through McCurtain County STR permitting, Oklahoma lodging tax compliance, and short-term rental enforcement defense. Oklahoma''s top cabin market specialists.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 93
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown STR Law OK', 'hochatown-str-law-ok', 'McCurtain County vacation rental compliance',
  'Hochatown STR Law provides compliance counsel for cabin owners throughout Broken Bow and Hochatown. Oklahoma short-term rental regulations, lodging tax guidance, and enforcement defense.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Legal', 'ozarks-lake-str-legal', 'Missouri lake house vacation rental law',
  'Ozarks Lake STR Legal guides lake house owners through Missouri STR regulations, Camden and Morgan County permits, and short-term rental compliance counsel for Lake of the Ozarks properties.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Law MO', 'lake-ozark-str-law-mo', 'Lake Ozark area vacation rental compliance',
  'Lake Ozark STR Law provides vacation rental compliance counsel for the mid-lake corridor. Missouri short-term rental regulations, HOA compliance, and lake house STR enforcement defense.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Legal', 'smoky-mountain-str-legal', 'Tennessee vacation rental law specialists',
  'Smoky Mountain STR Legal guides cabin owners through Sevier County STR permits, Tennessee regulatory compliance, and short-term rental enforcement defense. One of the nation''s busiest STR markets.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 116
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Law TN', 'sevier-county-str-law-tn', 'Gatlinburg area vacation rental compliance',
  'Sevier County STR Law covers the Pigeon Forge and Gatlinburg corridor with vacation rental compliance counsel. Tennessee STR regulations, HOA compliance, and enforcement defense for cabin owners.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 93
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Legal Services FL', 'sarasota-str-legal-services-fl', 'Gulf Coast vacation rental law',
  'Sarasota STR Legal Services guides vacation rental owners through Florida SB 280 compliance, Sarasota County STR licensing, and short-term rental enforcement defense for Gulf Coast properties.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 99
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Law FL', 'siesta-key-str-law-fl', 'Siesta Key vacation rental compliance',
  'Siesta Key STR Law provides vacation rental compliance counsel for beachfront condo and home owners on Siesta and Lido Keys. Florida STR preemption law and HOA STR restriction defense.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Legal FL', 'st-augustine-str-legal-fl', 'Ancient city vacation rental law',
  'St Augustine STR Legal guides vacation rental owners through Florida STR licensing, St. Johns County regulations, and historic district compliance. America''s oldest city STR law specialists.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Law FL', 'ponte-vedra-str-law-fl', 'Northeast Florida vacation rental compliance',
  'Ponte Vedra STR Law covers beach rental owners from Ponte Vedra to St. Augustine with Florida STR regulatory guidance. Coastal county compliance counsel and enforcement defense.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Legal FL', 'pensacola-str-legal-fl', 'Northwest Florida vacation rental law',
  'Pensacola STR Legal guides vacation rental owners through Florida SB 280 compliance, Escambia and Santa Rosa County STR licensing, and short-term rental enforcement defense.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Law FL', 'gulf-breeze-str-law-fl', 'Pensacola area vacation rental compliance',
  'Gulf Breeze STR Law covers the greater Pensacola market with Florida vacation rental compliance counsel. Military community STR guidance and Emerald Coast short-term rental regulatory expertise.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Legal OR', 'cannon-beach-str-legal-or', 'Oregon Coast vacation rental law',
  'Cannon Beach STR Legal guides vacation rental owners through Clatsop County STR permitting, Oregon short-term rental compliance, and enforcement defense for North Oregon Coast properties.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Law', 'north-oregon-coast-str-law', 'Seaside area vacation rental compliance',
  'North Oregon Coast STR Law covers Seaside and the northern Oregon Coast with vacation rental compliance counsel. Oregon STR regulations, local permit guidance, and enforcement defense.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Legal', 'tybee-island-str-legal', 'Georgia coast vacation rental law',
  'Tybee Island STR Legal guides vacation rental owners through Chatham County STR permitting, Georgia regulatory compliance, and short-term rental enforcement defense for coastal Georgia properties.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Law GA', 'savannah-str-law-ga', 'Savannah and coastal Georgia rental compliance',
  'Savannah STR Law covers downtown Savannah vacation homes and Tybee Island beach rentals with Georgia STR regulatory guidance. Historic district compliance and coastal county permit navigation.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Legal', 'kiawah-island-str-legal', 'Luxury Lowcountry vacation rental law',
  'Kiawah Island STR Legal guides luxury vacation rental owners through Charleston County STR licensing, Kiawah Island HOA STR restrictions, and South Carolina regulatory compliance.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 79
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Law SC', 'lowcountry-str-law-sc', 'Charleston Sea Islands vacation rental compliance',
  'Lowcountry STR Law covers Johns Island and the Charleston Sea Islands with South Carolina STR regulatory guidance. Charleston County permit applications and coastal community HOA compliance.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Legal', 'golden-isles-str-legal', 'St. Simons vacation rental law',
  'Golden Isles STR Legal guides vacation rental owners through Glynn County STR permitting, Georgia regulatory compliance, and enforcement defense for barrier island vacation properties.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Law', 'brunswick-ga-str-law', 'Glynn County vacation rental compliance',
  'Brunswick GA STR Law covers the Golden Isles market with Georgia vacation rental compliance counsel. Barrier island STR regulations, Glynn County permits, and enforcement defense.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Legal TN', 'chattanooga-str-legal-tn', 'Scenic city vacation rental law',
  'Chattanooga STR Legal guides vacation rental owners through Hamilton County STR permits, Tennessee regulatory compliance, and short-term rental enforcement defense for Chattanooga properties.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Law TN', 'scenic-city-str-law-tn', 'Greater Chattanooga vacation rental compliance',
  'Scenic City STR Law covers the Chattanooga metro with Tennessee vacation rental compliance counsel. City STR ordinance guidance, mountain community regulations, and enforcement defense.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Legal TX', 'hill-country-str-legal-tx', 'Fredericksburg vacation rental law',
  'Hill Country STR Legal guides vacation rental owners through Gillespie County STR permitting, Texas hotel occupancy tax compliance, and short-term rental enforcement defense in wine country.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Law TX', 'kerrville-str-law-tx', 'Kerr County vacation rental compliance',
  'Kerrville STR Law covers Kerrville and the Guadalupe Valley with Texas vacation rental compliance counsel. Kerr County STR regulations, permit applications, and enforcement defense.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Legal TX', 'comal-county-str-legal-tx', 'New Braunfels vacation rental law',
  'Comal County STR Legal guides vacation rental owners through City of New Braunfels STR permitting, Texas regulatory compliance, and short-term rental enforcement defense for river property owners.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 106
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Law TX', 'gruene-str-law-tx', 'New Braunfels area vacation rental compliance',
  'Gruene STR Law covers the Gruene neighborhood and greater New Braunfels with Texas vacation rental compliance counsel. Historic district STR regulations and Comal County permit guidance.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Legal', 'lake-cda-str-legal', 'Coeur d Alene vacation rental law',
  'Lake CDA STR Legal guides vacation rental owners through Kootenai County and City of Coeur d''Alene STR permitting, Idaho regulatory compliance, and short-term rental enforcement defense.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Law', 'north-idaho-str-law', 'Kootenai County vacation rental compliance',
  'North Idaho STR Law covers Coeur d''Alene and Post Falls with Idaho vacation rental compliance counsel. STR permit navigation, local ordinance guidance, and enforcement defense.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Legal WI', 'lake-geneva-str-legal-wi', 'Walworth County vacation rental law',
  'Lake Geneva STR Legal guides vacation rental owners through City of Lake Geneva STR licensing, Walworth County regulations, and Wisconsin short-term rental compliance counsel.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Law WI', 'geneva-lake-str-law-wi', 'Lake Geneva area vacation rental compliance',
  'Geneva Lake STR Law covers Williams Bay and the western Geneva Lake area with Wisconsin vacation rental compliance counsel. Town-level STR permit guidance and enforcement defense.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 43
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
