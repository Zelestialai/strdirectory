-- ============================================================
-- Migration 017 — Tier 3 Vendors: Insurance, Furniture & Supplies,
--                 Smart Home & Tech, Legal & Regulations
-- 2 vendors × 4 categories × 10 markets = 80 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- INSURANCE
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Insurance Group', 'asheville-str-insurance-group', 'Short-term rental insurance for Asheville vacation properties',
  'Asheville STR Insurance Group provides specialized short-term rental insurance for vacation property owners throughout Western North Carolina. We offer comprehensive STR coverage including liability, property damage, loss of rental income, and guest injury protection — all tailored to the unique risks of mountain vacation rental properties.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Vacation Rental Insurance', 'blue-ridge-vacation-rental-insurance', 'STR property and liability coverage in WNC',
  'Blue Ridge Vacation Rental Insurance helps Asheville area property owners find the right coverage for their short-term rental investments. From standalone STR policies to umbrella coverage for multi-property portfolios, we match WNC vacation rental owners with policies that provide genuine protection without overpaying.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX STR Insurance Specialists', 'obx-str-insurance-specialists', 'Outer Banks vacation rental and coastal property insurance',
  'OBX STR Insurance Specialists provides vacation rental insurance for property owners throughout the Outer Banks. We specialize in the unique insurance challenges of barrier island properties — wind and hurricane coverage, flood insurance, structural coverage for stilted beach houses, and comprehensive STR liability protection across the entire OBX market.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 118
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Insurance Group', 'barrier-island-insurance-group', 'Coastal STR coverage for Outer Banks vacation properties',
  'Barrier Island Insurance Group helps OBX vacation rental owners navigate the complex insurance landscape of barrier island property ownership. We provide wind, flood, and STR liability coverage tailored to the realities of Dare and Currituck County properties — ensuring owners are fully protected through storm season and beyond.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.8, 84
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Insurance', 'hilton-head-str-insurance', 'Lowcountry vacation rental insurance for Hilton Head properties',
  'Hilton Head STR Insurance provides comprehensive short-term rental insurance for vacation property owners across Hilton Head Island and the greater Lowcountry. We specialize in plantation community HOA insurance coordination, flood coverage for coastal properties, and high-value STR liability policies that match the premium nature of the Hilton Head market.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 93
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palmetto STR Insurance Agency', 'palmetto-str-insurance-agency', 'STR insurance coverage across South Carolina',
  'Palmetto STR Insurance Agency helps vacation rental owners across Hilton Head, Bluffton, and Beaufort find comprehensive STR coverage. We work with multiple carriers to find policies that cover the full scope of short-term rental risks — guest liability, property damage, income loss, and coastal weather events.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys STR Insurance', 'florida-keys-str-insurance', 'Key West and Florida Keys vacation rental insurance',
  'Florida Keys STR Insurance provides specialized insurance solutions for vacation rental property owners throughout the Florida Keys. We navigate the challenging insurance landscape of Monroe County — including wind, flood, and STR liability coverage — and help Keys property owners find comprehensive protection for their valuable coastal investments.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 127
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Keys Coastal Insurance Group', 'keys-coastal-insurance-group', 'STR and coastal property insurance across the Florida Keys',
  'Keys Coastal Insurance Group helps vacation rental investors throughout the Florida Keys build comprehensive insurance protection for their properties. From historic Key West Conch houses to modern waterfront estates in the Middle Keys, we provide tailored coverage packages that address the unique risks of Keys vacation rental ownership.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.8, 88
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Insurance', 'lake-tahoe-str-insurance', 'Mountain vacation rental insurance at Lake Tahoe',
  'Lake Tahoe STR Insurance provides comprehensive short-term rental insurance for vacation property owners throughout the Lake Tahoe basin. We specialize in covering the unique risks of mountain vacation rentals — snow load, wildfire, and STR liability — and navigate the dual California-Nevada regulatory landscape for Tahoe property owners.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 104
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Alpine Insurance Group', 'sierra-alpine-insurance-group', 'STR insurance for Lake Tahoe and Truckee vacation rentals',
  'Sierra Alpine Insurance Group helps vacation rental owners across the Lake Tahoe basin and Truckee area find appropriate coverage for their mountain properties. We specialize in wildfire risk coverage, snow damage policies, and STR-specific liability insurance — providing complete protection for one of California''s most valuable vacation rental markets.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Insurance', 'park-city-str-insurance', 'Ski resort vacation rental insurance in Park City',
  'Park City STR Insurance provides specialized insurance coverage for short-term rental properties throughout the Park City and Heber Valley area. We offer STR liability coverage, ski equipment loss protection, high-value property insurance, and comprehensive policies tailored to the unique risks and premium valuations of Utah mountain resort vacation rentals.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Mountain Insurance', 'wasatch-mountain-insurance', 'STR insurance across Park City and the Wasatch Back',
  'Wasatch Mountain Insurance helps vacation rental owners throughout the Park City area find comprehensive STR coverage. From ski chalet liability policies to loss of rental income coverage during shoulder seasons, we match Park City investors with protection that reflects the true value and risk profile of Utah mountain resort properties.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.8, 63
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Insurance Group', 'sedona-str-insurance-group', 'Arizona vacation rental insurance for Sedona properties',
  'Sedona STR Insurance Group provides specialized short-term rental insurance for vacation property owners throughout Sedona and the Verde Valley. We navigate Arizona''s unique insurance landscape — including wildfire and flash flood coverage — while providing comprehensive STR liability and property protection for one of America''s most distinctive vacation rental markets.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 109
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Insurance Agency', 'red-rock-insurance-agency', 'STR coverage for Sedona and Verde Valley vacation rentals',
  'Red Rock Insurance Agency helps Sedona vacation rental owners find comprehensive coverage that addresses the specific risks of desert and canyon property ownership. From wildfire risk policies to luxury property coverage and full STR liability protection, we provide Sedona investors with the peace of mind to focus on growing their rental business.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Insurance Group', 'savannah-str-insurance-group', 'Georgia vacation rental insurance in Savannah',
  'Savannah STR Insurance Group provides comprehensive short-term rental insurance for vacation property owners throughout Savannah and the Georgia coast. We specialize in historic property coverage for the Historic District, coastal flood insurance for Tybee Island, and comprehensive STR liability policies for the greater Savannah vacation rental market.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Insurance Agency', 'coastal-georgia-insurance-agency', 'STR insurance for Savannah and Tybee Island properties',
  'Coastal Georgia Insurance Agency helps vacation rental owners across Savannah and the Georgia coast find appropriate STR coverage. From antebellum mansion liability policies to Tybee Island beach cottage flood and wind coverage, we provide the specialized insurance expertise that protects coastal Georgia vacation rental investments.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.8, 64
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Insurance', 'virginia-beach-str-insurance', 'Coastal vacation rental insurance for Virginia Beach',
  'Virginia Beach STR Insurance provides specialized short-term rental insurance for vacation property owners throughout Virginia Beach and the Hampton Roads region. We offer comprehensive STR coverage including flood, wind, liability, and loss of rental income — all tailored to the specific risks of Virginia''s oceanfront and Sandbridge vacation rental properties.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 99
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater STR Insurance Group', 'tidewater-str-insurance-group', 'STR insurance across Virginia Beach and Hampton Roads',
  'Tidewater STR Insurance Group helps vacation rental investors across Virginia Beach and Hampton Roads find comprehensive coverage. We specialize in oceanfront property wind and flood insurance, STR liability policies, and multi-property portfolio coverage for investors who own vacation rentals across multiple Hampton Roads markets.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Insurance', 'san-antonio-str-insurance', 'Texas vacation rental insurance for San Antonio and the Hill Country',
  'San Antonio STR Insurance provides specialized short-term rental insurance for vacation property owners throughout San Antonio and the Texas Hill Country. From downtown River Walk loft liability coverage to Fredericksburg vineyard property insurance and New Braunfels river cabin flood protection, we offer comprehensive STR coverage across all Hill Country markets.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lone Star STR Insurance Agency', 'lone-star-str-insurance-agency', 'STR coverage for Texas Hill Country vacation rentals',
  'Lone Star STR Insurance Agency helps vacation rental owners across San Antonio and the Texas Hill Country find appropriate STR coverage. We specialize in Texas vacation rental liability, flood coverage for Hill Country river properties, and comprehensive policies for the full range of Hill Country STR property types.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- FURNITURE & SUPPLIES
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Furnishings', 'asheville-str-furnishings', 'Mountain vacation rental furniture packages in Asheville',
  'Asheville STR Furnishings provides complete furniture packages and supply kits for vacation rental owners throughout Western North Carolina. We curate mountain-inspired furnishing packages that balance durability with aesthetic appeal, delivering fully equipped properties ready to photograph and list — from downtown Asheville studios to Brevard mountain cabins.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 72
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Supply Co', 'blue-ridge-str-supply-co', 'Vacation rental supplies and amenity kits in WNC',
  'Blue Ridge STR Supply Co equips vacation rental properties throughout the Asheville area with everything owners need to deliver five-star guest experiences. From starter supply kits to ongoing consumable restocking, high-quality linens, and full furniture packages, we help WNC vacation rental owners create memorable stays.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 48
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX STR Furnishings', 'obx-str-furnishings', 'Beach house furniture packages for Outer Banks vacation rentals',
  'OBX STR Furnishings delivers complete furniture packages and supply kits for vacation rental property owners across the Outer Banks. We specialize in durable, coastal-style furnishings that withstand heavy beach house use while maintaining the fresh, airy aesthetic that OBX guests expect — with fast delivery from Corolla to Ocracoke.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Supply Co', 'barrier-island-supply-co', 'STR supplies and furnishings across the Outer Banks',
  'Barrier Island Supply Co equips vacation rental properties throughout the OBX with the linens, supplies, and amenities that drive five-star reviews. From beach gear packages to luxury linen sets and full property setup for new STR launches, we provide everything OBX vacation rental owners need to succeed on booking platforms.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Furnishings', 'hilton-head-str-furnishings', 'Luxury vacation rental furniture for Hilton Head properties',
  'Hilton Head STR Furnishings provides premium furniture packages and supply solutions for vacation rental owners throughout Hilton Head Island and the Lowcountry. We specialize in sophisticated, resort-quality furnishings that match the high expectations of Hilton Head''s upscale guest demographic — with white-glove delivery and setup throughout the island.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 61
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Supply Co', 'lowcountry-str-supply-co', 'Vacation rental furnishings and supplies in Hilton Head',
  'Lowcountry STR Supply Co equips vacation rental properties across Hilton Head and Bluffton with high-quality furnishings and guest supplies. From luxury linen packages to complete furniture staging and ongoing consumable delivery, we help Lowcountry property owners create the polished, resort-quality experiences that their guests expect.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 43
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Furnishings', 'key-west-str-furnishings', 'Tropical vacation rental furniture for Key West properties',
  'Key West STR Furnishings provides colorful, tropical furniture packages and supply kits for vacation rental owners throughout Key West and the Florida Keys. We curate furnishings that capture Key West''s unique Caribbean character while delivering the durability and comfort needed for high-traffic vacation rental properties in the Conch Republic.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys STR Supply', 'florida-keys-str-supply', 'Vacation rental supplies across the Florida Keys',
  'Florida Keys STR Supply equips vacation rental properties throughout the Florida Keys with everything needed for outstanding guest experiences. From snorkel and dive gear packages to premium beach supplies, luxury linens, and complete furniture packages, we help Keys vacation rental owners create the memorable island experiences guests rave about.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Furnishings', 'lake-tahoe-str-furnishings', 'Alpine vacation rental furniture for Lake Tahoe properties',
  'Lake Tahoe STR Furnishings provides complete furniture packages and supply solutions for vacation rental owners throughout the Lake Tahoe basin. We specialize in mountain-modern furnishings that evoke the warmth and beauty of the Tahoe alpine setting — with ski and outdoor gear packages, luxury linens, and full property setup for new STR launches.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 83
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra STR Supply Co', 'sierra-str-supply-co', 'Vacation rental furnishings and supplies in Lake Tahoe',
  'Sierra STR Supply Co equips vacation rental properties across the Lake Tahoe basin and Truckee with high-quality furnishings and guest amenities. From ski equipment lockers to luxury bedding packages and complete furniture staging, we help Tahoe property owners create the premium alpine experiences that justify the area''s top-tier nightly rates.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Furnishings', 'park-city-str-furnishings', 'Luxury ski resort furniture packages for Park City rentals',
  'Park City STR Furnishings delivers premium furniture packages and luxury supply kits for vacation rental owners throughout the Park City and Heber Valley area. We specialize in high-end mountain resort furnishings that meet the expectations of Park City''s affluent guest demographic — with white-glove delivery and setup for ski chalet and mountain estate properties.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 69
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch STR Supply Co', 'wasatch-str-supply-co', 'Vacation rental supplies and furnishings in Park City',
  'Wasatch STR Supply Co equips vacation rental properties throughout the Park City area with the furnishings, linens, and supplies that drive five-star guest reviews. From ski boot drying racks to luxury bedding and complete furniture packages for new STR launches, we help Park City property owners create exceptional mountain experiences.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.7, 46
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Furnishings', 'sedona-str-furnishings', 'Desert luxury vacation rental furniture in Sedona',
  'Sedona STR Furnishings provides earthy, luxury furniture packages and supply kits for vacation rental owners throughout Sedona and the Verde Valley. We curate furnishings that reflect Sedona''s unique spiritual and natural character — warm, organic materials and thoughtful designs that create the immersive red rock experience guests seek and pay premium prices for.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Supply Co', 'red-rock-str-supply-co', 'Vacation rental supplies and amenities in Sedona',
  'Red Rock STR Supply Co equips Sedona vacation rental properties with the furniture, linens, and amenity kits that create memorable guest experiences. From yoga mat and meditation cushion packages to luxury wellness amenities and complete property furnishing, we help Sedona STR owners create the high-end retreat experience their guests expect.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 52
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Furnishings', 'savannah-str-furnishings', 'Southern vacation rental furniture for Savannah properties',
  'Savannah STR Furnishings provides beautiful, historically-inspired furniture packages and supply solutions for vacation rental owners throughout Savannah and the Georgia coast. We specialize in furnishings that honor the architectural character of Savannah''s Historic District while delivering the modern comfort that guests expect from a premium vacation rental.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 67
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Supply Savannah', 'lowcountry-str-supply-savannah', 'Vacation rental supplies and furniture in coastal Georgia',
  'Lowcountry STR Supply Savannah equips vacation rental properties throughout Savannah and Tybee Island with high-quality furnishings and guest amenities. From antebellum-inspired furniture packages for Historic District townhouses to casual beach cottage supply kits for Tybee Island, we help Georgia coastal STR owners create compelling, well-equipped properties.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Furnishings', 'virginia-beach-str-furnishings', 'Coastal vacation rental furniture for Virginia Beach',
  'Virginia Beach STR Furnishings provides complete furniture packages and supply solutions for vacation rental owners throughout Virginia Beach and the Hampton Roads region. We specialize in fresh, nautical-inspired furnishings that capture the Virginia Beach beach town vibe — with durable materials suited for the high traffic and sandy conditions of oceanfront and Sandbridge properties.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Coast STR Supply', 'atlantic-coast-str-supply', 'Vacation rental supplies and furnishings in Virginia Beach',
  'Atlantic Coast STR Supply equips vacation rental properties throughout Virginia Beach with everything needed to create exceptional guest stays. From beach gear packages and outdoor furniture to luxury linen sets and complete property furnishing for new STR launches, we serve the full range of the Virginia Beach vacation rental market.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 51
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Furnishings', 'san-antonio-str-furnishings', 'Texas vacation rental furniture for San Antonio and Hill Country',
  'San Antonio STR Furnishings provides warm, Texan-inspired furniture packages and supply kits for vacation rental owners throughout San Antonio and the Texas Hill Country. We curate furnishings that blend the rich cultural heritage of San Antonio with the rustic charm of Hill Country style — creating properties that guests immediately fall in love with.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Supply TX', 'hill-country-str-supply-tx', 'Vacation rental supplies and furniture in the Texas Hill Country',
  'Hill Country STR Supply TX equips vacation rental properties throughout the Texas Hill Country with rustic-luxury furnishings and guest amenity packages. From Fredericksburg wine country vineyard cottage furniture to New Braunfels river property supply kits, we provide Hill Country STR owners with everything needed to deliver standout guest experiences.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- SMART HOME & TECH
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Smart Home', 'asheville-str-smart-home', 'Smart home automation for Asheville vacation rentals',
  'Asheville STR Smart Home installs and manages smart home technology for vacation rental properties throughout Western North Carolina. We specialize in keyless entry systems, noise monitoring, smart thermostats, WiFi optimization, and full automation setups that give Asheville STR owners remote control over their properties and reduce operational headaches.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 77
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Tech Solutions', 'blue-ridge-tech-solutions', 'STR technology setup and support in Western North Carolina',
  'Blue Ridge Tech Solutions provides technology installation and support for vacation rental properties throughout Asheville and WNC. From smart lock installation and channel manager integration to WiFi system setup and noise monitoring, we help mountain vacation rental owners leverage technology to improve guest experiences and simplify operations.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 53
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Smart Home Pros', 'obx-smart-home-pros', 'Smart home technology for Outer Banks vacation rentals',
  'OBX Smart Home Pros installs and maintains smart home systems for vacation rental properties throughout the Outer Banks. We specialize in the connectivity and remote management challenges of barrier island properties — providing reliable WiFi, keyless entry, smart thermostats, and security systems that keep OBX rentals running smoothly without an on-site manager.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Tech Services', 'barrier-island-tech-services', 'STR technology and automation on the Outer Banks',
  'Barrier Island Tech Services provides smart home installation and technology support for vacation rental owners across the Outer Banks. We help OBX property owners automate guest access, monitor noise and occupancy, optimize WiFi for large beach houses, and integrate their technology with popular STR management platforms.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Tech', 'hilton-head-str-tech', 'Smart home automation for Hilton Head vacation rentals',
  'Hilton Head STR Tech provides premium smart home installation and technology services for vacation rental properties throughout Hilton Head Island and the Lowcountry. We specialize in high-end automation solutions appropriate for Hilton Head''s luxury market — keyless access, security cameras, smart thermostats, and full home automation for resort-quality STR properties.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 71
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Smart Home Solutions', 'lowcountry-smart-home-solutions', 'STR technology services across Hilton Head and Bluffton',
  'Lowcountry Smart Home Solutions installs and supports smart home technology for vacation rental owners across Hilton Head and Bluffton. From keyless entry and noise monitoring to full smart home automation and channel manager integration, we help Lowcountry STR owners operate more efficiently and deliver consistently excellent guest experiences.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 48
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Tech Solutions', 'key-west-str-tech-solutions', 'Smart home automation for Key West vacation rentals',
  'Key West STR Tech Solutions provides smart home technology installation for vacation rental properties throughout Key West and the Florida Keys. We specialize in keyless entry for historic Conch house renovations, WiFi optimization for large waterfront properties, and security systems that give Keys vacation rental owners peace of mind when they''re off-island.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys Smart Home Pro', 'florida-keys-smart-home-pro', 'STR technology and automation in the Florida Keys',
  'Florida Keys Smart Home Pro installs and maintains smart home systems for vacation rental owners throughout the Florida Keys. From Key Largo to Key West, we provide reliable keyless entry, WiFi systems designed for waterfront environments, noise monitoring, and property automation that helps Keys STR owners manage their properties remotely and efficiently.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Tech', 'lake-tahoe-str-tech', 'Smart home technology for Lake Tahoe vacation rentals',
  'Lake Tahoe STR Tech provides smart home installation and technology services for vacation rental properties throughout the Lake Tahoe basin. We specialize in winter-ready automation solutions — smart thermostats that prevent pipe freezing, keyless entry that works in freezing temperatures, and WiFi systems optimized for Tahoe''s mountainous terrain.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Smart Home Solutions', 'sierra-smart-home-solutions', 'STR technology and automation in Lake Tahoe and Truckee',
  'Sierra Smart Home Solutions installs and supports smart home technology for vacation rental owners across the Lake Tahoe basin and Truckee. We help Tahoe property owners automate guest access, monitor properties remotely, and integrate their systems with Airbnb, VRBO, and other STR platforms — making remote management of mountain vacation rentals simple and reliable.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 61
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Smart Home', 'park-city-str-smart-home', 'Smart home automation for Park City ski resort rentals',
  'Park City STR Smart Home provides premium smart home technology for vacation rental properties throughout the Park City and Heber Valley area. We specialize in luxury mountain property automation — high-end keyless entry, comprehensive security systems, hot tub automation, and smart home integration that matches the sophistication that Park City''s premium rental properties demand.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch STR Tech Solutions', 'wasatch-str-tech-solutions', 'STR technology services in Park City and Heber Valley',
  'Wasatch STR Tech Solutions installs and maintains smart home systems for vacation rental owners throughout the Park City area. From smart lock installation and noise monitoring to full home automation and STR platform integration, we help Utah mountain resort property owners operate their vacation rentals efficiently and protect their investments.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Smart Home', 'sedona-str-smart-home', 'Smart home technology for Sedona vacation rentals',
  'Sedona STR Smart Home installs and manages smart home automation for vacation rental properties throughout Sedona and the Verde Valley. We provide keyless entry, noise monitoring, smart thermostats optimized for desert temperature swings, and security systems — all configured to help Sedona STR owners manage their properties remotely while protecting their high-value investments.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Verde Valley Tech Solutions', 'verde-valley-tech-solutions', 'STR technology and automation in Sedona and the Verde Valley',
  'Verde Valley Tech Solutions provides smart home installation and technology support for vacation rental owners across Sedona and the Verde Valley. We specialize in helping Sedona STR owners leverage technology to automate operations, protect their properties, and deliver the seamless guest experiences that earn five-star reviews in this premium market.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 59
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Smart Home', 'savannah-str-smart-home', 'Smart home automation for Savannah vacation rentals',
  'Savannah STR Smart Home installs smart home technology for vacation rental properties throughout Savannah and the Georgia coast. We specialize in keyless entry solutions for historic properties, noise monitoring for Historic District homes with close neighbors, WiFi optimization for multi-story townhouses, and security systems that protect some of Savannah''s most valuable real estate.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 74
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Tech Solutions', 'coastal-georgia-tech-solutions', 'STR technology services in Savannah and Tybee Island',
  'Coastal Georgia Tech Solutions provides smart home installation and technology services for vacation rental owners across Savannah and coastal Georgia. From smart lock and security system installation to WiFi optimization for Tybee Island beach houses and full automation for Historic District vacation rentals, we help Georgia coastal STR owners run their properties like pros.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 51
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Tech', 'virginia-beach-str-tech', 'Smart home automation for Virginia Beach vacation rentals',
  'Virginia Beach STR Tech provides smart home installation and technology services for vacation rental owners throughout Virginia Beach and Hampton Roads. We specialize in oceanfront property automation — keyless entry, security cameras, noise monitoring, and smart home systems that help Virginia Beach STR owners protect their coastal properties and manage them remotely.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 81
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater Smart Home Solutions', 'tidewater-smart-home-solutions', 'STR technology across Virginia Beach and Hampton Roads',
  'Tidewater Smart Home Solutions installs and supports smart home technology for vacation rental owners across Virginia Beach and the Hampton Roads region. From oceanfront condo smart lock installations to full home automation for Sandbridge beach houses, we help Virginia coastal STR owners automate operations and deliver exceptional guest experiences.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 57
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Smart Home', 'san-antonio-str-smart-home', 'Smart home technology for San Antonio vacation rentals',
  'San Antonio STR Smart Home installs and manages smart home automation for vacation rental properties throughout San Antonio and the Texas Hill Country. We provide keyless entry, security systems, noise monitoring, and smart home integration for everything from downtown River Walk lofts to remote Hill Country ranch properties.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Tech Solutions TX', 'hill-country-tech-solutions-tx', 'STR technology services across the Texas Hill Country',
  'Hill Country Tech Solutions TX provides smart home installation and technology support for vacation rental owners throughout the Texas Hill Country. We specialize in the unique connectivity challenges of rural Hill Country properties — installing reliable WiFi systems, smart home automation, and security systems for remote cabins and ranches where technology setup requires extra expertise.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- LEGAL & REGULATIONS
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Legal Group', 'asheville-str-legal-group', 'Short-term rental legal services in Asheville and WNC',
  'Asheville STR Legal Group provides specialized legal services for short-term rental property owners and investors throughout Western North Carolina. We guide clients through Buncombe County STR permit applications, zoning appeals, HOA compliance, and the legal structures needed to operate vacation rental businesses with full legal protection.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 69
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge STR Compliance', 'blue-ridge-str-compliance', 'STR regulations and compliance consulting in WNC',
  'Blue Ridge STR Compliance helps vacation rental owners across Western North Carolina navigate the complex and evolving regulatory landscape for short-term rentals. From Asheville''s STR permit process to county-level zoning issues and HOA disputes, we provide practical, investor-focused guidance that keeps properties compliant and operating profitably.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 47
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX STR Legal Services', 'obx-str-legal-services', 'Outer Banks vacation rental legal and compliance services',
  'OBX STR Legal Services provides specialized legal guidance for vacation rental property owners throughout the Outer Banks. We navigate Dare and Currituck County STR regulations, assist with permit applications, and provide legal structures that protect OBX property investors — from initial acquisition through ongoing operation.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island STR Compliance', 'barrier-island-str-compliance', 'STR regulations and legal services on the Outer Banks',
  'Barrier Island STR Compliance helps vacation rental owners across the OBX understand and comply with North Carolina''s short-term rental regulations. From permit renewals to zoning disputes and guest dispute resolution, we provide the legal expertise that keeps OBX vacation rental businesses operating smoothly and profitably.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Legal Group', 'hilton-head-str-legal-group', 'Lowcountry vacation rental legal and compliance services',
  'Hilton Head STR Legal Group provides specialized legal services for vacation rental owners throughout Hilton Head Island and the South Carolina Lowcountry. We specialize in plantation community HOA compliance, Beaufort County STR licensing, and the legal structures needed to operate short-term rental businesses in one of the Southeast''s most regulated resort markets.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 74
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Compliance', 'lowcountry-str-compliance', 'STR legal services across Hilton Head and Bluffton',
  'Lowcountry STR Compliance helps vacation rental owners navigate the regulatory landscape of operating short-term rentals in Hilton Head and the greater Lowcountry. From initial licensing to HOA disputes and ongoing compliance monitoring, we provide the practical legal guidance that keeps Lowcountry STR businesses operating with confidence.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 51
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Legal Services', 'key-west-str-legal-services', 'Florida Keys vacation rental legal and licensing services',
  'Key West STR Legal Services provides specialized legal guidance for vacation rental property owners throughout Key West and the Florida Keys. We navigate Monroe County''s complex STR licensing requirements, assist with historic preservation compliance for Conch house renovations, and provide the legal structures that protect Keys vacation rental investors.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys STR Compliance', 'florida-keys-str-compliance', 'STR regulations and legal services in the Florida Keys',
  'Florida Keys STR Compliance helps vacation rental owners navigate the layered regulatory requirements of operating short-term rentals in the Florida Keys. From Monroe County licensing and Florida state compliance to HOA requirements and guest dispute resolution, we provide comprehensive legal support for Keys vacation rental operators.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Legal Group', 'lake-tahoe-str-legal-group', 'California and Nevada STR legal services at Lake Tahoe',
  'Lake Tahoe STR Legal Group provides specialized legal services for vacation rental owners across the California and Nevada sides of Lake Tahoe. We navigate the complex and often conflicting STR regulations across South Lake Tahoe, Placer County, El Dorado County, and Washoe County — helping Tahoe investors maintain compliance in one of America''s most heavily regulated vacation rental markets.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 106
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra STR Compliance Group', 'sierra-str-compliance-group', 'STR regulations and legal guidance in Lake Tahoe and Truckee',
  'Sierra STR Compliance Group helps vacation rental owners throughout the Lake Tahoe basin understand and maintain compliance with the area''s evolving STR regulations. We monitor regulatory changes across multiple Tahoe-area jurisdictions and provide proactive guidance that helps investors protect their rental rights as the regulatory landscape continues to shift.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Legal Services', 'park-city-str-legal-services', 'Utah vacation rental legal and compliance in Park City',
  'Park City STR Legal Services provides specialized legal guidance for vacation rental owners and investors throughout the Park City and Heber Valley area. We navigate Summit County STR licensing, Sundance-period rental compliance, and HOA rules across Park City''s numerous planned communities — providing the legal expertise that keeps Park City vacation rental businesses operating profitably.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch STR Compliance Group', 'wasatch-str-compliance-group', 'STR legal services across Park City and the Wasatch Back',
  'Wasatch STR Compliance Group helps vacation rental owners throughout the Park City area maintain compliance with Utah''s short-term rental regulations. From initial Summit County licensing applications to ongoing compliance monitoring and HOA dispute resolution, we provide practical legal support for Utah mountain resort vacation rental investors.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Legal Group', 'sedona-str-legal-group', 'Arizona vacation rental legal services in Sedona',
  'Sedona STR Legal Group provides specialized legal services for short-term rental owners throughout Sedona and the Verde Valley. We guide clients through Yavapai County STR licensing, Sedona''s evolving vacation rental regulations, and the legal structures needed to operate in one of Arizona''s most scrutinized and high-value STR markets.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock STR Compliance', 'red-rock-str-compliance', 'STR regulations and legal guidance in Sedona',
  'Red Rock STR Compliance helps vacation rental owners navigate the increasingly complex regulatory environment for short-term rentals in Sedona. We monitor Sedona city ordinances and Yavapai County regulations, provide compliance audits, and assist owners in maintaining their STR licenses in a market where regulatory compliance is critical to long-term investment success.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Legal Services', 'savannah-str-legal-services', 'Georgia vacation rental legal services in Savannah',
  'Savannah STR Legal Services provides specialized legal guidance for vacation rental property owners throughout Savannah and the Georgia coast. We navigate Chatham County STR permit requirements, historic preservation compliance for the Historic District, and the legal structures that protect Savannah vacation rental investors and their properties.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia STR Compliance', 'coastal-georgia-str-compliance', 'STR regulations and legal services in Savannah',
  'Coastal Georgia STR Compliance helps vacation rental owners across Savannah and coastal Georgia understand and comply with the local regulatory requirements for short-term rentals. From initial permit applications to annual renewals and neighbor complaint response, we provide the practical compliance support that keeps Savannah STR businesses operating smoothly.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 54
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Legal Group', 'virginia-beach-str-legal-group', 'Virginia vacation rental legal services in Virginia Beach',
  'Virginia Beach STR Legal Group provides specialized legal services for short-term rental owners throughout Virginia Beach and the Hampton Roads region. We navigate Virginia Beach''s STR permit requirements, zoning regulations, and HOA compliance issues — providing the legal expertise that keeps Virginia coastal vacation rental businesses operating with full legal protection.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater STR Compliance Group', 'tidewater-str-compliance-group', 'STR legal services across Virginia Beach and Hampton Roads',
  'Tidewater STR Compliance Group helps vacation rental owners navigate the regulatory landscape for short-term rentals across Virginia Beach and Hampton Roads. From initial city STR permit applications to Williamsburg-area compliance and ongoing regulatory monitoring, we provide practical legal support for Virginia coastal vacation rental investors.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 59
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Legal Services', 'san-antonio-str-legal-services', 'Texas vacation rental legal services for San Antonio',
  'San Antonio STR Legal Services provides specialized legal guidance for short-term rental owners throughout San Antonio and the Texas Hill Country. We navigate San Antonio and Bexar County STR regulations, assist with Hill Country county permit requirements, and provide the legal structures that protect Texas vacation rental investors from River Walk to the Hill Country.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country STR Compliance TX', 'hill-country-str-compliance-tx', 'STR legal services across the Texas Hill Country',
  'Hill Country STR Compliance TX helps vacation rental owners throughout the Texas Hill Country navigate the patchwork of county-level STR regulations that govern the market. From Gillespie County Fredericksburg licensing to Comal County New Braunfels compliance, we provide the specialized expertise that keeps Hill Country vacation rental businesses operating legally and profitably.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 70
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;
