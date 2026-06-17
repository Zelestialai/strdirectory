-- ============================================================
-- Migration 016 — Tier 3 Vendors: Real Estate, Interior Design,
--                 Renovation & Construction, Accounting & Tax
-- 2 vendors × 4 categories × 10 markets = 80 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- REAL ESTATE
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Realty', 'asheville-str-realty', 'Short-term rental investment properties in Asheville & WNC',
  'Asheville STR Realty specializes in sourcing and selling short-term rental investment properties throughout Asheville and Western North Carolina. Our agents understand Buncombe County STR regulations, know which neighborhoods outperform, and provide detailed revenue projections on every listing.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Investment Homes', 'blue-ridge-investment-homes', 'Mountain vacation rental properties for STR investors',
  'Blue Ridge Investment Homes helps buyers find high-performing vacation rental properties across Asheville, Black Mountain, Hendersonville, and Brevard. We provide market data, cap rate analysis, and STR permit guidance to help investors make confident purchase decisions in the WNC market.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Investment Properties', 'obx-investment-properties', 'Outer Banks vacation rental real estate specialists',
  'OBX Investment Properties is the premier real estate brokerage for vacation rental investors on North Carolina''s Outer Banks. From Corolla oceanfront estates to Hatteras Island cottages, our agents provide comprehensive STR performance data and deep local knowledge to help buyers identify the highest-yield properties on the barrier islands.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Realty Group', 'barrier-island-realty-group', 'Buying and selling OBX vacation rental homes',
  'Barrier Island Realty Group serves buyers and sellers of vacation rental property across the Outer Banks. Our agents specialize in investment analysis, short-term rental revenue modeling, and navigating the unique financing and insurance landscape of barrier island real estate.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Realty', 'hilton-head-str-realty', 'Lowcountry vacation rental investment properties',
  'Hilton Head STR Realty helps investors acquire short-term rental properties across Hilton Head Island, Bluffton, and Beaufort. Our agents are experts in Sea Pines, Palmetto Dunes, and other plantation communities, providing detailed rental history analysis and HOA STR rule guidance.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Investment Group', 'lowcountry-investment-group', 'STR property acquisition across the SC Lowcountry',
  'Lowcountry Investment Group specializes in vacation rental property acquisitions across the South Carolina Lowcountry. From Hilton Head golf villas to Beaufort historic homes, we provide investors with the market intelligence and negotiation expertise needed to build a profitable STR portfolio.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys STR Realty', 'florida-keys-str-realty', 'Key West and Florida Keys vacation rental investments',
  'Florida Keys STR Realty is the leading brokerage for short-term rental property investors throughout the Florida Keys. We specialize in Old Town Key West Conch houses, waterfront fishing cottages in the Middle Keys, and eco-tourism properties near Key Largo — all with full STR licensing guidance and revenue projections.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Keys Investment Properties', 'keys-investment-properties', 'Vacation rental real estate across the Florida Keys',
  'Keys Investment Properties helps buyers navigate the complex and rewarding Florida Keys vacation rental market. From Key Largo to Key West, we provide detailed STR revenue analysis, Monroe County licensing guidance, and deep local expertise to help investors find properties that deliver exceptional returns.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tahoe STR Realty', 'tahoe-str-realty', 'Lake Tahoe vacation rental investment properties',
  'Tahoe STR Realty specializes in sourcing high-yield short-term rental properties throughout the Lake Tahoe basin. From South Lake Tahoe ski-in/ski-out chalets to Tahoe City lakefront homes, our agents provide California and Nevada STR regulation guidance and detailed seasonal revenue projections.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Nevada Investment Homes', 'sierra-nevada-investment-homes', 'Lake Tahoe and Truckee STR property specialists',
  'Sierra Nevada Investment Homes helps investors acquire vacation rental properties across the Lake Tahoe basin and Truckee corridor. We specialize in navigating the complex patchwork of STR regulations across South Lake Tahoe, Placer County, El Dorado County, and Washoe County to find compliant, high-performing properties.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Realty', 'park-city-str-realty', 'Utah mountain resort vacation rental investments',
  'Park City STR Realty is the leading brokerage for short-term rental investors in the Park City area. We specialize in ski-in/ski-out properties at Park City Mountain Resort and Deer Valley, as well as Heber Valley vacation homes — providing detailed winter and summer revenue projections and Summit County STR licensing guidance.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Mountain Properties', 'wasatch-mountain-properties', 'Park City and Heber Valley vacation rental acquisitions',
  'Wasatch Mountain Properties helps buyers find strong-performing vacation rental investments across the Park City and Heber Valley markets. From luxury ski chalets to Midway Swiss-style retreats, we provide investors with cap rate analysis, Summit County regulation guidance, and direct access to off-market STR properties.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.8, 54
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Realty', 'sedona-str-realty', 'Red rock country vacation rental investment properties',
  'Sedona STR Realty specializes in sourcing short-term rental investment properties across Sedona, Village of Oak Creek, and the greater Verde Valley. We provide investors with Yavapai County STR licensing guidance, revenue projections based on Sedona''s premium nightly rates, and expert knowledge of which neighborhoods command the highest guest demand.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 82
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Investment Group', 'red-rock-investment-group', 'Sedona vacation rental acquisitions and STR consulting',
  'Red Rock Investment Group helps investors buy, analyze, and optimize short-term rental properties in Sedona and the Verde Valley. From luxury retreats near Cathedral Rock to Village of Oak Creek golf properties, we provide comprehensive investment analysis and ongoing STR performance consulting.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Realty', 'savannah-str-realty', 'Savannah historic district and Tybee Island STR investments',
  'Savannah STR Realty is the premier real estate brokerage for short-term rental investors in the Savannah market. We specialize in Historic District vacation homes, Tybee Island beach cottages, and emerging neighborhoods — providing detailed STR revenue analysis and Chatham County licensing guidance.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Investment Homes', 'coastal-georgia-investment-homes', 'Vacation rental properties across coastal Georgia',
  'Coastal Georgia Investment Homes helps investors find high-performing short-term rental properties across the Savannah area and Georgia coast. From Victorian mansions in the Historic District to Tybee Island oceanfront cottages, we provide investment-focused buyers with the data and local expertise they need to succeed.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.8, 58
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Realty', 'virginia-beach-str-realty', 'Oceanfront and Sandbridge vacation rental investments',
  'Virginia Beach STR Realty specializes in short-term rental investment properties throughout the Virginia Beach market. From oceanfront condos on Atlantic Avenue to quiet Sandbridge vacation homes, we provide investors with Virginia Beach STR regulation guidance, revenue projections, and direct access to the best investment opportunities.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 88
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater Investment Properties', 'tidewater-investment-properties', 'Virginia Beach and Hampton Roads STR acquisitions',
  'Tidewater Investment Properties helps investors acquire vacation rental properties across Virginia Beach and the broader Hampton Roads area. We specialize in oceanfront and beach-block investments, Williamsburg colonial vacation homes, and Chincoteague island retreats — with full STR licensing guidance for Virginia municipalities.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Realty', 'san-antonio-str-realty', 'River Walk and Texas Hill Country vacation rental investments',
  'San Antonio STR Realty specializes in sourcing short-term rental investment properties in San Antonio and the Texas Hill Country. From downtown lofts near the River Walk to New Braunfels river cabins and Fredericksburg wine country retreats, we provide detailed Bexar and Comal County STR analysis and revenue projections.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Investment Homes', 'hill-country-investment-homes', 'Texas Hill Country and San Antonio STR acquisitions',
  'Hill Country Investment Homes helps investors find exceptional short-term rental properties across the Texas Hill Country corridor. From Fredericksburg vineyard estates to New Braunfels tubing cabins and Kerrville hunting retreats, we provide investors with Hill Country market data, revenue modeling, and STR regulation guidance.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- INTERIOR DESIGN & STAGING
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Interiors', 'asheville-str-interiors', 'Mountain-inspired STR design for Asheville vacation rentals',
  'Asheville STR Interiors creates warm, mountain-inspired spaces for vacation rental owners throughout the Asheville area. We specialize in blending rustic Appalachian aesthetics with modern comfort — designing spaces that photograph beautifully, earn five-star reviews, and command premium nightly rates.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Design Studio', 'blue-ridge-design-studio', 'STR interior design across Western North Carolina',
  'Blue Ridge Design Studio transforms vacation rental properties across Western North Carolina with thoughtful, guest-focused interiors. From downtown Asheville lofts to Brevard waterfall cabins, we create spaces that feel authentically local while meeting the high expectations of today''s discerning vacation rental guests.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 51
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX Coastal Interiors', 'obx-coastal-interiors', 'Outer Banks beach house STR design specialists',
  'OBX Coastal Interiors designs vacation rental properties along the entire Outer Banks, from Corolla to Ocracoke. We specialize in creating durable, beautiful coastal interiors that withstand heavy beach house traffic while delivering the fresh, airy aesthetic guests expect — with full furnishing packages and professional photography coordination.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Design Co', 'barrier-island-design-co', 'Beach house interiors for OBX vacation rentals',
  'Barrier Island Design Co creates stunning vacation rental interiors throughout the Outer Banks. From intimate soundside cottages to large oceanfront group estates, we deliver fully furnished, styled, and photo-ready properties that achieve top listing placement and consistently earn five-star guest reviews.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Interiors', 'hilton-head-str-interiors', 'Lowcountry resort STR design for Hilton Head properties',
  'Hilton Head STR Interiors designs sophisticated vacation rental spaces throughout Hilton Head Island and the greater Lowcountry. We specialize in plantation community properties, creating refined coastal interiors that match the premium expectations of Hilton Head''s upscale guest demographic and command the market''s highest nightly rates.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 67
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palmetto Design Studio', 'palmetto-design-studio', 'STR interior design across the SC Lowcountry',
  'Palmetto Design Studio creates beautiful, guest-ready vacation rental interiors for property owners across Hilton Head, Bluffton, and Beaufort. We offer full-service design packages including furniture sourcing, accessory styling, and professional photography, all tailored to maximize your STR revenue.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 45
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Design Studio', 'key-west-str-design-studio', 'Old Town Key West and Florida Keys vacation rental design',
  'Key West STR Design Studio creates unique, character-rich interiors for vacation rentals throughout the Florida Keys. We specialize in historic Conch house renovations and stylish waterfront properties, blending Key West''s colorful Caribbean aesthetic with modern amenities that today''s guests expect.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 84
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tropical Keys Interiors', 'tropical-keys-interiors', 'STR interior design across the Florida Keys',
  'Tropical Keys Interiors designs vacation rental properties throughout the Florida Keys with bright, tropical-inspired aesthetics that guests adore. From Key Largo dive cottages to Marathon waterfront homes, we create spaces that stand out on booking platforms and earn five-star reviews for their style, comfort, and attention to detail.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 56
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Design', 'lake-tahoe-str-design', 'Alpine-inspired interior design for Tahoe vacation rentals',
  'Lake Tahoe STR Design creates stunning alpine and lakeside interiors for vacation rental properties throughout the Lake Tahoe basin. From South Lake Tahoe ski chalets to Tahoe City waterfront cabins, we design spaces that capture the magic of Tahoe''s natural setting while delivering the comfort and style that commands premium nightly rates.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 79
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Design Studio', 'sierra-design-studio', 'STR interior design across Lake Tahoe and Truckee',
  'Sierra Design Studio transforms vacation rental properties throughout the Lake Tahoe basin and Truckee corridor. We specialize in mountain-modern aesthetics — warm, inviting spaces that feel luxurious and cozy while showcasing the natural beauty of one of America''s most spectacular alpine settings.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 52
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Interiors', 'park-city-str-interiors', 'Ski resort vacation rental design for Park City properties',
  'Park City STR Interiors creates luxurious mountain interiors for vacation rental properties throughout the Park City and Heber Valley area. We specialize in ski chalet design that combines alpine warmth with contemporary sophistication, helping property owners achieve the premium nightly rates that Park City''s discerning guests are willing to pay.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 86
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Deer Valley Design Co', 'deer-valley-design-co', 'Luxury STR interior design in Park City and Deer Valley',
  'Deer Valley Design Co creates ultra-premium vacation rental interiors for Park City''s most discerning property owners. Specializing in Deer Valley ski-in/ski-out properties and luxury mountain estates, we deliver white-glove design service that transforms properties into top-tier Airbnb Plus and luxury rental platform listings.',
  c.id, 'Park City', 'UT', p.id, true, false, 4.8, 43
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Interiors', 'sedona-str-interiors', 'Red rock inspired design for Sedona vacation rentals',
  'Sedona STR Interiors creates breathtaking vacation rental spaces that capture the spiritual beauty and dramatic landscape of red rock country. We design Sedona properties with an aesthetic that honors the land — earthy materials, warm tones, and thoughtful layouts that frame the iconic views guests travel from around the world to experience.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 91
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vortex Design Studio', 'vortex-design-studio', 'Spiritual and wellness-inspired STR design in Sedona',
  'Vortex Design Studio specializes in creating vacation rental spaces in Sedona that embody the area''s unique spiritual and wellness identity. From meditation gardens to crystal-accented interiors and panoramic red rock view rooms, we design properties that attract Sedona''s high-paying wellness and retreat guest demographic.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Design Studio', 'savannah-str-design-studio', 'Historic Savannah vacation rental interior design',
  'Savannah STR Design Studio creates stunning interiors for vacation rental properties in Savannah''s Historic District and across the greater Savannah area. We specialize in honoring the city''s extraordinary architectural heritage while delivering the modern comforts guests expect — creating spaces that feel authentically Savannah and photograph beautifully for listing platforms.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 77
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Interiors Savannah', 'lowcountry-interiors-savannah', 'Coastal and antebellum STR design in Savannah',
  'Lowcountry Interiors Savannah designs vacation rental properties across Savannah and Tybee Island with a deep appreciation for Lowcountry style and history. Whether restoring an antebellum townhouse in the Historic District or refreshing a Tybee Island beach cottage, we deliver spaces that delight guests and drive outstanding reviews.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.8, 53
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Interiors', 'virginia-beach-str-interiors', 'Coastal vacation rental design for Virginia Beach',
  'Virginia Beach STR Interiors creates fresh, coastal interiors for vacation rental properties throughout Virginia Beach and the Hampton Roads region. From oceanfront condos to Sandbridge beach houses and Williamsburg colonial homes, we design spaces that feel like a true beach getaway and inspire guests to rebook year after year.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 69
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Atlantic Coast Design Co', 'atlantic-coast-design-co', 'STR interior design across Virginia Beach and Sandbridge',
  'Atlantic Coast Design Co transforms vacation rental properties across Virginia Beach into high-performing, beautifully styled spaces. We specialize in the full range of the Virginia Beach STR market — from compact oceanfront condos to sprawling Sandbridge family beach houses — delivering complete furnishing packages and professional styling.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.7, 47
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Interiors', 'san-antonio-str-interiors', 'River Walk and Hill Country vacation rental design',
  'San Antonio STR Interiors creates warm, vibrant vacation rental spaces throughout San Antonio and the Texas Hill Country. We blend the rich cultural heritage of San Antonio''s historic neighborhoods with contemporary comfort, designing properties that feel authentically Texan and deliver the five-star experiences guests expect near the River Walk.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 74
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Design Studio TX', 'hill-country-design-studio-tx', 'STR interior design for Texas Hill Country vacation rentals',
  'Hill Country Design Studio TX specializes in creating rustic-luxe vacation rental interiors throughout the Texas Hill Country. From Fredericksburg wine country cottages to New Braunfels river properties and Boerne ranch estates, we design spaces that celebrate the natural beauty of the Hill Country while delivering modern luxury.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.8, 55
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- RENOVATION & CONSTRUCTION
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Renovation Co', 'asheville-str-renovation-co', 'Vacation rental renovations in Asheville and WNC',
  'Asheville STR Renovation Co specializes in transforming vacation rental properties throughout Western North Carolina into high-performing STR investments. From full cabin renovations in the mountains to downtown Asheville loft conversions, we deliver construction quality and STR-smart design decisions that maximize your property''s revenue potential.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 62
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Build & Restore', 'blue-ridge-build-restore', 'Mountain property renovation for STR investors in WNC',
  'Blue Ridge Build & Restore provides full-service renovation and construction for vacation rental investors throughout Western North Carolina. We specialize in mountain cabin restoration, ADU construction, and property upgrades that have a direct, measurable impact on nightly rates and occupancy.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 41
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX STR Builders', 'obx-str-builders', 'Outer Banks vacation rental renovation and construction',
  'OBX STR Builders provides renovation and construction services for vacation rental property owners throughout the Outer Banks. We specialize in beach house renovations, storm damage restoration, and new STR construction on the barrier islands — with deep expertise in Dare and Currituck County building codes and coastal construction requirements.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 78
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Construction', 'barrier-island-construction', 'Beach house renovation and remodeling on the OBX',
  'Barrier Island Construction handles vacation rental renovations and remodels across the Outer Banks. From major interior overhauls that justify significant nightly rate increases to targeted upgrades like new kitchens, master bath additions, and outdoor shower installations, we help OBX property owners maximize their STR returns.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 53
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Renovations', 'hilton-head-str-renovations', 'Vacation rental renovations across Hilton Head Island',
  'Hilton Head STR Renovations specializes in upgrading vacation rental properties across Hilton Head Island and Bluffton to meet the premium expectations of the Lowcountry luxury guest market. From villa remodels in Sea Pines to full property overhauls in Palmetto Dunes, we help owners achieve the renovations that justify the area''s premium nightly rates.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 57
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Build & Remodel', 'lowcountry-build-remodel', 'STR renovation services across the SC Lowcountry',
  'Lowcountry Build & Remodel provides vacation rental renovation and construction services throughout the Hilton Head and Bluffton area. We specialize in kitchen and bath upgrades, outdoor entertainment area construction, and full property renovations that significantly boost STR revenue for Lowcountry property investors.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 39
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West Renovation Experts', 'key-west-renovation-experts', 'Historic Conch house and Florida Keys vacation rental renovations',
  'Key West Renovation Experts specializes in the complex and rewarding work of renovating historic Conch houses and waterfront properties in Key West and the Florida Keys. We combine deep knowledge of Monroe County historic preservation requirements with STR-optimized design to create properties that command the highest nightly rates in the market.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 71
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys STR Builders', 'florida-keys-str-builders', 'Vacation rental renovation and construction in the Keys',
  'Florida Keys STR Builders provides renovation and construction services for vacation rental owners throughout the Florida Keys. We specialize in waterfront property upgrades, boat dock construction, pool and hot tub installations, and full property renovations — all designed to maximize STR revenue in the highly competitive Keys vacation rental market.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 48
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Renovations', 'lake-tahoe-str-renovations', 'Mountain cabin renovation and construction at Lake Tahoe',
  'Lake Tahoe STR Renovations transforms vacation rental properties throughout the Lake Tahoe basin into high-performing STR investments. From South Lake Tahoe ski chalet renovations to Tahoe City lakefront cabin upgrades, we deliver STR-optimized renovations that significantly improve your property''s listing appeal and revenue performance.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 66
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Build & Restore', 'sierra-build-restore', 'STR renovation services in Lake Tahoe and Truckee',
  'Sierra Build & Restore provides vacation rental renovation and construction services across the Lake Tahoe basin and Truckee corridor. We specialize in alpine property upgrades — hot tub installations, deck expansions, ski room conversions, and full interior remodels — that drive meaningful increases in nightly rates and occupancy.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 44
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Builders', 'park-city-str-builders', 'Ski resort vacation rental renovation in Park City',
  'Park City STR Builders specializes in luxury vacation rental renovations throughout the Park City and Heber Valley area. From ski room additions and steam shower installations to full luxury remodels that position properties as premium ski chalets, we help Park City investors achieve the renovations that justify the market''s exceptional nightly rates.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 59
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Build & Remodel', 'wasatch-build-remodel', 'STR renovation and construction in Park City and Heber Valley',
  'Wasatch Build & Remodel provides full-service vacation rental renovation across Park City, Heber City, and Midway. We specialize in mountain property upgrades that improve STR performance — from hot tub and sauna installations to kitchen and master bath remodels — delivered on time even during the busy ski season build window.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.7, 37
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Renovations', 'sedona-str-renovations', 'Red rock country vacation rental renovation and construction',
  'Sedona STR Renovations transforms vacation rental properties across Sedona and the Verde Valley into premium STR investments. We specialize in creating indoor-outdoor living spaces that showcase Sedona''s extraordinary red rock views — pool and spa additions, panoramic window installations, and luxury suite renovations that command the area''s highest nightly rates.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 68
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Verde Valley Build & Restore', 'verde-valley-build-restore', 'STR construction and renovation across Sedona and the Verde Valley',
  'Verde Valley Build & Restore provides vacation rental renovation and construction services throughout Sedona and the Verde Valley. From boutique casita construction to full property transformations, we help STR investors create the unique, character-rich properties that Sedona''s guests seek and pay premium prices to experience.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 46
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Renovation Co', 'savannah-str-renovation-co', 'Historic Savannah vacation rental renovation specialists',
  'Savannah STR Renovation Co specializes in the sensitive and skilled work of renovating historic properties for short-term rental use in Savannah''s Historic District. We combine deep knowledge of Chatham County historic preservation requirements with STR-optimized renovation strategies to create extraordinary vacation rental spaces in some of the most beautiful buildings in America.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 64
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Builders', 'coastal-georgia-builders', 'STR renovation and construction in Savannah and Tybee Island',
  'Coastal Georgia Builders provides vacation rental renovation and construction services across the Savannah area and Georgia coast. From Tybee Island beach cottage upgrades to garden district townhouse conversions in Savannah, we help STR investors create compelling properties that perform at the top of the market.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 42
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Builders', 'virginia-beach-str-builders', 'Coastal vacation rental renovation in Virginia Beach',
  'Virginia Beach STR Builders specializes in vacation rental renovations throughout Virginia Beach and the Hampton Roads region. From oceanfront condo upgrades to Sandbridge beach house expansions, we deliver high-quality construction that improves listing photos, guest experience, and — most importantly — nightly rates and occupancy.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 61
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater Build & Remodel', 'tidewater-build-remodel', 'STR renovation services across Virginia Beach and Hampton Roads',
  'Tidewater Build & Remodel provides vacation rental renovation and construction across Virginia Beach, Sandbridge, and the broader Hampton Roads market. We specialize in beach property upgrades — outdoor shower additions, pool and hot tub installations, and deck expansions — that meaningfully improve STR performance and guest satisfaction.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 40
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Builders', 'san-antonio-str-builders', 'Vacation rental renovation in San Antonio and the Hill Country',
  'San Antonio STR Builders provides renovation and construction services for vacation rental investors throughout San Antonio and the Texas Hill Country. From River Walk district loft conversions to Fredericksburg farmhouse renovations and New Braunfels river property upgrades, we help investors create the properties that perform best in the Texas Hill Country STR market.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 73
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Build & Restore TX', 'hill-country-build-restore-tx', 'STR renovation across the Texas Hill Country',
  'Hill Country Build & Restore TX specializes in vacation rental renovations throughout the Texas Hill Country. From Boerne ranch house transformations to Kerrville river cabin upgrades and Wimberley cottage renovations, we combine Hill Country craftsmanship with STR investment expertise to help investors maximize their property''s performance.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 49
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- ACCOUNTING & TAX
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Asheville STR Accounting', 'asheville-str-accounting', 'STR tax and accounting services in Asheville and WNC',
  'Asheville STR Accounting provides specialized tax preparation and financial services for short-term rental owners throughout Western North Carolina. We navigate the complex intersection of federal STR tax rules, North Carolina state taxes, and Buncombe County occupancy taxes — helping vacation rental owners maximize deductions and stay fully compliant.',
  c.id, 'Asheville', 'NC', p.id, true, true, 4.9, 108
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blue Ridge Tax Advisors', 'blue-ridge-tax-advisors', 'Vacation rental tax planning for Asheville STR investors',
  'Blue Ridge Tax Advisors serves short-term rental owners and investors throughout the Asheville area with comprehensive tax planning and preparation services. We specialize in STR-specific tax strategies including short-term rental classification, depreciation schedules, cost segregation, and entity structuring for WNC vacation rental portfolios.',
  c.id, 'Asheville', 'NC', p.id, true, false, 4.8, 79
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'OBX STR Accounting', 'obx-str-accounting', 'Outer Banks vacation rental tax and accounting services',
  'OBX STR Accounting provides tax preparation and accounting services for vacation rental owners throughout the Outer Banks. We specialize in Dare and Currituck County occupancy tax compliance, North Carolina rental income reporting, and the federal tax strategies that help OBX property owners legally minimize their tax burden.',
  c.id, 'Kill Devil Hills', 'NC', p.id, true, true, 4.9, 134
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Barrier Island Tax Services', 'barrier-island-tax-services', 'STR tax compliance for Outer Banks vacation rental owners',
  'Barrier Island Tax Services helps vacation rental owners across the Outer Banks navigate the complex tax landscape of owning and operating STR properties on North Carolina''s barrier islands. From county occupancy taxes to federal passive activity rules, we provide clear guidance and proactive planning to protect our clients'' STR profits.',
  c.id, 'Nags Head', 'NC', p.id, true, false, 4.7, 91
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hilton Head STR Accounting', 'hilton-head-str-accounting', 'Lowcountry vacation rental tax and accounting services',
  'Hilton Head STR Accounting provides specialized financial services for short-term rental investors across Hilton Head Island and the Beaufort County area. We handle South Carolina accommodations tax filings, federal STR tax optimization, and portfolio-level financial planning for Lowcountry vacation rental investors.',
  c.id, 'Hilton Head Island', 'SC', p.id, true, true, 4.9, 96
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Tax Advisors', 'lowcountry-tax-advisors', 'STR tax planning across Hilton Head and Bluffton',
  'Lowcountry Tax Advisors serves vacation rental owners across Hilton Head and Bluffton with comprehensive STR tax services. From initial investment structuring to annual tax preparation and long-term portfolio planning, we help Lowcountry STR investors keep more of what they earn.',
  c.id, 'Bluffton', 'SC', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Key West STR Accounting', 'key-west-str-accounting', 'Florida Keys vacation rental tax and accounting services',
  'Key West STR Accounting provides specialized tax and accounting services for vacation rental owners throughout the Florida Keys. We navigate Monroe County tourist development taxes, Florida sales tax requirements, and federal STR tax rules — helping Keys property owners achieve full compliance while maximizing every available deduction.',
  c.id, 'Key West', 'FL', p.id, true, true, 4.9, 119
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Florida Keys Tax Advisors', 'florida-keys-tax-advisors', 'STR tax planning for Key West and the Florida Keys',
  'Florida Keys Tax Advisors helps vacation rental investors throughout the Florida Keys optimize their tax position. We specialize in the unique tax landscape of Monroe County STR properties — from the layered Florida and county accommodation tax obligations to federal passive activity rules and short-term rental classification strategies.',
  c.id, 'Marathon', 'FL', p.id, true, false, 4.7, 83
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Tahoe STR Accounting', 'lake-tahoe-str-accounting', 'California and Nevada vacation rental tax services at Tahoe',
  'Lake Tahoe STR Accounting provides specialized tax services for vacation rental owners across the California and Nevada sides of Lake Tahoe. We navigate the complex dual-state tax landscape, Transient Occupancy Tax compliance across multiple jurisdictions, and federal STR optimization strategies for Tahoe property investors.',
  c.id, 'South Lake Tahoe', 'CA', p.id, true, true, 4.9, 127
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Tax Advisors', 'sierra-tax-advisors', 'STR tax planning for Lake Tahoe and Truckee investors',
  'Sierra Tax Advisors serves vacation rental investors throughout the Lake Tahoe basin and Truckee area with comprehensive STR tax services. We specialize in California and Nevada state tax optimization, cost segregation studies for Tahoe properties, and portfolio-level tax planning for multi-property STR investors.',
  c.id, 'Truckee', 'CA', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Park City STR Accounting', 'park-city-str-accounting', 'Utah ski resort vacation rental tax services',
  'Park City STR Accounting provides specialized tax and accounting services for short-term rental owners throughout the Park City and Heber Valley area. We navigate Summit County transient room tax, Utah state tax requirements, and federal STR optimization strategies — helping Park City investors maximize the returns on their mountain resort properties.',
  c.id, 'Park City', 'UT', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wasatch Tax Advisors', 'wasatch-tax-advisors', 'STR tax planning across Park City and the Wasatch Back',
  'Wasatch Tax Advisors helps vacation rental investors in the Park City area optimize their tax position and stay compliant with the area''s STR tax requirements. From Sundance Film Festival rental income reporting to annual federal tax preparation, we provide proactive, investor-focused tax services for Utah mountain resort properties.',
  c.id, 'Heber City', 'UT', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sedona STR Accounting', 'sedona-str-accounting', 'Arizona vacation rental tax and accounting in Sedona',
  'Sedona STR Accounting provides specialized tax services for short-term rental owners throughout Sedona and the greater Verde Valley. We handle Yavapai County TPT and bed tax compliance, Arizona state tax requirements, and federal STR tax optimization — helping Sedona property owners navigate one of the most complex STR tax environments in the Southwest.',
  c.id, 'Sedona', 'AZ', p.id, true, true, 4.9, 117
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Red Rock Tax Advisors', 'red-rock-tax-advisors', 'STR tax planning for Sedona and Verde Valley investors',
  'Red Rock Tax Advisors serves vacation rental owners across Sedona and the Verde Valley with comprehensive STR tax services. We specialize in Arizona TPT compliance, cost segregation for high-value Sedona properties, and tax planning strategies that help investors maximize the returns on their red rock country vacation rentals.',
  c.id, 'Sedona', 'AZ', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Savannah STR Accounting', 'savannah-str-accounting', 'Georgia vacation rental tax services in Savannah',
  'Savannah STR Accounting provides specialized tax and accounting services for vacation rental owners throughout Savannah and the Georgia coast. We navigate Chatham County hotel-motel tax, Georgia state income tax requirements, and federal STR tax strategies — helping Savannah property owners achieve compliance and maximize their tax efficiency.',
  c.id, 'Savannah', 'GA', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Georgia Tax Advisors', 'coastal-georgia-tax-advisors', 'STR tax planning for Savannah and Tybee Island owners',
  'Coastal Georgia Tax Advisors helps vacation rental owners across Savannah, Tybee Island, and coastal Georgia optimize their STR tax position. From short-term rental classification to cost segregation studies for Historic District properties, we provide the specialized STR tax expertise that general CPAs often lack.',
  c.id, 'Savannah', 'GA', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Virginia Beach STR Accounting', 'virginia-beach-str-accounting', 'Virginia vacation rental tax and accounting services',
  'Virginia Beach STR Accounting provides specialized tax services for vacation rental owners throughout Virginia Beach and the Hampton Roads region. We handle Virginia Beach transient occupancy tax compliance, Virginia state income tax requirements, and federal STR optimization strategies — helping coastal Virginia property owners minimize taxes and maximize returns.',
  c.id, 'Virginia Beach', 'VA', p.id, true, true, 4.9, 107
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Tidewater Tax Advisors', 'tidewater-tax-advisors', 'STR tax planning across Virginia Beach and Hampton Roads',
  'Tidewater Tax Advisors serves short-term rental investors across Virginia Beach and the Hampton Roads region with comprehensive STR tax services. We specialize in multi-property portfolio tax planning, Williamsburg vacation rental tax compliance, and cost segregation studies that generate significant tax savings for Virginia STR investors.',
  c.id, 'Virginia Beach', 'VA', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Antonio STR Accounting', 'san-antonio-str-accounting', 'Texas vacation rental tax and accounting services',
  'San Antonio STR Accounting provides specialized tax and accounting services for short-term rental owners throughout San Antonio and the Texas Hill Country. We navigate Texas hotel occupancy tax compliance, federal STR tax strategies, and portfolio-level financial planning for STR investors across Bexar, Comal, and Kendall counties.',
  c.id, 'San Antonio', 'TX', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hill Country Tax Advisors TX', 'hill-country-tax-advisors-tx', 'STR tax planning for Texas Hill Country vacation rentals',
  'Hill Country Tax Advisors TX helps vacation rental investors across the Texas Hill Country optimize their tax position. From Fredericksburg wine country estates to New Braunfels river properties, we provide comprehensive STR tax services including Texas HOT compliance, federal passive activity rule navigation, and cost segregation for Hill Country properties.',
  c.id, 'New Braunfels', 'TX', p.id, true, false, 4.7, 81
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;
