-- ============================================================
-- Migration 021 — Tier 4 Vendors B
-- Property Management + Maintenance & Repairs
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- PROPERTY MANAGEMENT
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Management', 'gulf-shores-str-management', 'Full-service vacation rental management on the AL Gulf Coast',
  'Gulf Shores STR Management provides comprehensive short-term rental property management for vacation rental owners across Gulf Shores and Orange Beach. We handle everything from listing optimization and pricing to guest communication, turnover coordination, and owner reporting.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 187 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Beach Rental Management', 'alabama-beach-rental-management', 'STR property management across the Alabama Gulf Coast',
  'Alabama Beach Rental Management offers full-service vacation rental management for property owners across Gulf Shores and Orange Beach. Our local team maximizes occupancy and revenue while handling every detail of daily operations.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB Vacation Rental Management', 'pcb-vacation-rental-management', 'Full-service STR management in Panama City Beach',
  'PCB Vacation Rental Management provides comprehensive property management for vacation rental owners across Panama City Beach. We specialize in maximizing revenue during the intense spring break and summer seasons while maintaining year-round occupancy.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Property Co', 'emerald-coast-property-co', 'STR management across Panama City Beach',
  'Emerald Coast Property Co offers full-service vacation rental management for property owners in Panama City Beach. Our revenue management team uses dynamic pricing and multi-platform distribution to maximize your property''s annual performance.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 178 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples Luxury Rental Management', 'naples-luxury-rental-management', 'Premium vacation rental management in SW Florida',
  'Naples Luxury Rental Management provides white-glove property management for luxury vacation rental owners across Naples, Marco Island, and Bonita Springs. We specialize in the high-end guest service that the Naples market demands.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 154 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southwest Florida STR Co', 'southwest-florida-str-co', 'STR property management across Naples and Marco Island',
  'Southwest Florida STR Co offers comprehensive vacation rental management for property owners across the Naples area. Our team handles listings, guest relations, maintenance coordination, and detailed financial reporting.',
  c.id, 'Bonita Springs', 'FL', p.id, true, false, 4.8, 118 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Rentals Mgmt', 'anna-maria-island-rentals-mgmt', 'Old Florida vacation rental management on AMI',
  'Anna Maria Island Rentals Management provides full-service STR property management for vacation rental owners across Anna Maria Island and the Sarasota Gulf Coast. We preserve the island''s Old Florida charm while maximizing owner returns.',
  c.id, 'Anna Maria', 'FL', p.id, true, true, 4.9, 176 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island Property Management', 'gulf-island-property-management', 'STR management across AMI and Siesta Key',
  'Gulf Island Property Management offers vacation rental management for property owners across Anna Maria Island, Longboat Key, and Siesta Key. Our local expertise and guest-first approach drive exceptional reviews and repeat bookings.',
  c.id, 'Holmes Beach', 'FL', p.id, true, false, 4.8, 132 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod Vacation Rental Mgmt', 'cape-cod-vacation-rental-mgmt', 'New England STR property management on Cape Cod',
  'Cape Cod Vacation Rental Management provides comprehensive property management for vacation rental owners throughout the Cape Cod peninsula. We specialize in maximizing the intense summer season while building shoulder-season occupancy.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape & Islands Property Co', 'cape-islands-property-co', 'STR management across Cape Cod and the Islands',
  'Cape & Islands Property Co offers full-service vacation rental management for property owners across Cape Cod. Our revenue-focused approach and deep local knowledge help owners achieve exceptional annual returns from their Cape properties.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons Estate Management', 'hamptons-estate-management', 'Luxury vacation rental management in the Hamptons',
  'Hamptons Estate Management provides ultra-premium property management for vacation rental owners across the Hamptons. We specialize in high-value estate rentals with the white-glove service and discretion that Hamptons owners expect.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Management', 'east-end-str-management', 'STR property management across the Hamptons',
  'East End STR Management offers comprehensive vacation rental management for property owners throughout the Hamptons. Our team handles all aspects of operations — from weekly rental logistics to year-round owner communication and financial reporting.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.7, 108 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore Vacation Mgmt Co', 'jersey-shore-vacation-mgmt-co', 'Full-service STR management along the NJ Shore',
  'Jersey Shore Vacation Management Co provides comprehensive property management for vacation rental owners across the New Jersey coast. We handle summer season logistics, off-season maintenance, and year-round owner reporting.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore Property Managers NJ', 'shore-property-managers-nj', 'STR management across the Jersey Shore',
  'Shore Property Managers NJ offers full-service vacation rental management for property owners from Long Beach Island to Cape May. Our local teams maximize your property''s revenue while providing guests with exceptional Shore experiences.',
  c.id, 'Stone Harbor', 'NJ', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD Rental Management', 'ocean-city-md-rental-management', 'Maryland beach resort STR management',
  'Ocean City MD Rental Management provides comprehensive vacation rental management for property owners across Ocean City and the Delaware beaches. We specialize in the Mid-Atlantic beach market''s seasonal patterns and operational demands.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Management Co', 'delmarva-str-management-co', 'STR management across Maryland and Delaware beaches',
  'Delmarva STR Management Co offers full-service vacation rental management for property owners across the Ocean City and Rehoboth Beach markets. Our revenue management expertise maximizes your property''s annual income.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Management Co', 'galveston-str-management-co', 'Texas island vacation rental management',
  'Galveston STR Management Co provides full-service property management for vacation rental owners across Galveston Island and Crystal Beach. We handle listings, guests, turnovers, and maintenance for Texas Gulf Coast properties.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 176 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Texas Gulf Coast Rental Mgmt', 'texas-gulf-coast-rental-mgmt', 'STR management across Galveston and the Bolivar Peninsula',
  'Texas Gulf Coast Rental Management offers comprehensive vacation rental management for property owners across Galveston and Crystal Beach. Our team maximizes revenue through dynamic pricing and multi-platform listing management.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 132 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth Beach STR Management', 'rehoboth-beach-str-management', 'Delaware beach vacation rental management',
  'Rehoboth Beach STR Management provides comprehensive property management for vacation rental owners across Rehoboth Beach, Dewey Beach, and Bethany Beach. We maximize Delaware''s loyal seasonal rental market for our owners.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Beaches Rental Co', 'delaware-beaches-rental-co', 'STR management across the Delaware coastal communities',
  'Delaware Beaches Rental Co offers full-service vacation rental management for property owners across Rehoboth, Dewey, and Bethany Beach. Our local expertise and guest-first approach drive strong reviews and returning visitors.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.8, 108 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Management', 'south-padre-str-management', 'Texas island vacation rental management',
  'South Padre STR Management provides full-service property management for vacation rental owners on South Padre Island. We specialize in maximizing spring break revenue while maintaining year-round occupancy through diverse market segments.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island Rental Partners', 'padre-island-rental-partners', 'STR management across South Padre Island',
  'Padre Island Rental Partners offers comprehensive vacation rental management for property owners on South Padre Island. Our team handles listings, guest services, maintenance, and financial reporting for the full STR operation.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.8, 124 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Luxury Rental Management', 'thirty-a-luxury-rental-management', 'Premium STR management along Scenic Highway 30A',
  '30A Luxury Rental Management provides premium property management for vacation rental owners along Scenic Highway 30A. We specialize in the high-end Seaside, Rosemary Beach, and Alys Beach communities with luxury-level guest services.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Walton County Vacation Rentals', 'walton-county-vacation-rentals', 'STR management across the 30A corridor',
  'Walton County Vacation Rentals offers full-service property management for vacation rental owners along the 30A corridor and South Walton County. Our revenue management approach consistently achieves top performance in Florida''s most competitive beach market.',
  c.id, 'Rosemary Beach', 'FL', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Management', 'breckenridge-str-management', 'Summit County ski vacation rental management',
  'Breckenridge STR Management provides full-service property management for vacation rental owners throughout Breckenridge and Summit County. We maximize ski season revenue while building year-round occupancy through summer mountain recreation marketing.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit Mountain Rentals Co', 'summit-mountain-rentals-co', 'STR management across the Breckenridge ski area',
  'Summit Mountain Rentals Co offers comprehensive vacation rental management for property owners across Breckenridge, Frisco, and Keystone. Our local team handles the unique operational demands of Colorado mountain ski properties.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.8, 176 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley Rental Management', 'vail-valley-rental-management', 'Luxury ski resort STR management in Vail',
  'Vail Valley Rental Management provides premium property management for vacation rental owners across Vail and Beaver Creek. We deliver the white-glove service and operational excellence that guests and owners in this world-class resort expect.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle Valley Property Partners', 'eagle-valley-property-partners', 'STR management across Vail and the Eagle Valley',
  'Eagle Valley Property Partners offers full-service vacation rental management for property owners throughout the Vail Valley. Our revenue-focused approach and luxury service standards help owners maximize returns in one of Colorado''s top ski markets.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 134 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen Snowmass Rental Mgmt', 'aspen-snowmass-rental-mgmt', 'Ultra-luxury vacation rental management in Aspen',
  'Aspen Snowmass Rental Management provides premier property management for vacation rental owners in Aspen and Snowmass Village. We offer truly white-glove service tailored to the extraordinary demands of America''s most glamorous ski resort market.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 154 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Property Group', 'roaring-fork-property-group', 'STR management across Aspen and Snowmass',
  'Roaring Fork Property Group offers comprehensive vacation rental management for property owners throughout Aspen and the Roaring Fork Valley. Our team delivers the operational precision and guest service quality that Aspen owners expect.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.8, 112 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat Vacation Rental Mgmt', 'steamboat-vacation-rental-mgmt', 'Ski Town USA STR management in Steamboat Springs',
  'Steamboat Vacation Rental Management provides full-service property management for vacation rental owners throughout Steamboat Springs. We maximize ski season performance while capturing the growing summer mountain recreation market.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Property Partners', 'yampa-valley-property-partners', 'STR management across Steamboat Springs',
  'Yampa Valley Property Partners offers comprehensive vacation rental management for property owners in Steamboat Springs. Our deep local roots and operational expertise help owners navigate the unique demands of Colorado''s most authentic ski town.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride Mountain Rental Mgmt', 'telluride-mountain-rental-mgmt', 'Exclusive vacation rental management in Telluride',
  'Telluride Mountain Rental Management provides premium property management for vacation rental owners in Telluride and Mountain Village. We combine deep local expertise with luxury service standards to maximize performance in this exclusive Colorado resort.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 124 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Mountain Property Co', 'san-juan-mountain-property-co', 'STR management across Telluride and Mountain Village',
  'San Juan Mountain Property Co offers full-service vacation rental management for property owners throughout Telluride. Our team handles ski season, festival periods, and summer operations with the attention to detail Telluride guests demand.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 94 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole Vacation Rental Mgmt', 'jackson-hole-vacation-rental-mgmt', 'Wyoming mountain STR management in Jackson Hole',
  'Jackson Hole Vacation Rental Management provides comprehensive property management for vacation rental owners throughout Jackson Hole and Teton Village. We excel at maximizing ski season, summer National Park, and fall revenue.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Valley Property Partners', 'teton-valley-property-partners', 'STR management across Jackson Hole',
  'Teton Valley Property Partners offers full-service vacation rental management for property owners throughout Jackson Hole. Our local expertise and luxury service approach help owners achieve exceptional returns in one of America''s premier mountain destinations.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky Resort Rental Mgmt', 'big-sky-resort-rental-mgmt', 'Montana mountain STR management at Big Sky',
  'Big Sky Resort Rental Management provides full-service property management for vacation rental owners throughout Big Sky and the Gallatin Valley. We maximize revenue across North America''s largest ski resort''s strong multi-season demand.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Montana Mountain Property Co', 'montana-mountain-property-co', 'STR management across Big Sky and Bozeman area',
  'Montana Mountain Property Co offers comprehensive vacation rental management for property owners throughout Big Sky and the greater Bozeman area. Our team handles the year-round operational demands of Montana''s fastest-growing resort market.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.8, 132 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley Vacation Rental Mgmt', 'sun-valley-vacation-rental-mgmt', 'Idaho ski resort STR management in Sun Valley',
  'Sun Valley Vacation Rental Management provides premium property management for vacation rental owners throughout Sun Valley and Ketchum. We deliver the high-touch service and revenue optimization that Idaho''s most exclusive resort market demands.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 154 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Blaine County Property Partners', 'blaine-county-property-partners', 'STR management across Sun Valley and Ketchum',
  'Blaine County Property Partners offers full-service vacation rental management for property owners across Sun Valley and Ketchum. Our local team maximizes revenue while providing the genuine Idaho mountain hospitality guests seek.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth Lakes STR Management', 'mammoth-lakes-str-management', 'Eastern Sierra vacation rental management at Mammoth',
  'Mammoth Lakes STR Management provides comprehensive property management for vacation rental owners throughout Mammoth Lakes. We maximize ski season revenue while capturing the rapidly growing summer mountain recreation demand.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra Property Group', 'eastern-sierra-property-group', 'STR management across Mammoth Lakes and June Lake',
  'Eastern Sierra Property Group offers full-service vacation rental management for property owners in Mammoth Lakes and June Lake. Our team navigates the Eastern Sierra''s unique four-season demand patterns to maximize owner returns.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear Vacation Rental Mgmt', 'big-bear-vacation-rental-mgmt', 'SoCal mountain STR management at Big Bear',
  'Big Bear Vacation Rental Management provides full-service property management for vacation rental owners throughout Big Bear Lake. We specialize in the weekend-driven Southern California mountain market and maximize your annual revenue.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Bernardino Mountain Rentals', 'san-bernardino-mountain-rentals', 'STR management across Big Bear and Lake Arrowhead',
  'San Bernardino Mountain Rentals offers comprehensive vacation rental management for property owners across Big Bear and Lake Arrowhead. Our team maximizes the intense LA-weekend demand while building midweek and holiday occupancy.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend Oregon STR Management', 'bend-oregon-str-management', 'Central Oregon vacation rental management',
  'Bend Oregon STR Management provides comprehensive property management for vacation rental owners throughout Bend, Sunriver, and Sisters. We maximize year-round performance across ski, summer, fall, and spring recreation seasons.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Property Co', 'central-oregon-property-co', 'STR management across Bend and Sunriver',
  'Central Oregon Property Co offers full-service vacation rental management for property owners in Bend and Sunriver. Our team leverages the area''s exceptional year-round outdoor recreation demand to achieve strong consistent occupancy.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Management Co', 'whitefish-str-management-co', 'Montana Glacier Country vacation rental management',
  'Whitefish STR Management Co provides full-service property management for vacation rental owners throughout Whitefish and the Flathead Valley. We maximize ski season and Glacier National Park summer revenue with year-round expert management.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley Property Group', 'flathead-valley-property-group', 'STR management across Whitefish and the Flathead Valley',
  'Flathead Valley Property Group offers comprehensive vacation rental management for property owners throughout Whitefish, Kalispell, and the Glacier Country region. Our team handles the unique seasonal patterns of Montana''s premier mountain resort market.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 124 from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- MAINTENANCE & REPAIRS
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Maintenance', 'gulf-shores-str-maintenance', 'Vacation rental maintenance across the AL Gulf Coast',
  'Gulf Shores STR Maintenance provides responsive maintenance and repair services for vacation rental properties across Gulf Shores and Orange Beach. We handle HVAC, plumbing, electrical, and general repairs with fast response times.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Beach Property Services', 'alabama-beach-property-services', 'STR repair and maintenance on the Alabama coast',
  'Alabama Beach Property Services offers comprehensive maintenance and handyman services for vacation rental owners across the Alabama Gulf Coast. Our licensed technicians handle all property repairs with STR-priority scheduling.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Maintenance Group', 'pcb-str-maintenance-group', 'Panama City Beach vacation rental maintenance services',
  'PCB STR Maintenance Group provides fast, reliable maintenance and repair services for vacation rental properties across Panama City Beach. We prioritize STR clients with rapid response to minimize revenue-disrupting downtime.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Property Services', 'emerald-coast-property-services', 'STR repair and handyman services in PCB',
  'Emerald Coast Property Services handles vacation rental maintenance and repairs for property owners throughout Panama City Beach. From appliance fixes to HVAC service and storm damage repair, we keep STR properties guest-ready.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 154 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Property Services', 'naples-str-property-services', 'Southwest Florida vacation rental maintenance',
  'Naples STR Property Services provides comprehensive maintenance and repair services for luxury vacation rentals across Naples, Marco Island, and Bonita Springs. We handle preventive maintenance and emergency repairs for high-end properties.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southwest Florida Repair Team', 'southwest-florida-repair-team', 'STR maintenance across Naples and Marco Island',
  'Southwest Florida Repair Team offers responsive vacation rental maintenance for property owners across the Naples area. Our licensed contractors handle plumbing, HVAC, electrical, and general repairs with STR-priority scheduling.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 98 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Property Care', 'anna-maria-island-property-care', 'Gulf island vacation rental maintenance services',
  'Anna Maria Island Property Care provides reliable maintenance and repair services for vacation rental owners across Anna Maria Island and the Sarasota Gulf Coast. We handle the salt-air challenges of island property ownership.',
  c.id, 'Anna Maria', 'FL', p.id, true, true, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island Repair Services', 'gulf-island-repair-services', 'STR maintenance across AMI and Siesta Key',
  'Gulf Island Repair Services offers comprehensive vacation rental maintenance for property owners across Anna Maria Island, Longboat Key, and Siesta Key. Our team understands coastal property challenges and provides reliable island-based service.',
  c.id, 'Holmes Beach', 'FL', p.id, true, false, 4.8, 108 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Property Services', 'cape-cod-str-property-services', 'New England vacation rental maintenance and repairs',
  'Cape Cod STR Property Services provides responsive maintenance and repair services for vacation rental owners throughout the Cape Cod peninsula. We specialize in Cape Cod''s aging housing stock and seasonal property challenges.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.8, 223 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Handyman Services', 'cape-handyman-services', 'STR repair and maintenance across Cape Cod',
  'Cape Handyman Services handles vacation rental maintenance and repairs for property owners across Cape Cod. From winter weatherization to in-season emergency repairs, we keep Cape Cod vacation rentals in peak guest-ready condition.',
  c.id, 'Falmouth', 'MA', p.id, true, false, 4.7, 178 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Property Care', 'hamptons-str-property-care', 'Premium vacation rental maintenance in the Hamptons',
  'Hamptons STR Property Care provides premium maintenance and repair services for vacation rental properties across the Hamptons. We handle luxury estate maintenance with the discretion and quality that high-end Hamptons properties require.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Property Services NY', 'east-end-property-services-ny', 'STR maintenance across the Hamptons and Montauk',
  'East End Property Services provides comprehensive vacation rental maintenance for property owners throughout the Hamptons. Our licensed contractors handle all repairs from routine maintenance to storm damage restoration at luxury estate properties.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.7, 118 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Property Care', 'jersey-shore-str-property-care', 'NJ beach vacation rental maintenance services',
  'Jersey Shore STR Property Care provides responsive maintenance and repair services for vacation rental owners across the New Jersey coast. We specialize in coastal property challenges including salt damage, flood repair, and seasonal maintenance.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore Repair Services NJ', 'shore-repair-services-nj', 'STR maintenance across the New Jersey Shore',
  'Shore Repair Services NJ handles vacation rental maintenance and repairs for property owners from Asbury Park to Wildwood. Our team provides rapid response to keep Shore properties guest-ready through the intense summer season.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Repairs', 'ocean-city-md-str-repairs', 'Maryland beach vacation rental maintenance',
  'Ocean City MD STR Repairs provides maintenance and repair services for vacation rental owners across Ocean City and the Delaware beaches. We handle the unique demands of oceanfront property maintenance with fast STR-priority response.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva Property Services', 'delmarva-property-services', 'STR maintenance across Maryland and Delaware beaches',
  'Delmarva Property Services offers comprehensive vacation rental maintenance for property owners across the Ocean City and Delaware beaches area. Our licensed technicians provide reliable repairs that minimize downtime during the peak rental season.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.7, 124 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Property Care', 'galveston-str-property-care', 'Texas island vacation rental maintenance services',
  'Galveston STR Property Care provides responsive maintenance and repair services for vacation rental owners across Galveston Island. We specialize in Gulf Coast property challenges including hurricane preparation, flood remediation, and coastal maintenance.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Texas Gulf Coast Repair Team', 'texas-gulf-coast-repair-team', 'STR maintenance across Galveston and Crystal Beach',
  'Texas Gulf Coast Repair Team handles vacation rental maintenance for property owners across Galveston and the Bolivar Peninsula. Our crews provide reliable repairs with the coastal property expertise that Gulf of Mexico locations demand.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Property Services', 'rehoboth-str-property-services', 'Delaware beach vacation rental maintenance',
  'Rehoboth STR Property Services provides maintenance and repair services for vacation rental owners across Rehoboth Beach and the Delaware beaches. We handle seasonal property preparation, in-season repairs, and winterization services.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 132 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Beaches Repair Co', 'delaware-beaches-repair-co', 'STR maintenance across Rehoboth and Bethany Beach',
  'Delaware Beaches Repair Co offers vacation rental maintenance services for property owners across the Delaware beaches. Our local technicians provide fast response and reliable repairs throughout the summer rental season.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 98 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Maintenance', 'south-padre-str-maintenance', 'Texas island vacation rental maintenance services',
  'South Padre STR Maintenance provides responsive maintenance and repair services for vacation rental owners on South Padre Island. We handle coastal property challenges, appliance repairs, and emergency services with fast STR-priority response.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island Property Services TX', 'island-property-services-tx', 'STR repair and maintenance on South Padre Island',
  'Island Property Services TX offers comprehensive vacation rental maintenance for property owners on South Padre Island. Our team handles the unique demands of barrier island property maintenance with reliable, licensed service.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.7, 107 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Property Services', 'thirty-a-str-property-services', 'Scenic 30A vacation rental maintenance and repairs',
  '30A STR Property Services provides premium maintenance and repair services for vacation rental properties along Scenic Highway 30A. We maintain the high standards required by the upscale Seaside and Rosemary Beach communities.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Walton County Property Care', 'walton-county-property-care', 'STR maintenance across the 30A corridor',
  'Walton County Property Care handles vacation rental maintenance for property owners throughout the 30A corridor and South Walton County. We provide preventive maintenance programs and rapid emergency response across all 30A communities.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 134 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Property Care', 'breckenridge-str-property-care', 'Summit County ski vacation rental maintenance',
  'Breckenridge STR Property Care provides maintenance and repair services for vacation rental owners throughout Breckenridge and Summit County. We specialize in mountain property challenges including snow removal, heating systems, and hot tub maintenance.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County Repair Services', 'summit-county-repair-services', 'STR maintenance across the Breckenridge ski area',
  'Summit County Repair Services handles vacation rental maintenance for property owners across Breckenridge, Frisco, and Keystone. Our mountain-experienced technicians manage ski property systems through the demands of Colorado winters.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 154 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Maintenance', 'vail-valley-str-maintenance', 'Luxury ski resort vacation rental maintenance in Vail',
  'Vail Valley STR Maintenance provides premium maintenance and repair services for vacation rental properties across Vail and Beaver Creek. We maintain luxury mountain properties to the exacting standards that Vail''s high-end market demands.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle Valley Property Care', 'eagle-valley-property-care', 'STR repairs across Vail and Beaver Creek',
  'Eagle Valley Property Care offers comprehensive vacation rental maintenance for property owners throughout the Vail Valley. Our licensed technicians handle all mechanical and structural repairs with fast turnaround on STR-critical issues.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 118 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Property Services', 'aspen-str-property-services', 'Ultra-luxury vacation rental maintenance in Aspen',
  'Aspen STR Property Services provides premium maintenance and repair services for vacation rental owners in Aspen and Snowmass Village. We maintain ultra-luxury mountain properties with the precision and discretion the Aspen market requires.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.8, 132 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Repair Group', 'roaring-fork-repair-group', 'STR maintenance across Aspen and Snowmass',
  'Roaring Fork Repair Group handles vacation rental maintenance and repairs for property owners throughout Aspen and the Roaring Fork Valley. Our experienced technicians manage high-value mountain properties to luxury standards.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 98 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Property Care', 'steamboat-str-property-care', 'Colorado mountain vacation rental maintenance',
  'Steamboat STR Property Care provides responsive maintenance and repair services for vacation rental owners throughout Steamboat Springs. We specialize in mountain property systems and handle emergency repairs with priority STR scheduling.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Repair Services', 'yampa-valley-repair-services', 'STR maintenance across Steamboat Springs',
  'Yampa Valley Repair Services handles vacation rental maintenance for property owners in Steamboat Springs. Our licensed technicians provide reliable repairs for mountain cabins, ski condos, and luxury mountain homes throughout the Yampa Valley.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 124 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Maintenance', 'telluride-str-maintenance', 'Mountain resort vacation rental maintenance in Telluride',
  'Telluride STR Maintenance provides maintenance and repair services for vacation rental owners in Telluride and Mountain Village. We handle the unique demands of high-altitude mountain property maintenance in this remote Colorado resort.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.8, 112 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Mountain Repair Co', 'san-juan-mountain-repair-co', 'STR property care across Telluride and Mountain Village',
  'San Juan Mountain Repair Co offers vacation rental maintenance for property owners in Telluride and Mountain Village. Our team manages the logistical challenges of maintaining properties in Colorado''s most remote premium resort market.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 84 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Property Care', 'jackson-hole-str-property-care', 'Wyoming mountain vacation rental maintenance',
  'Jackson Hole STR Property Care provides responsive maintenance and repair services for vacation rental owners throughout Jackson Hole and Teton Village. We handle luxury mountain property maintenance with fast response in all seasons.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.8, 187 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Village Property Services', 'teton-village-property-services', 'STR maintenance across Jackson Hole',
  'Teton Village Property Services handles vacation rental maintenance for property owners throughout Jackson Hole. Our licensed technicians specialize in mountain resort property systems and emergency repairs during busy ski and summer seasons.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Maintenance Co', 'big-sky-str-maintenance-co', 'Montana mountain vacation rental maintenance',
  'Big Sky STR Maintenance Co provides maintenance and repair services for vacation rental owners throughout Big Sky Resort and the Gallatin Valley. We handle Montana mountain property systems with reliable, year-round service.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley Property Care', 'gallatin-valley-property-care', 'STR maintenance across Big Sky and Bozeman area',
  'Gallatin Valley Property Care offers vacation rental maintenance for property owners throughout the Big Sky area. Our experienced team handles the full range of Montana mountain property maintenance with reliable response across all seasons.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Property Care', 'sun-valley-str-property-care', 'Idaho ski resort vacation rental maintenance',
  'Sun Valley STR Property Care provides premium maintenance and repair services for vacation rental properties across Sun Valley and Ketchum. We maintain Idaho''s legendary ski resort properties to the standards that Sun Valley guests expect.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River Property Services', 'wood-river-property-services', 'STR maintenance across Sun Valley and Ketchum',
  'Wood River Property Services handles vacation rental maintenance for property owners across Sun Valley, Ketchum, and Hailey. Our local team provides fast response and reliable repairs for the Wood River Valley''s premier STR properties.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 107 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth Lakes STR Maintenance', 'mammoth-lakes-str-maintenance', 'Eastern Sierra mountain vacation rental maintenance',
  'Mammoth Lakes STR Maintenance provides maintenance and repair services for vacation rental owners throughout Mammoth Lakes. We specialize in high-altitude property systems and the unique maintenance demands of California''s premier ski resort.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra Property Care', 'eastern-sierra-property-care', 'STR maintenance across Mammoth Lakes and June Lake',
  'Eastern Sierra Property Care offers vacation rental maintenance for property owners in Mammoth Lakes and the June Lake Loop. Our team handles mountain property systems year-round with reliable scheduling and emergency response.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 143 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Property Care', 'big-bear-str-property-care', 'SoCal mountain vacation rental maintenance',
  'Big Bear STR Property Care provides responsive maintenance and repair services for vacation rental owners across Big Bear Lake. We specialize in Southern California mountain property systems with weekend-priority service for LA-market STRs.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 234 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SoCal Mountain Repair Co', 'socal-mountain-repair-co', 'STR maintenance across Big Bear and Lake Arrowhead',
  'SoCal Mountain Repair Co handles vacation rental maintenance for property owners across Big Bear and Lake Arrowhead. Our team provides fast-response repairs optimized for the intense weekend demand of Southern California mountain STRs.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 187 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Property Services', 'bend-str-property-services', 'Oregon outdoor adventure vacation rental maintenance',
  'Bend STR Property Services provides maintenance and repair services for vacation rental owners throughout Bend, Sunriver, and Central Oregon. We handle year-round mountain property systems with reliable, licensed STR-priority service.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.8, 212 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Property Care', 'central-oregon-property-care', 'STR maintenance across Bend and Sunriver',
  'Central Oregon Property Care offers vacation rental maintenance for property owners throughout Bend and Sunriver. Our licensed technicians provide reliable repairs for high-desert mountain properties across all four seasons of Central Oregon.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 167 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Property Care', 'whitefish-str-property-care', 'Montana Glacier Country vacation rental maintenance',
  'Whitefish STR Property Care provides maintenance and repair services for vacation rental owners throughout Whitefish and the Flathead Valley. We handle Montana mountain property systems with reliable year-round service including harsh-winter repairs.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley Repair Services', 'flathead-valley-repair-services', 'STR maintenance across Whitefish and Kalispell',
  'Flathead Valley Repair Services handles vacation rental maintenance for property owners throughout Whitefish, Kalispell, and Columbia Falls. Our team provides reliable property care for Glacier Country''s fast-growing vacation rental market.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;
