-- ============================================================
-- Migration 015 — Tier 3 Vendors: Cleaning, Photography,
--                 Property Management, Maintenance & Repairs
-- 2 vendors × 4 categories × 10 markets = 80 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- CLEANING & TURNOVER
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Cleaning Co', 'asheville-str-cleaning-co', 'Mountain vacation rental turnovers in Asheville & WNC',
  'Asheville STR Cleaning Co provides professional short-term rental cleaning for vacation property owners throughout Asheville and Western North Carolina. We specialize in mountain cabin and downtown loft turnovers, with same-day scheduling and full linen service.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 187
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Turnover Pros', 'blue-ridge-turnover-pros', 'Reliable STR cleaning across the Asheville area',
  'Blue Ridge Turnover Pros serves vacation rental owners throughout the greater Asheville area with dependable turnover cleaning. From Hendersonville cottages to Black Mountain cabins, our teams deliver guest-ready properties with photo checklists and supply restocking.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Turnover Specialists', 'obx-turnover-specialists', 'Outer Banks vacation rental cleaning experts',
  'OBX Turnover Specialists is the leading STR cleaning service on North Carolina''s Outer Banks, covering Corolla through Hatteras with fast, reliable turnovers. We specialize in large beach house cleanings, hot tub maintenance, and the logistically complex same-day turnovers that define the OBX summer rental season.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 312
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Clean Team', 'barrier-island-clean-team', 'Dependable beach house turnovers on the Outer Banks',
  'Barrier Island Clean Team provides reliable vacation rental cleaning for property owners across the Outer Banks. We handle everything from cozy soundside cottages to large oceanfront estates, with full linen service, supply restocking, and damage reporting after every turnover.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 224
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Cleaning', 'hilton-head-str-cleaning', 'Resort-quality STR turnovers on Hilton Head Island',
  'Hilton Head STR Cleaning provides premium short-term rental cleaning for vacation property owners throughout Hilton Head Island and Bluffton. We deliver resort-standard turnovers for plantation community homes, oceanfront villas, and golf cottages with meticulous attention to detail.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Island Turnovers', 'lowcountry-island-turnovers', 'Reliable vacation rental cleaning on Hilton Head',
  'Lowcountry Island Turnovers serves STR owners across Hilton Head Island and the surrounding Lowcountry with dependable turnover cleaning. Our bonded and insured team handles plantation homes, beach villas, and resort condos with full linen service and guest-ready staging.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, false, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Cleaning', 'key-west-str-cleaning', 'Vacation rental turnovers in Key West & the Florida Keys',
  'Key West STR Cleaning provides professional short-term rental cleaning throughout Key West and the Florida Keys. We specialize in historic Conch houses, waterfront cottages, and tropical villas with same-day turnover availability and full linen and supply management.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Conch Republic Turnovers', 'conch-republic-turnovers', 'Reliable STR cleaning for Key West vacation rentals',
  'Conch Republic Turnovers provides dependable vacation rental cleaning for Key West property owners. From Old Town Conch houses to New Town condos, our local team delivers spotless turnovers with photo documentation and supply restocking so your guests always arrive to a perfect property.',
  c.id, 'Key West', 'FL', p.id, true, false, 4.7, 132
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Cleaning', 'lake-tahoe-str-cleaning', 'Year-round vacation rental turnovers at Lake Tahoe',
  'Lake Tahoe STR Cleaning serves short-term rental owners throughout the Lake Tahoe basin with professional year-round cleaning services. We handle ski season cabin turnovers, summer lake house cleanings, and everything in between — including hot tub maintenance, fireplace cleaning, and deep winter cleanouts.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 221
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Nevada Turnover Co', 'sierra-nevada-turnover-co', 'Reliable STR cleaning across the Lake Tahoe region',
  'Sierra Nevada Turnover Co provides dependable vacation rental cleaning for property owners across both the California and Nevada sides of Lake Tahoe. Our experienced team handles mountain cabin turnovers year-round, with expertise in ski-season scheduling and post-storm deep cleans.',
  c.id, 'Tahoe City', 'CA', p.id, true, false, 4.8, 178
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Cleaning', 'park-city-str-cleaning', 'Ski chalet and mountain home turnovers in Park City',
  'Park City STR Cleaning is a premier cleaning service for short-term rental owners throughout the Park City area. We specialize in ski-season chalet turnovers, Sundance Film Festival peak-period scheduling, and summer mountain home cleanings with full linen service and supply management.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 203
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Mountain Turnovers', 'wasatch-mountain-turnovers', 'Reliable vacation rental cleaning in the Park City area',
  'Wasatch Mountain Turnovers provides reliable short-term rental cleaning for property owners throughout the Park City and Heber City area. From luxury ski-in ski-out chalets to Deer Valley vacation homes, our teams deliver consistent, high-quality turnovers all year long.',
  c.id, 'Park City', 'UT', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Cleaning Co', 'sedona-str-cleaning-co', 'Red rock retreat cleaning for Sedona vacation rentals',
  'Sedona STR Cleaning Co provides professional short-term rental cleaning for vacation property owners throughout Sedona and the Verde Valley. We specialize in luxury red rock retreat turnovers, spa villa cleanings, and eco-resort maintenance with the white-glove standard that Sedona guests expect.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Turnover Services', 'red-rock-turnover-services', 'Dependable STR cleaning across the Sedona area',
  'Red Rock Turnover Services provides dependable vacation rental cleaning for STR owners throughout Sedona and surrounding communities. Our local team handles everything from cozy casitas to luxury hilltop estates, delivering guest-ready properties with photo documentation and supply restocking.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Cleaning Co', 'savannah-str-cleaning-co', 'Historic district vacation rental turnovers in Savannah',
  'Savannah STR Cleaning Co provides professional short-term rental cleaning for vacation property owners throughout Savannah and Tybee Island. We specialize in historic district townhome turnovers, Victorian mansion cleanings, and Tybee beach house maintenance with full linen service.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 189
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Turnovers', 'coastal-georgia-turnovers', 'Reliable STR cleaning in Savannah and Tybee Island',
  'Coastal Georgia Turnovers serves vacation rental owners across Savannah and the Georgia coast with dependable turnover cleaning. From moss-draped historic squares to Tybee Island beachfront cottages, we deliver consistent, high-quality turnovers with photo reports and supply management.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 154
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Cleaning', 'virginia-beach-str-cleaning', 'Vacation rental turnovers across Virginia Beach',
  'Virginia Beach STR Cleaning provides professional short-term rental cleaning for property owners throughout Virginia Beach and the Hampton Roads area. We handle oceanfront condo turnovers, Sandbridge beach house cleanings, and resort property maintenance with same-day availability in peak season.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 212
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sandbridge Turnover Pros', 'sandbridge-turnover-pros', 'Beach house cleaning for Virginia Beach rental owners',
  'Sandbridge Turnover Pros specializes in vacation rental cleaning for beach house owners in Virginia Beach''s most desirable neighborhoods. Our team handles everything from oceanfront estates to quiet bay-side cottages, with full linen service, supply restocking, and detailed turnover reports.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Cleaning Co', 'san-antonio-str-cleaning-co', 'Vacation rental turnovers in San Antonio & the Hill Country',
  'San Antonio STR Cleaning Co provides professional short-term rental cleaning for property owners throughout San Antonio and the Texas Hill Country. We handle downtown River Walk loft turnovers, historic King William District homes, and Hill Country cabin cleanings with fast turnaround and full supply management.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alamo City Turnovers', 'alamo-city-turnovers', 'Reliable STR cleaning across San Antonio',
  'Alamo City Turnovers serves vacation rental owners throughout San Antonio with dependable turnover cleaning services. From downtown condos near the Alamo to suburban vacation homes and Hill Country getaways in Boerne, our teams deliver spotless properties that earn five-star guest reviews.',
  c.id, 'San Antonio', 'TX', p.id, true, false, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- PHOTOGRAPHY & DESIGN
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Photography', 'asheville-str-photography', 'Mountain vacation rental photography in Asheville',
  'Asheville STR Photography captures the unique character of Western North Carolina vacation rentals — from downtown arts district lofts to Blue Ridge mountain cabins. We specialize in moody, atmospheric photography that showcases mountain views, cozy interiors, and the distinctive Asheville aesthetic that attracts premium guests.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 134
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Property Lens', 'blue-ridge-property-lens', 'Professional STR listing photos across Western NC',
  'Blue Ridge Property Lens provides professional photography for short-term rental owners throughout the Asheville area and Western North Carolina. Our wide-angle HDR photography and drone aerials showcase mountain views, outdoor spaces, and interior character that drive bookings.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 98
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Vacation Rental Photos', 'obx-vacation-rental-photos', 'Outer Banks beach house photography specialists',
  'OBX Vacation Rental Photos specializes in listing photography for vacation rental properties across the Outer Banks. We capture the expansive oceanfront views, rooftop decks, private pools, and coastal character that make OBX beach houses stand out on Airbnb and VRBO.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal NC Property Shots', 'coastal-nc-property-shots', 'Professional vacation rental photography on the OBX',
  'Coastal NC Property Shots provides professional listing photography for vacation rental owners across the Outer Banks. From Corolla oceanfront mansions to Hatteras surf cottages, we deliver stunning images that showcase your property''s best features and maximize your listing''s appeal.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 154
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Photography', 'hilton-head-str-photography', 'Resort vacation rental photography on Hilton Head Island',
  'Hilton Head STR Photography captures the elegance of Hilton Head vacation properties with bright, sophisticated photography. We photograph plantation community homes, oceanfront villas, and golf cottages with the polished aesthetic that appeals to the upscale Hilton Head traveler.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sea Pines Property Photos', 'sea-pines-property-photos', 'Luxury STR listing photography on Hilton Head',
  'Sea Pines Property Photos provides premium photography for vacation rental owners throughout Hilton Head Island. Specializing in the island''s upscale resort communities, we deliver listing images that reflect the luxury experience guests expect in this premier destination.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, false, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West Vacation Lens', 'key-west-vacation-lens', 'Tropical vacation rental photography in Key West',
  'Key West Vacation Lens captures the vibrant, tropical character of Key West vacation rentals with colorful, lifestyle-driven photography. We photograph historic Conch houses, tropical pool villas, and waterfront properties with the warm, inviting imagery that attracts guests to the Southernmost City.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 156
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys Property Photos', 'florida-keys-property-photos', 'STR listing photography throughout the Florida Keys',
  'Florida Keys Property Photos provides professional vacation rental photography throughout the Keys, from Key Largo to Key West. We specialize in waterfront properties, tropical villas, and tiki-style cottages with drone aerials that showcase the turquoise waters and island lifestyle.',
  c.id, 'Key West', 'FL', p.id, true, false, 4.7, 121
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Photography', 'lake-tahoe-str-photography', 'Mountain lake vacation rental photography at Tahoe',
  'Lake Tahoe STR Photography specializes in capturing the stunning natural beauty of Lake Tahoe vacation rentals. We photograph ski chalets, lakefront cabins, and mountain homes with HDR imagery, blue-water drone shots, and golden-hour shoots that showcase the iconic Tahoe backdrop.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Shots STR Media', 'sierra-shots-str-media', 'Professional listing photography around Lake Tahoe',
  'Sierra Shots STR Media provides listing photography for vacation rental owners throughout the Lake Tahoe basin. Our mountain photography expertise captures both the cozy interior warmth of ski cabins and the dramatic exterior landscapes that make Tahoe properties so desirable.',
  c.id, 'Tahoe City', 'CA', p.id, true, false, 4.8, 132
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Photography', 'park-city-str-photography', 'Luxury ski chalet photography in Park City, Utah',
  'Park City STR Photography captures the luxury ski resort lifestyle in every listing image. We specialize in high-end chalet photography for Park City Mountain Resort and Deer Valley area properties, with mountain sunset shoots, ski trail drone aerials, and interior photography that justifies premium nightly rates.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Property Lens', 'wasatch-property-lens', 'Professional STR listing photos in Park City',
  'Wasatch Property Lens provides professional photography for vacation rental owners throughout the Park City area. We deliver listing images that showcase ski-in ski-out access, mountain views, luxury amenities, and the premium living spaces that command high nightly rates in this top Utah resort market.',
  c.id, 'Park City', 'UT', p.id, true, false, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona Red Rock Photography', 'sedona-red-rock-photography', 'Stunning vacation rental photography in Sedona',
  'Sedona Red Rock Photography creates breathtaking listing images for vacation rental properties throughout Sedona. We capture the dramatic red rock vistas, private infinity pools, outdoor meditation decks, and luxury interiors that make Sedona properties worth every premium dollar guests pay.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Verde Valley STR Photos', 'verde-valley-str-photos', 'Professional listing photography for Sedona rentals',
  'Verde Valley STR Photos provides professional photography for vacation rental owners throughout the Sedona and Verde Valley area. Our desert landscape expertise captures red rock views, outdoor living spaces, and luxury interiors with the golden-hour magic that makes Sedona properties irresistible.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Photography', 'savannah-str-photography', 'Historic home vacation rental photography in Savannah',
  'Savannah STR Photography captures the timeless beauty of Savannah vacation rental properties. We specialize in photographing historic district homes, Spanish moss-framed exteriors, and Tybee Island beach cottages with an aesthetic that transports guests before they even arrive.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 156
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Georgia Coast Property Lens', 'georgia-coast-property-lens', 'Professional STR photos in Savannah and Tybee Island',
  'Georgia Coast Property Lens provides listing photography for vacation rental owners throughout the Savannah area and Tybee Island. We capture the unique character of Georgia coastal properties — from grand Victorian homes to casual beach bungalows — with imagery that drives bookings.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 118
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Photography', 'virginia-beach-str-photography', 'Oceanfront vacation rental photography in Virginia Beach',
  'Virginia Beach STR Photography captures the coastal lifestyle of Virginia Beach vacation properties with bright, energetic listing imagery. We photograph oceanfront condos, Sandbridge beach houses, and Chesapeake Bay waterfront properties with drone aerials and lifestyle photography that attracts premium guests.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 189
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hampton Roads Property Photos', 'hampton-roads-property-photos', 'Professional STR listing photos across Virginia Beach',
  'Hampton Roads Property Photos serves vacation rental owners throughout Virginia Beach and the Hampton Roads area with professional listing photography. Our coastal photography expertise highlights oceanfront views, private outdoor spaces, and the relaxed Virginia Beach lifestyle.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Photography', 'san-antonio-str-photography', 'Vacation rental photography in San Antonio & Hill Country',
  'San Antonio STR Photography provides professional listing photography for vacation rental owners throughout San Antonio and the Texas Hill Country. We capture the character of River Walk lofts, historic district homes, and Hill Country vineyard retreats with imagery that drives bookings year-round.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alamo City Property Lens', 'alamo-city-property-lens', 'Professional STR listing photos across San Antonio',
  'Alamo City Property Lens delivers high-quality listing photography for short-term rental owners throughout San Antonio. From downtown historic properties to suburban vacation homes and Hill Country retreats, our photography helps your listing stand out in a competitive Texas market.',
  c.id, 'San Antonio', 'TX', p.id, true, false, 4.8, 128
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- PROPERTY MANAGEMENT
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Management', 'asheville-str-management', 'Full-service Airbnb management in Asheville & WNC',
  'Asheville STR Management provides comprehensive short-term rental management for property owners throughout Asheville and Western North Carolina. We handle dynamic pricing, guest communication, cleaning coordination, and maintenance for mountain cabins, downtown lofts, and all property types in this growing market.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 156
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Vacation Rentals Mgmt', 'blue-ridge-vacation-rentals-mgmt', 'Expert STR management across the Asheville area',
  'Blue Ridge Vacation Rentals Mgmt offers full-service property management for short-term rental owners throughout the greater Asheville area. Our local team handles all aspects of your rental — from listing optimization and pricing to guest services and property maintenance.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 118
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Vacation Rental Management', 'obx-vacation-rental-management', 'Full-service STR management on the Outer Banks',
  'OBX Vacation Rental Management provides comprehensive property management for vacation rental owners across the Outer Banks. We manage the full spectrum — from small oceanside cottages to large group beach houses — with expert seasonal pricing, 24/7 guest support, and local maintenance coordination.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 243
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Property Partners', 'barrier-island-property-partners', 'Trusted STR management for OBX rental owners',
  'Barrier Island Property Partners manages vacation rental properties across the Outer Banks with a focus on maximizing seasonal revenue and delivering exceptional guest experiences. Our local team handles all coordination so OBX property owners can enjoy passive income from their beach investments.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 187
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head Vacation Rental Mgmt', 'hilton-head-vacation-rental-mgmt', 'Premium STR management on Hilton Head Island',
  'Hilton Head Vacation Rental Management provides white-glove property management for vacation rental owners throughout Hilton Head Island and Bluffton. We specialize in the premium Hilton Head market — managing plantation community homes, oceanfront villas, and golf cottages with a service standard that matches the island''s upscale reputation.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island STR Partners Hilton Head', 'island-str-partners-hilton-head', 'Expert Airbnb management on Hilton Head Island',
  'Island STR Partners provides full-service short-term rental management for property owners on Hilton Head Island. Our team navigates the island''s HOA rules, resort community regulations, and seasonal demand patterns to maximize your rental income while maintaining impeccable property standards.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, false, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West Vacation Rental Management', 'key-west-vacation-rental-management', 'Full-service STR management in Key West & the Keys',
  'Key West Vacation Rental Management provides comprehensive property management for vacation rental owners throughout Key West and the Florida Keys. We specialize in the unique Key West market — managing historic Conch houses, waterfront villas, and tropical retreats with expert pricing and guest services.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southernmost STR Management', 'southernmost-str-management', 'Expert Airbnb management in Key West',
  'Southernmost STR Management offers full-service short-term rental management for property owners in Key West. Our local team handles all aspects of your vacation rental — from listing optimization and dynamic pricing to guest communication, cleaning coordination, and maintenance.',
  c.id, 'Key West', 'FL', p.id, true, false, 4.8, 132
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Management', 'lake-tahoe-str-management', 'Year-round vacation rental management at Lake Tahoe',
  'Lake Tahoe STR Management provides comprehensive short-term rental management for property owners throughout the Tahoe basin. We manage properties year-round across both ski season and summer, handling dynamic pricing, guest services, cleaning coordination, and maintenance for cabins and vacation homes on both sides of the lake.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 212
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tahoe Mountain Properties Mgmt', 'tahoe-mountain-properties-mgmt', 'Expert Airbnb management across the Lake Tahoe area',
  'Tahoe Mountain Properties Management offers full-service STR management for vacation rental owners throughout the Lake Tahoe region. Our team handles all coordination across the four-season market — from peak ski weekends to summer lake weekends — with expert pricing and local maintenance.',
  c.id, 'Tahoe City', 'CA', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Management Co', 'park-city-str-management-co', 'Full-service ski chalet management in Park City',
  'Park City STR Management Co provides premium short-term rental management for property owners throughout the Park City area. We specialize in luxury ski resort properties — managing Deer Valley chalets, Park City Mountain condos, and Sundance Film Festival peak-period surge pricing with expert local knowledge.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Deer Valley STR Partners', 'deer-valley-str-partners', 'Expert vacation rental management in the Park City area',
  'Deer Valley STR Partners manages luxury vacation rental properties throughout the Park City and Heber Valley area. Our full-service approach covers all aspects of STR operations — from listing creation and dynamic pricing to guest concierge services and property maintenance.',
  c.id, 'Park City', 'UT', p.id, true, false, 4.8, 154
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Management Co', 'sedona-str-management-co', 'Full-service vacation rental management in Sedona',
  'Sedona STR Management Co provides comprehensive short-term rental management for property owners throughout Sedona and the Verde Valley. We manage luxury red rock retreats, spa villas, and boutique vacation rentals with a premium service approach that commands top-tier nightly rates.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Partners', 'red-rock-str-partners', 'Expert Airbnb management in Sedona, Arizona',
  'Red Rock STR Partners offers full-service vacation rental management for property owners in the Sedona area. Our local team handles dynamic pricing, guest communication, cleaning coordination, and maintenance for all Sedona property types — from cozy casitas to luxury hilltop estates.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 132
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Management', 'savannah-str-management', 'Full-service vacation rental management in Savannah',
  'Savannah STR Management provides comprehensive short-term rental management for property owners throughout Savannah and the Georgia coast. We specialize in historic district properties, navigating Savannah''s STR ordinance requirements while maximizing rental income for our owners.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 154
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia STR Partners', 'coastal-georgia-str-partners', 'Expert Airbnb management in Savannah & Tybee Island',
  'Coastal Georgia STR Partners manages vacation rental properties throughout Savannah and Tybee Island. Our full-service approach handles all aspects of short-term rental operations — from listing optimization and pricing to guest services, cleaning coordination, and property maintenance.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 118
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Management', 'virginia-beach-str-management', 'Full-service vacation rental management in Virginia Beach',
  'Virginia Beach STR Management provides comprehensive short-term rental management for property owners throughout Virginia Beach and the Hampton Roads area. We handle dynamic pricing, guest services, cleaning coordination, and maintenance for oceanfront condos, beach houses, and all Virginia Beach property types.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal VA STR Partners', 'coastal-va-str-partners', 'Expert Airbnb management across Virginia Beach',
  'Coastal VA STR Partners offers full-service vacation rental management for property owners throughout Virginia Beach. Our team specializes in seasonal pricing optimization, peak summer demand management, and year-round occupancy strategies for the Virginia Beach vacation rental market.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Management Co', 'san-antonio-str-management-co', 'Full-service Airbnb management in San Antonio & Hill Country',
  'San Antonio STR Management Co provides comprehensive short-term rental management for property owners throughout San Antonio and the Texas Hill Country. We manage downtown vacation rentals, historic district properties, and Hill Country cabins with expert pricing and guest services.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'River Walk STR Partners', 'river-walk-str-partners', 'Expert vacation rental management in San Antonio',
  'River Walk STR Partners manages short-term rental properties throughout San Antonio with a focus on maximizing revenue from the city''s strong tourism base. Our team handles all STR operations — from listing optimization and dynamic pricing to guest concierge services and property maintenance.',
  c.id, 'San Antonio', 'TX', p.id, true, false, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- MAINTENANCE & REPAIRS
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Maintenance', 'asheville-str-maintenance', 'Responsive handyman and maintenance for Asheville rentals',
  'Asheville STR Maintenance provides on-call handyman and property maintenance services for short-term rental owners throughout the Asheville area. We handle plumbing, HVAC, appliance repairs, and general maintenance for mountain cabins and downtown vacation rentals with STR-priority scheduling.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Property Repair', 'blue-ridge-property-repair', 'Fast repairs and maintenance for WNC vacation rentals',
  'Blue Ridge Property Repair serves short-term rental owners across Western North Carolina with fast, reliable maintenance services. Our licensed technicians handle all repair needs — from plumbing and electrical to HVAC and appliances — with same-day response for guest-impacting issues.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.7, 87
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Property Maintenance', 'obx-property-maintenance', 'Vacation rental maintenance across the Outer Banks',
  'OBX Property Maintenance provides comprehensive maintenance and repair services for vacation rental property owners across the Outer Banks. We handle the unique challenges of barrier island properties — salt air corrosion, storm damage, pool/hot tub maintenance, and emergency repairs — with fast response times.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.8, 198
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Repairs OBX', 'barrier-island-repairs-obx', 'On-call handyman and repairs on the Outer Banks',
  'Barrier Island Repairs provides on-call maintenance and repair services for vacation rental owners across the Outer Banks. From plumbing and electrical repairs to pool maintenance and storm prep, our local team responds quickly to protect your rental income.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 156
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Maintenance', 'hilton-head-str-maintenance', 'Property maintenance for Hilton Head vacation rentals',
  'Hilton Head STR Maintenance provides responsive property maintenance for vacation rental owners throughout Hilton Head Island and Bluffton. We handle all repair needs for island properties — including HVAC, plumbing, appliances, and hurricane preparation — with the quick response time that premium resort properties demand.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island Handyman Hilton Head', 'island-handyman-hilton-head', 'Reliable repairs and maintenance on Hilton Head Island',
  'Island Handyman Hilton Head provides reliable maintenance and repair services for vacation rental property owners throughout Hilton Head. Our licensed team handles plumbing, electrical, HVAC, appliances, and general repairs with priority scheduling for guest-impacting issues.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, false, 4.7, 103
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Maintenance', 'key-west-str-maintenance', 'Property maintenance for Key West vacation rentals',
  'Key West STR Maintenance provides comprehensive property maintenance for vacation rental owners in Key West and the Florida Keys. We specialize in the unique maintenance needs of tropical island properties — including hurricane prep, salt air corrosion prevention, pool maintenance, and historic structure repairs.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.8, 123
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys Property Repairs', 'florida-keys-property-repairs', 'On-call repairs and maintenance in the Florida Keys',
  'Florida Keys Property Repairs provides on-call maintenance and repair services for vacation rental owners throughout the Florida Keys. From Key Largo to Key West, our licensed team handles all repair needs with fast response for guest-impacting issues.',
  c.id, 'Key West', 'FL', p.id, true, false, 4.7, 98
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Maintenance', 'lake-tahoe-str-maintenance', 'Year-round property maintenance at Lake Tahoe',
  'Lake Tahoe STR Maintenance provides year-round property maintenance for vacation rental owners throughout the Tahoe basin. We handle all season-specific maintenance needs — snow removal and winterization in ski season, deck and HVAC servicing in summer — with fast response for guest emergencies.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Mountain Property Repair', 'sierra-mountain-property-repair', 'Reliable STR maintenance around Lake Tahoe',
  'Sierra Mountain Property Repair serves vacation rental owners throughout the Lake Tahoe area with reliable maintenance and repair services. Our licensed technicians handle all property needs — plumbing, HVAC, appliances, hot tubs, and more — with STR-priority scheduling.',
  c.id, 'Tahoe City', 'CA', p.id, true, false, 4.7, 132
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Maintenance Co', 'park-city-str-maintenance-co', 'Property maintenance for Park City ski rental owners',
  'Park City STR Maintenance Co provides comprehensive property maintenance for vacation rental owners throughout the Park City area. We specialize in ski property maintenance — including snowmelt system servicing, ski storage maintenance, hot tub care, and all property repairs for mountain resort homes.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.8, 154
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Property Maintenance', 'wasatch-property-maintenance', 'Reliable repairs for Park City vacation rental properties',
  'Wasatch Property Maintenance serves vacation rental owners throughout Park City and the surrounding Wasatch Back with reliable maintenance and repair services. From plumbing and HVAC to ski chalet-specific amenity maintenance, our local team keeps your property guest-ready year-round.',
  c.id, 'Park City', 'UT', p.id, true, false, 4.7, 118
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Maintenance Services', 'sedona-str-maintenance-services', 'Property maintenance for Sedona vacation rental owners',
  'Sedona STR Maintenance Services provides responsive property maintenance for vacation rental owners throughout the Sedona area. We handle all repair needs for desert resort properties — including HVAC, pool and spa maintenance, plumbing, and general handyman work — with priority scheduling for guest-impacting issues.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Property Repairs', 'red-rock-property-repairs', 'Fast, reliable repairs for Sedona STR properties',
  'Red Rock Property Repairs provides on-call maintenance and repair services for vacation rental owners throughout Sedona and the Verde Valley. Our licensed technicians handle all property needs with fast response times to minimize guest disruption and protect your rental income.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 103
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Maintenance Co', 'savannah-str-maintenance-co', 'Property maintenance for Savannah vacation rentals',
  'Savannah STR Maintenance Co provides reliable maintenance and repair services for vacation rental owners throughout Savannah and Tybee Island. We specialize in the maintenance needs of historic Savannah properties — including aging plumbing, HVAC, and the ongoing upkeep of antebellum and Victorian structures.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.8, 121
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Georgia Coast Property Maintenance', 'georgia-coast-property-maintenance', 'Handyman and repairs for Savannah STR properties',
  'Georgia Coast Property Maintenance serves vacation rental owners throughout Savannah and the Georgia coast with reliable maintenance services. Our licensed team handles all repair needs — plumbing, electrical, HVAC, and general handyman work — with quick response for guest-impacting issues.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 94
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Maintenance', 'virginia-beach-str-maintenance', 'Property maintenance for Virginia Beach vacation rentals',
  'Virginia Beach STR Maintenance provides responsive property maintenance and repair services for short-term rental owners throughout Virginia Beach and the Hampton Roads area. We handle all maintenance needs for coastal properties — including storm prep, salt air corrosion, HVAC, and pool maintenance.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hampton Roads STR Handyman', 'hampton-roads-str-handyman', 'Reliable repairs and maintenance in Virginia Beach',
  'Hampton Roads STR Handyman provides on-call maintenance and repair services for vacation rental owners throughout Virginia Beach. From plumbing and electrical to appliance repairs and HVAC, our licensed team responds quickly to keep your coastal rental guest-ready.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.7, 121
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Maintenance Co', 'san-antonio-str-maintenance-co', 'Vacation rental maintenance in San Antonio & Hill Country',
  'San Antonio STR Maintenance Co provides comprehensive property maintenance for short-term rental owners throughout San Antonio and the Texas Hill Country. We handle all repair needs — plumbing, HVAC, electrical, appliances — with fast response times for downtown and Hill Country properties alike.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alamo City STR Handyman', 'alamo-city-str-handyman', 'On-call repairs and maintenance for San Antonio rentals',
  'Alamo City STR Handyman provides on-call handyman and property repair services for vacation rental owners throughout San Antonio. Our licensed technicians handle all maintenance needs with priority scheduling for guest-impacting issues across the San Antonio metro area.',
  c.id, 'San Antonio', 'TX', p.id, true, false, 4.7, 109
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;
