-- ============================================================
-- Migration 028 — Tier 4 Vendors E
-- Insurance + Furniture & Supplies
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- INSURANCE
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Insurance', 'gulf-shores-str-insurance', 'Alabama beach vacation rental insurance specialists',
  'Gulf Shores STR Insurance provides short-term rental insurance solutions for vacation rental owners across the Alabama Gulf Coast. We specialize in hurricane and flood coverage, liability protection for beach properties, and STR-specific policies that standard homeowners insurance won''t cover.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast Rental Insurance', 'alabama-coast-rental-insurance', 'STR insurance for the AL Gulf Coast',
  'Alabama Coast Rental Insurance provides vacation rental insurance coverage for STR owners along the Alabama Gulf Coast. We source policies from multiple carriers to find the right combination of hurricane, flood, and STR liability coverage for Gulf Shores and Orange Beach properties.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Insurance Advisors', 'pcb-str-insurance-advisors', 'Panama City Beach vacation rental insurance experts',
  'PCB STR Insurance Advisors provides short-term rental insurance for vacation property owners across Panama City Beach. We specialize in Gulf Coast coastal property insurance — combining hurricane wind, flood, and STR liability coverage with comprehensive guest damage protection.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Rental Coverage', 'emerald-coast-rental-coverage', 'STR insurance along Florida''s Emerald Coast',
  'Emerald Coast Rental Coverage provides vacation rental insurance solutions for STR owners along Florida''s Emerald Coast. We navigate the complex Florida coastal insurance market to find comprehensive coverage for Panama City Beach condos, 30A homes, and Destin vacation rentals.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 45 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Insurance Group', 'naples-str-insurance-group', 'Southwest Florida luxury vacation rental insurance',
  'Naples STR Insurance Group provides insurance solutions for luxury vacation rental owners across Naples and Marco Island. We specialize in high-value coastal property coverage, condo association gap insurance, and STR liability policies for Southwest Florida''s premium rental market.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 59 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SW Florida STR Coverage', 'sw-florida-str-coverage', 'STR insurance for Naples and Marco Island',
  'SW Florida STR Coverage provides short-term rental insurance for vacation property owners in Naples, Marco Island, and Bonita Springs. We source comprehensive STR policies that cover guest liability, property damage, income loss, and the flood and hurricane risks common to SW Florida.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.8, 38 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island STR Insurance', 'anna-maria-island-str-insurance', 'Florida Gulf island vacation rental coverage',
  'Anna Maria Island STR Insurance provides short-term rental insurance for vacation property owners across Anna Maria Island. We specialize in coastal Florida STR coverage — flood, wind, guest liability, and rental income protection for island properties that standard policies overlook.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 47 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Coverage', 'gulf-island-str-coverage', 'STR insurance across Florida''s Gulf islands',
  'Gulf Island STR Coverage provides vacation rental insurance for STR owners across Anna Maria Island, Longboat Key, and Siesta Key. We navigate Florida''s challenging coastal insurance market to secure comprehensive STR policies with appropriate hurricane, flood, and liability protection.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Insurance', 'cape-cod-str-insurance', 'New England vacation rental insurance specialists',
  'Cape Cod STR Insurance provides short-term rental insurance for vacation property owners throughout the Cape Cod peninsula. We specialize in New England coastal STR coverage — wind, flood, liability, and rental income protection tailored to the Cape''s seasonal rental market.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 76 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape Rental Coverage', 'lower-cape-rental-coverage', 'STR insurance for Cape Cod vacation rentals',
  'Lower Cape Rental Coverage provides vacation rental insurance solutions for STR owners across Cape Cod. We help owners understand the differences between homeowner policies and true STR coverage, and source policies that protect against guest liability, property damage, and rental income loss.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Insurance Group', 'hamptons-str-insurance-group', 'Luxury Hamptons vacation rental insurance',
  'Hamptons STR Insurance Group provides insurance solutions for high-value vacation rental properties in the Hamptons. We specialize in luxury STR coverage — high-value personal property, umbrella liability, art and wine protection, and comprehensive policies for premium Hamptons weekly rentals.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 53 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Rental Coverage', 'east-end-rental-coverage', 'STR insurance for Hamptons vacation rentals',
  'East End Rental Coverage provides vacation rental insurance for STR owners in the Hamptons. We source New York STR-specific policies that protect against the unique liability exposure of high-end vacation rentals — large guest groups, catered events, and luxury personal property claims.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 34 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Insurance', 'jersey-shore-str-insurance', 'NJ shore vacation rental insurance specialists',
  'Jersey Shore STR Insurance provides short-term rental insurance for vacation property owners across the New Jersey shore. We specialize in NJ coastal STR coverage — wind and flood protection for beach houses, guest liability coverage, and rental income insurance for Ocean City, Avalon, and LBI owners.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 64 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore STR Coverage NJ', 'shore-str-coverage-nj', 'STR insurance for the Jersey Shore',
  'Shore STR Coverage NJ provides vacation rental insurance solutions for STR owners throughout the New Jersey shore. We navigate the complex NJ coastal insurance market to find comprehensive STR coverage that protects against the liability risks unique to vacation rental properties.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 40 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Insurance', 'ocean-city-md-str-insurance', 'Maryland beach vacation rental coverage',
  'Ocean City MD STR Insurance provides short-term rental insurance for vacation property owners in Ocean City and along the Maryland coast. We specialize in Maryland coastal STR coverage — coastal wind, flood, guest liability, and rental income protection tailored to the Delmarva beach market.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 51 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Coverage', 'delmarva-str-coverage', 'STR insurance across the Delmarva Peninsula',
  'Delmarva STR Coverage provides vacation rental insurance for STR owners across the Delmarva Peninsula. We source policies that protect Maryland and Delaware beach properties against coastal hazards, guest liability, and rental income loss across the full Delmarva STR market.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Insurance Group', 'galveston-str-insurance-group', 'Texas Gulf island vacation rental coverage experts',
  'Galveston STR Insurance Group provides short-term rental insurance for vacation property owners on Galveston Island. We specialize in Texas Gulf Coast STR coverage — hurricane wind and storm surge flood protection, guest liability, and rental income policies for island vacation rental owners.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City STR Coverage', 'island-city-str-coverage', 'STR insurance for Galveston Island rentals',
  'Island City STR Coverage provides vacation rental insurance solutions for STR owners across Galveston Island. We help island property owners navigate the Texas Gulf Coast insurance market and secure comprehensive STR policies with appropriate storm and flood coverage.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Insurance', 'rehoboth-str-insurance', 'Delaware beach vacation rental coverage specialists',
  'Rehoboth STR Insurance provides short-term rental insurance for vacation property owners across the Delaware beaches. We specialize in Delaware coastal STR coverage — coastal wind, flood, guest liability, and rental income protection for Rehoboth Beach, Dewey, and Bethany Beach rentals.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Shore Rental Coverage', 'delaware-shore-rental-coverage', 'STR insurance for Delaware coastal rentals',
  'Delaware Shore Rental Coverage provides vacation rental insurance solutions for STR owners along the Delaware coast. We source comprehensive STR policies that protect against the coastal risks and guest liability exposures unique to Delaware beach town vacation rentals.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Insurance', 'south-padre-str-insurance', 'Texas island vacation rental coverage experts',
  'South Padre STR Insurance provides short-term rental insurance for vacation property owners on South Padre Island. We specialize in Texas Gulf Coast STR coverage — hurricane, flood, and wind protection combined with comprehensive guest liability for South Padre Island vacation rentals.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island STR Coverage', 'padre-island-str-coverage', 'STR insurance for South Padre Island rentals',
  'Padre Island STR Coverage provides vacation rental insurance for STR owners on South Padre Island. We help island property owners secure comprehensive STR policies with appropriate Texas Gulf Coast coastal hazard coverage and liability protection.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.6, 24 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Insurance Group', '30a-str-insurance-group', 'Scenic 30A luxury vacation rental coverage',
  '30A STR Insurance Group provides short-term rental insurance for high-value vacation property owners along Scenic Highway 30A. We specialize in luxury Florida Gulf Coast STR coverage — comprehensive wind, flood, and liability policies for premium 30A properties.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 64 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor STR Coverage 30A', 'corridor-str-coverage-30a', 'STR insurance along 30A',
  'Corridor STR Coverage provides vacation rental insurance solutions for STR owners in Seaside, Rosemary Beach, WaterColor, and throughout the 30A corridor. We navigate Florida''s coastal insurance market to provide comprehensive protection for these high-value STR properties.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Insurance', 'breckenridge-str-insurance', 'Summit County ski resort vacation rental coverage',
  'Breckenridge STR Insurance provides short-term rental insurance for ski resort vacation property owners in Breckenridge and Summit County. We specialize in mountain STR coverage — snow load and freeze damage, ski liability, guest injury protection, and rental income insurance.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 68 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County STR Coverage', 'summit-county-str-coverage', 'STR insurance for Breckenridge and Frisco',
  'Summit County STR Coverage provides vacation rental insurance for STR owners across Summit County ski resort communities. We source mountain-specific STR policies that address the unique coverage needs of high-altitude Colorado vacation rental properties.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 44 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Insurance', 'vail-valley-str-insurance', 'Eagle County luxury ski resort rental coverage',
  'Vail Valley STR Insurance provides high-value vacation rental insurance for luxury properties in Vail and Beaver Creek. We specialize in luxury mountain STR coverage — high-value furnishings replacement, ski equipment liability, umbrella policies, and comprehensive income protection.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 54 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Coverage', 'eagle-county-str-coverage', 'STR insurance for Vail and Avon rentals',
  'Eagle County STR Coverage provides vacation rental insurance for STR owners throughout the Vail Valley. We help Colorado mountain property owners secure comprehensive STR policies with appropriate coverage for freeze damage, guest liability, and rental income interruption.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 35 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Insurance Advisors', 'aspen-str-insurance-advisors', 'Aspen ultra-luxury vacation rental coverage',
  'Aspen STR Insurance Advisors provides bespoke insurance solutions for ultra-high-value vacation rental properties in Aspen and Snowmass. We specialize in luxury STR coverage — high-limit personal property, fine arts and jewelry, umbrella liability, and income protection for Aspen''s premium rental market.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 41 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork STR Coverage', 'roaring-fork-str-coverage', 'STR insurance for Aspen and Roaring Fork Valley',
  'Roaring Fork STR Coverage provides vacation rental insurance for STR owners throughout the Roaring Fork Valley. We source comprehensive mountain STR policies for Aspen, Basalt, and Carbondale properties at all value levels.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Insurance Group', 'steamboat-str-insurance-group', 'Routt County ski resort vacation rental coverage',
  'Steamboat STR Insurance Group provides short-term rental insurance for ski resort vacation property owners in Steamboat Springs. We specialize in mountain STR coverage — freeze and snow damage, hot tub liability, guest injury protection, and rental income insurance for Steamboat properties.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley STR Coverage', 'yampa-valley-str-coverage', 'STR insurance for Steamboat Springs rentals',
  'Yampa Valley STR Coverage provides vacation rental insurance solutions for STR owners in Steamboat Springs and the Yampa Valley. We help mountain property owners secure comprehensive STR policies tailored to Colorado''s high-alpine rental environment.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Insurance', 'telluride-str-insurance', 'San Juan Mountains luxury vacation rental coverage',
  'Telluride STR Insurance provides premium insurance solutions for luxury vacation rental properties in Telluride and Mountain Village. We specialize in ultra-luxury mountain STR coverage with high-value property, umbrella liability, and comprehensive income protection policies for Telluride''s elite rental market.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 37 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Miguel STR Coverage', 'san-miguel-str-coverage', 'STR insurance for Telluride area rentals',
  'San Miguel STR Coverage provides vacation rental insurance for STR owners in the Telluride region. We source comprehensive mountain STR policies for Telluride and Mountain Village properties with appropriate high-altitude coverage and liability protection.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 22 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Insurance', 'jackson-hole-str-insurance', 'Teton County luxury vacation rental coverage',
  'Jackson Hole STR Insurance provides high-value short-term rental insurance for luxury vacation properties in Jackson Hole. We specialize in Teton County STR coverage — wildfire and flood protection, luxury property replacement, umbrella liability, and income protection for premium Jackson Hole rentals.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton STR Coverage', 'teton-str-coverage', 'STR insurance for Jackson Hole vacation rentals',
  'Teton STR Coverage provides vacation rental insurance for STR owners throughout the Jackson Hole valley. We source Wyoming mountain STR policies that address the unique coverage needs of Teton County vacation properties — from slopeside condos to wilderness cabins.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Insurance Group', 'big-sky-str-insurance-group', 'Montana ski resort vacation rental coverage',
  'Big Sky STR Insurance Group provides short-term rental insurance for vacation property owners in Big Sky and the Gallatin Valley. We specialize in Montana mountain STR coverage — wildfire, freeze, and snow damage protection combined with comprehensive guest liability.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley STR Coverage', 'gallatin-valley-str-coverage', 'STR insurance for Big Sky and Gallatin Valley',
  'Gallatin Valley STR Coverage provides vacation rental insurance for STR owners in Big Sky and the greater Gallatin Valley. We source Montana-specific STR policies with appropriate wildfire, mountain hazard, and guest liability coverage for this rapidly growing vacation rental market.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Insurance', 'sun-valley-str-insurance', 'Wood River Valley vacation rental coverage specialists',
  'Sun Valley STR Insurance provides short-term rental insurance for vacation property owners in Sun Valley and the Wood River Valley. We specialize in Idaho mountain STR coverage — wildfire, freeze, and snow damage combined with STR liability protection for Blaine County properties.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 43 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River STR Coverage', 'wood-river-str-coverage', 'STR insurance for Sun Valley and Ketchum',
  'Wood River STR Coverage provides vacation rental insurance for STR owners in Ketchum, Hailey, and the Wood River Valley. We help Idaho mountain property owners secure comprehensive STR policies with appropriate coverage for the unique risks of Wood River Valley vacation rentals.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Insurance Group', 'mammoth-str-insurance-group', 'Eastern Sierra vacation rental coverage specialists',
  'Mammoth STR Insurance Group provides short-term rental insurance for vacation property owners in Mammoth Lakes. We specialize in high-altitude California STR coverage — snow load and freeze damage, earthquake coverage, guest liability, and rental income protection for Mammoth rental properties.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra STR Coverage', 'eastern-sierra-str-coverage', 'STR insurance for Mammoth Lakes rentals',
  'Eastern Sierra STR Coverage provides vacation rental insurance for STR owners in Mammoth Lakes and June Lake. We source comprehensive California mountain STR policies with appropriate snow, earthquake, and liability coverage for Mono County vacation properties.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Insurance', 'big-bear-str-insurance', 'San Bernardino Mountains vacation rental coverage',
  'Big Bear STR Insurance provides short-term rental insurance for vacation property owners in Big Bear Lake and Big Bear City. We specialize in SoCal mountain STR coverage — snow and freeze damage, hot tub liability, guest injury protection, and rental income insurance for Big Bear cabin owners.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 69 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain STR Coverage SoCal', 'mountain-str-coverage-socal', 'STR insurance for Big Bear vacation rentals',
  'Mountain STR Coverage SoCal provides vacation rental insurance solutions for STR owners across the Big Bear Valley. We help Southern California mountain property owners secure comprehensive STR policies that protect against the unique risks of San Bernardino Mountains vacation rentals.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 45 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Insurance Group', 'bend-str-insurance-group', 'Central Oregon vacation rental coverage specialists',
  'Bend STR Insurance Group provides short-term rental insurance for vacation property owners in Bend and Sunriver. We specialize in Oregon STR coverage — wildfire protection, guest liability, rental income insurance, and comprehensive policies for Central Oregon''s diverse vacation rental market.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 75 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon STR Coverage', 'central-oregon-str-coverage', 'STR insurance for Bend and Sunriver rentals',
  'Central Oregon STR Coverage provides vacation rental insurance for STR owners in Bend, Sunriver, and Sisters. We source Oregon STR-specific policies with appropriate wildfire, liability, and income protection coverage for Deschutes County vacation properties.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Insurance', 'whitefish-str-insurance', 'Montana mountain vacation rental coverage specialists',
  'Whitefish STR Insurance provides short-term rental insurance for vacation property owners in Whitefish and the Flathead Valley. We specialize in Northwest Montana STR coverage — wildfire, freeze, and snow damage combined with STR liability protection for Glacier country vacation properties.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley STR Coverage', 'flathead-valley-str-coverage', 'STR insurance for Whitefish and Kalispell',
  'Flathead Valley STR Coverage provides vacation rental insurance for STR owners throughout the Flathead Valley. We help Northwest Montana property owners secure comprehensive STR coverage with appropriate wildfire, mountain hazard, and liability protection.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 32 from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- FURNITURE & SUPPLIES
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Furnishings', 'gulf-shores-str-furnishings', 'Alabama beach house vacation rental furniture',
  'Gulf Shores STR Furnishings provides turnkey furniture packages for vacation rental owners along the Alabama Gulf Coast. We offer coastal-durable furniture collections, linen starter packages, and complete STR supply setups for Gulf Shores and Orange Beach properties.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 53 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast STR Supplies', 'alabama-coast-str-supplies', 'STR furniture and supplies for the AL Gulf Coast',
  'Alabama Coast STR Supplies provides furniture, linens, and guest amenity packages for vacation rental owners along the Alabama Gulf Coast. We supply everything from beach-durable outdoor furniture to hotel-quality linens at competitive STR prices.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Furnishings Co', 'pcb-str-furnishings-co', 'Panama City Beach vacation rental furniture packages',
  'PCB STR Furnishings Co provides turnkey furniture and supply packages for vacation rental owners in Panama City Beach. We offer beach-modern furniture collections, commercial-grade linens, and complete STR setup packages to get new rentals guest-ready fast.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Supplies', 'emerald-coast-str-supplies', 'STR furniture and supplies along FL''s Emerald Coast',
  'Emerald Coast STR Supplies provides furniture packages, linen service, and guest amenity supplies for vacation rental owners from Panama City Beach to Destin. We offer coastal furniture collections with durability ratings designed for high-volume STR use.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Furnishings', 'naples-str-furnishings', 'SW Florida luxury vacation rental furniture',
  'Naples STR Furnishings provides luxury furniture and supply packages for high-end vacation rental owners across Naples and Marco Island. We offer upscale coastal furniture collections, premium linen packages, and complete STR staging supplies to attract discerning Naples guests.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 56 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SW Florida STR Supplies', 'sw-florida-str-supplies', 'STR furniture and supplies for Naples and Marco Island',
  'SW Florida STR Supplies provides furniture packages, linens, and guest amenity supplies for vacation rental owners in Naples, Marco Island, and Bonita Springs. We offer complete STR supply setups at competitive prices for Southwest Florida vacation rental investors.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria STR Furnishings', 'anna-maria-str-furnishings', 'Old Florida vacation rental furniture packages',
  'Anna Maria STR Furnishings provides furniture and supply packages for vacation rental owners across Anna Maria Island. We specialize in coastal-casual furniture collections that reflect Old Florida character while providing the durability needed for high-turnover island rentals.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Supplies', 'gulf-island-str-supplies', 'STR furniture across Florida''s Gulf islands',
  'Gulf Island STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners across Anna Maria Island, Longboat Key, and Siesta Key. We offer complete STR furnishing solutions for Florida Gulf island vacation rentals.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Furnishings', 'cape-cod-str-furnishings', 'New England vacation rental furniture specialists',
  'Cape Cod STR Furnishings provides furniture and supply packages for vacation rental owners throughout the Cape Cod peninsula. We offer New England coastal furniture collections — navy and white palettes, shiplap accents, rope and nautical details — with commercial STR durability.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape STR Supplies', 'lower-cape-str-supplies', 'STR furniture and supplies for Cape Cod',
  'Lower Cape STR Supplies provides furniture packages, linens, and guest amenity supplies for vacation rental owners across Cape Cod. We stock a curated selection of coastal-casual furnishings, premium white linens, and complete STR supply packages for Cape property owners.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Furnishings', 'hamptons-str-furnishings', 'Luxury Hamptons vacation rental furniture',
  'Hamptons STR Furnishings provides luxury furniture and supply packages for high-end vacation rental owners in the Hamptons. We curate premium furniture collections — designer sofas, outdoor dining sets, and upscale bedroom furnishings — that meet the elevated expectations of Hamptons weekly renters.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Supplies', 'east-end-str-supplies', 'STR furniture and supplies for the Hamptons',
  'East End STR Supplies provides furniture packages, premium linens, and complete STR supply setups for vacation rental owners in the Hamptons. We source Hamptons-quality furnishings at STR-appropriate price points and provide white-glove delivery and setup.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Furnishings', 'jersey-shore-str-furnishings', 'NJ shore vacation rental furniture packages',
  'Jersey Shore STR Furnishings provides furniture and supply packages for vacation rental owners across the New Jersey shore. We offer durable coastal-casual furniture collections for beach houses and condos from Ocean City to Long Beach Island, with linen and supply packages included.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 58 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore STR Supplies NJ', 'shore-str-supplies-nj', 'STR furniture and supplies for the Jersey Shore',
  'Shore STR Supplies NJ provides furniture packages, linens, and guest amenity supplies for vacation rental owners across the New Jersey shore. We stock everything STR owners need to get their shore house guest-ready for the summer season.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Furnishings', 'ocean-city-md-str-furnishings', 'Maryland beach vacation rental furniture',
  'Ocean City MD STR Furnishings provides furniture and supply packages for vacation rental owners across Ocean City and the Maryland coast. We offer coastal-durable furniture collections, hotel-quality linens, and complete STR supply setups for Delmarva beach rental owners.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 47 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Supplies', 'delmarva-str-supplies', 'STR furniture and supplies for the Delmarva coast',
  'Delmarva STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners across the Delmarva Peninsula. We serve Maryland and Delaware beach town STR owners with competitive pricing and fast local delivery.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.6, 28 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Furnishings', 'galveston-str-furnishings', 'Texas Gulf island vacation rental furniture',
  'Galveston STR Furnishings provides furniture and supply packages for vacation rental owners on Galveston Island. We offer coastal-casual furniture collections with durable materials suited for island rental use, plus linen and supply packages for complete STR setup.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.8, 57 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City STR Supplies', 'island-city-str-supplies', 'STR furniture and supplies for Galveston Island',
  'Island City STR Supplies provides furniture packages, linens, and STR amenity supplies for vacation rental owners across Galveston Island. We offer everything needed to furnish and stock a Galveston vacation rental for the Texas Gulf Coast market.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Furnishings', 'rehoboth-str-furnishings', 'Delaware beach vacation rental furniture packages',
  'Rehoboth STR Furnishings provides furniture and supply packages for vacation rental owners across Rehoboth Beach and the Delaware coast. We offer coastal-casual furniture collections, linen packages, and complete STR supply setups for Delaware beach town investors.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Shore STR Supplies', 'delaware-shore-str-supplies', 'STR furniture and supplies for Delaware beaches',
  'Delaware Shore STR Supplies provides furniture packages, linens, and guest amenity supplies for vacation rental owners across the Delaware coast. We serve Rehoboth, Dewey Beach, and Bethany Beach STR owners with quick local delivery and competitive pricing.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 25 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Furnishings', 'south-padre-str-furnishings', 'Texas island vacation rental furniture packages',
  'South Padre STR Furnishings provides furniture and supply packages for vacation rental owners on South Padre Island. We offer tropical-coastal furniture collections, linen packages, and complete STR supply setups for South Padre Island condo and beach house investors.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 38 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island STR Supplies', 'padre-island-str-supplies', 'STR furniture and supplies for South Padre Island',
  'Padre Island STR Supplies provides furniture packages, linens, and STR amenity supplies for vacation rental owners on South Padre Island. We stock everything needed to set up and operate a South Padre Island STR, from beach chairs to hotel-quality bedding.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.6, 22 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Furnishings Studio', '30a-str-furnishings-studio', 'Scenic 30A luxury vacation rental furniture',
  '30A STR Furnishings Studio provides luxury furniture and supply packages for vacation rental owners along Scenic Highway 30A. We curate upscale coastal furniture collections — quality sofas, dining sets, and bedroom furnishings — that match the elevated aesthetic expectations of 30A guests.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 61 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor STR Supplies 30A', 'corridor-str-supplies-30a', 'STR furniture and supplies along 30A',
  'Corridor STR Supplies provides furniture packages, premium linens, and complete STR supply setups for vacation rental owners throughout the 30A corridor. We service Seaside, Rosemary Beach, WaterColor, and WaterSound properties with white-glove delivery and setup.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Furnishings', 'breckenridge-str-furnishings', 'Summit County ski resort vacation rental furniture',
  'Breckenridge STR Furnishings provides ski lodge–style furniture and supply packages for vacation rental owners in Breckenridge and Summit County. We offer cozy mountain furniture collections — plush sofas, ski-theme accent pieces, and durable mountain furnishings with complete linen packages.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 64 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit Mountain STR Supplies', 'summit-mountain-str-supplies', 'STR furniture and supplies for Breckenridge and Frisco',
  'Summit Mountain STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners across Summit County. We stock mountain-appropriate furniture — heavy-duty pieces that withstand ski gear, snow boots, and high-turnover mountain rental use.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 42 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Furnishings', 'vail-valley-str-furnishings', 'Eagle County luxury ski resort rental furniture',
  'Vail Valley STR Furnishings provides luxury furniture and supply packages for high-end vacation rental owners in Vail and Beaver Creek. We curate premium mountain-modern furniture collections with high-end textiles and complete STR setup packages for Vail''s luxury rental market.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 51 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Supplies', 'eagle-county-str-supplies', 'STR furniture and supplies for Vail and Avon',
  'Eagle County STR Supplies provides furniture packages, linens, and STR amenity supplies for vacation rental owners throughout the Vail Valley. We serve Vail, Avon, and Edwards STR owners with mountain-appropriate furniture and quick local delivery.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Furnishings', 'aspen-str-furnishings', 'Aspen luxury vacation rental furniture packages',
  'Aspen STR Furnishings provides ultra-luxury furniture and supply packages for high-end vacation rental owners in Aspen and Snowmass. We source premium mountain-modern furnishings, designer textiles, and bespoke décor items that meet Aspen''s world-class rental standards.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 38 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork STR Supplies', 'roaring-fork-str-supplies', 'STR furniture and supplies for Aspen area rentals',
  'Roaring Fork STR Supplies provides furniture packages, linens, and STR supply setups for vacation rental owners throughout the Roaring Fork Valley. We serve Aspen, Basalt, and Carbondale STR owners with quality mountain furniture at all budget levels.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 25 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Furnishings', 'steamboat-str-furnishings', 'Colorado ski town vacation rental furniture',
  'Steamboat STR Furnishings provides cozy Western-mountain furniture and supply packages for vacation rental owners in Steamboat Springs. We offer cowboy-ski-town–flavored furniture collections — leather and plaid accents, lodge-style pieces — with complete STR linen and supply packages.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley STR Supplies', 'yampa-valley-str-supplies', 'STR furniture and supplies for Steamboat Springs',
  'Yampa Valley STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners in Steamboat Springs. We stock mountain-durable furniture collections that hold up to ski season use with complete linen sets and amenity packages.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Furnishings', 'telluride-str-furnishings', 'San Juan Mountains luxury vacation rental furniture',
  'Telluride STR Furnishings provides luxury furniture and supply packages for high-end vacation rental owners in Telluride and Mountain Village. We curate premium mountain-modern furnishings and complete STR setups that meet Telluride''s world-class luxury rental expectations.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 34 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain Village STR Supplies', 'mountain-village-str-supplies', 'STR furniture and supplies for Telluride',
  'Mountain Village STR Supplies provides furniture packages, premium linens, and STR supplies for vacation rental owners in Telluride''s Mountain Village. We offer high-quality mountain furnishings with delivery to gondola-accessible Mountain Village properties.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 21 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Furnishings', 'jackson-hole-str-furnishings', 'Teton mountain vacation rental furniture packages',
  'Jackson Hole STR Furnishings provides luxury furniture and supply packages for vacation rental owners in Jackson Hole. We offer rustic-luxury Wyoming mountain furniture collections — reclaimed wood pieces, quality leather, and wildlife-inspired accents — with complete STR linen and supply packages.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 54 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton STR Supplies', 'teton-str-supplies', 'STR furniture and supplies for Jackson Hole',
  'Teton STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners throughout the Jackson Hole valley. We serve Teton Village ski resort condos and Jackson area mountain homes with quality mountain furniture and fast local delivery.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Furnishings', 'big-sky-str-furnishings', 'Montana ski resort vacation rental furniture',
  'Big Sky STR Furnishings provides furniture and supply packages for vacation rental owners in Big Sky and the Gallatin Valley. We offer Montana wilderness–inspired mountain furniture collections with cozy lodge character, complete linen packages, and full STR supply setups.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley STR Supplies', 'gallatin-valley-str-supplies', 'STR furniture and supplies for Big Sky',
  'Gallatin Valley STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners in Big Sky and the greater Gallatin Valley. We stock mountain-appropriate furniture at competitive Montana prices with quick delivery to Big Sky resort properties.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Furnishings', 'sun-valley-str-furnishings', 'Wood River Valley vacation rental furniture',
  'Sun Valley STR Furnishings provides furniture and supply packages for vacation rental owners in Sun Valley and the Wood River Valley. We offer sophisticated alpine furniture collections with Sun Valley''s signature mid-century modern mountain style and complete STR linen packages.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 40 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River STR Supplies', 'wood-river-str-supplies', 'STR furniture and supplies for Sun Valley and Ketchum',
  'Wood River STR Supplies provides furniture packages, linens, and STR amenity supplies for vacation rental owners in Ketchum and the Wood River Valley. We serve Sun Valley area STR owners with quality mountain furniture and complete supply packages.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 24 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Furnishings', 'mammoth-str-furnishings', 'Eastern Sierra vacation rental furniture packages',
  'Mammoth STR Furnishings provides furniture and supply packages for vacation rental owners in Mammoth Lakes. We offer mountain-modern furniture collections with ski lodge warmth — quality upholstered sofas, reclaimed wood accents, and durable furnishings suited to Mammoth''s year-round rental season.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 53 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra STR Supplies', 'eastern-sierra-str-supplies', 'STR furniture and supplies for Mammoth Lakes',
  'Eastern Sierra STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners in Mammoth Lakes and June Lake. We stock everything needed to fully furnish and supply an Eastern Sierra vacation rental for both ski and summer seasons.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Furnishings', 'big-bear-str-furnishings', 'San Bernardino Mountains vacation rental furniture',
  'Big Bear STR Furnishings provides furniture and supply packages for vacation rental owners in Big Bear Lake and Big Bear City. We offer rustic-charming mountain cabin furniture collections — knotty pine pieces, plaid accents, and cozy mountain décor — with complete linen and supply packages.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 64 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain STR Supplies SoCal', 'mountain-str-supplies-socal', 'STR furniture and supplies for Big Bear',
  'Mountain STR Supplies SoCal provides furniture packages, linens, and STR supplies for vacation rental owners across the Big Bear Valley. We stock mountain-appropriate furniture at competitive prices with fast delivery to Big Bear Lake and Big Bear City properties.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 42 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Furnishings Co', 'bend-str-furnishings-co', 'Central Oregon vacation rental furniture packages',
  'Bend STR Furnishings Co provides furniture and supply packages for vacation rental owners in Bend and Sunriver. We offer Pacific Northwest–inspired furniture collections — clean modern lines, natural wood finishes, and earthy tones — with complete STR linen and supply packages.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon STR Supplies', 'central-oregon-str-supplies', 'STR furniture and supplies for Bend and Sunriver',
  'Central Oregon STR Supplies provides furniture packages, linens, and guest amenity supplies for vacation rental owners in Bend, Sunriver, and Sisters. We stock everything needed for a complete Central Oregon STR setup — from outdoor adventure storage solutions to hotel-quality bedding.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 46 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Furnishings', 'whitefish-str-furnishings', 'Montana mountain vacation rental furniture',
  'Whitefish STR Furnishings provides furniture and supply packages for vacation rental owners in Whitefish and the Flathead Valley. We offer Montana lodge–inspired furniture collections with natural timber finishes, wildlife-themed décor, and warm mountain furnishings that guests love.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 46 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley STR Supplies', 'flathead-valley-str-supplies', 'STR furniture and supplies for Whitefish and Kalispell',
  'Flathead Valley STR Supplies provides furniture packages, linens, and STR supplies for vacation rental owners throughout the Flathead Valley. We serve Whitefish, Kalispell, and Flathead Lake STR owners with quality mountain furniture and fast local delivery.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;
