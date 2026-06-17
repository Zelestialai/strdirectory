-- ============================================================
-- Migration 029 — Tier 4 Vendors F
-- Smart Home & Technology + Legal & Regulations
-- 2 vendors × 2 categories × 24 markets = 96 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- SMART HOME & TECHNOLOGY
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Smart Home', 'gulf-shores-str-smart-home', 'Alabama beach house STR technology specialists',
  'Gulf Shores STR Smart Home installs smart locks, keyless entry, noise monitors, and WiFi systems for vacation rental owners along the Alabama Gulf Coast. We specialize in Airbnb and VRBO-compatible technology that enhances guest experience and simplifies remote property management.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast STR Tech', 'alabama-coast-str-tech', 'STR smart home technology for the AL Gulf Coast',
  'Alabama Coast STR Tech provides smart home installations and WiFi upgrades for vacation rental owners along the Alabama Gulf Coast. We install smart locks, guest WiFi systems, and noise monitoring equipment to help STR owners manage beach properties remotely.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Smart Home Pros', 'pcb-str-smart-home-pros', 'Panama City Beach vacation rental tech specialists',
  'PCB STR Smart Home Pros installs smart home technology for vacation rental owners across Panama City Beach. We specialize in keyless entry systems, guest WiFi networks, smart thermostats, and noise monitors that improve guest experience and help owners manage high-volume PCB rentals remotely.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Technology', 'emerald-coast-str-technology', 'STR smart home tech along FL''s Emerald Coast',
  'Emerald Coast STR Technology provides smart home installations and WiFi solutions for vacation rental owners along Florida''s Emerald Coast. We install Schlage, August, and Igloohome smart locks, Ubiquiti guest WiFi networks, and Minut noise monitors for STR properties.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Smart Home', 'naples-str-smart-home', 'SW Florida luxury vacation rental tech specialists',
  'Naples STR Smart Home provides premium smart home installations for luxury vacation rental owners across Naples and Marco Island. We specialize in integrated home automation systems, keyless entry, guest WiFi, and smart climate control for high-end SW Florida STR properties.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 53 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SW Florida STR Technology', 'sw-florida-str-technology', 'STR smart home tech for Naples and Marco Island',
  'SW Florida STR Technology provides smart lock installations, WiFi upgrades, and smart home automation for vacation rental owners in Naples, Marco Island, and Bonita Springs. We help STR owners automate guest access and monitor properties remotely.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria STR Smart Home', 'anna-maria-str-smart-home', 'Florida Gulf island vacation rental tech specialists',
  'Anna Maria STR Smart Home installs smart locks, guest WiFi systems, and noise monitors for vacation rental owners across Anna Maria Island. We help island STR owners manage properties remotely with reliable technology that works even during Florida''s busy storm season.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Technology', 'gulf-island-str-technology', 'STR smart home tech across Florida''s Gulf islands',
  'Gulf Island STR Technology provides smart home installations for vacation rental owners across Anna Maria Island, Longboat Key, and Siesta Key. We install keyless entry, guest WiFi networks, and remote monitoring systems that simplify management of Gulf island vacation rentals.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 26 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Smart Home', 'cape-cod-str-smart-home', 'New England vacation rental technology specialists',
  'Cape Cod STR Smart Home installs smart locks, enterprise WiFi, and noise monitors for vacation rental owners throughout Cape Cod. We specialize in seasonal-property smart home setups — winterization modes, freeze alerts, and remote access systems for absent Cape Cod STR owners.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape STR Technology', 'lower-cape-str-technology', 'STR smart home tech for Cape Cod vacation rentals',
  'Lower Cape STR Technology provides smart home installations and WiFi solutions for vacation rental owners across Cape Cod. We install guest-friendly smart lock systems, mesh WiFi networks, and smart climate control systems designed for seasonal Cape Cod vacation properties.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.7, 42 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Smart Home', 'hamptons-str-smart-home', 'Luxury Hamptons vacation rental technology',
  'Hamptons STR Smart Home provides premium smart home integrations for luxury vacation rental properties in the Hamptons. We install Lutron lighting systems, Sonos whole-home audio, keyless entry, and enterprise-grade WiFi for high-end weekly rental properties in Southampton and East Hampton.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 46 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Technology', 'east-end-str-technology', 'STR smart home tech for the Hamptons',
  'East End STR Technology provides smart home installations for vacation rental owners in the Hamptons. We specialize in keyless entry, high-speed guest WiFi, whole-home audio, and smart climate systems that meet the tech expectations of discerning Hamptons weekly renters.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.8, 29 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Smart Home', 'jersey-shore-str-smart-home', 'NJ shore vacation rental tech specialists',
  'Jersey Shore STR Smart Home installs smart locks, WiFi systems, and noise monitors for vacation rental owners across the New Jersey shore. We help shore house owners manage high-turnover summer rentals remotely with reliable smart home technology.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 55 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore STR Technology NJ', 'shore-str-technology-nj', 'STR smart home tech for the Jersey Shore',
  'Shore STR Technology NJ provides smart home installations and WiFi upgrades for vacation rental owners along the New Jersey shore. We install keyless entry, guest WiFi networks, and pool/spa automation for shore house and condo STR owners from LBI to Cape May.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 35 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Smart Home', 'ocean-city-md-str-smart-home', 'Maryland beach vacation rental tech experts',
  'Ocean City MD STR Smart Home installs smart home technology for vacation rental owners across Ocean City and the Maryland coast. We provide keyless entry, guest WiFi systems, noise monitors, and remote property monitoring solutions for Delmarva beach STR owners.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 45 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Technology', 'delmarva-str-technology', 'STR smart home tech for the Delmarva Peninsula',
  'Delmarva STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners across the Delmarva Peninsula. We serve Maryland and Delaware beach town vacation rental owners with reliable smart home solutions.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.6, 26 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Smart Home', 'galveston-str-smart-home', 'Texas Gulf island vacation rental tech specialists',
  'Galveston STR Smart Home installs smart locks, WiFi systems, and vacation rental automation for property owners on Galveston Island. We help island STR owners manage high-turnover beach rentals remotely with weather-resistant smart home technology.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 54 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City STR Technology', 'island-city-str-technology', 'STR smart home tech for Galveston Island',
  'Island City STR Technology provides smart home installations for vacation rental owners across Galveston Island. We install keyless entry, guest WiFi, and smart climate control systems that work reliably in Galveston''s challenging coastal environment.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 33 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Smart Home', 'rehoboth-str-smart-home', 'Delaware beach vacation rental tech experts',
  'Rehoboth STR Smart Home provides smart home installations for vacation rental owners in Rehoboth Beach and across the Delaware coast. We install keyless entry systems, guest WiFi networks, and noise monitors that simplify management of seasonal Delaware beach rentals.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Shore STR Technology', 'delaware-shore-str-technology', 'STR smart home tech for Delaware beach rentals',
  'Delaware Shore STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners along the Delaware coast. We help Rehoboth and Bethany Beach STR owners automate guest access and monitor properties remotely.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 23 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Smart Home', 'south-padre-str-smart-home', 'Texas island vacation rental tech specialists',
  'South Padre STR Smart Home installs smart home technology for vacation rental owners on South Padre Island. We provide keyless entry, high-speed guest WiFi, and remote monitoring solutions suited to the demanding coastal Texas environment.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 36 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island STR Technology', 'padre-island-str-technology', 'STR smart home tech for South Padre Island',
  'Padre Island STR Technology provides smart lock installations, WiFi systems, and vacation rental automation for STR owners on South Padre Island. We help island property owners manage their rentals remotely with reliable, hurricane-rated smart home technology.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.6, 20 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Smart Home', '30a-str-smart-home', 'Scenic 30A luxury vacation rental tech specialists',
  '30A STR Smart Home provides premium smart home installations for luxury vacation rental owners along Scenic Highway 30A. We install integrated smart home systems — Lutron lighting, whole-home audio, keyless entry, and enterprise WiFi — designed for 30A''s high-end rental properties.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 58 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor STR Technology 30A', 'corridor-str-technology-30a', 'STR smart home tech along 30A',
  'Corridor STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners along the 30A corridor. We service Seaside, Rosemary Beach, and WaterColor properties with reliable guest-centric smart home technology.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Smart Home', 'breckenridge-str-smart-home', 'Summit County ski resort vacation rental tech',
  'Breckenridge STR Smart Home installs smart home technology for vacation rental owners in Breckenridge and Summit County. We specialize in mountain STR technology — freeze detection alerts, keyless entry with temperature-rated hardware, and guest WiFi systems that work at altitude.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 61 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit Mountain STR Technology', 'summit-mountain-str-technology', 'STR smart home tech for Breckenridge and Frisco',
  'Summit Mountain STR Technology provides smart home installations and WiFi solutions for vacation rental owners across Summit County. We install cold-weather smart locks, mesh WiFi networks, and freeze/leak detection systems for Breckenridge and Frisco STR properties.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Smart Home', 'vail-valley-str-smart-home', 'Eagle County luxury ski resort rental tech',
  'Vail Valley STR Smart Home provides premium smart home installations for luxury vacation rentals in Vail and Beaver Creek. We install integrated home automation — Lutron, Sonos, Nest, and Schlage — with enterprise WiFi and remote monitoring for high-value Vail STR properties.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 48 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Technology', 'eagle-county-str-technology', 'STR smart home tech for Vail and Avon',
  'Eagle County STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners throughout the Vail Valley. We install reliable cold-weather smart home technology for Vail, Avon, and Edwards vacation rentals.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 30 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Smart Home', 'aspen-str-smart-home', 'Aspen luxury vacation rental technology specialists',
  'Aspen STR Smart Home provides ultra-premium smart home integrations for luxury vacation rental properties in Aspen and Snowmass. We install Crestron and Control4 automation systems, high-speed WiFi, and enterprise-level security for the most discerning Aspen STR owners.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 37 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork STR Technology', 'roaring-fork-str-technology', 'STR smart home tech for Aspen area rentals',
  'Roaring Fork STR Technology provides smart home installations and WiFi solutions for vacation rental owners throughout the Roaring Fork Valley. We install reliable smart locks, freeze detection, and guest WiFi for Aspen, Basalt, and Carbondale STR properties.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 23 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Smart Home', 'steamboat-str-smart-home', 'Routt County ski resort vacation rental tech',
  'Steamboat STR Smart Home installs smart home technology for vacation rental owners in Steamboat Springs. We specialize in mountain STR technology — cold-weather smart locks, freeze and leak detection, and guest WiFi systems designed for the demands of high-altitude Colorado rentals.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 44 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley STR Technology', 'yampa-valley-str-technology', 'STR smart home tech for Steamboat Springs',
  'Yampa Valley STR Technology provides smart lock installations, WiFi upgrades, and remote monitoring solutions for vacation rental owners in Steamboat Springs. We help STR owners manage their mountain properties remotely with reliable, cold-weather-rated smart home technology.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Smart Home', 'telluride-str-smart-home', 'San Juan Mountains luxury vacation rental tech',
  'Telluride STR Smart Home provides premium smart home integrations for luxury vacation rental properties in Telluride and Mountain Village. We install advanced home automation, keyless entry, and enterprise WiFi systems that work reliably in Telluride''s extreme high-altitude environment.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 33 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan STR Technology', 'san-juan-str-technology', 'STR smart home tech for Telluride Mountain Village',
  'San Juan STR Technology provides smart home installations and WiFi solutions for vacation rental owners in Telluride and Mountain Village. We install cold-weather smart locks, mesh WiFi, and freeze detection systems for properties in Colorado''s highest vacation rental market.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 19 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Smart Home', 'jackson-hole-str-smart-home', 'Teton County luxury vacation rental tech specialists',
  'Jackson Hole STR Smart Home installs premium smart home technology for vacation rental owners throughout the Jackson Hole valley. We specialize in mountain STR systems — satellite internet (Starlink), cold-weather smart locks, freeze detection, and integrated automation for remote Wyoming properties.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 51 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton STR Technology', 'teton-str-technology', 'STR smart home tech for Jackson Hole',
  'Teton STR Technology provides smart home installations, WiFi solutions, and remote monitoring for vacation rental owners in Jackson Hole. We install Starlink internet, cold-weather keyless entry, and freeze/leak detection for Teton Village and Jackson area STR properties.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Smart Home', 'big-sky-str-smart-home', 'Montana ski resort vacation rental tech specialists',
  'Big Sky STR Smart Home installs smart home technology for vacation rental owners in Big Sky and the Gallatin Valley. We specialize in Montana mountain STR systems — Starlink internet, cold-weather smart locks, and remote monitoring for properties in Big Sky''s rapidly growing resort community.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley STR Technology', 'gallatin-valley-str-technology', 'STR smart home tech for Big Sky and Bozeman',
  'Gallatin Valley STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners in Big Sky and the greater Gallatin Valley. We install reliable cold-weather smart home systems for Montana mountain vacation rentals.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 25 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Smart Home', 'sun-valley-str-smart-home', 'Wood River Valley vacation rental tech specialists',
  'Sun Valley STR Smart Home installs smart home technology for vacation rental owners in Sun Valley and Ketchum. We provide keyless entry, high-speed WiFi, freeze detection, and remote monitoring for Wood River Valley vacation rental properties.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 39 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River STR Technology', 'wood-river-str-technology', 'STR smart home tech for Sun Valley and Ketchum',
  'Wood River STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners in Ketchum, Hailey, and the Wood River Valley. We install reliable mountain smart home systems for Idaho STR properties.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 22 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Smart Home', 'mammoth-str-smart-home', 'Eastern Sierra vacation rental tech specialists',
  'Mammoth STR Smart Home installs smart home technology for vacation rental owners in Mammoth Lakes. We specialize in high-altitude smart home systems — cold-weather keyless entry, Starlink internet, freeze detection, and guest WiFi for Mammoth''s demanding mountain rental environment.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra STR Technology', 'eastern-sierra-str-technology', 'STR smart home tech for Mammoth Lakes',
  'Eastern Sierra STR Technology provides smart lock installations, WiFi solutions, and vacation rental automation for STR owners in Mammoth Lakes and June Lake. We install reliable high-altitude smart home technology for Eastern Sierra vacation rental properties.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Smart Home', 'big-bear-str-smart-home', 'San Bernardino Mountains vacation rental tech',
  'Big Bear STR Smart Home installs smart home technology for vacation rental owners in Big Bear Lake and Big Bear City. We specialize in SoCal mountain STR systems — smart locks, mesh WiFi, and freeze detection designed for Big Bear''s year-round rental market and variable mountain climate.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 61 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain STR Technology SoCal', 'mountain-str-technology-socal', 'STR smart home tech for Big Bear rentals',
  'Mountain STR Technology SoCal provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners across the Big Bear Valley. We install reliable smart home systems for Southern California mountain vacation rentals at competitive prices.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 38 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Smart Home Co', 'bend-str-smart-home-co', 'Central Oregon vacation rental tech specialists',
  'Bend STR Smart Home Co installs smart home technology for vacation rental owners in Bend and Sunriver. We specialize in Pacific Northwest STR systems — smart locks, enterprise WiFi, noise monitors, and remote monitoring for Deschutes County''s growing vacation rental market.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 67 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon STR Technology', 'central-oregon-str-technology', 'STR smart home tech for Bend and Sunriver',
  'Central Oregon STR Technology provides smart lock installations, WiFi solutions, and vacation rental automation for STR owners in Bend, Sunriver, and Sisters. We install reliable smart home systems suited to the diverse Central Oregon vacation rental market.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 43 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Smart Home', 'whitefish-str-smart-home', 'Northwest Montana vacation rental tech specialists',
  'Whitefish STR Smart Home installs smart home technology for vacation rental owners in Whitefish and the Flathead Valley. We specialize in Montana mountain STR systems — cold-weather smart locks, Starlink internet, freeze detection, and remote monitoring for Glacier country vacation rentals.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley STR Technology', 'flathead-valley-str-technology', 'STR smart home tech for Whitefish and Kalispell',
  'Flathead Valley STR Technology provides smart lock installations, WiFi upgrades, and vacation rental automation for STR owners throughout the Flathead Valley. We install reliable cold-weather smart home systems for Northwest Montana vacation rental properties.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- ────────────────────────────────────────────────────────────
