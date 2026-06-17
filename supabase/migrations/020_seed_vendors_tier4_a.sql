-- ============================================================
-- Migration 020 — Tier 4 Vendors A
-- Cleaning & Turnover + Photography & Design (48 vendors each)
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- CLEANING & TURNOVER
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Cleaning', 'gulf-shores-str-cleaning', 'Alabama Gulf Coast vacation rental turnovers',
  'Gulf Shores STR Cleaning provides professional vacation rental turnover services across Gulf Shores and Orange Beach. We specialize in beachfront condo and beach house cleanings with same-day scheduling, linen service, and damage reporting.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 203 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Orange Beach Turnover Pros', 'orange-beach-turnover-pros', 'Reliable STR cleaning across the AL Gulf Coast',
  'Orange Beach Turnover Pros serves vacation rental owners from Gulf Shores to Perdido Key with dependable turnover cleaning. Our teams handle beachfront high-rises, canal-front homes, and cottage communities with full supply restocking.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.8, 156 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Cleaning Co', 'pcb-str-cleaning-co', 'Panama City Beach vacation rental turnover experts',
  'PCB STR Cleaning Co delivers fast, reliable turnovers for vacation rental owners across Panama City Beach. We handle everything from beachfront towers to Gulf-view condos and cottage communities with photo-verified checklists.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 278 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Turnover Team', 'emerald-coast-turnover-team', 'Professional STR cleaning in Panama City Beach',
  'Emerald Coast Turnover Team specializes in same-day vacation rental turnovers for high-volume STR properties in Panama City Beach. Our experienced crews deliver guest-ready properties with full linen service and restocking.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.8, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Cleaning Group', 'naples-str-cleaning-group', 'Southwest Florida luxury vacation rental cleaning',
  'Naples STR Cleaning Group provides premium turnover cleaning for vacation rental owners across Naples, Marco Island, and Bonita Springs. We specialize in luxury properties and high-end condos with white-glove cleaning standards.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Marco Island Turnover Pros', 'marco-island-turnover-pros', 'STR cleaning across Naples and Marco Island',
  'Marco Island Turnover Pros serves vacation rental owners across the greater Naples area with reliable, high-quality turnover cleaning. From Sanibel cottages to Naples Beach high-rises, we deliver consistently excellent results.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 124 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria Island Cleaning Co', 'anna-maria-island-cleaning-co', 'Old Florida STR turnover specialists',
  'Anna Maria Island Cleaning Co provides expert vacation rental turnover cleaning across Anna Maria Island, Holmes Beach, and Bradenton Beach. We understand the Old Florida character of the island and clean to the standards guests expect.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Siesta Key Turnover Team', 'siesta-key-turnover-team', 'Gulf Coast STR cleaning from AMI to Siesta Key',
  'Siesta Key Turnover Team covers vacation rental turnovers across Anna Maria Island, Longboat Key, and Siesta Key. Our crews specialize in island properties with tight turnaround windows and comprehensive linen service.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Cleaning Co', 'cape-cod-str-cleaning-co', 'New England vacation rental turnover specialists',
  'Cape Cod STR Cleaning Co provides professional vacation rental cleaning throughout the Cape Cod peninsula. From Falmouth to Provincetown, we handle summer-season high-volume turnovers with reliable scheduling and photo checklists.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape Turnover Pros', 'lower-cape-turnover-pros', 'Reliable STR cleaning across Cape Cod',
  'Lower Cape Turnover Pros serves vacation rental owners from Sandwich to Provincetown with dependable turnover cleaning. We specialize in the Cape''s challenging seasonal volume and tight Saturday turnaround schedules.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.8, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Cleaning Group', 'hamptons-str-cleaning-group', 'Premium vacation rental cleaning in the Hamptons',
  'Hamptons STR Cleaning Group provides white-glove turnover cleaning for high-end vacation rental properties across Southampton, East Hampton, and Montauk. We meet the exacting standards that Hamptons guests and owners demand.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 187 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Turnover Pros', 'east-end-turnover-pros', 'Luxury STR cleaning across the Hamptons',
  'East End Turnover Pros specializes in premium vacation rental turnovers across the Hamptons. From Montauk oceanfront estates to Sag Harbor harbor homes, we deliver the meticulous cleaning quality that high-end Hamptons rentals require.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 142 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Cleaning', 'jersey-shore-str-cleaning', 'NJ beachfront vacation rental turnover services',
  'Jersey Shore STR Cleaning provides professional vacation rental turnovers across the New Jersey coast from Long Beach Island to Cape May. We specialize in the demanding Saturday turnover rush that defines the Jersey Shore rental season.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore Turnover Team NJ', 'shore-turnover-team-nj', 'Reliable STR cleaning along the Jersey Shore',
  'Shore Turnover Team NJ covers vacation rental cleaning from Asbury Park to Wildwood. Our crews are trained for the logistical demands of beach town STR operations — fast, reliable, and photo-verified every time.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Cleaning', 'ocean-city-md-str-cleaning', 'Maryland beach resort vacation rental turnovers',
  'Ocean City MD STR Cleaning delivers professional turnover cleaning for vacation rental owners across Ocean City and the surrounding Delaware beaches. We handle everything from oceanfront high-rises to quiet bayside cottages.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva Turnover Pros', 'delmarva-turnover-pros', 'STR cleaning across the Maryland and Delaware beaches',
  'Delmarva Turnover Pros serves vacation rental owners across Ocean City, Bethany Beach, and Rehoboth with reliable, photo-documented turnovers. We specialize in the high-volume summer season that defines Mid-Atlantic beach STR operations.',
  c.id, 'Ocean City', 'MD', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Cleaning Co', 'galveston-str-cleaning-co', 'Texas island vacation rental turnover specialists',
  'Galveston STR Cleaning Co provides professional vacation rental turnovers across Galveston Island, Jamaica Beach, and Crystal Beach. We specialize in Texas Gulf Coast beach properties with reliable same-day scheduling.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bolivar Peninsula Turnover Team', 'bolivar-peninsula-turnover-team', 'Galveston and Crystal Beach STR cleaning',
  'Bolivar Peninsula Turnover Team serves vacation rental owners across Galveston and the Bolivar Peninsula with dependable turnover cleaning. Our teams handle beach houses, canal properties, and bay-front cottages with full supply restocking.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 134 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Cleaning Group', 'rehoboth-str-cleaning-group', 'Delaware beach vacation rental turnover services',
  'Rehoboth STR Cleaning Group provides professional turnover cleaning for vacation rental owners across Rehoboth Beach, Dewey Beach, and Bethany Beach. We specialize in Delaware''s loyal seasonal rental market.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.9, 156 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Beaches Turnover Pros', 'delaware-beaches-turnover-pros', 'Reliable STR cleaning across Rehoboth and Bethany Beach',
  'Delaware Beaches Turnover Pros covers vacation rental turnovers from Lewes to Fenwick Island. Our crews deliver consistent, photo-verified cleanings with linen service and supply restocking for the full Mid-Atlantic beach season.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.8, 118 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Cleaning', 'south-padre-str-cleaning', 'Texas island beach vacation rental turnovers',
  'South Padre STR Cleaning provides professional turnover cleaning for vacation rental owners across South Padre Island and Mustang Island. We specialize in the spring break surge and summer family season that drive South Padre''s STR market.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mustang Island Turnover Team', 'mustang-island-turnover-team', 'STR cleaning across South Padre and Port Aransas',
  'Mustang Island Turnover Team serves vacation rental owners across South Padre Island and Port Aransas with reliable, same-day turnovers. Our crews handle beach cottages, condos, and waterfront homes with full linen service.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.8, 132 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Cleaning Co', 'thirty-a-str-cleaning-co', 'Scenic Highway 30A vacation rental turnover specialists',
  '30A STR Cleaning Co provides premium vacation rental turnovers along Scenic Highway 30A. We serve Seaside, Rosemary Beach, Alys Beach, and WaterColor with the meticulous cleaning standards these architecturally distinguished communities demand.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 243 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rosemary Beach Turnover Pros', 'rosemary-beach-turnover-pros', 'Luxury STR cleaning along Florida''s 30A corridor',
  'Rosemary Beach Turnover Pros serves premium vacation rental properties across the 30A corridor from Inlet Beach to Blue Mountain Beach. We deliver the white-glove cleaning quality that 30A''s high-end rental market demands.',
  c.id, 'Rosemary Beach', 'FL', p.id, true, false, 4.8, 176 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Cleaning', 'breckenridge-str-cleaning', 'Summit County ski vacation rental turnover services',
  'Breckenridge STR Cleaning provides professional vacation rental turnovers for ski properties throughout Breckenridge, Frisco, and Keystone. We specialize in mountain property cleaning with winter scheduling and full linen service.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 256 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County Turnover Pros', 'summit-county-turnover-pros', 'Reliable STR cleaning across the I-70 ski corridor',
  'Summit County Turnover Pros covers vacation rental turnovers across Breckenridge, Dillon, Silverthorne, and Copper Mountain. Our crews are experienced with ski season scheduling challenges and mountain property logistics.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail STR Cleaning Group', 'vail-str-cleaning-group', 'Premium ski resort vacation rental cleaning in Vail',
  'Vail STR Cleaning Group provides white-glove turnover cleaning for vacation rental properties across Vail Village, Lionshead, and Beaver Creek. We meet the exacting luxury standards that Vail''s premium rental market demands.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle Valley Turnover Pros', 'eagle-valley-turnover-pros', 'STR cleaning across Vail and Beaver Creek',
  'Eagle Valley Turnover Pros serves luxury vacation rental owners throughout the Vail Valley and Beaver Creek with premium turnover services. Our teams are trained to handle high-value mountain properties with discretion and care.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Cleaning Co', 'aspen-str-cleaning-co', 'World-class vacation rental cleaning in Aspen and Snowmass',
  'Aspen STR Cleaning Co provides premier vacation rental turnover services throughout Aspen and Snowmass Village. We specialize in ultra-luxury mountain properties, delivering the impeccable cleaning standards that Aspen guests expect.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 154 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Turnover Team', 'roaring-fork-turnover-team', 'Luxury STR cleaning across Aspen and Basalt',
  'Roaring Fork Turnover Team serves high-end vacation rental properties throughout the Aspen area and Roaring Fork Valley. From Aspen ski condos to Carbondale ranch estates, we deliver white-glove turnover service.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 112 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Cleaning', 'steamboat-str-cleaning', 'Ski Town USA vacation rental turnover services',
  'Steamboat STR Cleaning provides professional vacation rental turnovers throughout Steamboat Springs and the Yampa Valley. We specialize in mountain cabin and ski condo cleanings with reliable scheduling through ski season.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Turnover Pros', 'yampa-valley-turnover-pros', 'Reliable STR cleaning in Steamboat Springs',
  'Yampa Valley Turnover Pros covers vacation rental turnovers across Steamboat Springs and surrounding mountain communities. Our crews deliver consistent, photo-verified cleanings with full linen service for ski season and summer.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.8, 147 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Cleaning', 'telluride-str-cleaning', 'Mountain resort vacation rental cleaning in Telluride',
  'Telluride STR Cleaning provides premium turnover services for vacation rental properties throughout Telluride and Mountain Village. We specialize in the logistics of box canyon property cleaning and luxury mountain rental standards.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 132 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Mountain Turnover Co', 'san-juan-mountain-turnover-co', 'STR cleaning across Telluride and Mountain Village',
  'San Juan Mountain Turnover Co serves vacation rental owners throughout Telluride and Mountain Village with professional turnover cleaning. Our teams are experienced with the unique scheduling demands of Telluride''s festival and ski seasons.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.8, 98 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Cleaning', 'jackson-hole-str-cleaning', 'Wyoming mountain vacation rental turnover services',
  'Jackson Hole STR Cleaning provides professional vacation rental turnovers throughout Jackson Hole and Teton Village. We specialize in luxury mountain properties with winter scheduling and full linen service year-round.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 223 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Village Turnover Pros', 'teton-village-turnover-pros', 'Luxury STR cleaning in Jackson Hole and Teton Village',
  'Teton Village Turnover Pros serves high-end vacation rental owners across Jackson Hole with premium turnover services. From ski-in/ski-out chalets to National Park gateway properties, we deliver white-glove cleaning quality.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Cleaning Co', 'big-sky-str-cleaning-co', 'Montana mountain resort vacation rental cleaning',
  'Big Sky STR Cleaning Co provides professional vacation rental turnovers throughout Big Sky Resort and the greater Gallatin Valley. We specialize in Montana mountain properties with full linen service and reliable ski-season scheduling.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley Turnover Pros', 'gallatin-valley-turnover-pros', 'STR cleaning across Big Sky and Bozeman area',
  'Gallatin Valley Turnover Pros covers vacation rental turnovers throughout the Big Sky area and greater Bozeman region. Our crews are experienced with Montana mountain property logistics and the demanding ski and summer seasons.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Cleaning', 'sun-valley-str-cleaning', 'Idaho ski resort vacation rental turnover services',
  'Sun Valley STR Cleaning provides premier vacation rental turnovers throughout Sun Valley and Ketchum. We serve Idaho''s most legendary ski resort community with the premium cleaning standards that Sun Valley''s discerning guests expect.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River Valley Turnover Team', 'wood-river-valley-turnover-team', 'STR cleaning across Sun Valley and Ketchum',
  'Wood River Valley Turnover Team serves vacation rental owners across Sun Valley, Ketchum, and Hailey with reliable turnover cleaning. Our crews deliver consistent quality through ski season and the busy summer recreation season.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.8, 124 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth Lakes STR Cleaning', 'mammoth-lakes-str-cleaning', 'Eastern Sierra vacation rental turnover specialists',
  'Mammoth Lakes STR Cleaning provides professional vacation rental turnovers throughout Mammoth Lakes and June Lake. We specialize in high-altitude mountain property cleaning with year-round scheduling across ski and summer seasons.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 234 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra Turnover Pros', 'eastern-sierra-turnover-pros', 'STR cleaning across Mammoth Lakes and June Lake',
  'Eastern Sierra Turnover Pros covers vacation rental turnovers throughout Mammoth Lakes and the Owens Valley. Our teams handle ski condos, cabin communities, and mountain homes with full linen service and reliable year-round scheduling.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.8, 178 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Cleaning Co', 'big-bear-str-cleaning-co', 'Southern California mountain vacation rental cleaning',
  'Big Bear STR Cleaning Co provides professional vacation rental turnovers throughout Big Bear Lake and Big Bear City. We specialize in the weekend rush that defines Southern California mountain STR operations, with same-day scheduling.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.9, 312 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Bernardino Mountain Turnover', 'san-bernardino-mountain-turnover', 'STR cleaning across Big Bear and Lake Arrowhead',
  'San Bernardino Mountain Turnover serves vacation rental owners across Big Bear Lake and Lake Arrowhead with reliable turnover cleaning. Our crews handle the high weekend volume that LA-feeder mountain markets demand.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.8, 243 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Cleaning Group', 'bend-str-cleaning-group', 'Oregon outdoor adventure vacation rental turnovers',
  'Bend STR Cleaning Group provides professional vacation rental turnovers throughout Bend, Sunriver, and Sisters. We specialize in Oregon mountain town properties with year-round scheduling across ski, summer, and shoulder seasons.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 267 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Turnover Team', 'central-oregon-turnover-team', 'STR cleaning across Bend and Sunriver',
  'Central Oregon Turnover Team covers vacation rental turnovers throughout the greater Bend area including Sunriver, Sisters, and Redmond. Our experienced crews deliver consistent, photo-verified cleanings with full linen and supply service.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.8, 198 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Cleaning Co', 'whitefish-str-cleaning-co', 'Montana Glacier Country vacation rental turnovers',
  'Whitefish STR Cleaning Co provides professional vacation rental turnovers throughout Whitefish, Kalispell, and the Flathead Valley. We specialize in Montana mountain properties with ski season and Glacier National Park summer scheduling.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley Turnover Pros', 'flathead-valley-turnover-pros', 'STR cleaning across Whitefish and Kalispell',
  'Flathead Valley Turnover Pros serves vacation rental owners across the Whitefish Mountain area and greater Flathead Valley. Our teams deliver reliable, thorough cleanings for ski chalets, lake cabins, and Glacier gateway properties.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- PHOTOGRAPHY & DESIGN
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Photography', 'gulf-shores-str-photography', 'Alabama Gulf Coast vacation rental photography',
  'Gulf Shores STR Photography provides professional vacation rental listing photography and design for property owners across Gulf Shores and Orange Beach. We specialize in capturing the beach lifestyle and Gulf views that drive bookings.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast Visual Media', 'alabama-coast-visual-media', 'STR listing photos and design on the AL Gulf Coast',
  'Alabama Coast Visual Media creates compelling listing photography and marketing content for vacation rental owners across the Alabama Gulf Coast. Our work highlights the area''s stunning emerald water and sugar-white sand.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.8, 98 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Photography Co', 'pcb-str-photography-co', 'Panama City Beach vacation rental listing photography',
  'PCB STR Photography Co delivers professional listing photography for vacation rental owners across Panama City Beach. We capture the Gulf''s brilliant emerald waters and the property features that drive booking decisions.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Photography Group', 'emerald-coast-photography-group', 'STR listing photos along Florida''s Emerald Coast',
  'Emerald Coast Photography Group provides vacation rental photography and virtual tours for property owners in Panama City Beach. We create visual content that showcases Gulf views, amenities, and the lifestyle guests are searching for.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Photography Studio', 'naples-str-photography-studio', 'Luxury SW Florida vacation rental photography',
  'Naples STR Photography Studio creates premium listing photography for luxury vacation rental properties across Naples, Marco Island, and Bonita Springs. Our work captures the refined Southwest Florida lifestyle that commands premium rates.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 112 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Southwest Florida Visual Group', 'southwest-florida-visual-group', 'STR photography across Naples and the Gulf Coast',
  'Southwest Florida Visual Group provides professional listing photography and design for vacation rental owners across the greater Naples area. We specialize in showcasing waterfront properties, luxury interiors, and outdoor living spaces.',
  c.id, 'Bonita Springs', 'FL', p.id, true, false, 4.7, 87 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria STR Photography', 'anna-maria-str-photography', 'Old Florida island vacation rental listing photography',
  'Anna Maria STR Photography creates beautiful listing photos for vacation rental owners across Anna Maria Island, Holmes Beach, and Siesta Key. We capture the charming Old Florida character that makes AMI properties so desirable.',
  c.id, 'Anna Maria', 'FL', p.id, true, true, 4.9, 123 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island Visual Media AMI', 'gulf-island-visual-media-ami', 'STR photography across the Sarasota Gulf islands',
  'Gulf Island Visual Media AMI provides professional vacation rental photography for property owners across Anna Maria Island, Longboat Key, and Siesta Key. We specialize in capturing Gulf sunsets, beach access, and island living.',
  c.id, 'Holmes Beach', 'FL', p.id, true, false, 4.8, 94 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Photography', 'cape-cod-str-photography', 'New England vacation rental listing photography',
  'Cape Cod STR Photography creates stunning listing photos for vacation rental owners across the Cape Cod peninsula. We capture the weathered shingles, shingled cottages, and classic New England coastal character that drives bookings.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Outer Cape Visual Studio', 'outer-cape-visual-studio', 'STR listing photography across Cape Cod',
  'Outer Cape Visual Studio provides professional vacation rental photography and virtual tours for property owners from Sandwich to Provincetown. We capture the authentic Cape Cod character that keeps guests coming back year after year.',
  c.id, 'Wellfleet', 'MA', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Photography Studio', 'hamptons-str-photography-studio', 'Premium Hamptons vacation rental listing photography',
  'Hamptons STR Photography Studio creates world-class listing photography for vacation rental properties across the Hamptons. We specialize in luxury estate photography that showcases pool decks, ocean views, and high-end interiors.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End Visual Group', 'east-end-visual-group', 'STR photography across the Hamptons and Montauk',
  'East End Visual Group provides premium vacation rental photography and design services for property owners across the Hamptons. We create imagery that reflects the aspirational lifestyle that brings guests to the East End.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 108 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Photography', 'jersey-shore-str-photography', 'NJ beach vacation rental listing photography',
  'Jersey Shore STR Photography provides professional listing photos for vacation rental owners across the New Jersey coast. We capture beach access, boardwalk proximity, and the beloved Jersey Shore atmosphere that drives seasonal bookings.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore Visual Media NJ', 'shore-visual-media-nj', 'STR photography along the New Jersey coast',
  'Shore Visual Media NJ creates compelling listing photography for vacation rental properties across the Jersey Shore. Our work highlights ocean proximity, outdoor living spaces, and the classic Jersey Shore character guests love.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 123 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Photography', 'ocean-city-md-str-photography', 'Maryland beach resort vacation rental photography',
  'Ocean City MD STR Photography provides professional listing photography for vacation rental owners across Ocean City and the Delaware beaches. We capture boardwalk views, ocean proximity, and the classic Mid-Atlantic beach resort atmosphere.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.9, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chesapeake Shore Visual Co', 'chesapeake-shore-visual-co', 'STR photography across Ocean City MD and Delaware',
  'Chesapeake Shore Visual Co serves vacation rental owners across Ocean City and the Delaware beaches with professional listing photography and virtual tours. We specialize in oceanfront and bayfront property imagery.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.8, 112 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Photography', 'galveston-str-photography', 'Texas Gulf Coast vacation rental listing photography',
  'Galveston STR Photography creates professional listing photos for vacation rental owners across Galveston Island and the Bolivar Peninsula. We capture Gulf views, beach access, and the historic Victorian character of Galveston properties.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Texas Gulf Visual Studio', 'texas-gulf-visual-studio', 'STR photography across Galveston and Crystal Beach',
  'Texas Gulf Visual Studio provides vacation rental photography and design for property owners across Galveston and Crystal Beach. We specialize in waterfront and Gulf-view properties that showcase the Texas Gulf Coast lifestyle.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 98 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Photography', 'rehoboth-str-photography', 'Delaware beach vacation rental listing photography',
  'Rehoboth STR Photography provides professional listing photos for vacation rental owners across Rehoboth Beach, Dewey Beach, and Bethany Beach. We capture Delaware''s beautiful beaches and the distinctive character of each community.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.9, 118 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Coast Visual Media', 'delaware-coast-visual-media', 'STR photography across the Delaware beaches',
  'Delaware Coast Visual Media creates compelling vacation rental listing photography for property owners across Rehoboth Beach, Fenwick Island, and Lewes. Our work showcases the quiet beauty of Delaware''s undiscovered coastal towns.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.8, 87 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Photography', 'south-padre-str-photography', 'Texas island vacation rental listing photography',
  'South Padre STR Photography provides professional listing photos for vacation rental owners on South Padre Island. We capture the Gulf''s clear waters, beach access, and the colorful Texas island atmosphere that drives bookings.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.9, 132 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Rio Grande Visual Co', 'lower-rio-grande-visual-co', 'STR photography across South Padre Island',
  'Lower Rio Grande Visual Co serves vacation rental owners across South Padre Island with professional listing photography and virtual tours. We specialize in beachfront condos, waterfront homes, and Gulf-view properties.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.7, 94 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Photography Studio', 'thirty-a-str-photography-studio', 'Premium Scenic 30A vacation rental listing photography',
  '30A STR Photography Studio creates world-class listing photography for vacation rental owners along Scenic Highway 30A. We specialize in the architecturally stunning properties of Seaside, Rosemary Beach, and Alys Beach.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 198 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Walton County Visual Arts', 'walton-county-visual-arts', 'STR photography along Florida''s 30A corridor',
  'Walton County Visual Arts provides premium vacation rental photography for property owners along 30A. Our imagery captures the dune lakes, New Urbanist architecture, and emerald waters that make 30A the most coveted stretch of Gulf Coast.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.8, 154 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Photography', 'breckenridge-str-photography', 'Summit County ski vacation rental photography',
  'Breckenridge STR Photography creates professional listing photos for vacation rental owners throughout Breckenridge and Summit County. We capture ski-in access, mountain views, and the charming Victorian Main Street atmosphere.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado Mountain Visual Co', 'colorado-mountain-visual-co', 'STR photography across the I-70 ski corridor',
  'Colorado Mountain Visual Co provides vacation rental photography across Breckenridge, Frisco, and Keystone. We specialize in ski property imagery — capturing mountain views, slope access, and the alpine character guests love.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail STR Photography Studio', 'vail-str-photography-studio', 'Luxury ski resort vacation rental photography in Vail',
  'Vail STR Photography Studio delivers premium listing photography for vacation rental properties across Vail and Beaver Creek. We capture the world-class mountain setting, luxury interiors, and resort amenities that justify Vail''s top-tier rates.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle Valley Visual Arts', 'eagle-valley-visual-arts', 'STR photography across Vail Valley and Beaver Creek',
  'Eagle Valley Visual Arts provides high-end vacation rental photography for property owners across the Vail Valley. Our work showcases the extraordinary alpine beauty and luxury mountain living that defines Vail''s premium rental market.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 108 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Photography Group', 'aspen-str-photography-group', 'World-class vacation rental photography in Aspen',
  'Aspen STR Photography Group creates exceptional listing photography for vacation rental owners in Aspen and Snowmass Village. We capture the extraordinary mountain scenery, ultra-luxury interiors, and aspirational lifestyle that defines the Aspen market.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 127 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork Visual Studio', 'roaring-fork-visual-studio', 'STR photography across Aspen and the Roaring Fork Valley',
  'Roaring Fork Visual Studio provides luxury vacation rental photography across Aspen and the Roaring Fork Valley. Our imagery meets the ultra-premium visual standards that Aspen''s discerning property owners and guests demand.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.8, 94 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Photography', 'steamboat-str-photography', 'Ski Town USA vacation rental listing photography',
  'Steamboat STR Photography creates professional listing photos for vacation rental owners throughout Steamboat Springs. We capture the authentic Western mountain character, champagne powder views, and outdoor adventure lifestyle that defines Steamboat.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.9, 156 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley Visual Media', 'yampa-valley-visual-media', 'STR photography across Steamboat Springs',
  'Yampa Valley Visual Media provides vacation rental photography and virtual tours for property owners in Steamboat Springs and the surrounding Yampa Valley. We showcase the mountain views and authentic Western character guests seek.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.8, 118 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Photography', 'telluride-str-photography', 'Box canyon mountain vacation rental photography',
  'Telluride STR Photography creates stunning listing photos for vacation rental owners in Telluride and Mountain Village. We capture the jaw-dropping box canyon scenery and Victorian mining town character that makes Telluride one-of-a-kind.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 109 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan Visual Arts Telluride', 'san-juan-visual-arts-telluride', 'STR photography across Telluride and Mountain Village',
  'San Juan Visual Arts provides premium vacation rental photography for properties throughout Telluride and Mountain Village. Our imagery captures the extraordinary 14,000-foot peaks, gondola access, and exclusive mountain character.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 82 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Photography', 'jackson-hole-str-photography', 'Wyoming mountain vacation rental listing photography',
  'Jackson Hole STR Photography creates world-class listing photos for vacation rental owners throughout Jackson Hole. We capture the awe-inspiring Grand Teton views, ski terrain, and mountain luxury that defines the Jackson Hole experience.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 178 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton Range Visual Studio', 'teton-range-visual-studio', 'STR photography across Jackson Hole and Teton Village',
  'Teton Range Visual Studio provides premium vacation rental photography across Jackson Hole and Teton Village. Our imagery showcases the iconic Grand Teton backdrop, luxury chalets, and the outdoor adventure lifestyle that commands premium rates.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.8, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Photography Co', 'big-sky-str-photography-co', 'Montana mountain resort vacation rental photography',
  'Big Sky STR Photography Co creates professional listing photos for vacation rental owners throughout Big Sky Resort and the Gallatin Valley. We capture Montana''s vast mountain landscapes and the luxury resort character of North America''s largest ski area.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.9, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Montana Big Sky Visual Group', 'montana-big-sky-visual-group', 'STR photography across Big Sky and the Gallatin Valley',
  'Montana Big Sky Visual Group provides vacation rental photography for property owners throughout the Big Sky area. We specialize in showcasing Montana''s dramatic mountain scenery, ski access, and the authentic Western wilderness experience.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.8, 107 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Photography', 'sun-valley-str-photography', 'Idaho ski resort vacation rental listing photography',
  'Sun Valley STR Photography delivers premium listing photography for vacation rental owners throughout Sun Valley and Ketchum. We capture Idaho''s legendary ski mountain, Wood River Valley beauty, and the timeless mountain town character.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 123 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River Visual Arts', 'wood-river-visual-arts', 'STR photography across Sun Valley and Ketchum',
  'Wood River Visual Arts provides professional vacation rental photography for property owners across Sun Valley, Ketchum, and Hailey. Our imagery captures the world-class ski terrain and stunning Idaho mountain scenery.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 89 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Photography Group', 'mammoth-str-photography-group', 'Eastern Sierra mountain vacation rental photography',
  'Mammoth STR Photography Group creates professional listing photos for vacation rental owners throughout Mammoth Lakes. We capture the dramatic Eastern Sierra scenery, ski resort access, and summer alpine landscapes that draw guests year-round.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sierra Nevada Visual Studio', 'sierra-nevada-visual-studio', 'STR photography across Mammoth Lakes and June Lake',
  'Sierra Nevada Visual Studio provides vacation rental photography for property owners across Mammoth Lakes, June Lake, and the Eastern Sierra. We specialize in showcasing the area''s dramatic volcanic landscapes and year-round recreation.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.8, 124 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Photography Co', 'big-bear-str-photography-co', 'Southern California mountain vacation rental photography',
  'Big Bear STR Photography Co provides professional listing photos for vacation rental owners across Big Bear Lake and Big Bear City. We capture the lakeside mountain lifestyle, ski resort access, and four-season recreation that drives Southern California bookings.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.9, 212 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Bernardino Mountain Visual', 'san-bernardino-mountain-visual', 'STR photography across Big Bear and Lake Arrowhead',
  'San Bernardino Mountain Visual creates vacation rental photography for property owners across Big Bear and Lake Arrowhead. We specialize in showcasing mountain lake settings, ski access, and the SoCal mountain getaway lifestyle.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.8, 167 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Photography Studio', 'bend-str-photography-studio', 'Oregon outdoor adventure vacation rental photography',
  'Bend STR Photography Studio creates compelling listing photos for vacation rental owners throughout Bend and Sunriver. We capture Central Oregon''s stunning volcanic landscapes, Mt. Bachelor views, and the outdoor adventure lifestyle guests seek.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 189 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon Visual Group', 'central-oregon-visual-group', 'STR photography across Bend and the Oregon Cascades',
  'Central Oregon Visual Group provides vacation rental photography for property owners throughout Bend, Sunriver, and Sisters. We specialize in showcasing the high desert landscape, Cascade mountain views, and Bend''s outdoor recreation lifestyle.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.8, 143 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Photography', 'whitefish-str-photography', 'Montana Glacier Country vacation rental photography',
  'Whitefish STR Photography creates professional listing photos for vacation rental owners throughout Whitefish and the Flathead Valley. We capture the stunning Glacier National Park proximity, ski mountain views, and Montana wilderness character.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.9, 134 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Glacier Country Visual Studio', 'glacier-country-visual-studio', 'STR photography across Whitefish and Kalispell',
  'Glacier Country Visual Studio provides vacation rental photography for property owners across Whitefish, Kalispell, and Columbia Falls. We specialize in showcasing Glacier National Park views, mountain lake settings, and Montana wilderness beauty.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 98 from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;
