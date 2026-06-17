-- Migration 039: Tier 6 vendor seeds — renovation + accounting-tax
-- 26 markets × 2 categories × 2 vendors = 104 vendors

-- ============================================================
-- CATEGORY: renovation
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Renovation Co', 'maui-str-renovation-co', 'Vacation rental remodeling on Maui',
  'Maui STR Renovation Co transforms vacation rental properties across West and South Maui with island-style renovations. Kitchen and bath remodels, lanai upgrades, and resort-quality finishes.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 47
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental Reno', 'kihei-vacation-rental-reno', 'South Maui STR remodel specialists',
  'Kihei Vacation Rental Reno handles kitchen upgrades, bathroom remodels, and full STR transformations across South Maui. Tropical-modern finishes and durable materials for high-turnover rentals.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 36
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Renovation Group', 'oahu-str-renovation-group', 'Honolulu vacation rental remodeling',
  'Oahu STR Renovation Group specializes in full vacation rental renovations across Honolulu — from Waikiki condos to North Shore beach houses. Hawaii building code expertise and fast project completion.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Remodel Oahu', 'kailua-str-remodel-oahu', 'Windward Oahu rental renovation',
  'Kailua STR Remodel handles vacation rental upgrades across the Windward Coast. Outdoor shower installations, kitchen refreshes, and beachfront property transformations that increase nightly rates.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 43
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Renovation Co', 'kauai-str-renovation-co', 'Garden Isle vacation rental remodeling',
  'Kauai STR Renovation Co handles kitchen and bath renovations, deck upgrades, and full property transformations for vacation rentals across Princeville, Poipu, and the North Shore.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 51
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu Rental Renovation HI', 'poipu-rental-renovation-hi', 'South Shore Kauai STR remodeling',
  'Poipu Rental Renovation handles vacation rental upgrades across Poipu and Koloa. Outdoor living space enhancements, kitchen modernizations, and high-ROI renovations for Kauai property owners.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 38
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Renovation', 'big-island-str-renovation', 'Hawaii Island vacation rental remodeling',
  'Big Island STR Renovation covers the Kona Coast with vacation rental renovation expertise. Lava stone feature walls, tropical outdoor kitchens, and resort-quality bathroom renovations.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 49
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Remodel HI', 'hilo-str-remodel-hi', 'East Hawaii vacation rental renovation',
  'Hilo STR Remodel covers the Hilo and Puna districts with vacation rental renovation. Eco-lodge buildouts, rainforest-inspired finishes, and sustainable material expertise.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.6, 33
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Renovation UT', 'moab-str-renovation-ut', 'Canyon country vacation rental remodeling',
  'Moab STR Renovation handles full property renovations for vacation rentals in Grand County. Desert-modern finishes, outdoor living upgrades, and high-ROI improvements for Moab investors.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Rental Renovation', 'red-rock-rental-renovation', 'Moab area STR remodel specialists',
  'Red Rock Rental Renovation transforms vacation rental properties throughout the Moab corridor. Stargazing deck builds, desert kitchen upgrades, and off-grid property improvements.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Renovation', 'santa-fe-str-renovation', 'Adobe home vacation rental remodeling',
  'Santa Fe STR Renovation specializes in adobe structure repairs, traditional plaster restoration, and contemporary upgrades for vacation rentals throughout Santa Fe County. Respectful of historic character.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Renovation NM', 'high-desert-renovation-nm', 'Northern New Mexico STR remodeling',
  'High Desert Renovation NM covers Santa Fe vacation rentals with renovation expertise. Saltillo tile installations, latilla ceilings, and portal additions that enhance Southwest charm.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Renovation NM', 'taos-str-renovation-nm', 'Mountain vacation rental remodeling',
  'Taos STR Renovation handles pueblo-style renovations, ski chalet upgrades, and full property transformations throughout Taos County. Traditional New Mexico construction methods and modern amenities.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Mountain Renovation Co', 'taos-mountain-renovation-co', 'Taos area STR remodel services',
  'Taos Mountain Renovation Co covers Taos and El Prado with vacation rental renovation expertise. Mountain casita transformations and ski property upgrades that increase booking rates.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 40
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Renovation VT', 'stowe-str-renovation-vt', 'Vermont ski lodge vacation rental remodeling',
  'Stowe STR Renovation transforms Vermont ski chalets and mountain properties into premium vacation rentals. Mudroom buildouts, fireplace upgrades, and ski-storage solutions for Stowe owners.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain Renovation VT', 'green-mountain-renovation-vt', 'Lamoille Valley STR remodeling',
  'Green Mountain Renovation VT covers Stowe and Morrisville with vacation rental renovation. Vermont farmhouse restorations, modern ski lodge upgrades, and outdoor hot tub installations.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Renovation NY', 'catskills-str-renovation-ny', 'Upstate NY cabin and farmhouse remodeling',
  'Catskills STR Renovation transforms A-frames, farmhouses, and cabins throughout Ulster and Sullivan Counties into top-booking rentals. Design-forward renovations for the discerning NYC market.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Remodel NY', 'phoenicia-str-remodel-ny', 'Southern Catskills rental renovation',
  'Phoenicia STR Remodel covers the Esopus Valley and southern Catskills with vacation rental renovation. Cabin modernizations and farmhouse conversions that attract premium bookings.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Renovation', 'finger-lakes-str-renovation', 'Wine country vacation rental remodeling',
  'Finger Lakes STR Renovation transforms lakefront cottages and winery guesthouses across the Finger Lakes region. Dock additions, sunroom builds, and wine-country-inspired interior renovations.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Remodel', 'seneca-lake-str-remodel', 'Schuyler County vacation rental renovation',
  'Seneca Lake STR Remodel covers Watkins Glen and the southern Finger Lakes with vacation rental renovation. Lake view maximization, outdoor kitchen builds, and cottage transformations.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Renovation', 'hudson-valley-str-renovation', 'Historic home vacation rental remodeling',
  'Hudson Valley STR Renovation transforms historic farmhouses, converted barns, and estate properties into premium vacation rentals. Respectful of the historic character while delivering modern amenities.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rhinebeck STR Remodel NY', 'rhinebeck-str-remodel-ny', 'Dutchess County vacation rental renovation',
  'Rhinebeck STR Remodel covers the mid-Hudson Valley with vacation rental renovation. Manor house restorations, barn conversions, and luxury cottage renovations for premium STR investors.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Renovation OK', 'broken-bow-str-renovation-ok', 'Oklahoma cabin vacation rental remodeling',
  'Broken Bow STR Renovation builds and renovates log cabins and luxury retreats throughout McCurtain County. Hot tub additions, covered outdoor decks, and full cabin buildouts for new STR investors.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 96
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown Cabin Renovation', 'hochatown-cabin-renovation', 'Broken Bow area STR remodeling',
  'Hochatown Cabin Renovation specializes in cabin upgrades, game room additions, and full STR transformations across the Broken Bow and Hochatown market. Log cabin new-build expertise.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Renovation', 'ozarks-lake-str-renovation', 'Missouri lake house vacation rental remodeling',
  'Ozarks Lake STR Renovation handles full lake house renovations, dock additions, and party deck buildouts across Lake of the Ozarks. High-ROI improvements for rental property investors.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark Rental Renovation MO', 'lake-ozark-rental-renovation-mo', 'Lake Ozark STR remodel services',
  'Lake Ozark Rental Renovation covers the mid-lake area with vacation rental renovation. Boathouse additions, outdoor bar buildouts, and kitchen modernizations for lake house owners.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Renovation', 'smoky-mountain-str-renovation', 'Pigeon Forge cabin remodeling experts',
  'Smoky Mountain STR Renovation transforms Sevier County cabins and chalets into premium rental properties. Hot tub decks, theater room buildouts, and full cabin renovations for new investors.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 109
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gatlinburg Cabin Renovation TN', 'gatlinburg-cabin-renovation-tn', 'Sevier County STR remodeling',
  'Gatlinburg Cabin Renovation covers the Gatlinburg and Wears Valley corridor with vacation rental renovation. Mountain cabin upgrades, game room additions, and hot tub platform builds.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Renovation FL', 'sarasota-str-renovation-fl', 'Gulf Coast vacation rental remodeling',
  'Sarasota STR Renovation handles kitchen and bath remodels, pool additions, and full property transformations for vacation rentals across Sarasota County. Florida building code expertise.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Remodel', 'siesta-key-str-remodel', 'Siesta Key vacation rental renovation',
  'Siesta Key STR Remodel specializes in beachfront condo and home renovations on Siesta and Lido Keys. Outdoor shower additions, impact window upgrades, and kitchen refreshes for rental owners.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Renovation', 'st-augustine-str-renovation', 'Historic city vacation rental remodeling',
  'St Augustine STR Renovation handles historic home renovations for vacation rentals in America''s oldest city. Sympathetic restoration, modern amenity integration, and St. Johns County permit expertise.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Remodel FL', 'ponte-vedra-str-remodel-fl', 'Northeast Florida rental renovation',
  'Ponte Vedra STR Remodel covers beach rental renovations from Ponte Vedra to St. Augustine Beach. Oceanfront home upgrades, outdoor living additions, and impact window installations.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Renovation FL', 'pensacola-str-renovation-fl', 'Northwest Florida vacation rental remodeling',
  'Pensacola STR Renovation handles beach house renovations, storm damage repairs, and full property transformations for vacation rentals across Escambia and Santa Rosa Counties.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 82
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Remodel FL', 'gulf-breeze-str-remodel-fl', 'Pensacola area rental renovation',
  'Gulf Breeze STR Remodel covers the greater Pensacola market with vacation rental renovation. Beach house upgrades, outdoor entertainment space buildouts, and hurricane hardening projects.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Renovation OR', 'cannon-beach-str-renovation-or', 'Oregon Coast vacation rental remodeling',
  'Cannon Beach STR Renovation handles beach house renovations and coastal property upgrades on the North Oregon Coast. Storm-resistant improvements, deck rebuilds, and interior modernizations.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Remodel', 'north-oregon-coast-str-remodel', 'Seaside area vacation rental renovation',
  'North Oregon Coast STR Remodel covers Seaside and the northern Oregon Coast with vacation rental renovation. Coastal cottage upgrades and Pacific Northwest property transformations.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Renovation', 'tybee-island-str-renovation', 'Georgia coast vacation rental remodeling',
  'Tybee Island STR Renovation handles beach cottage renovations and vacation rental improvements on Tybee Island. Coastal Georgia specialists with expertise in hurricane-resistant construction.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Renovation GA', 'savannah-str-renovation-ga', 'Savannah and coastal Georgia rental remodeling',
  'Savannah STR Renovation covers downtown Savannah historic homes and Tybee Island beach cottages with renovation expertise. Historic preservation compliance and coastal Georgia construction knowledge.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Renovation', 'kiawah-island-str-renovation', 'Luxury Lowcountry rental remodeling',
  'Kiawah Island STR Renovation specializes in luxury vacation rental renovations on Kiawah and Seabrook Islands. Resort-quality finishes, pool additions, and golf villa transformations.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 78
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Renovation SC', 'lowcountry-str-renovation-sc', 'Charleston Sea Islands rental remodeling',
  'Lowcountry STR Renovation covers Johns Island and the Charleston Sea Islands with vacation rental renovation expertise. Lowcountry home improvements and coastal construction specialists.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Renovation', 'golden-isles-str-renovation', 'St. Simons vacation rental remodeling',
  'Golden Isles STR Renovation handles vacation rental renovations on St. Simons Island, Sea Island, and Jekyll Island. Barrier island construction expertise and coastal Georgia property upgrades.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Renovation', 'brunswick-ga-str-renovation', 'Glynn County vacation rental remodeling',
  'Brunswick GA STR Renovation covers the Golden Isles market with vacation rental renovation expertise. Coastal Georgia property transformations and barrier island construction knowledge.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Renovation TN', 'chattanooga-str-renovation-tn', 'Scenic city vacation rental remodeling',
  'Chattanooga STR Renovation handles downtown loft renovations, mountain cabin upgrades, and full property transformations throughout Hamilton County. Outdoor adventure-themed build expertise.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 77
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Remodel TN', 'scenic-city-str-remodel-tn', 'Greater Chattanooga rental renovation',
  'Scenic City STR Remodel covers the Chattanooga metro and surrounding mountain communities with vacation rental renovation. Ridgeline property upgrades and river view maximization projects.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Renovation TX', 'hill-country-str-renovation-tx', 'Fredericksburg vacation rental remodeling',
  'Hill Country STR Renovation handles wine country cottage renovations, ranch property upgrades, and full STR buildouts throughout Gillespie County. German vernacular architecture specialists.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Renovation TX', 'kerrville-str-renovation-tx', 'Kerr County vacation rental remodeling',
  'Kerrville STR Renovation covers Kerrville and the Guadalupe Valley with vacation rental renovation. River cabin upgrades, cedar construction, and Texas Hill Country property transformations.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal River STR Renovation TX', 'comal-river-str-renovation-tx', 'New Braunfels vacation rental remodeling',
  'Comal River STR Renovation handles river house renovations, outdoor entertaining buildouts, and full property transformations for vacation rentals in New Braunfels. Water access improvements included.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 103
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Renovation TX', 'gruene-str-renovation-tx', 'Gruene and New Braunfels STR remodeling',
  'Gruene STR Renovation covers the historic Gruene district and greater New Braunfels with vacation rental renovation. Historic preservation and modern amenity integration for Texas STR investors.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 78
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Renovation', 'lake-cda-str-renovation', 'Coeur d Alene vacation rental remodeling',
  'Lake CDA STR Renovation handles lakefront home renovations, dock additions, and full property transformations for vacation rentals in Kootenai County. North Idaho construction expertise.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Renovation', 'north-idaho-str-renovation', 'Kootenai County vacation rental remodeling',
  'North Idaho STR Renovation covers Coeur d''Alene and Post Falls with vacation rental renovation. Mountain lake property upgrades, dock builds, and cedar lodge transformations.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Renovation WI', 'lake-geneva-str-renovation-wi', 'Walworth County vacation rental remodeling',
  'Lake Geneva STR Renovation handles lake cottage renovations, pier additions, and vacation home transformations along Geneva Lake. Wisconsin craftsmen with Midwestern lake house expertise.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Remodel WI', 'geneva-lake-str-remodel-wi', 'Lake Geneva area rental renovation',
  'Geneva Lake STR Remodel covers Williams Bay and the western Geneva Lake shoreline with vacation rental renovation. Victorian cottage restorations and modern lake house upgrades.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 45
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- ============================================================
-- CATEGORY: accounting-tax
-- ============================================================