-- LEGAL & REGULATIONS
-- ────────────────────────────────────────────────────────────

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Shores STR Legal', 'gulf-shores-str-legal', 'Alabama beach vacation rental legal specialists',
  'Gulf Shores STR Legal provides legal and regulatory consulting for short-term rental owners along the Alabama Gulf Coast. We help STR investors navigate Gulf Shores and Orange Beach permit requirements, HOA restrictions, and Alabama short-term rental law compliance.',
  c.id, 'Gulf Shores', 'AL', p.id, true, true, 4.9, 44 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alabama Coast STR Advisors', 'alabama-coast-str-advisors', 'STR legal and regulatory help for the AL Gulf Coast',
  'Alabama Coast STR Advisors provides regulatory consulting and legal support for vacation rental owners along the Alabama Gulf Coast. We help STR owners understand Orange Beach STR ordinances, navigate permit applications, and respond to HOA compliance issues.',
  c.id, 'Orange Beach', 'AL', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'PCB STR Legal Advisors', 'pcb-str-legal-advisors', 'Panama City Beach vacation rental legal experts',
  'PCB STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Panama City Beach. We specialize in Bay County STR ordinances, permit applications, condo association rental restrictions, and legal compliance for PCB short-term rental investors.',
  c.id, 'Panama City Beach', 'FL', p.id, true, true, 4.9, 57 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Compliance', 'emerald-coast-str-compliance', 'STR legal help along Florida''s Emerald Coast',
  'Emerald Coast STR Compliance provides regulatory guidance and legal consulting for vacation rental owners along Florida''s Emerald Coast. We navigate county STR ordinances, condo association rules, and Florida Vacation Rental Act compliance for PCB and 30A investors.',
  c.id, 'Panama City Beach', 'FL', p.id, true, false, 4.7, 36 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Naples STR Legal Group', 'naples-str-legal-group', 'SW Florida vacation rental legal specialists',
  'Naples STR Legal Group provides legal and regulatory services for short-term rental owners across Naples and Marco Island. We handle Collier County STR permit applications, condo association vacation rental disputes, and Florida Vacation Rental Act compliance for SW Florida investors.',
  c.id, 'Naples', 'FL', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SW Florida STR Compliance', 'sw-florida-str-compliance', 'STR legal and regulatory help for Naples area',
  'SW Florida STR Compliance provides regulatory consulting for vacation rental owners in Naples, Marco Island, and Bonita Springs. We help investors navigate Collier County STR rules, condominium rental restrictions, and Florida DBPR vacation rental licensing requirements.',
  c.id, 'Marco Island', 'FL', p.id, true, false, 4.7, 31 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Anna Maria STR Legal', 'anna-maria-str-legal', 'Florida Gulf island vacation rental legal experts',
  'Anna Maria STR Legal provides legal and regulatory consulting for vacation rental owners across Anna Maria Island. We specialize in the island''s unique STR regulations — existing permit grandfathering, occupancy ordinances, and Manatee County STR compliance for island property owners.',
  c.id, 'Holmes Beach', 'FL', p.id, true, true, 4.9, 38 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gulf Island STR Compliance', 'gulf-island-str-compliance', 'STR legal help across Florida''s Gulf islands',
  'Gulf Island STR Compliance provides regulatory guidance and legal support for vacation rental owners across Anna Maria Island, Longboat Key, and Siesta Key. We help STR owners understand island-specific ordinances and navigate Florida Gulf Coast vacation rental regulations.',
  c.id, 'Anna Maria', 'FL', p.id, true, false, 4.7, 22 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Cape Cod STR Legal Advisors', 'cape-cod-str-legal-advisors', 'New England vacation rental legal specialists',
  'Cape Cod STR Legal Advisors provides legal and regulatory consulting for vacation rental owners throughout the Cape Cod peninsula. We specialize in Massachusetts Chapter 64G occupancy tax compliance, Cape Cod regional STR ordinances, and historic district vacation rental permitting.',
  c.id, 'Hyannis', 'MA', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lower Cape STR Compliance', 'lower-cape-str-compliance', 'STR legal and regulatory help for Cape Cod',
  'Lower Cape STR Compliance provides regulatory consulting for vacation rental owners across Cape Cod. We help STR owners navigate Massachusetts vacation rental law, town-by-town STR ordinances, and Cape Cod Association of Realtors guidance on short-term rental compliance.',
  c.id, 'Chatham', 'MA', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Hamptons STR Legal Group', 'hamptons-str-legal-group', 'Luxury Hamptons vacation rental legal specialists',
  'Hamptons STR Legal Group provides legal and regulatory services for vacation rental owners in the Hamptons. We specialize in Southampton and East Hampton STR ordinances, permit applications, rental agreement drafting, and luxury STR liability protection for Hamptons property owners.',
  c.id, 'Southampton', 'NY', p.id, true, true, 4.9, 48 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'East End STR Compliance', 'east-end-str-compliance', 'STR legal and regulatory help for the Hamptons',
  'East End STR Compliance provides regulatory consulting and legal support for vacation rental owners in the Hamptons. We help owners navigate East End town STR ordinances, rental permit requirements, and the complex regulatory environment of New York State vacation rentals.',
  c.id, 'East Hampton', 'NY', p.id, true, false, 4.7, 26 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jersey Shore STR Legal', 'jersey-shore-str-legal', 'NJ shore vacation rental legal specialists',
  'Jersey Shore STR Legal provides legal and regulatory consulting for vacation rental owners across the New Jersey shore. We specialize in NJ shore town STR ordinances — Ocean City, Avalon, Stone Harbor, and LBI permit requirements — and New Jersey Division of Consumer Affairs rental compliance.',
  c.id, 'Ocean City', 'NJ', p.id, true, true, 4.8, 51 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Shore STR Compliance NJ', 'shore-str-compliance-nj', 'STR legal and regulatory help for the Jersey Shore',
  'Shore STR Compliance NJ provides regulatory guidance for vacation rental owners along the New Jersey shore. We help STR investors navigate NJ shore town rental ordinances, seasonal rental license requirements, and New Jersey vacation rental law compliance.',
  c.id, 'Avalon', 'NJ', p.id, true, false, 4.7, 32 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Ocean City MD STR Legal', 'ocean-city-md-str-legal', 'Maryland beach vacation rental legal experts',
  'Ocean City MD STR Legal provides legal and regulatory consulting for vacation rental owners in Ocean City and along the Maryland coast. We specialize in Ocean City STR ordinance compliance, Maryland vacation rental law, and rental agreement drafting for Delmarva beach town investors.',
  c.id, 'Ocean City', 'MD', p.id, true, true, 4.8, 43 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delmarva STR Compliance', 'delmarva-str-compliance', 'STR legal help across the Delmarva Peninsula',
  'Delmarva STR Compliance provides regulatory consulting for vacation rental owners across the Delmarva Peninsula. We help Maryland and Delaware beach town STR owners navigate local ordinances, rental permit requirements, and state vacation rental law compliance.',
  c.id, 'Ocean Pines', 'MD', p.id, true, false, 4.6, 24 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Galveston STR Legal Group', 'galveston-str-legal-group', 'Texas Gulf island vacation rental legal specialists',
  'Galveston STR Legal Group provides legal and regulatory consulting for vacation rental owners on Galveston Island. We specialize in Galveston STR permit requirements, HOA vacation rental restrictions, and Texas vacation rental law compliance for island property investors.',
  c.id, 'Galveston', 'TX', p.id, true, true, 4.9, 49 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Island City STR Compliance', 'island-city-str-compliance', 'STR legal help for Galveston Island rentals',
  'Island City STR Compliance provides regulatory guidance for vacation rental owners across Galveston Island. We help STR investors navigate Galveston''s STR ordinances, historic district vacation rental rules, and Texas vacation rental law compliance.',
  c.id, 'Galveston', 'TX', p.id, true, false, 4.7, 30 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rehoboth STR Legal Advisors', 'rehoboth-str-legal-advisors', 'Delaware beach vacation rental legal specialists',
  'Rehoboth STR Legal Advisors provides legal and regulatory consulting for vacation rental owners across the Delaware beaches. We specialize in Rehoboth Beach STR ordinances, Delaware vacation rental law, and rental agreement drafting for Rehoboth, Dewey Beach, and Bethany Beach investors.',
  c.id, 'Rehoboth Beach', 'DE', p.id, true, true, 4.8, 38 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Delaware Shore STR Compliance', 'delaware-shore-str-compliance', 'STR legal help for Delaware beach rentals',
  'Delaware Shore STR Compliance provides regulatory guidance for vacation rental owners along the Delaware coast. We help STR investors navigate Delaware beach town rental ordinances and Delaware vacation rental law compliance requirements.',
  c.id, 'Bethany Beach', 'DE', p.id, true, false, 4.7, 20 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'South Padre STR Legal', 'south-padre-str-legal', 'Texas island vacation rental legal specialists',
  'South Padre STR Legal provides legal and regulatory consulting for vacation rental owners on South Padre Island. We specialize in South Padre STR permit requirements, condo association rental policies, and Texas vacation rental law compliance for island property investors.',
  c.id, 'South Padre Island', 'TX', p.id, true, true, 4.8, 34 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Padre Island STR Compliance', 'padre-island-str-compliance', 'STR legal help for South Padre Island',
  'Padre Island STR Compliance provides regulatory guidance for vacation rental owners on South Padre Island. We help island STR investors navigate Texas vacation rental ordinances, condo association rental rules, and Texas hotel occupancy tax compliance requirements.',
  c.id, 'South Padre Island', 'TX', p.id, true, false, 4.6, 17 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Legal Group', '30a-str-legal-group', 'Scenic 30A vacation rental legal specialists',
  '30A STR Legal Group provides legal and regulatory consulting for vacation rental owners along Scenic Highway 30A. We specialize in Walton County STR ordinances, New Urbanist community vacation rental rules, and Florida Vacation Rental Act compliance for 30A corridor investors.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, true, 4.9, 55 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Corridor STR Compliance 30A', 'corridor-str-compliance-30a', 'STR legal and regulatory help along 30A',
  'Corridor STR Compliance provides regulatory guidance for vacation rental owners throughout the 30A corridor. We help STR owners navigate Seaside, Rosemary Beach, and WaterColor community-specific vacation rental rules and Walton County STR permit compliance.',
  c.id, 'Seaside', 'FL', p.id, true, false, 4.7, 34 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Breckenridge STR Legal Advisors', 'breckenridge-str-legal-advisors', 'Summit County ski resort STR legal specialists',
  'Breckenridge STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Breckenridge and Summit County. We specialize in Summit County STR license requirements, HOA rental restrictions, and Colorado vacation rental law compliance for ski resort investors.',
  c.id, 'Breckenridge', 'CO', p.id, true, true, 4.9, 58 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Summit County STR Compliance', 'summit-county-str-compliance', 'STR legal help for Breckenridge and Frisco',
  'Summit County STR Compliance provides regulatory guidance for vacation rental owners throughout Summit County. We help STR investors navigate Breckenridge STR license applications, Frisco vacation rental rules, and Summit County STR ordinance compliance.',
  c.id, 'Frisco', 'CO', p.id, true, false, 4.7, 37 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Vail Valley STR Legal Group', 'vail-valley-str-legal-group', 'Eagle County luxury ski resort STR legal experts',
  'Vail Valley STR Legal Group provides legal and regulatory services for vacation rental owners in Vail and Beaver Creek. We specialize in Eagle County STR regulations, Vail STR permit applications, Beaver Creek HOA rental policies, and Colorado mountain vacation rental law compliance.',
  c.id, 'Vail', 'CO', p.id, true, true, 4.9, 45 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eagle County STR Compliance', 'eagle-county-str-compliance', 'STR legal help for Vail and Avon',
  'Eagle County STR Compliance provides regulatory guidance for vacation rental owners throughout the Vail Valley. We help STR investors navigate Eagle County vacation rental ordinances, Avon and Edwards STR rules, and Colorado vacation rental law requirements.',
  c.id, 'Avon', 'CO', p.id, true, false, 4.7, 28 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Aspen STR Legal Advisors', 'aspen-str-legal-advisors', 'Aspen luxury vacation rental legal specialists',
  'Aspen STR Legal Advisors provides sophisticated legal and regulatory services for vacation rental owners in Aspen and Snowmass Village. We specialize in Pitkin County STR regulations, Aspen lodge permit requirements, and complex HOA vacation rental dispute resolution for the Aspen luxury market.',
  c.id, 'Aspen', 'CO', p.id, true, true, 4.9, 36 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Roaring Fork STR Compliance', 'roaring-fork-str-compliance', 'STR legal help for Aspen area rentals',
  'Roaring Fork STR Compliance provides regulatory guidance for vacation rental owners throughout the Roaring Fork Valley. We help STR investors navigate Aspen, Pitkin County, and Garfield County vacation rental regulations for properties across the Roaring Fork Valley.',
  c.id, 'Basalt', 'CO', p.id, true, false, 4.7, 21 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Steamboat STR Legal Group', 'steamboat-str-legal-group', 'Routt County vacation rental legal specialists',
  'Steamboat STR Legal Group provides legal and regulatory consulting for vacation rental owners in Steamboat Springs. We specialize in Routt County STR ordinances, Steamboat Springs vacation rental permit applications, and Colorado mountain vacation rental law compliance.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Yampa Valley STR Compliance', 'yampa-valley-str-compliance', 'STR legal help for Steamboat Springs',
  'Yampa Valley STR Compliance provides regulatory guidance for vacation rental owners in Steamboat Springs and the Yampa Valley. We help STR investors navigate Routt County vacation rental ordinances and Steamboat Springs STR permit requirements.',
  c.id, 'Steamboat Springs', 'CO', p.id, true, false, 4.7, 25 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Telluride STR Legal Advisors', 'telluride-str-legal-advisors', 'San Juan Mountains vacation rental legal specialists',
  'Telluride STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Telluride and Mountain Village. We specialize in San Miguel County STR regulations, Telluride permit applications, and Mountain Village HOA vacation rental policy compliance.',
  c.id, 'Telluride', 'CO', p.id, true, true, 4.9, 30 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Juan STR Compliance', 'san-juan-str-compliance', 'STR legal help for Telluride Mountain Village',
  'San Juan STR Compliance provides regulatory guidance for vacation rental owners in Telluride and Mountain Village. We help STR investors navigate San Miguel County vacation rental laws and Mountain Village community-specific rental regulations.',
  c.id, 'Mountain Village', 'CO', p.id, true, false, 4.7, 16 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Jackson Hole STR Legal Group', 'jackson-hole-str-legal-group', 'Teton County luxury vacation rental legal experts',
  'Jackson Hole STR Legal Group provides legal and regulatory services for vacation rental owners in Jackson Hole. We specialize in Teton County STR regulations, Jackson STR permit applications, national park adjacency restrictions, and Wyoming vacation rental law compliance for mountain property investors.',
  c.id, 'Jackson', 'WY', p.id, true, true, 4.9, 46 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Teton STR Compliance', 'teton-str-compliance', 'STR legal help for Jackson Hole',
  'Teton STR Compliance provides regulatory guidance for vacation rental owners throughout the Jackson Hole valley. We help STR investors navigate Teton County vacation rental ordinances, Teton Village HOA rental policies, and Wyoming vacation rental law compliance.',
  c.id, 'Teton Village', 'WY', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Sky STR Legal Advisors', 'big-sky-str-legal-advisors', 'Montana ski resort vacation rental legal specialists',
  'Big Sky STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Big Sky and the Gallatin Valley. We specialize in Gallatin County STR regulations, Big Sky Resort area vacation rental rules, and Montana vacation rental law compliance for this rapidly growing market.',
  c.id, 'Big Sky', 'MT', p.id, true, true, 4.8, 37 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Gallatin Valley STR Compliance', 'gallatin-valley-str-compliance', 'STR legal help for Big Sky and Bozeman',
  'Gallatin Valley STR Compliance provides regulatory guidance for vacation rental owners in Big Sky and the greater Gallatin Valley. We help STR investors navigate Gallatin County vacation rental ordinances and Montana short-term rental law compliance requirements.',
  c.id, 'Gallatin Gateway', 'MT', p.id, true, false, 4.7, 22 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Sun Valley STR Legal Group', 'sun-valley-str-legal-group', 'Wood River Valley vacation rental legal specialists',
  'Sun Valley STR Legal Group provides legal and regulatory consulting for vacation rental owners in Sun Valley and the Wood River Valley. We specialize in Blaine County STR regulations, Ketchum vacation rental permit requirements, and Idaho vacation rental law compliance for Wood River Valley investors.',
  c.id, 'Sun Valley', 'ID', p.id, true, true, 4.9, 34 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Wood River STR Compliance', 'wood-river-str-compliance', 'STR legal help for Sun Valley and Ketchum',
  'Wood River STR Compliance provides regulatory guidance for vacation rental owners in Ketchum, Hailey, and the Wood River Valley. We help STR investors navigate Blaine County and Ketchum vacation rental ordinances and Idaho vacation rental law compliance.',
  c.id, 'Ketchum', 'ID', p.id, true, false, 4.7, 19 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mammoth STR Legal Advisors', 'mammoth-str-legal-advisors', 'Eastern Sierra vacation rental legal specialists',
  'Mammoth STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Mammoth Lakes. We specialize in Mono County and Town of Mammoth Lakes STR regulations, vacation rental permit applications, and California vacation rental law compliance for Eastern Sierra investors.',
  c.id, 'Mammoth Lakes', 'CA', p.id, true, true, 4.9, 44 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Eastern Sierra STR Compliance', 'eastern-sierra-str-compliance', 'STR legal help for Mammoth Lakes',
  'Eastern Sierra STR Compliance provides regulatory guidance for vacation rental owners in Mammoth Lakes and June Lake. We help STR investors navigate Mono County vacation rental ordinances and California short-term rental law compliance requirements.',
  c.id, 'June Lake', 'CA', p.id, true, false, 4.7, 27 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Big Bear STR Legal Group', 'big-bear-str-legal-group', 'San Bernardino Mountains vacation rental legal experts',
  'Big Bear STR Legal Group provides legal and regulatory consulting for vacation rental owners in Big Bear Lake and Big Bear City. We specialize in San Bernardino County STR regulations, Big Bear Lake STR permit applications, and California vacation rental law compliance for mountain cabin investors.',
  c.id, 'Big Bear Lake', 'CA', p.id, true, true, 4.8, 56 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mountain STR Compliance SoCal', 'mountain-str-compliance-socal', 'STR legal help for Big Bear rentals',
  'Mountain STR Compliance SoCal provides regulatory guidance for vacation rental owners across the Big Bear Valley. We help STR investors navigate San Bernardino County vacation rental rules, HOA rental restrictions, and California short-term rental law compliance.',
  c.id, 'Big Bear City', 'CA', p.id, true, false, 4.7, 35 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bend STR Legal Advisors', 'bend-str-legal-advisors', 'Central Oregon vacation rental legal specialists',
  'Bend STR Legal Advisors provides legal and regulatory consulting for vacation rental owners in Bend and Sunriver. We specialize in Deschutes County STR regulations, Bend city vacation rental permit requirements, Sunriver SROA rental rules, and Oregon vacation rental law compliance.',
  c.id, 'Bend', 'OR', p.id, true, true, 4.9, 62 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Central Oregon STR Compliance', 'central-oregon-str-compliance', 'STR legal help for Bend and Sunriver',
  'Central Oregon STR Compliance provides regulatory guidance for vacation rental owners in Bend, Sunriver, and Sisters. We help STR investors navigate Deschutes County vacation rental ordinances, Sunriver Owners Association rental rules, and Oregon short-term rental law compliance.',
  c.id, 'Sunriver', 'OR', p.id, true, false, 4.7, 39 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Whitefish STR Legal Group', 'whitefish-str-legal-group', 'Montana mountain vacation rental legal specialists',
  'Whitefish STR Legal Group provides legal and regulatory consulting for vacation rental owners in Whitefish and the Flathead Valley. We specialize in Flathead County STR regulations, Whitefish vacation rental permit applications, and Montana vacation rental law compliance for Northwest Montana investors.',
  c.id, 'Whitefish', 'MT', p.id, true, true, 4.8, 41 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Flathead Valley STR Compliance', 'flathead-valley-str-compliance', 'STR legal help for Whitefish and Kalispell',
  'Flathead Valley STR Compliance provides regulatory guidance for vacation rental owners throughout the Flathead Valley. We help STR investors navigate Flathead County vacation rental ordinances and Montana short-term rental law compliance for Whitefish, Kalispell, and Flathead Lake properties.',
  c.id, 'Kalispell', 'MT', p.id, true, false, 4.7, 25 from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;
