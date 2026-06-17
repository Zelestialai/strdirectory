-- Migration 040: Tier 6 vendor seeds — insurance + furniture-supplies
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: insurance
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Insurance Agency', 'maui-str-insurance-agency', 'Hawaii vacation rental insurance specialists',
  'Maui STR Insurance Agency provides short-term rental insurance for vacation properties across the Valley Isle. Hurricane coverage, guest liability, and comprehensive STR policies for Hawaii property owners.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 48
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental Insurance', 'kihei-vacation-rental-insurance', 'South Maui STR coverage specialists',
  'Kihei Vacation Rental Insurance provides comprehensive short-term rental coverage for South Maui property owners. Hurricane, flood, and liability policies designed for Hawaii vacation rental operators.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 36
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Insurance Services', 'oahu-str-insurance-services', 'Honolulu vacation rental coverage',
  'Oahu STR Insurance Services provides short-term rental insurance for vacation properties across Honolulu. High-value condo coverage, hurricane endorsements, and STR liability policies for Oahu owners.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windward Oahu STR Insurance', 'windward-oahu-str-insurance', 'Kailua vacation rental coverage',
  'Windward Oahu STR Insurance covers vacation rental properties across the Windward Coast with comprehensive STR policies. Beachfront home liability and hurricane coverage for Hawaii owners.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Insurance Co', 'kauai-str-insurance-co', 'Garden Isle vacation rental coverage',
  'Kauai STR Insurance Co provides comprehensive short-term rental coverage for vacation properties across Princeville, Poipu, and the North Shore. Hurricane and flood endorsements for coastal Kauai owners.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 52
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Coverage Kauai', 'poipu-str-coverage-kauai', 'South Shore Kauai rental insurance',
  'Poipu STR Coverage provides vacation rental insurance for South Shore Kauai property owners. Beachfront home and condo policies with comprehensive hurricane and liability protection.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 37
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Insurance', 'big-island-str-insurance', 'Hawaii Island vacation rental coverage',
  'Big Island STR Insurance provides short-term rental policies for vacation properties across the Kona Coast and beyond. Lava zone risk policies, hurricane endorsements, and comprehensive liability coverage.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Coverage HI', 'hilo-str-coverage-hi', 'East Hawaii vacation rental insurance',
  'Hilo STR Coverage provides vacation rental insurance for east side Big Island properties. High-rainfall climate specialists, flood coverage, and comprehensive STR liability policies.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 38
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Insurance UT', 'moab-str-insurance-ut', 'Canyon country vacation rental coverage',
  'Moab STR Insurance provides short-term rental coverage for vacation properties in Grand County. Flash flood endorsements, desert property liability, and comprehensive STR policies for Moab owners.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Coverage UT', 'red-rock-str-coverage-ut', 'Moab area vacation rental insurance',
  'Red Rock STR Coverage provides vacation rental insurance for Moab property owners. Remote property coverage, adventure guest liability, and comprehensive canyon country STR policies.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 43
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Insurance', 'santa-fe-str-insurance', 'New Mexico vacation rental coverage',
  'Santa Fe STR Insurance provides comprehensive short-term rental coverage for vacation properties in Santa Fe County. Adobe home policies, high-desert climate endorsements, and STR liability coverage.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Coverage NM', 'high-desert-str-coverage-nm', 'Northern NM vacation rental insurance',
  'High Desert STR Coverage covers Santa Fe vacation rental owners with comprehensive STR insurance. Northern New Mexico fire risk, adobe structure coverage, and comprehensive liability policies.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Insurance NM', 'taos-str-insurance-nm', 'Mountain vacation rental coverage',
  'Taos STR Insurance provides short-term rental coverage for ski chalets and mountain vacation rentals throughout Taos County. Snowload, freeze damage, and comprehensive mountain STR policies.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 56
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley STR Coverage', 'taos-valley-str-coverage', 'Taos area vacation rental insurance',
  'Taos Valley STR Coverage provides vacation rental insurance for Taos and El Prado property owners. Mountain climate policies, ski season liability, and comprehensive STR coverage.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Insurance VT', 'stowe-str-insurance-vt', 'Vermont ski resort rental coverage',
  'Stowe STR Insurance provides comprehensive short-term rental coverage for ski chalets and mountain vacation homes in Lamoille County. Snowload, pipe freeze, and ski season liability policies.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Coverage VT', 'green-mountain-str-coverage-vt', 'Stowe area vacation rental insurance',
  'Green Mountain STR Coverage covers Stowe and Morrisville vacation rental owners with Vermont mountain property insurance. Four-season coverage with ski and foliage season liability endorsements.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Insurance NY', 'catskills-str-insurance-ny', 'Upstate NY vacation rental coverage',
  'Catskills STR Insurance provides comprehensive short-term rental coverage for A-frames, farmhouses, and mountain cabins across Ulster and Sullivan Counties. Rural property and well water specialists.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Coverage NY', 'phoenicia-str-coverage-ny', 'Southern Catskills rental insurance',
  'Phoenicia STR Coverage provides vacation rental insurance for properties throughout the Esopus Valley and southern Catskills. Remote cabin policies and weekend rental liability coverage.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Insurance', 'finger-lakes-str-insurance', 'Wine country vacation rental coverage',
  'Finger Lakes STR Insurance provides comprehensive short-term rental coverage for lakefront cottages and winery guesthouses across the Finger Lakes region. Dock and waterfront endorsements available.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Coverage', 'seneca-lake-str-coverage', 'Schuyler County vacation rental insurance',
  'Seneca Lake STR Coverage provides vacation rental insurance for lakefront and gorge-view properties around Watkins Glen. Waterfront liability and comprehensive Finger Lakes STR policies.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Insurance', 'hudson-valley-str-insurance', 'River valley vacation rental coverage',
  'Hudson Valley STR Insurance provides comprehensive short-term rental coverage for historic farmhouses, converted barns, and estate properties across Ulster and Dutchess Counties.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Coverage', 'dutchess-county-str-coverage', 'Rhinebeck area vacation rental insurance',
  'Dutchess County STR Coverage provides vacation rental insurance for manor houses, estate properties, and charming cottages throughout the Rhinebeck and mid-Hudson Valley area.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Insurance OK', 'broken-bow-str-insurance-ok', 'Oklahoma cabin vacation rental coverage',
  'Broken Bow STR Insurance provides comprehensive short-term rental coverage for log cabins and luxury retreats throughout McCurtain County. Hot tub liability, storm damage, and guest injury coverage.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 94
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown STR Coverage OK', 'hochatown-str-coverage-ok', 'McCurtain County vacation rental insurance',
  'Hochatown STR Coverage provides vacation rental insurance for cabin owners throughout Broken Bow and Hochatown. Oklahoma rural property policies with comprehensive STR liability endorsements.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Insurance', 'ozarks-lake-str-insurance', 'Missouri lake house vacation rental coverage',
  'Ozarks Lake STR Insurance provides comprehensive short-term rental coverage for lake houses across Lake of the Ozarks. Dock liability, watercraft endorsements, and comprehensive STR policies.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Coverage MO', 'lake-ozark-str-coverage-mo', 'Lake Ozark area vacation rental insurance',
  'Lake Ozark STR Coverage provides vacation rental insurance for the mid-lake area. Missouri lake house policies with party rental liability endorsements and waterfront property coverage.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Insurance', 'smoky-mountain-str-insurance', 'Tennessee vacation rental coverage',
  'Smoky Mountain STR Insurance provides comprehensive short-term rental coverage for cabins and chalets throughout Sevier County. Hot tub liability, mountain property endorsements, and STR-specific policies.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Coverage', 'sevier-county-str-coverage', 'Gatlinburg area vacation rental insurance',
  'Sevier County STR Coverage provides vacation rental insurance for the Pigeon Forge and Gatlinburg corridor. Smoky Mountain cabin and chalet policies with full STR liability protection.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Insurance FL', 'sarasota-str-insurance-fl', 'Gulf Coast vacation rental coverage',
  'Sarasota STR Insurance provides comprehensive short-term rental coverage for vacation properties across Sarasota County. Hurricane, flood, and liability policies for Gulf Coast rental owners.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 96
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Coverage FL', 'siesta-key-str-coverage-fl', 'Siesta Key vacation rental insurance',
  'Siesta Key STR Coverage provides beachfront condo and vacation home insurance for Siesta and Lido Keys. Comprehensive coastal Florida STR policies with hurricane and storm surge endorsements.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Insurance FL', 'st-augustine-str-insurance-fl', 'Northeast Florida vacation rental coverage',
  'St Augustine STR Insurance provides comprehensive short-term rental coverage for historic homes and beach rentals in St. Johns County. Historic structure riders and coastal Florida STR policies.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Coverage FL', 'ponte-vedra-str-coverage-fl', 'Ponte Vedra vacation rental insurance',
  'Ponte Vedra STR Coverage provides vacation rental insurance for beach homes from Ponte Vedra to St. Augustine Beach. Comprehensive Florida coastal STR policies with hurricane endorsements.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Insurance FL', 'pensacola-str-insurance-fl', 'Northwest Florida vacation rental coverage',
  'Pensacola STR Insurance provides comprehensive short-term rental coverage for vacation properties across Escambia and Santa Rosa Counties. Hurricane and flood policies for Emerald Coast rental owners.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Coverage FL', 'gulf-breeze-str-coverage-fl', 'Pensacola area vacation rental insurance',
  'Gulf Breeze STR Coverage covers the greater Pensacola market with comprehensive vacation rental insurance. Coastal Florida STR policies, hurricane endorsements, and military relocation coverage.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Insurance OR', 'cannon-beach-str-insurance-or', 'Oregon Coast vacation rental coverage',
  'Cannon Beach STR Insurance provides comprehensive short-term rental coverage for beach houses on the North Oregon Coast. Pacific storm, erosion, and liability policies for Oregon coastal property owners.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Coverage', 'north-oregon-coast-str-coverage', 'Seaside area vacation rental insurance',
  'North Oregon Coast STR Coverage provides vacation rental insurance for Seaside and the northern Oregon Coast. Coastal weather, flood, and comprehensive STR liability policies for Pacific Northwest owners.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Insurance', 'tybee-island-str-insurance', 'Georgia coast vacation rental coverage',
  'Tybee Island STR Insurance provides comprehensive short-term rental coverage for beach cottages and vacation homes on Tybee Island. Hurricane, flood, and coastal Georgia STR liability policies.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Coverage GA', 'savannah-str-coverage-ga', 'Savannah area vacation rental insurance',
  'Savannah STR Coverage provides vacation rental insurance for downtown Savannah historic homes and Tybee Island beach cottages. Historic structure policies and coastal Georgia STR coverage.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Insurance', 'kiawah-island-str-insurance', 'Luxury Lowcountry vacation rental coverage',
  'Kiawah Island STR Insurance specializes in luxury vacation rental coverage for Kiawah and Seabrook Islands. High-value property policies, coastal storm coverage, and golf resort liability endorsements.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 81
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Coverage SC', 'lowcountry-str-coverage-sc', 'Charleston Sea Islands rental insurance',
  'Lowcountry STR Coverage provides vacation rental insurance for Johns Island and the Charleston Sea Islands. Lowcountry coastal property policies and comprehensive South Carolina STR liability coverage.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Insurance', 'golden-isles-str-insurance', 'St. Simons vacation rental coverage',
  'Golden Isles STR Insurance provides comprehensive short-term rental coverage for vacation properties on St. Simons Island, Sea Island, and Jekyll Island. Coastal Georgia barrier island specialists.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Coverage', 'brunswick-ga-str-coverage', 'Glynn County vacation rental insurance',
  'Brunswick GA STR Coverage provides vacation rental insurance for the Golden Isles market. Coastal Georgia STR policies with hurricane, flood, and comprehensive liability endorsements.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Insurance TN', 'chattanooga-str-insurance-tn', 'Scenic city vacation rental coverage',
  'Chattanooga STR Insurance provides comprehensive short-term rental coverage for downtown lofts, mountain cabins, and waterfront vacation rentals in Hamilton County. Tennessee STR policies.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Coverage TN', 'scenic-city-str-coverage-tn', 'Greater Chattanooga vacation rental insurance',
  'Scenic City STR Coverage covers the Chattanooga market with vacation rental insurance. Mountain and urban STR policies with outdoor adventure guest liability endorsements.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Insurance TX', 'hill-country-str-insurance-tx', 'Fredericksburg vacation rental coverage',
  'Hill Country STR Insurance provides comprehensive short-term rental coverage for wine country cottages and ranch vacation rentals in Gillespie County. Texas hailstorm endorsements and comprehensive STR policies.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Coverage TX', 'kerrville-str-coverage-tx', 'Kerr County vacation rental insurance',
  'Kerrville STR Coverage provides vacation rental insurance for Kerrville and the Guadalupe Valley. Texas Hill Country STR policies with river flood endorsements and comprehensive liability coverage.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Insurance TX', 'comal-county-str-insurance-tx', 'New Braunfels vacation rental coverage',
  'Comal County STR Insurance provides comprehensive short-term rental coverage for river house vacation rentals in New Braunfels. Comal River flood endorsements and comprehensive Texas STR liability policies.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 104
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Coverage TX', 'gruene-str-coverage-tx', 'New Braunfels area vacation rental insurance',
  'Gruene STR Coverage provides vacation rental insurance for the Gruene and greater New Braunfels market. Texas river property STR policies with flood and water damage endorsements.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Insurance', 'lake-cda-str-insurance', 'Coeur d Alene vacation rental coverage',
  'Lake CDA STR Insurance provides comprehensive short-term rental coverage for lakefront homes and waterfront condos in Kootenai County. Idaho STR policies with dock liability and waterfront endorsements.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Coverage', 'north-idaho-str-coverage', 'Kootenai County vacation rental insurance',
  'North Idaho STR Coverage provides vacation rental insurance for Coeur d''Alene and Post Falls property owners. Mountain lake property policies with comprehensive Idaho STR liability coverage.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Insurance WI', 'lake-geneva-str-insurance-wi', 'Walworth County vacation rental coverage',
  'Lake Geneva STR Insurance provides comprehensive short-term rental coverage for lake cottages and vacation homes along Geneva Lake. Wisconsin STR policies with dock liability and waterfront endorsements.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 62
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Coverage WI', 'geneva-lake-str-coverage-wi', 'Lake Geneva area vacation rental insurance',
  'Geneva Lake STR Coverage covers Williams Bay and the western Geneva Lake shoreline with vacation rental insurance. Wisconsin lake cottage STR policies and waterfront property liability coverage.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 44
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: furniture-supplies
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Furnishings Co', 'maui-str-furnishings-co', 'Hawaii vacation rental furniture packages',
  'Maui STR Furnishings Co provides complete furniture and supply packages for vacation rentals across the Valley Isle. Island-inspired decor, durable outdoor furniture, and premium linen bundles.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 52
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei STR Supply House', 'kihei-str-supply-house', 'South Maui vacation rental supplies',
  'Kihei STR Supply House provides furniture packages, kitchen supplies, and linen bundles for South Maui vacation rentals. Turnkey setup service from Kihei to Wailea.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 38
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Furnishings', 'oahu-str-furnishings', 'Honolulu vacation rental furniture',
  'Oahu STR Furnishings provides complete furniture and supply packages for vacation rentals across Honolulu. Contemporary Hawaiian style, resort-quality linens, and full kitchen stocking.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Supply Co', 'kailua-str-supply-co', 'Windward Oahu rental furnishings',
  'Kailua STR Supply Co provides furniture packages and supplies for vacation rentals across the Windward Coast. Beachside-casual aesthetic and premium guest amenity bundles.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Furnishings', 'kauai-str-furnishings', 'Garden Isle vacation rental furniture',
  'Kauai STR Furnishings provides complete furniture and supply packages for vacation rentals across Kauai. Tropical-luxury decor, outdoor living furniture, and premium linen programs.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Supply Kauai', 'poipu-str-supply-kauai', 'South Kauai rental furnishing packages',
  'Poipu STR Supply covers South Shore Kauai vacation rentals with furniture packages, kitchen supplies, and linen bundles. Resort-quality amenities for Poipu and Koloa property owners.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 39
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Furnishings', 'big-island-str-furnishings', 'Hawaii Island vacation rental supplies',
  'Big Island STR Furnishings provides furniture packages and supply bundles for vacation rentals across the Kona Coast. Island-modern aesthetic, outdoor living sets, and complete kitchen packages.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 56
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Supply Co HI', 'hilo-str-supply-co-hi', 'East Hawaii vacation rental furnishings',
  'Hilo STR Supply Co provides furniture packages and supplies for vacation rental owners in the Hilo and Puna districts. Eco-friendly materials and natural fiber furnishings for rainforest retreats.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.6, 37
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Furnishings UT', 'moab-str-furnishings-ut', 'Canyon country vacation rental supplies',
  'Moab STR Furnishings provides desert-modern furniture packages and supplies for vacation rentals in Grand County. Durable outdoor furnishings, camping-gear amenity kits, and turnkey property setup.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Supply UT', 'red-rock-str-supply-ut', 'Moab area rental furnishing packages',
  'Red Rock STR Supply covers Moab vacation rental owners with furniture packages, outdoor gear storage solutions, and complete turnkey supply bundles. Desert climate durability standards.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 45
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Furnishings', 'santa-fe-str-furnishings', 'Southwest style vacation rental supplies',
  'Santa Fe STR Furnishings provides Southwest-inspired furniture packages and supplies for vacation rentals in Santa Fe County. Handcrafted New Mexico furniture, Talavera accents, and premium linens.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Supply NM', 'high-desert-str-supply-nm', 'Northern NM rental furnishing packages',
  'High Desert STR Supply covers Santa Fe vacation rental owners with complete furniture and supply packages. Adobe-appropriate decor, local artisan sourcing, and turnkey property setup.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Furnishings NM', 'taos-str-furnishings-nm', 'Mountain art colony vacation rental supplies',
  'Taos STR Furnishings provides locally sourced furniture packages and supply bundles for ski chalets and vacation rentals throughout Taos County. New Mexico artisan goods and mountain-modern decor.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley STR Supply', 'taos-valley-str-supply', 'Taos area rental furnishing packages',
  'Taos Valley STR Supply covers Taos and El Prado vacation rental owners with complete furniture and supply packages. Ski-ready property setup and year-round supply restocking.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Furnishings VT', 'stowe-str-furnishings-vt', 'Vermont ski lodge rental supplies',
  'Stowe STR Furnishings provides cozy Vermont-style furniture packages and supply bundles for ski chalets and mountain vacation rentals. Wool throws, wood accents, and lodge-quality guest amenities.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Supply VT', 'green-mountain-str-supply-vt', 'Stowe area rental furnishing packages',
  'Green Mountain STR Supply covers Stowe and Morrisville vacation rental owners with complete furniture packages and supply bundles. Vermont-made products and premium guest amenity kits.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Furnishings NY', 'catskills-str-furnishings-ny', 'Upstate NY cabin vacation rental supplies',
  'Catskills STR Furnishings provides A-frame and cabin furniture packages for vacation rentals throughout Ulster and Sullivan Counties. Design-forward pieces that photograph well for the NYC market.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Supply NY', 'phoenicia-str-supply-ny', 'Southern Catskills rental furnishing packages',
  'Phoenicia STR Supply covers the Esopus Valley and southern Catskills with vacation rental furniture packages. Rustic-modern pieces, organic textiles, and complete cabin supply bundles.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Furnishings', 'finger-lakes-str-furnishings', 'Wine country vacation rental supplies',
  'Finger Lakes STR Furnishings provides wine-country-inspired furniture packages for lakefront cottages and winery guesthouses. Vineyard aesthetic, outdoor dining sets, and premium linen bundles.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Supply', 'seneca-lake-str-supply', 'Schuyler County vacation rental furnishings',
  'Seneca Lake STR Supply covers the Watkins Glen area with vacation rental furniture packages and supply bundles. Lakefront cottage aesthetic and wine trail-inspired guest amenity kits.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Furnishings', 'hudson-valley-str-furnishings', 'River valley vacation rental supplies',
  'Hudson Valley STR Furnishings provides sophisticated furniture packages for farmhouses, barns, and historic homes across the mid-Hudson Valley. Antique-modern mix and Hudson Valley artisan products.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Supply', 'dutchess-county-str-supply', 'Rhinebeck area rental furnishing packages',
  'Dutchess County STR Supply covers the Rhinebeck and mid-Hudson Valley area with vacation rental furniture packages and supply bundles. Estate property staging and premium guest amenities.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Furnishings OK', 'broken-bow-str-furnishings-ok', 'Oklahoma cabin vacation rental supplies',
  'Broken Bow STR Furnishings provides rustic-luxury furniture packages for log cabins and retreats throughout McCurtain County. Durable outdoor furniture, game room setups, and hot tub supplies.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown STR Supply OK', 'hochatown-str-supply-ok', 'McCurtain County rental furnishing packages',
  'Hochatown STR Supply covers Hochatown and the Broken Bow area with complete cabin furnishing packages. Everything from recliners to cornhole sets for the full Oklahoma cabin experience.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Furnishings', 'ozarks-lake-str-furnishings', 'Missouri lake house vacation rental supplies',
  'Ozarks Lake STR Furnishings provides complete furniture packages for lake house vacation rentals across Lake of the Ozarks. Outdoor entertaining sets, dock furniture, and water sports supply packages.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Supply MO', 'lake-ozark-str-supply-mo', 'Lake Ozark area rental furnishing packages',
  'Lake Ozark STR Supply covers the mid-lake corridor with vacation rental furniture packages and supply bundles. Party-ready outdoor furniture, float toy kits, and complete kitchen supply packages.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Furnishings', 'smoky-mountain-str-furnishings', 'Tennessee cabin vacation rental supplies',
  'Smoky Mountain STR Furnishings provides complete furniture packages for cabins and chalets throughout Sevier County. Mountain-rustic decor, hot tub accessories, and full game room equipment packages.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 113
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Supply TN', 'sevier-county-str-supply-tn', 'Gatlinburg area rental furnishing packages',
  'Sevier County STR Supply covers the Pigeon Forge and Gatlinburg corridor with complete vacation rental furniture packages. Cabin aesthetic, bear-country decor, and durable high-turnover furnishings.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Furnishings FL', 'sarasota-str-furnishings-fl', 'Gulf Coast vacation rental supplies',
  'Sarasota STR Furnishings provides coastal-luxury furniture packages for vacation rentals across Sarasota County. Outdoor entertaining sets, resort-quality linens, and premium guest amenity packages.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 98
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Supply FL', 'siesta-key-str-supply-fl', 'Siesta Key vacation rental furnishings',
  'Siesta Key STR Supply provides beachfront condo and vacation home furniture packages for Siesta and Lido Keys. Beach-chic aesthetic, outdoor lounger sets, and white sand-inspired decor.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Furnishings', 'st-augustine-str-furnishings', 'Historic city vacation rental supplies',
  'St Augustine STR Furnishings provides furniture packages and supply bundles for vacation rentals in St. Johns County. Historic home-appropriate furnishings and beach cottage supply kits.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Supply FL', 'ponte-vedra-str-supply-fl', 'Northeast Florida rental furnishing packages',
  'Ponte Vedra STR Supply covers beach rental owners from Ponte Vedra to St. Augustine Beach with furniture packages and supply bundles. Coastal Florida aesthetic and premium outdoor entertaining sets.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Furnishings FL', 'pensacola-str-furnishings-fl', 'Northwest Florida vacation rental supplies',
  'Pensacola STR Furnishings provides complete furniture packages for vacation rentals across Escambia and Santa Rosa Counties. Emerald Coast beach house aesthetic and durable outdoor furniture sets.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Supply FL', 'gulf-breeze-str-supply-fl', 'Pensacola area rental furnishing packages',
  'Gulf Breeze STR Supply covers the greater Pensacola market with vacation rental furniture packages. Coastal Florida decor, outdoor entertaining sets, and complete new property setup service.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Furnishings OR', 'cannon-beach-str-furnishings-or', 'Oregon Coast vacation rental supplies',
  'Cannon Beach STR Furnishings provides Pacific Northwest-inspired furniture packages for beach houses on the North Oregon Coast. Storm-watching window seats, cozy textiles, and complete supply bundles.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Supply', 'north-oregon-coast-str-supply', 'Seaside area rental furnishing packages',
  'North Oregon Coast STR Supply covers Seaside and the northern Oregon Coast with vacation rental furniture packages. Beachcomber decor and durable outdoor furnishings for Pacific Coast rentals.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Furnishings', 'tybee-island-str-furnishings', 'Georgia coast vacation rental supplies',
  'Tybee Island STR Furnishings provides beach cottage furniture packages and supply bundles for vacation rentals on Tybee Island. Southern coastal decor, front porch furniture, and premium linen packages.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Supply GA', 'savannah-str-supply-ga', 'Savannah area vacation rental furnishings',
  'Savannah STR Supply covers downtown Savannah vacation homes and Tybee Island beach cottages with furniture packages and supply bundles. Historic Savannah aesthetic and coastal Georgia decor.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Furnishings', 'kiawah-island-str-furnishings', 'Luxury Lowcountry vacation rental supplies',
  'Kiawah Island STR Furnishings provides luxury furniture packages for vacation rentals on Kiawah and Seabrook Islands. Resort-quality pieces, premium outdoor furnishings, and concierge-level supply packages.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 84
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Supply SC', 'lowcountry-str-supply-sc', 'Charleston Sea Islands rental furnishings',
  'Lowcountry STR Supply covers Johns Island and the Charleston Sea Islands with vacation rental furniture packages. Lowcountry aesthetic, plantation-inspired pieces, and coastal living supply bundles.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Furnishings', 'golden-isles-str-furnishings', 'St. Simons vacation rental supplies',
  'Golden Isles STR Furnishings provides furniture packages for vacation rentals on St. Simons Island, Sea Island, and Jekyll Island. Coastal Georgia charm, moss-oak inspired decor, and premium linen bundles.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Supply', 'brunswick-ga-str-supply', 'Glynn County vacation rental furnishings',
  'Brunswick GA STR Supply covers the Golden Isles market with vacation rental furniture packages and supply bundles. Barrier island property turnkey setup and complete guest amenity packages.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Furnishings TN', 'chattanooga-str-furnishings-tn', 'Scenic city vacation rental supplies',
  'Chattanooga STR Furnishings provides furniture packages for downtown lofts, mountain cabins, and waterfront vacation rentals throughout Hamilton County. Urban-industrial and mountain-rustic aesthetics.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Supply TN', 'scenic-city-str-supply-tn', 'Greater Chattanooga rental furnishing packages',
  'Scenic City STR Supply covers the Chattanooga metro and mountain communities with vacation rental furniture packages and supply bundles. Outdoor adventure gear storage and premium guest amenities.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Furnishings TX', 'hill-country-str-furnishings-tx', 'Fredericksburg vacation rental supplies',
  'Hill Country STR Furnishings provides wine-country-inspired furniture packages for vacation rentals throughout Gillespie County. Texas Hill Country aesthetic, outdoor fire pit furniture, and premium linen bundles.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Supply TX', 'kerrville-str-supply-tx', 'Kerr County vacation rental furnishings',
  'Kerrville STR Supply covers Kerrville and the Guadalupe Valley with vacation rental furniture packages. Texas Hill Country materials, cedar accents, and complete river retreat supply bundles.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal River STR Furnishings TX', 'comal-river-str-furnishings-tx', 'New Braunfels vacation rental supplies',
  'Comal River STR Furnishings provides complete furniture packages for river house vacation rentals in New Braunfels. Waterproof outdoor furniture, river float equipment storage, and Texas Hill Country decor.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Supply TX', 'gruene-str-supply-tx', 'New Braunfels area rental furnishing packages',
  'Gruene STR Supply covers the Gruene neighborhood and greater New Braunfels with vacation rental furniture packages. Historic Texas charm and river recreation supply bundles for STR owners.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Furnishings', 'lake-cda-str-furnishings', 'Coeur d Alene vacation rental supplies',
  'Lake CDA STR Furnishings provides mountain-modern furniture packages for lakefront homes and condos throughout Coeur d''Alene. Pacific Northwest materials, outdoor entertaining sets, and dock furniture.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Supply', 'north-idaho-str-supply', 'Kootenai County vacation rental furnishings',
  'North Idaho STR Supply covers Coeur d''Alene and Post Falls with vacation rental furniture packages and supply bundles. Idaho mountain lodge aesthetic, outdoor gear storage, and complete property setup.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Furnishings WI', 'lake-geneva-str-furnishings-wi', 'Walworth County vacation rental supplies',
  'Lake Geneva STR Furnishings provides charming lake cottage furniture packages for vacation rentals along Geneva Lake. Victorian summer house aesthetic, outdoor lakeside furniture, and premium linen bundles.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Supply WI', 'geneva-lake-str-supply-wi', 'Lake Geneva area rental furnishing packages',
  'Geneva Lake STR Supply covers Williams Bay and the western Geneva Lake shoreline with vacation rental furniture packages and supply bundles. Wisconsin lake cottage aesthetic and complete setup service.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;