-- Maui HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Maui STR Accounting Services', 'maui-str-accounting-services', 'Hawaii vacation rental tax and accounting',
  'Maui STR Accounting Services handles GET/TAT remittance, federal rental income reporting, and financial strategy for vacation rental owners across the Valley Isle. Hawaii STR tax specialists.',
  c.id, 'Lahaina', 'HI', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kihei Vacation Rental CPA', 'kihei-vacation-rental-cpa', 'South Maui STR tax services',
  'Kihei Vacation Rental CPA provides tax preparation and financial advisory services for South Maui vacation rental owners. Hawaii GET/TAT compliance and 1040 Schedule E optimization.',
  c.id, 'Kihei', 'HI', p.id, true, false, 4.7, 39
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Oahu HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oahu STR Tax Advisors', 'oahu-str-tax-advisors', 'Honolulu vacation rental accounting',
  'Oahu STR Tax Advisors handles GET/TAT remittance, vacation rental income reporting, and tax strategy for Honolulu property owners. Hawaii short-term rental taxation experts.',
  c.id, 'Honolulu', 'HI', p.id, true, false, 4.9, 78
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kailua STR Accounting HI', 'kailua-str-accounting-hi', 'Windward Oahu rental tax services',
  'Kailua STR Accounting covers vacation rental owners across the Windward Coast with GET/TAT compliance, Schedule E preparation, and STR financial planning services.',
  c.id, 'Kailua', 'HI', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kauai HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kauai STR Tax Services', 'kauai-str-tax-services', 'Garden Isle vacation rental accounting',
  'Kauai STR Tax Services provides GET/TAT compliance, federal income tax preparation, and financial advisory for vacation rental owners across Princeville, Poipu, and the North Shore.',
  c.id, 'Princeville', 'HI', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Poipu STR Accounting Kauai', 'poipu-str-accounting-kauai', 'South Kauai vacation rental tax',
  'Poipu STR Accounting covers South Shore Kauai vacation rental owners with GET/TAT remittance, tax prep, and rental income optimization strategies.',
  c.id, 'Poipu', 'HI', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Big Island HI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Island STR Tax Advisors', 'big-island-str-tax-advisors', 'Hawaii Island vacation rental accounting',
  'Big Island STR Tax Advisors covers Kona Coast vacation rental owners with GET/TAT remittance, federal tax preparation, and STR financial planning. Hawaii County vacation rental taxation experts.',
  c.id, 'Kona', 'HI', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilo STR Accounting HI', 'hilo-str-accounting-hi', 'East Hawaii vacation rental tax services',
  'Hilo STR Accounting provides GET/TAT compliance, rental income tax preparation, and financial advisory for vacation rental owners in the Hilo and Puna districts.',
  c.id, 'Hilo', 'HI', p.id, true, false, 4.7, 38
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Moab UT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Moab STR Tax Advisors UT', 'moab-str-tax-advisors-ut', 'Grand County vacation rental accounting',
  'Moab STR Tax Advisors handles Utah transient room tax compliance, federal rental income reporting, and investment property tax strategy for vacation rental owners in Grand County.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Accounting UT', 'red-rock-str-accounting-ut', 'Moab area vacation rental tax services',
  'Red Rock STR Accounting covers Moab vacation rental owners with Utah short-term rental tax compliance, Schedule E preparation, and rental income maximization strategies.',
  c.id, 'Moab', 'UT', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Santa Fe NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Santa Fe STR Tax Services', 'santa-fe-str-tax-services', 'New Mexico vacation rental accounting',
  'Santa Fe STR Tax Services handles New Mexico gross receipts tax on rentals, federal income tax preparation, and investment property strategy for vacation rental owners in Santa Fe County.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert STR Accounting NM', 'high-desert-str-accounting-nm', 'Northern NM vacation rental tax',
  'High Desert STR Accounting covers Santa Fe vacation rental owners with NM gross receipts tax compliance, Schedule E optimization, and rental property financial planning.',
  c.id, 'Santa Fe', 'NM', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Taos NM
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos STR Tax Advisors NM', 'taos-str-tax-advisors-nm', 'Taos vacation rental accounting services',
  'Taos STR Tax Advisors provides NM gross receipts tax compliance, federal rental income reporting, and investment strategy for ski chalet and vacation rental owners throughout Taos County.',
  c.id, 'Taos', 'NM', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Taos Valley STR Accounting', 'taos-valley-str-accounting', 'Taos area vacation rental tax services',
  'Taos Valley STR Accounting covers Taos and El Prado vacation rental owners with New Mexico short-term rental tax compliance and rental income tax preparation.',
  c.id, 'El Prado', 'NM', p.id, true, false, 4.7, 41
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Stowe VT
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Stowe STR Tax Advisors VT', 'stowe-str-tax-advisors-vt', 'Vermont ski rental accounting',
  'Stowe STR Tax Advisors handles Vermont meals and rooms tax compliance, federal rental income reporting, and investment property tax strategy for ski chalet and vacation rental owners.',
  c.id, 'Stowe', 'VT', p.id, true, false, 4.8, 72
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Green Mountain STR Accounting', 'green-mountain-str-accounting', 'Stowe area vacation rental tax',
  'Green Mountain STR Accounting covers Stowe and Morrisville vacation rental owners with Vermont meals and rooms tax compliance, Schedule E, and STR financial planning.',
  c.id, 'Morrisville', 'VT', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Catskills NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Catskills STR Tax Services NY', 'catskills-str-tax-services-ny', 'Upstate NY vacation rental accounting',
  'Catskills STR Tax Services handles New York State sales tax on rentals, federal rental income reporting, and investment property strategy for vacation rental owners across the Catskills region.',
  c.id, 'Woodstock', 'NY', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Phoenicia STR Accounting NY', 'phoenicia-str-accounting-ny', 'Southern Catskills rental tax services',
  'Phoenicia STR Accounting covers vacation rental owners throughout the southern Catskills with NY short-term rental tax compliance, Schedule E preparation, and financial advisory.',
  c.id, 'Phoenicia', 'NY', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Finger Lakes NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Finger Lakes STR Tax Advisors', 'finger-lakes-str-tax-advisors', 'Wine country vacation rental accounting',
  'Finger Lakes STR Tax Advisors provides NY short-term rental tax compliance, federal rental income reporting, and investment strategy for lakefront cottage and winery guesthouse owners.',
  c.id, 'Ithaca', 'NY', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Seneca Lake STR Accounting', 'seneca-lake-str-accounting', 'Schuyler County vacation rental tax',
  'Seneca Lake STR Accounting covers Watkins Glen area vacation rental owners with New York State tax compliance, Schedule E optimization, and rental income financial planning.',
  c.id, 'Watkins Glen', 'NY', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Hudson Valley NY
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hudson Valley STR Tax Advisors', 'hudson-valley-str-tax-advisors', 'River valley vacation rental accounting',
  'Hudson Valley STR Tax Advisors handles NY short-term rental tax compliance, federal rental income reporting, and investment property strategy for vacation rental owners from Kingston to Hudson.',
  c.id, 'Kingston', 'NY', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Dutchess County STR Accounting', 'dutchess-county-str-accounting', 'Rhinebeck area vacation rental tax',
  'Dutchess County STR Accounting covers the mid-Hudson Valley with vacation rental tax compliance, Schedule E preparation, and NY State short-term rental tax services.',
  c.id, 'Rhinebeck', 'NY', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Broken Bow OK
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Broken Bow STR Tax Services', 'broken-bow-str-tax-services', 'Oklahoma vacation rental accounting',
  'Broken Bow STR Tax Services handles Oklahoma lodging tax compliance, federal rental income reporting, and investment property strategy for cabin owners throughout McCurtain County.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.9, 98
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hochatown STR Accounting OK', 'hochatown-str-accounting-ok', 'McCurtain County rental tax services',
  'Hochatown STR Accounting covers Broken Bow and Hochatown cabin owners with Oklahoma lodging tax compliance, Schedule E optimization, and STR financial planning.',
  c.id, 'Broken Bow', 'OK', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake of the Ozarks MO
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ozarks Lake STR Tax Advisors', 'ozarks-lake-str-tax-advisors', 'Missouri vacation rental accounting',
  'Ozarks Lake STR Tax Advisors handles Missouri sales tax on rentals, federal rental income reporting, and investment property strategy for lake house owners across Lake of the Ozarks.',
  c.id, 'Osage Beach', 'MO', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Ozark STR Accounting MO', 'lake-ozark-str-accounting-mo', 'Lake of the Ozarks rental tax services',
  'Lake Ozark STR Accounting covers the mid-lake corridor with Missouri short-term rental tax compliance, Schedule E preparation, and vacation rental financial advisory.',
  c.id, 'Lake Ozark', 'MO', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pigeon Forge TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Tax Services', 'smoky-mountain-str-tax-services', 'Tennessee vacation rental accounting',
  'Smoky Mountain STR Tax Services handles Tennessee sales tax on accommodations, federal rental income reporting, and investment property tax strategy for Sevier County cabin owners.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.9, 112
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sevier County STR Accounting', 'sevier-county-str-accounting', 'Gatlinburg area rental tax services',
  'Sevier County STR Accounting covers the Pigeon Forge and Gatlinburg market with Tennessee short-term rental tax compliance, Schedule E optimization, and cabin investment financial planning.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Sarasota FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sarasota STR Tax Advisors FL', 'sarasota-str-tax-advisors-fl', 'Gulf Coast vacation rental accounting',
  'Sarasota STR Tax Advisors handles Florida transient rental tax compliance, federal rental income reporting, and investment property strategy for vacation rental owners across Sarasota County.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.8, 97
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key STR Accounting FL', 'siesta-key-str-accounting-fl', 'Siesta Key vacation rental tax services',
  'Siesta Key STR Accounting covers beachfront condo and vacation home owners on Siesta and Lido Keys with Florida short-term rental tax compliance and Schedule E preparation.',
  c.id, 'Sarasota', 'FL', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Augustine FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'St Augustine STR Tax Services', 'st-augustine-str-tax-services', 'Ancient city vacation rental accounting',
  'St Augustine STR Tax Services handles Florida transient rental tax compliance, federal rental income reporting, and investment property strategy for vacation rental owners in St. Johns County.',
  c.id, 'St. Augustine', 'FL', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ponte Vedra STR Accounting FL', 'ponte-vedra-str-accounting-fl', 'Northeast Florida rental tax services',
  'Ponte Vedra STR Accounting covers beach rental owners from Ponte Vedra to St. Augustine with Florida short-term rental tax compliance and Schedule E optimization.',
  c.id, 'Ponte Vedra Beach', 'FL', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Pensacola FL
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pensacola STR Tax Advisors FL', 'pensacola-str-tax-advisors-fl', 'Northwest Florida vacation rental accounting',
  'Pensacola STR Tax Advisors handles Florida transient rental tax compliance, federal rental income reporting, and investment property strategy for vacation rental owners in Escambia County.',
  c.id, 'Pensacola Beach', 'FL', p.id, true, false, 4.8, 83
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Breeze STR Accounting FL', 'gulf-breeze-str-accounting-fl', 'Pensacola area rental tax services',
  'Gulf Breeze STR Accounting covers the greater Pensacola market with Florida short-term rental tax compliance, Schedule E preparation, and vacation rental income optimization.',
  c.id, 'Pensacola', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Cannon Beach OR
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cannon Beach STR Tax Services', 'cannon-beach-str-tax-services', 'Oregon Coast vacation rental accounting',
  'Cannon Beach STR Tax Services handles Oregon lodging tax compliance, federal rental income reporting, and investment property strategy for vacation rental owners on the North Oregon Coast.',
  c.id, 'Cannon Beach', 'OR', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Oregon Coast STR Accounting', 'north-oregon-coast-str-accounting', 'Seaside area rental tax services',
  'North Oregon Coast STR Accounting covers Seaside and the northern Oregon Coast with Oregon short-term rental tax compliance, Schedule E optimization, and vacation rental financial planning.',
  c.id, 'Seaside', 'OR', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Tybee Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tybee Island STR Tax Services', 'tybee-island-str-tax-services', 'Georgia coast vacation rental accounting',
  'Tybee Island STR Tax Services handles Georgia hotel-motel fee compliance, federal rental income reporting, and investment property strategy for vacation rental owners on Tybee Island.',
  c.id, 'Tybee Island', 'GA', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Accounting GA', 'savannah-str-accounting-ga', 'Savannah and coastal Georgia rental tax',
  'Savannah STR Accounting covers downtown Savannah and Tybee Island vacation rental owners with Georgia short-term rental tax compliance, Schedule E preparation, and financial advisory.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Kiawah Island SC
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kiawah Island STR Tax Advisors', 'kiawah-island-str-tax-advisors', 'Luxury Lowcountry vacation rental accounting',
  'Kiawah Island STR Tax Advisors provides South Carolina accommodations tax compliance, federal rental income reporting, and investment strategy for luxury vacation rental owners.',
  c.id, 'Kiawah Island', 'SC', p.id, true, false, 4.9, 82
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Accounting SC', 'lowcountry-str-accounting-sc', 'Charleston Sea Islands rental tax services',
  'Lowcountry STR Accounting covers Johns Island and the Charleston Sea Islands with South Carolina short-term rental tax compliance, Schedule E preparation, and vacation rental financial planning.',
  c.id, 'Johns Island', 'SC', p.id, true, false, 4.8, 59
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- St. Simons Island GA
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Golden Isles STR Tax Services', 'golden-isles-str-tax-services', 'St. Simons vacation rental accounting',
  'Golden Isles STR Tax Services handles Georgia hotel-motel fee compliance, federal rental income reporting, and investment property strategy for vacation rental owners in Glynn County.',
  c.id, 'St. Simons Island', 'GA', p.id, true, false, 4.8, 69
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Brunswick GA STR Accounting', 'brunswick-ga-str-accounting', 'Glynn County vacation rental tax services',
  'Brunswick GA STR Accounting covers Golden Isles vacation rental owners with Georgia short-term rental tax compliance, Schedule E optimization, and rental income financial planning.',
  c.id, 'Brunswick', 'GA', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Chattanooga TN
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chattanooga STR Tax Advisors', 'chattanooga-str-tax-advisors', 'Tennessee River city rental accounting',
  'Chattanooga STR Tax Advisors handles Tennessee sales tax on accommodations, federal rental income reporting, and investment property strategy for vacation rental owners in Hamilton County.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic City STR Accounting TN', 'scenic-city-str-accounting-tn', 'Greater Chattanooga rental tax services',
  'Scenic City STR Accounting covers the Chattanooga metro with Tennessee short-term rental tax compliance, Schedule E preparation, and vacation rental income optimization.',
  c.id, 'Chattanooga', 'TN', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Fredericksburg TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Tax Services TX', 'hill-country-str-tax-services-tx', 'Fredericksburg vacation rental accounting',
  'Hill Country STR Tax Services handles Texas hotel occupancy tax compliance, federal rental income reporting, and investment property strategy for wine country vacation rental owners in Gillespie County.',
  c.id, 'Fredericksburg', 'TX', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Kerrville STR Accounting TX', 'kerrville-str-accounting-tx', 'Kerr County vacation rental tax services',
  'Kerrville STR Accounting covers Kerrville and the Guadalupe Valley with Texas short-term rental tax compliance, Schedule E optimization, and rental income financial planning.',
  c.id, 'Kerrville', 'TX', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- New Braunfels TX
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Comal County STR Tax Advisors', 'comal-county-str-tax-advisors', 'New Braunfels vacation rental accounting',
  'Comal County STR Tax Advisors handles Texas hotel occupancy tax compliance, federal rental income reporting, and investment property strategy for river house vacation rental owners in Comal County.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.9, 108
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gruene STR Accounting TX', 'gruene-str-accounting-tx', 'New Braunfels area rental tax services',
  'Gruene STR Accounting covers New Braunfels and Gruene vacation rental owners with Texas hotel occupancy tax compliance, Schedule E preparation, and rental income optimization.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Coeur d'Alene ID
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake CDA STR Tax Services', 'lake-cda-str-tax-services', 'Coeur d Alene vacation rental accounting',
  'Lake CDA STR Tax Services handles Idaho sales tax on vacation rentals, federal rental income reporting, and investment property strategy for vacation rental owners in Kootenai County.',
  c.id, 'Coeur d''Alene', 'ID', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'North Idaho STR Accounting', 'north-idaho-str-accounting', 'Kootenai County rental tax services',
  'North Idaho STR Accounting covers Coeur d''Alene and Post Falls vacation rental owners with Idaho short-term rental tax compliance, Schedule E optimization, and financial planning.',
  c.id, 'Post Falls', 'ID', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- Lake Geneva WI
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Geneva STR Tax Advisors WI', 'lake-geneva-str-tax-advisors-wi', 'Walworth County vacation rental accounting',
  'Lake Geneva STR Tax Advisors handles Wisconsin sales tax on short-term rentals, federal rental income reporting, and investment property strategy for lake cottage owners in Walworth County.',
  c.id, 'Lake Geneva', 'WI', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Geneva Lake STR Accounting WI', 'geneva-lake-str-accounting-wi', 'Lake Geneva area rental tax services',
  'Geneva Lake STR Accounting covers Williams Bay and the western Geneva Lake area with Wisconsin short-term rental tax compliance, Schedule E preparation, and vacation rental financial planning.',
  c.id, 'Williams Bay', 'WI', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;
