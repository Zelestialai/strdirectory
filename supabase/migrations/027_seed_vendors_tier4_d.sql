-- ============================================================
-- Migration 027 — Tier 4 Vendors D
-- Renovation & Construction + Accounting & Tax
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- RENOVATION & CONSTRUCTION
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Coast STR Renovations', 'gulf-coast-str-renovations', 'Alabama beach house STR renovation specialists',
  'Gulf Coast STR Renovations transforms vacation rental properties across Gulf Shores and Orange Beach. We specialize in STR-optimized renovations — durable coastal finishes, updated kitchens and baths, outdoor entertainment areas, and design upgrades that maximize nightly rates.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.8, 67 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Orange Beach Rental Remodel', 'orange-beach-rental-remodel', 'STR renovation and construction on the AL Gulf Coast',
  'Orange Beach Rental Remodel provides renovation and remodeling services for vacation rental owners along the Alabama Gulf Coast. We focus on ROI-driven improvements — beachfront deck upgrades, kitchen remodels, flooring replacements, and exterior refreshes that boost bookings.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Contractors', 'pcb-str-contractors', 'Panama City Beach vacation rental renovation experts',
  'PCB STR Contractors specializes in renovation and remodeling for vacation rental properties across Panama City Beach. We handle everything from full gut renovations to targeted upgrades — balcony additions, bathroom refreshes, LVP flooring, and pool deck improvements.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 84 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Build Group', 'emerald-coast-build-group', 'STR renovation along Florida''s Emerald Coast',
  'Emerald Coast Build Group provides general contracting and renovation services for vacation rental owners along Florida''s Emerald Coast. We specialize in moisture-resistant coastal construction, hurricane-rated upgrades, and ROI-focused improvements for PCB STR properties.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 56 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Build Co', 'naples-str-build-co', 'Southwest Florida luxury vacation rental renovations',
  'Naples STR Build Co provides luxury renovation and construction services for high-end vacation rental properties across Naples and Marco Island. We specialize in custom pool installations, kitchen-to-outdoor living expansions, and full interior renovations for luxury STR owners.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 72 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Marco Island Renovation Pros', 'marco-island-renovation-pros', 'STR renovation specialists in SW Florida',
  'Marco Island Renovation Pros provides renovation and remodeling services for vacation rental owners in Naples and Marco Island. We handle condo renovations, waterfront property upgrades, and complete STR transformations designed to maximize rental income.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 45 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Renovations', 'anna-maria-island-renovations', 'Old Florida beach house STR renovation specialists',
  'Anna Maria Island Renovations provides renovation and remodeling services for vacation rental properties across Anna Maria Island. We specialize in preserving Old Florida character while upgrading kitchens, bathrooms, and outdoor spaces for modern guest expectations.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 58 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island Build Group', 'gulf-island-build-group', 'STR renovation across Florida''s Gulf islands',
  'Gulf Island Build Group provides general contracting and renovation for vacation rental owners across Anna Maria Island, Longboat Key, and Siesta Key. We specialize in coastal construction methods, salt-air resistant materials, and STR-optimized renovation scopes.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Contractors', 'cape-cod-str-contractors', 'New England vacation rental renovation specialists',
  'Cape Cod STR Contractors provides renovation and construction services for vacation rental properties throughout the Cape Cod peninsula. We specialize in historic cottage preservation, cedar-shingle exterior work, and full STR gut renovations that command premium rates.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 89 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape Build Partners', 'lower-cape-build-partners', 'STR renovation across Cape Cod',
  'Lower Cape Build Partners handles renovation and remodeling for vacation rental owners from Chatham to Provincetown. We specialize in Cape-style renovations — adding outdoor showers, expanding decks, modernizing kitchens — while maintaining the authentic Cape Cod character guests love.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.8, 56 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Renovation Group', 'hamptons-str-renovation-group', 'Luxury Hamptons vacation rental renovation specialists',
  'Hamptons STR Renovation Group provides luxury renovation and construction services for high-end vacation rental properties in Southampton and East Hampton. We specialize in pool house additions, chef kitchen remodels, and full STR transformations that justify Hamptons premium rates.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 63 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Build Partners', 'east-end-build-partners', 'STR renovation and construction in the Hamptons',
  'East End Build Partners provides high-end renovation services for vacation rental owners in the Hamptons. We handle premium finishes, outdoor kitchen additions, spa bathroom remodels, and complete property transformations designed to maximize Hamptons weekly rental rates.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.7, 41 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Renovation Co', 'jersey-shore-str-renovation-co', 'NJ shore vacation rental renovation specialists',
  'Jersey Shore STR Renovation Co provides renovation and remodeling for vacation rental owners across the Jersey Shore. We specialize in shore house renovations — roof deck additions, updated shore baths, open-concept main levels, and exterior refreshes that boost Ocean City and Avalon rental income.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 75 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore Build Group NJ', 'shore-build-group-nj', 'STR renovation and construction for the Jersey Shore',
  'Shore Build Group NJ provides general contracting and renovation for vacation rental owners from Long Beach Island to Cape May. We handle complete shore house gut renovations, deck additions, and targeted upgrades designed to maximize NJ shore rental income.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 49 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD Rental Renovations', 'ocean-city-md-rental-renovations', 'Maryland beach town STR renovation specialists',
  'Ocean City MD Rental Renovations provides renovation and remodeling for vacation rental owners in Ocean City and the surrounding Maryland coast. We specialize in condo renovations, beach house upgrades, and targeted improvements that drive higher nightly rates and reviews.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 61 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva Build Partners', 'delmarva-build-partners', 'STR renovation across the Delmarva shore',
  'Delmarva Build Partners provides general contracting and renovation for vacation rental owners along the Delmarva Peninsula. We handle everything from Ocean City condo remodels to Fenwick Island beach house renovations with STR ROI as the top priority.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.6, 37 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Renovation Group', 'galveston-str-renovation-group', 'Texas Gulf island vacation rental renovation experts',
  'Galveston STR Renovation Group specializes in renovation and construction for vacation rental properties on Galveston Island. We handle hurricane-resistant upgrades, historic Victorian restoration work, and complete STR transformations designed for coastal Texas conditions.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island Build Co Galveston', 'island-build-co-galveston', 'STR renovation and construction on Galveston Island',
  'Island Build Co provides renovation services for vacation rental owners across Galveston Island. We specialize in flood-zone-aware renovations, pier-and-beam foundation work, outdoor entertainment area additions, and complete property transformations for Galveston STR investors.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 44 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Renovation Co', 'rehoboth-str-renovation-co', 'Delaware beach vacation rental renovation specialists',
  'Rehoboth STR Renovation Co provides renovation and remodeling for vacation rental owners in Rehoboth Beach, Dewey Beach, and Bethany Beach. We specialize in coastal renovations — screened porch additions, bathroom updates, and kitchen refreshes that increase STR booking rates.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 53 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Beaches Build Group', 'delaware-beaches-build-group', 'STR renovation across the Delaware coast',
  'Delaware Beaches Build Group provides general contracting and renovation for vacation rental owners across the Delaware beaches. We handle beach house remodels, condo upgrades, and targeted STR improvements from Dewey Beach to Fenwick Island.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 32 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Renovation', 'south-padre-str-renovation', 'Texas island vacation rental renovation experts',
  'South Padre STR Renovation provides renovation and remodeling services for vacation rental owners on South Padre Island. We handle beachfront condo renovations, outdoor deck additions, pool area improvements, and complete STR property transformations.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 51 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island Build Partners', 'padre-island-build-partners', 'STR renovation on South Padre Island',
  'Padre Island Build Partners provides general contracting and renovation for vacation rental properties on South Padre Island. We specialize in coastal construction, storm-resistant upgrades, and ROI-focused improvements for STR investors on this growing Texas barrier island.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.6, 29 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Renovation Group', '30a-str-renovation-group', 'Scenic 30A vacation rental renovation specialists',
  '30A STR Renovation Group provides renovation and construction for vacation rental owners along Scenic Highway 30A. We specialize in Gulf-front property renovations, New Urbanist cottage upgrades, and custom outdoor entertainment areas that justify premium 30A rental rates.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 74 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor Build Co 30A', 'corridor-build-co-30a', 'STR renovation and construction along 30A',
  'Corridor Build Co provides general contracting and renovation for vacation rental owners throughout the 30A corridor. We handle cottage remodels, carriage house additions, and outdoor kitchen installations designed to increase nightly rates at Seaside, Rosemary Beach, and WaterColor properties.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 47 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Contractors', 'breckenridge-str-contractors', 'Summit County ski resort vacation rental renovation',
  'Breckenridge STR Contractors provides renovation and construction for vacation rental properties across Summit County. We specialize in ski cabin renovations — hot tub installations, ski-boot room builds, fireplace upgrades, and full mountain cabin transformations.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 78 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit Mountain Build Group', 'summit-mountain-build-group', 'STR renovation for Breckenridge and Frisco',
  'Summit Mountain Build Group provides general contracting and renovation for vacation rental owners throughout Summit County. We handle condo remodels, deck expansions, and high-altitude-specific construction upgrades for STR properties in Breckenridge, Frisco, and Keystone.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 52 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Contractors', 'vail-valley-str-contractors', 'Eagle County luxury ski resort renovation specialists',
  'Vail Valley STR Contractors provides high-end renovation and construction for luxury vacation rental properties in Vail and Beaver Creek. We specialize in premium ski resort renovations — slopeside condo upgrades, hot tub installations, and luxury finishes that maximize Vail rental rates.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 64 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County Build Partners', 'eagle-county-build-partners', 'STR renovation for Vail and Avon',
  'Eagle County Build Partners provides general contracting and renovation for vacation rental owners in the Vail Valley. We handle mountain home renovations, hot tub additions, ski-gear storage builds, and targeted improvements that boost rental income in Avon and Edwards.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 40 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Construction Group', 'aspen-str-construction-group', 'Aspen luxury vacation rental renovation specialists',
  'Aspen STR Construction Group provides luxury renovation and construction for high-end vacation rental properties in Aspen and Snowmass Village. We specialize in ultra-premium finishes, custom built-ins, chef kitchen installations, and complete STR property transformations.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Build Partners', 'roaring-fork-build-partners', 'STR renovation for Aspen and Roaring Fork Valley',
  'Roaring Fork Build Partners provides general contracting and renovation for vacation rental owners throughout the Roaring Fork Valley. We handle Aspen condo upgrades, Basalt mountain home renovations, and STR-focused improvements at all budget levels.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Build Co', 'steamboat-str-build-co', 'Routt County ski resort vacation rental renovation',
  'Steamboat STR Build Co provides renovation and construction for vacation rental properties in Steamboat Springs. We specialize in ski cabin upgrades — hot tub installations, mudroom and ski-boot room additions, open-concept remodels, and deck renovations for the Steamboat STR market.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 61 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Build Group', 'yampa-valley-build-group', 'STR renovation and construction for Steamboat Springs',
  'Yampa Valley Build Group handles renovation and construction for vacation rental owners in Steamboat Springs and the Yampa Valley. We provide full-scope STR renovations at competitive prices for the Steamboat market, from condo refreshes to mountain home transformations.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Construction', 'telluride-str-construction', 'San Juan Mountains luxury vacation rental renovation',
  'Telluride STR Construction provides luxury renovation and construction services for vacation rental properties in Telluride and Mountain Village. We handle high-altitude construction challenges, premium finish work, and full property transformations for ultra-luxury Telluride STR owners.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 44 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Build Partners', 'san-juan-build-partners', 'STR renovation for Telluride Mountain Village',
  'San Juan Build Partners provides renovation services for vacation rental owners in Telluride and Mountain Village. We specialize in high-alpine construction, gondola-accessible project logistics, and premium renovations that maintain the Mountain Village aesthetic standards.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Contractors', 'jackson-hole-str-contractors', 'Teton County luxury vacation rental renovation experts',
  'Jackson Hole STR Contractors provides premium renovation and construction for vacation rental properties in Jackson Hole. We specialize in log home renovations, barn-conversion STR builds, hot spring additions, and complete property transformations for the luxury Jackson Hole market.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 69 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Build Group', 'teton-build-group', 'STR renovation and construction in Jackson Hole',
  'Teton Build Group provides general contracting and renovation for vacation rental owners throughout the Jackson Hole valley. We handle ski resort condo upgrades, mountain home renovations, and targeted improvements designed to maximize occupancy and nightly rates.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Build Co', 'big-sky-str-build-co', 'Montana ski resort vacation rental renovation specialists',
  'Big Sky STR Build Co provides renovation and construction for vacation rental properties in Big Sky and the Gallatin Valley. We handle ski resort condo upgrades, mountain cabin renovations, hot tub installations, and full STR property transformations in this growing Montana market.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 54 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Build Partners', 'gallatin-build-partners', 'STR renovation for Big Sky and Gallatin Valley',
  'Gallatin Build Partners provides general contracting and renovation for vacation rental owners in Big Sky and the greater Gallatin Valley. We handle full cabin renovations, deck additions, and targeted STR improvements designed to capitalize on Big Sky''s explosive growth.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Contractors', 'sun-valley-str-contractors', 'Wood River Valley vacation rental renovation experts',
  'Sun Valley STR Contractors provides renovation and construction for vacation rental properties in Sun Valley and Ketchum. We specialize in mountain home renovations, hot tub and sauna installations, deck upgrades, and complete STR transformations for the Wood River Valley market.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 51 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River Build Group', 'wood-river-build-group', 'STR renovation for Sun Valley and Ketchum',
  'Wood River Build Group provides general contracting and renovation for vacation rental owners in Ketchum, Hailey, and the Wood River Valley. We offer competitive Sun Valley STR renovations — from cabin refreshes to full mountain home transformations.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Renovation Group', 'mammoth-str-renovation-group', 'Eastern Sierra vacation rental renovation specialists',
  'Mammoth STR Renovation Group provides renovation and construction for vacation rental properties in Mammoth Lakes. We specialize in high-altitude construction, ski condo remodels, hot tub installations, and full property transformations for the Mammoth Lakes STR market.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 68 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra Build Partners', 'eastern-sierra-build-partners', 'STR renovation for Mammoth Lakes',
  'Eastern Sierra Build Partners provides general contracting and renovation for vacation rental owners in Mammoth Lakes and June Lake. We handle ski cabin upgrades, condo renovations, and targeted STR improvements optimized for Mammoth''s dual ski and summer season.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Build Co', 'big-bear-str-build-co', 'San Bernardino Mountains vacation rental renovation',
  'Big Bear STR Build Co provides renovation and construction for vacation rental properties in Big Bear Lake and Big Bear City. We specialize in cabin renovations, lake view deck additions, hot tub installations, and STR transformations for the high-volume Southern California mountain market.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 81 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Bernardino Mountain Builders', 'san-bernardino-mountain-builders', 'STR renovation for Big Bear cabins',
  'San Bernardino Mountain Builders provides general contracting and renovation for vacation rental owners across the Big Bear Valley. We handle cabin remodels, kitchen and bathroom upgrades, and complete STR property transformations for Southern California mountain investors.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 53 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Renovation Group', 'bend-str-renovation-group', 'Central Oregon vacation rental renovation specialists',
  'Bend STR Renovation Group provides renovation and construction for vacation rental properties in Bend and Sunriver. We specialize in Pacific Northwest STR renovations — outdoor living spaces, modern farmhouse kitchen remodels, and full property transformations for the booming Bend market.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 86 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Build Partners', 'central-oregon-build-partners', 'STR renovation for Bend and Sunriver',
  'Central Oregon Build Partners provides general contracting and renovation for vacation rental owners in Bend, Sunriver, and Sisters. We handle Sunriver resort home renovations, Bend urban STR upgrades, and targeted improvements designed to drive top-of-market rates.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 54 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Contractors', 'whitefish-str-contractors', 'Montana ski resort vacation rental renovation experts',
  'Whitefish STR Contractors provides renovation and construction for vacation rental properties in Whitefish and Kalispell. We handle mountain home renovations, ski cabin upgrades, hot tub installations, and full STR transformations for the growing Northwest Montana market.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 57 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley Build Group', 'flathead-valley-build-group', 'STR renovation and construction in Flathead Valley',
  'Flathead Valley Build Group provides general contracting and renovation for vacation rental owners throughout the Flathead Valley. We handle cabin renovations, lakefront property improvements, and complete STR transformations for properties near Glacier National Park.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- ACCOUNTING & TAX
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Accounting', 'gulf-shores-str-accounting', 'Alabama vacation rental tax and bookkeeping specialists',
  'Gulf Shores STR Accounting provides tax preparation, bookkeeping, and financial advisory services for short-term rental owners across the Alabama Gulf Coast. We specialize in lodging tax compliance, STR depreciation strategies, and Airbnb/VRBO income reporting for Gulf Shores investors.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast STR Tax Advisors', 'alabama-coast-str-tax-advisors', 'STR tax and accounting for the AL Gulf Coast',
  'Alabama Coast STR Tax Advisors provides accounting and tax services tailored for vacation rental owners along the Alabama Gulf Coast. We handle Alabama lodging tax filings, STR income tax optimization, and help investors maximize deductions on beach rental properties.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Tax Group', 'pcb-str-tax-group', 'Panama City Beach vacation rental accounting experts',
  'PCB STR Tax Group provides tax preparation and accounting for vacation rental owners in Panama City Beach. We specialize in Florida tourist development tax compliance, STR depreciation strategies, and comprehensive financial planning for PCB rental property investors.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 78 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Bookkeeping', 'emerald-coast-str-bookkeeping', 'STR accounting along Florida''s Emerald Coast',
  'Emerald Coast STR Bookkeeping provides bookkeeping, tax filing, and financial advisory services for vacation rental owners from Panama City Beach to Destin. We handle Florida lodging tax compliance and help STR investors track income and expenses across multiple platforms.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 49 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Tax Advisors', 'naples-str-tax-advisors', 'Southwest Florida luxury vacation rental accounting',
  'Naples STR Tax Advisors provides accounting and tax services for high-value vacation rental owners across Naples and Marco Island. We specialize in luxury property depreciation, Florida lodging tax compliance, and comprehensive tax optimization for SW Florida STR investors.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 64 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SW Florida STR Bookkeeping', 'sw-florida-str-bookkeeping', 'STR tax and accounting for Naples and Marco Island',
  'SW Florida STR Bookkeeping provides vacation rental bookkeeping and tax services for STR owners in Naples, Marco Island, and Bonita Springs. We track Airbnb and VRBO income, manage Florida lodging tax remittances, and provide quarterly financial reports for STR investors.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria STR Accounting', 'anna-maria-str-accounting', 'Florida Gulf island vacation rental tax specialists',
  'Anna Maria STR Accounting provides tax preparation and bookkeeping for vacation rental owners across Anna Maria Island. We handle Florida lodging tax compliance, STR depreciation strategies, and help island property investors optimize their annual tax positions.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.8, 51 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Tax Group', 'gulf-island-str-tax-group', 'STR accounting for Florida Gulf island rentals',
  'Gulf Island STR Tax Group provides accounting and tax advisory services for vacation rental owners across Anna Maria Island, Longboat Key, and Siesta Key. We specialize in Florida lodging tax filings, STR expense tracking, and multi-property vacation rental tax planning.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Tax Advisors', 'cape-cod-str-tax-advisors', 'New England vacation rental accounting specialists',
  'Cape Cod STR Tax Advisors provides tax preparation and accounting for vacation rental owners throughout the Cape Cod peninsula. We specialize in Massachusetts room occupancy tax compliance, Cape Cod STR deduction strategies, and seasonal rental income optimization.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 83 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape STR Bookkeeping', 'lower-cape-str-bookkeeping', 'STR tax and bookkeeping for Cape Cod',
  'Lower Cape STR Bookkeeping provides bookkeeping and tax services for vacation rental owners across Cape Cod. We handle Massachusetts lodging tax filings, Airbnb and VRBO income reconciliation, and help Cape Cod STR owners maximize their annual tax deductions.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.7, 51 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Tax Group', 'hamptons-str-tax-group', 'Luxury Hamptons vacation rental accounting specialists',
  'Hamptons STR Tax Group provides accounting and tax services for high-value vacation rental owners in Southampton and East Hampton. We specialize in New York State lodging tax compliance, luxury property depreciation, and comprehensive tax planning for Hamptons STR investors.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Accounting', 'east-end-str-accounting', 'STR tax advisors for the Hamptons',
  'East End STR Accounting provides tax preparation and bookkeeping for vacation rental owners in the Hamptons. We handle New York lodging tax compliance, Suffolk County STR regulations, and help Hamptons investors optimize their substantial weekly rental income tax position.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 37 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Tax Advisors', 'jersey-shore-str-tax-advisors', 'NJ shore vacation rental accounting specialists',
  'Jersey Shore STR Tax Advisors provides tax preparation and accounting for vacation rental owners across the New Jersey shore. We specialize in New Jersey hotel/motel tax compliance, Ocean City and Avalon STR reporting, and tax optimization for NJ shore rental investors.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 69 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore STR Bookkeeping NJ', 'shore-str-bookkeeping-nj', 'STR tax and bookkeeping for the Jersey Shore',
  'Shore STR Bookkeeping NJ provides bookkeeping and tax services for vacation rental owners along the New Jersey shore. We track rental income across Airbnb, VRBO, and direct booking platforms and handle NJ lodging tax remittances for shore town investors.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Tax Group', 'ocean-city-md-str-tax-group', 'Maryland beach rental accounting specialists',
  'Ocean City MD STR Tax Group provides accounting and tax services for vacation rental owners across Ocean City and the Maryland shore. We handle Maryland sales and use tax compliance for STRs, condo association fee deductions, and comprehensive tax planning for beach rental investors.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 55 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Bookkeeping', 'delmarva-str-bookkeeping', 'STR tax and accounting for the Delmarva shore',
  'Delmarva STR Bookkeeping provides bookkeeping and tax advisory services for vacation rental owners across the Delmarva Peninsula. We handle Maryland and Delaware lodging tax compliance and provide streamlined financial reporting for beach rental investors.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Tax Advisors', 'galveston-str-tax-advisors', 'Texas Gulf island vacation rental accounting',
  'Galveston STR Tax Advisors provides tax preparation and accounting for vacation rental owners on Galveston Island. We specialize in Texas hotel occupancy tax compliance, short-term rental income optimization, and comprehensive tax planning for Galveston STR investors.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City STR Bookkeeping', 'island-city-str-bookkeeping', 'STR tax and bookkeeping for Galveston Island',
  'Island City STR Bookkeeping provides bookkeeping and tax services for vacation rental owners on Galveston Island. We track rental income across platforms, handle Texas hotel occupancy tax filings, and provide monthly financial reports to keep Galveston STR investors organized.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 42 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Tax Group', 'rehoboth-str-tax-group', 'Delaware beach vacation rental accounting specialists',
  'Rehoboth STR Tax Group provides tax preparation and accounting for vacation rental owners in Rehoboth Beach and across the Delaware coast. We handle Delaware lodging tax compliance, vacation rental depreciation strategies, and comprehensive tax planning for beach rental investors.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Coast STR Bookkeeping', 'delaware-coast-str-bookkeeping', 'STR tax and accounting for Delaware beach rentals',
  'Delaware Coast STR Bookkeeping provides bookkeeping and tax services for vacation rental owners across the Delaware beaches. We track Airbnb and VRBO income, handle Delaware lodging tax remittances, and provide clear financial reporting for Rehoboth and Bethany Beach investors.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 30 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Tax Advisors', 'south-padre-str-tax-advisors', 'Texas island vacation rental accounting specialists',
  'South Padre STR Tax Advisors provides tax preparation and accounting for vacation rental owners on South Padre Island. We handle Texas hotel occupancy tax compliance, STR income deduction strategies, and comprehensive tax planning for South Padre Island investors.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 44 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island STR Bookkeeping', 'padre-island-str-bookkeeping', 'STR tax and bookkeeping for South Padre Island',
  'Padre Island STR Bookkeeping provides bookkeeping and tax services for vacation rental owners on South Padre Island. We manage Texas lodging tax filings, track vacation rental income and expenses, and help investors stay financially organized throughout the year.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.7, 26 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Tax Group', '30a-str-tax-group', 'Scenic 30A vacation rental accounting specialists',
  '30A STR Tax Group provides tax preparation and accounting for vacation rental owners along Scenic Highway 30A. We handle Florida lodging tax compliance for high-value 30A properties, optimize STR depreciation strategies, and provide comprehensive financial planning for 30A investors.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 71 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor STR Bookkeeping 30A', 'corridor-str-bookkeeping-30a', 'STR tax and bookkeeping along 30A',
  'Corridor STR Bookkeeping provides bookkeeping and tax advisory services for vacation rental owners throughout the 30A corridor. We track high-value weekly rental income, handle Florida tourist development tax remittances, and provide clear quarterly financial summaries for 30A investors.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 44 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Tax Advisors', 'breckenridge-str-tax-advisors', 'Summit County ski resort vacation rental accounting',
  'Breckenridge STR Tax Advisors provides tax preparation and accounting for vacation rental owners in Breckenridge and Summit County. We handle Colorado lodging tax compliance, ski property depreciation strategies, and comprehensive tax planning for Summit County STR investors.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 74 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County STR Bookkeeping', 'summit-county-str-bookkeeping', 'STR tax and bookkeeping for Breckenridge and Frisco',
  'Summit County STR Bookkeeping provides bookkeeping and tax services for vacation rental owners in Breckenridge, Frisco, and Keystone. We handle Colorado lodging tax filings, track STR income across platforms, and help mountain property investors maximize their tax deductions.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Tax Group', 'vail-valley-str-tax-group', 'Eagle County ski resort vacation rental accounting',
  'Vail Valley STR Tax Group provides accounting and tax services for vacation rental owners in Vail and Beaver Creek. We specialize in high-value ski resort property depreciation, Eagle County lodging tax compliance, and comprehensive tax optimization for Vail STR investors.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 58 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Bookkeeping', 'eagle-county-str-bookkeeping', 'STR tax and bookkeeping for Vail and Avon',
  'Eagle County STR Bookkeeping provides bookkeeping and tax advisory for vacation rental owners in the Vail Valley. We manage Colorado lodging tax remittances, provide monthly financial reports, and help Vail area STR investors stay organized across all booking platforms.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Tax Advisors', 'aspen-str-tax-advisors', 'Aspen luxury vacation rental accounting specialists',
  'Aspen STR Tax Advisors provides sophisticated accounting and tax services for high-value vacation rental owners in Aspen and Snowmass. We specialize in ultra-luxury property depreciation, Pitkin County lodging tax compliance, and comprehensive wealth planning for Aspen STR investors.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 44 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork STR Bookkeeping', 'roaring-fork-str-bookkeeping', 'STR tax and accounting for Aspen area rentals',
  'Roaring Fork STR Bookkeeping provides bookkeeping and tax services for vacation rental owners throughout the Roaring Fork Valley. We handle Colorado lodging tax compliance for Aspen, Basalt, and Carbondale STR properties and provide clear financial tracking across booking platforms.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 29 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Tax Group', 'steamboat-str-tax-group', 'Routt County vacation rental accounting specialists',
  'Steamboat STR Tax Group provides tax preparation and accounting for vacation rental owners in Steamboat Springs. We handle Colorado lodging tax compliance, dual-season ski and summer rental income reporting, and comprehensive tax optimization for Routt County STR investors.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 54 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley STR Bookkeeping', 'yampa-valley-str-bookkeeping', 'STR tax and bookkeeping for Steamboat Springs',
  'Yampa Valley STR Bookkeeping provides bookkeeping and tax services for vacation rental owners in Steamboat Springs and the Yampa Valley. We manage Colorado lodging tax filings, track platform income, and provide Steamboat STR investors with clear monthly financial reports.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Tax Advisors', 'telluride-str-tax-advisors', 'San Juan Mountains vacation rental accounting',
  'Telluride STR Tax Advisors provides accounting and tax services for ultra-high-value vacation rental owners in Telluride and Mountain Village. We specialize in luxury mountain property depreciation, San Miguel County lodging tax compliance, and wealth-level tax planning for Telluride investors.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 39 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Miguel STR Bookkeeping', 'san-miguel-str-bookkeeping', 'STR tax and accounting for Telluride',
  'San Miguel STR Bookkeeping provides bookkeeping and tax advisory for vacation rental owners in the Telluride area. We handle San Miguel County lodging tax filings and provide financial reporting for this premium Colorado ski destination''s STR investors.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 24 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Tax Group', 'jackson-hole-str-tax-group', 'Teton County luxury vacation rental accounting',
  'Jackson Hole STR Tax Group provides accounting and tax services for vacation rental owners in Jackson Hole. We specialize in Wyoming lodging tax compliance, luxury mountain property depreciation, and comprehensive tax planning for Teton County STR investors — including foreign national buyers.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 64 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton STR Bookkeeping', 'teton-str-bookkeeping', 'STR tax and bookkeeping for Jackson Hole',
  'Teton STR Bookkeeping provides bookkeeping and tax services for vacation rental owners throughout the Jackson Hole valley. We track Airbnb, VRBO, and direct booking income, handle Wyoming lodging tax remittances, and provide clear quarterly financial reporting.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 40 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Tax Advisors', 'big-sky-str-tax-advisors', 'Montana mountain vacation rental accounting specialists',
  'Big Sky STR Tax Advisors provides tax preparation and accounting for vacation rental owners in Big Sky and the Gallatin Valley. We handle Montana lodging tax compliance, STR depreciation strategies, and comprehensive tax planning for investors in this rapidly appreciating Montana market.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 49 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley STR Bookkeeping', 'gallatin-valley-str-bookkeeping', 'STR tax and accounting for Big Sky',
  'Gallatin Valley STR Bookkeeping provides bookkeeping and tax advisory services for vacation rental owners in Big Sky and the greater Gallatin Valley. We manage Montana lodging tax filings and help STR investors track income, expenses, and deductions throughout the year.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Tax Group', 'sun-valley-str-tax-group', 'Wood River Valley vacation rental accounting',
  'Sun Valley STR Tax Group provides accounting and tax services for vacation rental owners in Sun Valley and the Wood River Valley. We handle Idaho lodging tax compliance, ski resort property depreciation, and comprehensive tax planning for Blaine County STR investors.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 46 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River STR Bookkeeping', 'wood-river-str-bookkeeping', 'STR tax and bookkeeping for Sun Valley and Ketchum',
  'Wood River STR Bookkeeping provides bookkeeping and tax services for vacation rental owners in Ketchum, Hailey, and the Wood River Valley. We manage Idaho lodging tax remittances, track platform income, and keep Sun Valley STR investors organized and compliant.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Tax Advisors', 'mammoth-str-tax-advisors', 'Eastern Sierra vacation rental accounting specialists',
  'Mammoth STR Tax Advisors provides tax preparation and accounting for vacation rental owners in Mammoth Lakes. We specialize in California lodging tax compliance, Mono County STR rules, and comprehensive tax optimization for Mammoth Lakes investors with dual ski and summer rental seasons.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra STR Bookkeeping', 'eastern-sierra-str-bookkeeping', 'STR tax and bookkeeping for Mammoth Lakes',
  'Eastern Sierra STR Bookkeeping provides bookkeeping and tax services for vacation rental owners in Mammoth Lakes and June Lake. We handle California transient occupancy tax filings, track dual-season rental income, and provide clear financial reporting for Mammoth STR investors.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Tax Group', 'big-bear-str-tax-group', 'San Bernardino Mountains vacation rental accounting',
  'Big Bear STR Tax Group provides tax preparation and accounting for vacation rental owners in Big Bear Lake and Big Bear City. We handle California transient occupancy tax compliance, San Bernardino County STR regulations, and comprehensive tax planning for Big Bear cabin investors.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 74 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain STR Bookkeeping SoCal', 'mountain-str-bookkeeping-socal', 'STR tax and bookkeeping for Big Bear',
  'Mountain STR Bookkeeping SoCal provides bookkeeping and tax services for vacation rental owners across the Big Bear Valley. We track Airbnb and VRBO income, manage California lodging tax remittances, and help Big Bear cabin investors stay organized and compliant.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 48 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Tax Advisors', 'bend-str-tax-advisors', 'Central Oregon vacation rental accounting specialists',
  'Bend STR Tax Advisors provides tax preparation and accounting for vacation rental owners in Bend and Sunriver. We specialize in Oregon lodging tax compliance, Deschutes County STR regulations, and comprehensive tax planning for Central Oregon vacation rental investors.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 81 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon STR Bookkeeping', 'central-oregon-str-bookkeeping', 'STR tax and bookkeeping for Bend and Sunriver',
  'Central Oregon STR Bookkeeping provides bookkeeping and tax services for vacation rental owners in Bend, Sunriver, and Sisters. We handle Oregon transient lodging tax filings, Sunriver SROA fee tracking, and comprehensive financial reporting for Central Oregon STR investors.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 51 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Tax Group', 'whitefish-str-tax-group', 'Northwest Montana vacation rental accounting',
  'Whitefish STR Tax Group provides tax preparation and accounting for vacation rental owners in Whitefish and the Flathead Valley. We handle Montana lodging tax compliance, Glacier gateway property depreciation, and comprehensive tax planning for Northwest Montana STR investors.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 53 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley STR Bookkeeping', 'flathead-valley-str-bookkeeping', 'STR tax and bookkeeping for Whitefish and Kalispell',
  'Flathead Valley STR Bookkeeping provides bookkeeping and tax services for vacation rental owners throughout the Flathead Valley. We manage Montana lodging tax filings for Whitefish, Kalispell, and lakefront properties and provide clear monthly financial reports for STR investors.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;
