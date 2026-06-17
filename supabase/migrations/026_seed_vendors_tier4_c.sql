-- ============================================================
-- Migration 026 — Tier 4 Vendors C
-- Real Estate & Property Finders + Interior Design & Staging
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- REAL ESTATE & PROPERTY FINDERS
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Realty', 'gulf-shores-str-realty', 'Alabama Gulf Coast STR investment specialists',
  'Gulf Shores STR Realty helps investors find and acquire vacation rental properties along the Alabama Gulf Coast. Our agents specialize in short-term rental markets, HOA regulations, and cap rate analysis for Gulf Shores and Orange Beach properties.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 87 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Orange Beach Property Finders', 'orange-beach-property-finders', 'STR buyer agents for the AL Gulf Coast',
  'Orange Beach Property Finders serves STR investors seeking beach properties along the Alabama Gulf Coast. We analyze short-term rental income potential, navigate complex beachfront regulations, and identify underperforming properties with upside potential.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 54 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB Investment Realty', 'pcb-investment-realty', 'Panama City Beach vacation rental property specialists',
  'PCB Investment Realty is a dedicated short-term rental buyer agency serving Panama City Beach. We help investors evaluate condos, beach houses, and Gulf-front properties with detailed STR income projections and permit status research.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 112 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Properties', 'emerald-coast-str-properties', 'STR investment experts along the Emerald Coast',
  'Emerald Coast STR Properties helps buyers identify and acquire high-performing vacation rentals from Panama City Beach to Navarre. Our team provides detailed rental history analysis, Airbnb market comparables, and due diligence support.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 67 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Realty Group', 'naples-str-realty-group', 'Southwest Florida luxury STR acquisitions',
  'Naples STR Realty Group specializes in short-term rental investment properties across Naples, Marco Island, and Bonita Springs. We focus on luxury waterfront and Gulf-view properties with strong short-term rental income track records.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 78 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Marco Island Property Partners', 'marco-island-property-partners', 'STR buyer agents for Naples and Marco Island',
  'Marco Island Property Partners helps investors acquire short-term rental properties throughout Southwest Florida. Our agents understand the nuances of Marco Island condo restrictions and Naples STR regulations to find compliant, high-yield investments.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Realty STR', 'anna-maria-island-realty-str', 'Old Florida STR investment specialists',
  'Anna Maria Island Realty STR focuses exclusively on short-term rental investment properties across Anna Maria Island and the surrounding Gulf Coast. We provide deep local knowledge on permit grandfathering, occupancy caps, and historic cottage values.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 63 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Buyers', 'gulf-island-str-buyers', 'STR acquisition specialists across FL Gulf islands',
  'Gulf Island STR Buyers works with investors seeking vacation rental properties on Anna Maria Island, Longboat Key, and Siesta Key. We specialize in off-market deals and provide comprehensive STR income analysis to support acquisition decisions.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Investment Group', 'cape-cod-str-investment-group', 'New England vacation rental property experts',
  'Cape Cod STR Investment Group helps buyers find and acquire short-term rental properties throughout the Cape Cod peninsula. We provide Airbnb and VRBO revenue analysis, local STR regulation research, and off-season valuation expertise.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 94 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape Realty Partners', 'lower-cape-realty-partners', 'STR buyer agents for Cape Cod and the Islands',
  'Lower Cape Realty Partners specializes in short-term rental acquisitions from Sandwich to Provincetown. Our team helps investors identify cottages, colonial homes, and waterfront properties with proven STR track records and year-round rental potential.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.7, 58 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Realty', 'hamptons-str-realty', 'Luxury Hamptons vacation rental investment specialists',
  'Hamptons STR Realty is a boutique agency focused on short-term rental investment properties across Southampton, East Hampton, and Bridgehampton. We provide detailed weekly rental rate analysis and help investors navigate the Hamptons luxury STR market.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Property Finders', 'east-end-property-finders', 'STR acquisition experts for the Hamptons',
  'East End Property Finders helps STR investors identify and acquire vacation rental properties in the Hamptons. We specialize in week-by-week rental income modeling and help buyers understand South Fork zoning and STR permit requirements.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Realty', 'jersey-shore-str-realty', 'NJ shore vacation rental investment experts',
  'Jersey Shore STR Realty specializes in short-term rental investment properties across Ocean City, Avalon, Stone Harbor, and LBI. Our agents understand Jersey Shore STR regulations, HOA restrictions, and seasonal pricing dynamics.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.9, 86 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Avalon Shore Property Group', 'avalon-shore-property-group', 'STR buyers agents for South Jersey shore towns',
  'Avalon Shore Property Group helps investors acquire vacation rental properties in Avalon, Stone Harbor, Cape May, and surrounding shore communities. We provide comprehensive STR income analysis and navigate NJ shore town regulations.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 52 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD Investment Realty', 'ocean-city-md-investment-realty', 'Maryland beach town STR acquisition specialists',
  'Ocean City MD Investment Realty serves STR investors looking to acquire vacation rental properties in Ocean City and the surrounding Maryland shore area. We specialize in high-density condo buildings, oceanfront properties, and seasonal revenue analysis.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 67 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Property Partners', 'delmarva-str-property-partners', 'STR buyer agents for the Delmarva Peninsula',
  'Delmarva STR Property Partners specializes in vacation rental investment properties from Ocean City to Fenwick Island. We help investors evaluate condo associations, HOA rental policies, and Airbnb market dynamics across the Delmarva shore towns.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Realty', 'galveston-str-realty', 'Texas Gulf Coast vacation rental property specialists',
  'Galveston STR Realty helps investors identify and acquire short-term rental properties across Galveston Island. We provide Airbnb revenue analysis, flood zone and insurance guidance, and help buyers navigate Galveston STR permit requirements.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 79 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City Property Finders', 'island-city-property-finders', 'STR acquisition experts for Galveston Island',
  'Island City Property Finders is a dedicated STR buyer agency serving Galveston Island investors. We focus on historic Craftsman homes, beach houses, and East End properties with strong vacation rental histories and proven revenue track records.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 45 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Realty', 'rehoboth-str-realty', 'Delaware beach STR investment specialists',
  'Rehoboth STR Realty serves investors seeking vacation rental properties in Rehoboth Beach, Dewey Beach, and Bethany Beach. We specialize in STR income analysis, Lewes and Cape Henlopen area properties, and Delaware short-term rental regulation compliance.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Beaches Property Group', 'delaware-beaches-property-group', 'STR buyer agents across the Delaware beaches',
  'Delaware Beaches Property Group helps STR investors acquire vacation rental properties across the Delaware coast. We analyze seasonal rental rates, recommend up-and-coming neighborhoods in Bethany Beach and Fenwick Island, and navigate HOA rental policies.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Realty', 'south-padre-str-realty', 'Texas island vacation rental property experts',
  'South Padre Island STR Realty specializes in short-term rental investment properties on South Padre Island. We help investors find beachfront condos, canal homes, and Bay properties with strong Airbnb and VRBO rental histories in the Texas island market.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 58 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island Property Finders', 'padre-island-property-finders', 'STR buyer agents for South Padre Island',
  'Padre Island Property Finders connects STR investors with vacation rental opportunities on South Padre Island. We provide market analysis, rental projection modeling, and guidance on island condo association rules and Texas STR compliance.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Realty', '30a-str-realty', 'Scenic 30A corridor vacation rental specialists',
  '30A STR Realty is a boutique buyer agency focused on short-term rental investment properties along Scenic Highway 30A. We specialize in Gulf-front homes, carriage houses, and New Urbanist cottages in Seaside, Rosemary Beach, and WaterColor.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 83 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Scenic Corridor Property Partners', 'scenic-corridor-property-partners', 'STR acquisition experts along 30A',
  'Scenic Corridor Property Partners helps investors find high-performing vacation rental properties along the 30A corridor. We analyze weekly rental rates for each 30A community — from Dune Allen to Inlet Beach — and identify properties with strong seasonal income.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.8, 51 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Realty', 'breckenridge-str-realty', 'Summit County ski vacation rental investment experts',
  'Breckenridge STR Realty specializes in short-term rental investment properties in Breckenridge, Frisco, and surrounding Summit County ski towns. We help investors understand HOA restrictions, ski-in/ski-out premiums, and Summit County STR license requirements.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 97 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County Property Finders', 'summit-county-property-finders', 'STR buyer agents for Breckenridge and Frisco',
  'Summit County Property Finders helps STR investors acquire ski resort properties in Breckenridge, Keystone, and Copper Mountain. We specialize in STR license compliance, lift access premiums, and year-round dual-season rental revenue analysis.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 61 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Realty', 'vail-valley-str-realty', 'Vail and Eagle County luxury STR investment specialists',
  'Vail Valley STR Realty serves STR investors seeking ski resort properties in Vail, Beaver Creek, and the surrounding Eagle County communities. We provide in-depth analysis of ski-in/ski-out properties, slopeside condos, and Eagle County STR regulations.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 74 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County Property Partners', 'eagle-county-property-partners', 'STR acquisition experts for Vail and Avon',
  'Eagle County Property Partners helps STR investors navigate the Vail Valley real estate market. We specialize in vacation rental investment opportunities in Avon, Edwards, and Minturn — strong STR markets adjacent to Vail with fewer permit restrictions.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 47 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen Valley STR Realty', 'aspen-valley-str-realty', 'Aspen luxury short-term rental investment specialists',
  'Aspen Valley STR Realty is a boutique buyer agency focused on short-term rental investment properties in Aspen and Snowmass Village. We help investors understand Pitkin County STR regulations, Aspen lodge restrictions, and luxury chalet acquisition strategies.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 52 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Property Finders', 'roaring-fork-property-finders', 'STR buyer agents for Aspen and the Roaring Fork Valley',
  'Roaring Fork Property Finders serves STR investors seeking vacation rental properties in Aspen, Basalt, Carbondale, and Glenwood Springs. We identify value plays in the Roaring Fork Valley with strong rental demand and fewer permitting restrictions than Aspen proper.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Realty', 'steamboat-str-realty', 'Routt County ski vacation rental investment experts',
  'Steamboat STR Realty helps investors acquire short-term rental properties in Steamboat Springs. We specialize in ski-in/ski-out condos, mountain homes, and Routt County STR license compliance, with detailed winter and summer dual-season revenue analysis.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.9, 68 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Property Group', 'yampa-valley-property-group', 'STR buyer agents for Steamboat Springs',
  'Yampa Valley Property Group serves STR investors in Steamboat Springs and the surrounding Yampa Valley. We help buyers identify properties with strong dual-season STR income from ski season and summer outdoor recreation, with expertise in Routt County STR requirements.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride Mountain Realty', 'telluride-mountain-realty', 'San Juan Mountains luxury STR investment specialists',
  'Telluride Mountain Realty is a boutique agency focused on short-term rental investment properties in Telluride and Mountain Village. We help investors understand San Miguel County STR regulations, gondola access premiums, and Mountain Village HOA rental policies.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 47 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan STR Property Finders', 'san-juan-str-property-finders', 'STR buyer agents for Telluride and Mountain Village',
  'San Juan STR Property Finders helps STR investors acquire properties in the Telluride region. We provide gondola access analysis, Mountain Village vs. Telluride proper comparison, and detailed rental income modeling for this ultra-premium ski market.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Realty', 'jackson-hole-str-realty', 'Teton County luxury vacation rental investment experts',
  'Jackson Hole STR Realty is a premier buyer agency for short-term rental investment properties in Jackson Hole. We specialize in Teton County STR regulations, national park proximity premiums, and fly-fishing cabin acquisitions throughout the Greater Yellowstone ecosystem.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 83 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Village Property Group', 'teton-village-property-group', 'STR acquisition specialists for Jackson Hole ski resort',
  'Teton Village Property Group helps STR investors acquire ski resort properties at Teton Village and throughout the Jackson Hole Mountain Resort corridor. We focus on ski-in/ski-out condos, slopeside townhomes, and Teton Village HOA rental compliance.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.8, 52 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Realty', 'big-sky-str-realty', 'Montana mountain vacation rental investment specialists',
  'Big Sky STR Realty helps investors acquire short-term rental properties in Big Sky and surrounding Gallatin County. We specialize in ski resort condos, mountain home acquisitions, and Big Sky Resort STR regulations for this rapidly growing Montana market.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.9, 61 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley Property Finders', 'gallatin-valley-property-finders', 'STR buyer agents for Big Sky and Bozeman',
  'Gallatin Valley Property Finders serves STR investors seeking vacation rental properties in Big Sky and the greater Gallatin Valley. We analyze the strong growth trends in this market, identify value properties, and navigate Gallatin County STR permit requirements.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Realty', 'sun-valley-str-realty', 'Wood River Valley vacation rental investment experts',
  'Sun Valley STR Realty helps STR investors acquire properties in Sun Valley, Ketchum, and the Wood River Valley. We specialize in celebrity retreat market analysis, Blaine County STR regulations, and ski season vs. summer rental income optimization.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ketchum Property Partners', 'ketchum-property-partners', 'STR buyer agents for Sun Valley and Ketchum',
  'Ketchum Property Partners focuses on short-term rental investment properties in Ketchum, Hailey, and Bellevue within the Wood River Valley. We help investors find undervalued STR opportunities in this premium market at more accessible price points.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth Lakes STR Realty', 'mammoth-lakes-str-realty', 'Eastern Sierra vacation rental investment specialists',
  'Mammoth Lakes STR Realty helps investors acquire short-term rental properties in Mammoth Lakes and the June Lake Loop. We specialize in Mammoth Mountain ski resort proximity, Mono County STR regulations, and year-round dual-season STR revenue analysis.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 76 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra Property Finders', 'eastern-sierra-property-finders', 'STR buyer agents for Mammoth Lakes',
  'Eastern Sierra Property Finders serves STR investors in Mammoth Lakes and June Lake. We help buyers evaluate ski resort condos, cabin investments, and dual-season properties that generate income from both Mammoth Mountain ski season and Eastern Sierra summer outdoor recreation.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Realty', 'big-bear-str-realty', 'San Bernardino Mountains STR investment specialists',
  'Big Bear STR Realty helps investors acquire short-term rental properties in Big Bear Lake and Big Bear City. We specialize in ski cabin acquisitions, San Bernardino County STR permit compliance, and year-round rental income analysis for this accessible SoCal mountain market.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.9, 89 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Bernardino Mountain Property Group', 'san-bernardino-mountain-property-group', 'STR buyer agents for Big Bear',
  'San Bernardino Mountain Property Group focuses on STR investment opportunities throughout the Big Bear Valley. We help investors identify underpriced cabins, evaluate HOA rental restrictions, and maximize STR income from this high-demand Southern California mountain market.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 56 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Realty', 'bend-str-realty', 'Central Oregon vacation rental investment experts',
  'Bend STR Realty helps investors acquire short-term rental properties in Bend and Sunriver. We specialize in Deschutes County STR regulations, Bend city permit requirements, and investment analysis for Central Oregon''s fast-growing outdoor recreation market.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 94 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Property Finders', 'central-oregon-property-finders', 'STR buyer agents for Bend and Sunriver',
  'Central Oregon Property Finders serves STR investors seeking vacation rental properties in Bend, Sunriver, Sisters, and Redmond. We help buyers navigate Deschutes County STR permit rules, evaluate Sunriver SROA regulations, and identify high-yield STR opportunities.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 58 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Realty', 'whitefish-str-realty', 'Northwest Montana vacation rental investment specialists',
  'Whitefish STR Realty helps STR investors acquire properties in Whitefish, Kalispell, and Flathead Valley. We specialize in Whitefish Mountain Resort proximity premiums, Glacier National Park gateway properties, and Flathead County STR permit requirements.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.9, 63 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley Property Partners', 'flathead-valley-property-partners', 'STR buyer agents for Whitefish and Kalispell',
  'Flathead Valley Property Partners serves STR investors throughout the Flathead Valley. We help buyers find vacation rental properties in Kalispell, Columbia Falls, and lakefront properties on Flathead Lake, with expertise in Flathead County STR regulations.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- INTERIOR DESIGN & STAGING
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Interiors', 'gulf-coast-str-interiors', 'Alabama beach house STR design specialists',
  'Gulf Coast STR Interiors designs vacation rental properties across Gulf Shores and Orange Beach for maximum guest satisfaction and 5-star reviews. We specialize in coastal-casual design, durable beach-house furnishings, and photography-ready staging.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 76 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Shore Design Studio', 'alabama-shore-design-studio', 'Beach rental interior design along the AL coast',
  'Alabama Shore Design Studio creates guest-ready vacation rental interiors for STR owners across Gulf Shores and Orange Beach. We focus on durable coastal aesthetics that withstand heavy rental use while generating premium Airbnb reviews and repeat bookings.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB Vacation Rental Design', 'pcb-vacation-rental-design', 'Panama City Beach STR interior design experts',
  'PCB Vacation Rental Design transforms vacation rental properties across Panama City Beach into guest-ready showstoppers. We create beach-modern interiors with high-durability furnishings, custom artwork, and well-equipped kitchens that drive 5-star reviews.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 92 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Interior Studios', 'emerald-coast-interior-studios', 'STR design along Florida''s Emerald Coast',
  'Emerald Coast Interior Studios provides full-service interior design and furnishing packages for vacation rental owners from Panama City Beach to Navarre. We specialize in creating cohesive coastal design themes that photograph well and exceed guest expectations.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.8, 61 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples Luxury STR Design', 'naples-luxury-str-design', 'Southwest Florida luxury vacation rental interiors',
  'Naples Luxury STR Design creates high-end vacation rental interiors for luxury properties across Naples, Marco Island, and Bonita Springs. We specialize in upscale coastal design, premium furniture sourcing, and white-glove staging services for luxury STR owners.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Marco Island STR Interiors', 'marco-island-str-interiors', 'Island interior design for SW Florida vacation rentals',
  'Marco Island STR Interiors provides full-service interior design and furnishing packages for vacation rental owners on Marco Island and in Naples. We create island-inspired, guest-focused interiors that consistently earn 5-star reviews.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Design Co', 'anna-maria-island-design-co', 'Old Florida STR interior design specialists',
  'Anna Maria Island Design Co creates charming, Old Florida–inspired vacation rental interiors across Anna Maria Island. We blend vintage coastal character with practical STR durability, creating spaces that guests love and share widely on social media.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 58 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island Interior Studios', 'gulf-island-interior-studios', 'STR design across Florida''s Gulf islands',
  'Gulf Island Interior Studios provides vacation rental interior design and furnishing services for STR owners across Anna Maria Island, Longboat Key, and Siesta Key. We create coastal-modern interiors that maximize guest satisfaction and listing appeal.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Design Studio', 'cape-cod-str-design-studio', 'New England vacation rental interior specialists',
  'Cape Cod STR Design Studio creates coastal New England–inspired vacation rental interiors throughout the Cape Cod peninsula. We blend nautical character with modern comfort, sourcing durable furnishings that hold up to heavy summer rental use.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 84 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape Interiors', 'lower-cape-interiors', 'STR design for Cape Cod vacation rentals',
  'Lower Cape Interiors specializes in vacation rental interior design across the Cape Cod peninsula. We focus on creating Instagram-worthy spaces that reflect Cape Cod''s authentic character — shiplap, sea glass palettes, and classic nautical accents done right.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.8, 52 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Design Group', 'hamptons-str-design-group', 'Luxury Hamptons vacation rental interior design',
  'Hamptons STR Design Group creates luxury vacation rental interiors for high-end properties across Southampton, East Hampton, and Bridgehampton. We specialize in Hamptons-style coastal design with premium furnishings, custom art curation, and professional staging.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 61 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Interiors', 'east-end-str-interiors', 'Hamptons STR interior design and staging',
  'East End STR Interiors provides full-service interior design for vacation rental owners in the Hamptons. We create sophisticated coastal interiors that attract premium weekly renters, incorporating quality furnishings that meet the expectations of discerning Hamptons guests.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 42 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Design', 'jersey-shore-str-design', 'NJ shore vacation rental interior specialists',
  'Jersey Shore STR Design creates colorful, beach-inspired vacation rental interiors for STR owners across the Jersey Shore. We specialize in bright, guest-friendly designs that photograph well and hold up to the heavy summer rental season at Ocean City, Avalon, and Stone Harbor.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.9, 73 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore House Interiors NJ', 'shore-house-interiors-nj', 'STR design for Jersey Shore vacation rentals',
  'Shore House Interiors NJ provides interior design and furnishing packages for vacation rental owners across the New Jersey shore. We blend classic Shore house character with durable, guest-ready design that drives five-star reviews and repeat bookings.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 46 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Design', 'ocean-city-md-str-design', 'Maryland beach vacation rental interior experts',
  'Ocean City MD STR Design transforms vacation rental properties across Ocean City into highly-rated, guest-ready spaces. We create beach-modern interiors with durable furnishings, nautical accents, and cohesive design themes that drive premium booking rates.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 59 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Maryland Interior Studios', 'coastal-maryland-interior-studios', 'STR interior design for Ocean City area rentals',
  'Coastal Maryland Interior Studios provides vacation rental interior design for STR owners across Ocean City, Berlin, and the Eastern Shore. We create guest-focused interiors that emphasize comfort, durability, and the coastal Maryland aesthetic guests expect.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston Island STR Design', 'galveston-island-str-design', 'Texas Gulf island vacation rental interiors',
  'Galveston Island STR Design creates stylish, guest-ready vacation rental interiors for STR owners across Galveston Island. We blend coastal Texan character with practical STR durability — historic Victorian color palettes, Gulf-inspired art, and comfortable beach house furnishings.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island Victorian Interiors', 'island-victorian-interiors', 'STR design for Galveston historic and coastal rentals',
  'Island Victorian Interiors provides STR interior design tailored to Galveston''s unique architectural heritage. We design vacation rentals that honor the island''s Victorian history while delivering modern comfort and STR functionality for today''s guests.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Design Studio', 'rehoboth-str-design-studio', 'Delaware beach vacation rental interior specialists',
  'Rehoboth STR Design Studio creates guest-ready vacation rental interiors for STR owners across Rehoboth Beach, Dewey Beach, and Bethany Beach. We specialize in airy, coastal-modern designs that photograph beautifully and earn consistently strong reviews.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.9, 54 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Shore Interiors', 'delaware-shore-interiors', 'STR interior design for Delaware beach towns',
  'Delaware Shore Interiors provides vacation rental interior design and furnishing packages for STR owners across the Delaware coast. We create comfortable, durable beach interiors that stand up to summer rental seasons while driving premium reviews and repeat guests.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Design', 'south-padre-str-design', 'Texas island vacation rental interior experts',
  'South Padre STR Design creates colorful, beach-inspired vacation rental interiors for STR owners on South Padre Island. We design spaces that appeal to the family and spring break market — bright, durable, and photo-ready with fun coastal Texas character.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island Interior Studios', 'padre-island-interior-studios', 'STR design for South Padre Island rentals',
  'Padre Island Interior Studios provides full-service interior design for vacation rental owners on South Padre Island. We specialize in tropical beach designs with weather-resistant furnishings, vibrant coastal palettes, and practical guest amenities.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Design Studio', '30a-str-design-studio', 'Scenic 30A luxury vacation rental design',
  '30A STR Design Studio creates high-end vacation rental interiors along Scenic Highway 30A. We specialize in the upscale coastal-modern aesthetic that 30A guests expect — Gulf-inspired color palettes, quality furnishings, and bespoke local art that makes properties unforgettable.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 78 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'WaterColor Interior Design', 'watercolor-interior-design', 'STR interior design along Florida''s 30A',
  'WaterColor Interior Design provides vacation rental interior design for STR owners in Seaside, Rosemary Beach, WaterColor, and WaterSound. We specialize in New Urbanist cottage interiors with coastal character that justifies premium rental rates along the 30A corridor.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Design Co', 'breckenridge-str-design-co', 'Colorado ski resort vacation rental design',
  'Breckenridge STR Design Co creates mountain-modern vacation rental interiors for STR owners in Breckenridge and Summit County. We specialize in ski lodge–inspired design with reclaimed wood accents, cozy layered textiles, and durable mountain furnishings.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 82 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit Mountain Interiors', 'summit-mountain-interiors', 'STR interior design for Breckenridge and Frisco',
  'Summit Mountain Interiors provides vacation rental interior design for STR owners across Summit County. We create warm, inviting mountain interiors that make guests feel at home after a day on the slopes — functional ski-boot rooms, cozy living spaces, and well-equipped kitchens.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 54 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley Interior Design', 'vail-valley-interior-design', 'Vail ski resort luxury vacation rental design',
  'Vail Valley Interior Design creates luxury mountain interiors for vacation rental owners in Vail and Beaver Creek. We specialize in high-end alpine design with custom built-ins, premium textiles, and ski-in/ski-out functionality that justifies premium nightly rates.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 63 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Interiors', 'eagle-county-str-interiors', 'STR interior design for Vail and Avon',
  'Eagle County STR Interiors provides vacation rental interior design for STR owners in Vail, Avon, and Edwards. We create mountain-modern interiors with cozy warmth and alpine character tailored to attract premium ski-season and summer guests in the Vail Valley.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Design Studio', 'aspen-str-design-studio', 'Aspen luxury vacation rental interior design',
  'Aspen STR Design Studio creates ultra-luxury vacation rental interiors for high-end STR properties in Aspen and Snowmass. We specialize in mountain-modern luxury design with custom furniture, bespoke artwork, and immersive alpine interiors that command the highest rates in the Rockies.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 47 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Interior Studios', 'roaring-fork-interior-studios', 'STR design for Aspen and the Roaring Fork Valley',
  'Roaring Fork Interior Studios provides vacation rental interior design for STR owners across the Roaring Fork Valley. We create beautiful mountain-contemporary interiors in Aspen, Basalt, and Carbondale — striking the balance between luxury appeal and rental durability.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 32 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Design Co', 'steamboat-str-design-co', 'Colorado ski town vacation rental interior specialists',
  'Steamboat STR Design Co creates cozy, Western-flavored vacation rental interiors for STR owners in Steamboat Springs. We specialize in the warm cowboy-ski-town aesthetic that Steamboat is known for — log accents, warm textiles, and comfortable mountain furnishings guests love.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.9, 59 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Interior Design', 'yampa-valley-interior-design', 'STR interior design for Steamboat Springs',
  'Yampa Valley Interior Design provides vacation rental interior design for STR owners throughout Steamboat Springs and the Yampa Valley. We create warm, welcoming mountain interiors that blend Steamboat''s ranching heritage with modern ski resort comfort.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Interiors', 'telluride-str-interiors', 'San Juan Mountains luxury vacation rental design',
  'Telluride STR Interiors creates luxury mountain interiors for vacation rental owners in Telluride and Mountain Village. We specialize in high-design alpine interiors with artisan furnishings, custom local artwork, and sophisticated mountain-modern aesthetics.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 43 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain Village STR Design', 'mountain-village-str-design', 'STR interior design for Telluride Mountain Village',
  'Mountain Village STR Design provides vacation rental interior design for STR owners in Telluride''s Mountain Village. We create ski-in/ski-out resort interiors with premium mountain furnishings and design that meets the elevated expectations of Telluride guests.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Design', 'jackson-hole-str-design', 'Teton mountain vacation rental interior specialists',
  'Jackson Hole STR Design creates spectacular mountain vacation rental interiors for STR owners throughout the Jackson Hole valley. We specialize in rustic-luxury Teton design — reclaimed timber, natural stone, and wildlife-inspired art that immerses guests in the Wyoming wilderness.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Village Interior Studio', 'teton-village-interior-studio', 'Ski resort STR design for Jackson Hole',
  'Teton Village Interior Studio provides vacation rental interior design for ski resort properties at Teton Village. We create premium slopeside interiors with mountain-modern luxury furnishings tailored to attract the high-end guests Jackson Hole Mountain Resort commands.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky Mountain Interiors', 'big-sky-mountain-interiors', 'Montana ski resort vacation rental design',
  'Big Sky Mountain Interiors creates inviting mountain vacation rental interiors for STR owners in Big Sky and the Gallatin Valley. We specialize in Montana wilderness design — natural wood finishes, cozy fireside living areas, and rustic-modern furnishings that delight guests.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.9, 54 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Interior Design Studio', 'gallatin-interior-design-studio', 'STR design for Big Sky and Bozeman area',
  'Gallatin Interior Design Studio provides vacation rental interior design for STR owners across the Gallatin Valley. We create warm, nature-inspired interiors for Big Sky cabins, Bozeman guesthouses, and Gallatin Gateway mountain homes that guests rave about.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Design Co', 'sun-valley-str-design-co', 'Wood River Valley vacation rental interior specialists',
  'Sun Valley STR Design Co creates sophisticated vacation rental interiors for STR owners in Sun Valley and Ketchum. We specialize in the Sun Valley look — sophisticated alpine design with mid-century modern influences, natural materials, and luxurious comfort.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ketchum Interior Studios', 'ketchum-interior-studios', 'STR interior design for Sun Valley and Ketchum',
  'Ketchum Interior Studios provides vacation rental interior design for STR owners in Ketchum and Hailey. We create stylish mountain interiors that capture the spirit of Sun Valley''s outdoor lifestyle — functional ski-gear storage, cozy gathering spaces, and design that earns 5-star reviews.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Design Studio', 'mammoth-str-design-studio', 'Eastern Sierra vacation rental interior specialists',
  'Mammoth STR Design Studio creates mountain vacation rental interiors for STR owners in Mammoth Lakes. We specialize in high-alpine modern design with ski-lodge warmth — vaulted interiors, natural stone fireplaces, and durable mountain furnishings that guests love year-round.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 65 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Interior Studios', 'sierra-interior-studios', 'STR design for Mammoth Lakes and June Lake',
  'Sierra Interior Studios provides vacation rental interior design for STR owners in Mammoth Lakes and June Lake. We create cozy, guest-focused mountain interiors with Eastern Sierra character that drive premium reviews and strong repeat bookings in this year-round destination.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Design Co', 'big-bear-str-design-co', 'San Bernardino Mountains vacation rental design',
  'Big Bear STR Design Co creates cozy ski cabin and lake house interiors for vacation rental owners in Big Bear Lake. We specialize in the rustic-charming Big Bear aesthetic — knotty pine accents, plaid textiles, and mountain-theme furnishings that guests adore.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.9, 78 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain Cabin Interiors SoCal', 'mountain-cabin-interiors-socal', 'STR interior design for Big Bear cabins',
  'Mountain Cabin Interiors SoCal provides vacation rental interior design for STR owners across the Big Bear Valley. We create charming cabin interiors that appeal to the Southern California family market — fun, durable, and cozy with mountain character that photographs beautifully.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 50 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Design Studio', 'bend-str-design-studio', 'Central Oregon vacation rental interior specialists',
  'Bend STR Design Studio creates contemporary Pacific Northwest vacation rental interiors for STR owners in Bend and Sunriver. We specialize in the Bend aesthetic — clean lines, natural wood, and mountain-modern design that attracts the outdoor adventure and remote work guest.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 83 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'High Desert Interior Studios', 'high-desert-interior-studios', 'STR design for Bend and Central Oregon rentals',
  'High Desert Interior Studios provides vacation rental interior design for STR owners in Bend, Sunriver, and Sisters. We create inviting Pacific Northwest interiors that celebrate Central Oregon''s outdoor culture — reclaimed wood, earthy tones, and functional adventure-ready spaces.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 53 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Design Co', 'whitefish-str-design-co', 'Montana mountain vacation rental interior design',
  'Whitefish STR Design Co creates stunning mountain vacation rental interiors for STR owners in Whitefish and Kalispell. We specialize in Montana lodge design — natural timber, wildlife-inspired art, and warm mountain furnishings that make guests feel deep in the Glacier country.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.9, 56 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glacier Country Interior Studios', 'glacier-country-interior-studios', 'STR interior design for Whitefish and Kalispell',
  'Glacier Country Interior Studios provides vacation rental interior design for STR owners throughout Flathead Valley. We create warm, guest-focused mountain interiors for Whitefish, Kalispell, and lakefront properties that reflect the rugged beauty of Northwest Montana.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;
