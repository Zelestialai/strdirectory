-- ============================================================
-- Migration 011 — Tier 2 Vendors: Cleaning, Photography,
--                 Property Management, Maintenance & Repairs
-- 2 vendors × 4 categories × 8 markets = 64 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- CLEANING & TURNOVER
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High Turnover Co', 'mile-high-turnover-co', 'Fast, reliable STR cleaning across the Denver metro',
  'Mile High Turnover Co specializes in short-term rental cleaning for Airbnb and VRBO hosts across Denver, Aurora, and Lakewood. We handle same-day turnovers, linen service, restocking, and damage reporting so your listing stays five-star ready.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 214
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rocky Mountain Clean', 'rocky-mountain-clean', 'Hotel-quality STR turnovers in Denver & Boulder',
  'Rocky Mountain Clean delivers hotel-standard cleaning for short-term rental properties throughout the Denver and Boulder corridor. Our trained teams handle full turnovers, deep cleans, and supply restocking with a quality checklist review after every visit.',
  c.id, 'Boulder', 'CO', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City Turnovers', 'crescent-city-turnovers', 'NOLA STR cleaning experts — Mardi Gras ready',
  'Crescent City Turnovers is the go-to cleaning service for New Orleans short-term rental hosts. We specialize in fast festival-season turnovers, post-Mardi Gras deep cleans, and weekly maintenance for properties in the French Quarter, Garden District, and Uptown.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayou Fresh Cleaning', 'bayou-fresh-cleaning', 'Reliable turnover cleaning for NOLA vacation rentals',
  'Bayou Fresh Cleaning provides dependable STR turnover services for New Orleans and the North Shore. From historic shotgun houses to modern condos, our teams deliver spotless turnovers with photo documentation and supply management.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 132
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pacific Shore Turnovers', 'pacific-shore-turnovers', 'San Diego STR cleaning from La Jolla to Coronado',
  'Pacific Shore Turnovers is a top-rated cleaning company serving short-term rental hosts throughout San Diego County. We cover La Jolla, Pacific Beach, Coronado, Encinitas, and Carlsbad with same-day turnover availability and dedicated host communication.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 243
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SoCal STR Clean', 'socal-str-clean', 'Trusted vacation rental cleaning for San Diego hosts',
  'SoCal STR Clean serves Airbnb and VRBO hosts across San Diego with fast, reliable turnover cleaning. Our bonded and insured team provides full linen service, restocking, and digital checklists so you always know exactly what was done.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 189
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Turnover Pros', 'lowcountry-turnover-pros', 'Charleston STR cleaning from downtown to Isle of Palms',
  'Lowcountry Turnover Pros specializes in short-term rental turnovers throughout greater Charleston — from historic downtown homes and Mount Pleasant properties to Isle of Palms beach houses and Kiawah Island luxury rentals. Linen, supplies, and guest-ready staging included.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 221
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Holy City Clean Team', 'holy-city-clean-team', 'Dependable vacation rental turnovers in Charleston',
  'Holy City Clean Team delivers consistent, high-quality STR turnover cleaning for Charleston hosts. We cover all of the Tri-county area including North Charleston, Summerville, and Goose Creek, with flexible scheduling for same-day turnovers.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 145
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand Cleaners', 'grand-strand-cleaners', 'STR turnovers across the entire Myrtle Beach Grand Strand',
  'Grand Strand Cleaners is the largest dedicated STR cleaning company on the South Carolina coast, servicing properties from Little River to Pawleys Island. We handle oceanfront condos, beach houses, and golf villas with fast turnovers, linen service, and owner reporting.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 312
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Oceanfront Turnover Co', 'oceanfront-turnover-co', 'Reliable beach condo cleaning for Myrtle Beach hosts',
  'Oceanfront Turnover Co specializes in vacation rental cleaning for beachfront condos and resort properties in Myrtle Beach and North Myrtle Beach. Our team is experienced with high-frequency summer turnovers and off-season deep cleaning.',
  c.id, 'North Myrtle Beach', 'SC', p.id, true, false, 4.7, 178
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Turnovers', 'emerald-coast-turnovers', 'Premium STR cleaning along Destin''s Emerald Coast',
  'Emerald Coast Turnovers provides premium short-term rental cleaning throughout the Destin area, including Santa Rosa Beach, 30A, and Panama City Beach. We specialize in luxury beach homes, gulf-front condos, and 30A cottages with meticulous turnover checklists.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 267
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Spotless', '30a-spotless', 'The trusted cleaning partner for 30A vacation rentals',
  '30A Spotless is the premier cleaning service for vacation rental owners along Scenic Highway 30A, covering Seaside, Rosemary Beach, WaterColor, and Alys Beach. We understand the premium expectations of 30A guests and deliver consistent five-star ready turnovers.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 203
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Cabin Cleaners', 'smoky-mountain-cabin-cleaners', 'Specialized cabin turnovers in Gatlinburg & Pigeon Forge',
  'Smoky Mountain Cabin Cleaners is the leading STR cleaning service in the Great Smoky Mountains, specializing in cabin and chalet turnovers throughout Gatlinburg, Pigeon Forge, and Sevierville. We handle hot tub maintenance, fireplace cleaning, game room restocking, and full cabin turnovers.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 389
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Turnover Services', 'appalachian-turnover-services', 'Reliable STR cleaning for Smoky Mountain cabin owners',
  'Appalachian Turnover Services provides dependable vacation rental cleaning throughout the Smoky Mountains region. From Wears Valley chalets to Pigeon Forge resort cabins, we deliver consistent turnovers with hot tub maintenance, restocking, and photo reports.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 234
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Cleaning', 'windy-city-str-cleaning', 'Chicago''s go-to turnover cleaning for Airbnb hosts',
  'Windy City STR Cleaning is a leading short-term rental cleaning company serving Chicago neighborhoods including River North, Lincoln Park, Wicker Park, and Logan Square. We offer same-day turnovers, linen service, and a dedicated host app for scheduling and communication.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 276
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chi-Town Turnovers', 'chi-town-turnovers', 'Dependable vacation rental cleaning across Chicago',
  'Chi-Town Turnovers delivers fast, reliable STR cleaning for Airbnb and VRBO hosts across Chicago and the inner suburbs. We specialize in high-rise condo turnovers, townhome cleaning, and boutique apartment turnovers in all major Chicago neighborhoods.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 198
from public.categories c, public.profiles p where c.slug = 'cleaning-turnover' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- PHOTOGRAPHY & DESIGN
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alpine Lens Photography', 'alpine-lens-photography', 'Stunning STR photography showcasing Colorado''s mountain lifestyle',
  'Alpine Lens Photography specializes in short-term rental and vacation property photography across the Denver metro and Colorado mountain towns. We capture the unique character of mountain homes, ski chalets, and urban Denver rentals with HDR photography, drone aerials, and virtual tours.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 156
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Front Range STR Media', 'front-range-str-media', 'Professional listing photos and virtual tours for Denver hosts',
  'Front Range STR Media provides professional photography, video walkthroughs, and Matterport 3D virtual tours for short-term rental properties throughout the Denver Front Range. Our listing-optimized photos consistently increase booking rates for our clients.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Photography', 'nola-str-photography', 'Capturing the character of New Orleans vacation rentals',
  'NOLA STR Photography specializes in showcasing the unique architectural character of New Orleans short-term rental properties. From French Quarter Creole cottages to Garden District mansions, we use wide-angle HDR photography and twilight shoots to make your listing irresistible.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayou View Media', 'bayou-view-media', 'Professional STR listing photos across greater New Orleans',
  'Bayou View Media delivers high-quality photography and video content for vacation rental owners throughout the New Orleans metro. We specialize in interior lifestyle photography, drone footage, and listing-ready photo packages delivered within 24 hours.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 98
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Clicks San Diego', 'coastal-clicks-san-diego', 'Beach lifestyle photography for San Diego vacation rentals',
  'Coastal Clicks San Diego captures the beauty of San Diego vacation properties with bright, airy, beach-lifestyle photography. We serve La Jolla, Pacific Beach, Coronado, and North County coastal properties with HDR photos, drone aerials, and Airbnb-optimized listing images.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 187
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'SoCal Property Lens', 'socal-property-lens', 'Professional vacation rental photography in San Diego',
  'SoCal Property Lens provides professional photography services for short-term rental owners throughout San Diego County. Our team specializes in capturing the indoor/outdoor California lifestyle that makes San Diego properties so appealing to guests.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Photography', 'charleston-str-photography', 'Showcasing the beauty of Charleston vacation rentals',
  'Charleston STR Photography captures the timeless elegance of Charleston short-term rental properties. We specialize in historic homes, beachfront properties, and boutique rentals throughout the greater Charleston area, with golden-hour shoots, drone aerials, and wide-angle interior photography.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Palmetto Property Shots', 'palmetto-property-shots', 'Professional listing photos for Charleston area rentals',
  'Palmetto Property Shots delivers stunning vacation rental photography for hosts throughout Charleston, Mount Pleasant, Isle of Palms, and Kiawah Island. Our listing-optimized images help your property stand out in a competitive Charleston market.',
  c.id, 'Mount Pleasant', 'SC', p.id, true, false, 4.7, 121
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Strand Side Photography', 'strand-side-photography', 'Professional STR listing photos across the Grand Strand',
  'Strand Side Photography is the leading STR photography service on the South Carolina Grand Strand, covering Myrtle Beach, North Myrtle Beach, and Pawleys Island. We photograph oceanfront condos, beach houses, and golf villas with HDR imagery and drone aerials.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 178
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Beach Rentals Photography MB', 'beach-rentals-photography-mb', 'Vacation rental listing photos in Myrtle Beach',
  'Beach Rentals Photography delivers affordable, high-quality listing photos for vacation rental owners throughout the Myrtle Beach area. Quick 24-hour turnaround on edited photos, with drone add-ons available for oceanfront properties.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 143
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Photos', 'emerald-coast-str-photos', 'Luxury beach rental photography for Destin & 30A',
  'Emerald Coast STR Photos specializes in luxury vacation rental photography throughout the Destin and 30A corridor. We photograph gulf-front estates, 30A cottages, and beachside condos with the bright, airy aesthetic that attracts premium guests and justifies higher nightly rates.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 201
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Vacation Lens', '30a-vacation-lens', 'Premium listing photography along scenic 30A',
  '30A Vacation Lens captures the distinctive architectural beauty of 30A vacation homes in Seaside, Rosemary Beach, WaterColor, and Alys Beach. Our photography emphasizes natural light, outdoor living spaces, and the unique design details that make 30A properties special.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Property Photos', 'smoky-mountain-property-photos', 'Cabin photography that captures mountain magic',
  'Smoky Mountain Property Photos specializes in vacation rental cabin photography throughout Gatlinburg, Pigeon Forge, and the surrounding Smokies region. We capture mountain views, hot tubs, fire pits, game rooms, and all the amenities that drive bookings in this market.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 298
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Cabin Lens', 'appalachian-cabin-lens', 'Professional listing photos for Smoky Mountain cabin rentals',
  'Appalachian Cabin Lens provides professional photography for vacation rental cabin owners throughout the Great Smoky Mountains. From cozy one-bedroom getaways to large group lodges, we deliver stunning listing images that highlight your property''s best features.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 187
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Photography', 'chicago-str-photography', 'Urban STR listing photography for Chicago Airbnb hosts',
  'Chicago STR Photography specializes in short-term rental listing photography for Chicago condo and apartment hosts. We work throughout Chicago''s most popular Airbnb neighborhoods — River North, Lincoln Park, Wicker Park, and the West Loop — with HDR photography and virtual tours.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 213
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City Property Media', 'windy-city-property-media', 'Professional vacation rental photos across Chicago',
  'Windy City Property Media delivers high-quality listing photography for short-term rental owners throughout the Chicago metro. We specialize in urban apartment photography, high-rise condo shoots, and neighborhood lifestyle imagery that resonates with guests.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'photography-design' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- PROPERTY MANAGEMENT
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Management', 'colorado-str-management', 'Full-service Airbnb management across Denver & the mountains',
  'Colorado STR Management provides comprehensive short-term rental management for property owners throughout Denver, Boulder, and the Colorado mountain towns. We handle everything from dynamic pricing and guest communication to cleaning coordination and maintenance, maximizing your rental income hands-free.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Peak STR Denver', 'peak-str-denver', 'Denver''s trusted short-term rental management experts',
  'Peak STR Denver specializes in full-service property management for Airbnb and VRBO hosts in the Denver metro. Our team handles dynamic pricing, guest screening, 24/7 support, and all coordination so you earn more without lifting a finger.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA Vacation Rental Management', 'nola-vacation-rental-management', 'Expert STR management for New Orleans property owners',
  'NOLA Vacation Rental Management is the premier property management company for short-term rental owners in New Orleans. We specialize in the unique demands of the NOLA market — including festival surge pricing, noise ordinance compliance, and the historic property considerations of the French Quarter and Garden District.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 156
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Co', 'crescent-city-str-co', 'Full-service Airbnb management in New Orleans',
  'Crescent City STR Co manages short-term rental properties throughout the greater New Orleans area. From listing optimization and dynamic pricing to guest communication and cleaning coordination, we handle everything while you collect the income.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 112
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Management', 'san-diego-str-management', 'Full-service vacation rental management in San Diego',
  'San Diego STR Management provides comprehensive short-term rental management for property owners throughout San Diego County. We specialize in coastal properties in La Jolla, Pacific Beach, and Encinitas, and deliver consistent 5-star guest experiences that maximize your rental income.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 198
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pacific Coast Property Partners', 'pacific-coast-property-partners', 'San Diego''s trusted Airbnb management experts',
  'Pacific Coast Property Partners manages vacation rental properties across San Diego with a focus on maximizing revenue and guest satisfaction. Our team handles dynamic pricing, guest communication, cleaning coordination, and maintenance for hassle-free STR ownership.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 145
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston Vacation Rental Mgmt', 'charleston-vacation-rental-mgmt', 'Expert STR management for Charleston property owners',
  'Charleston Vacation Rental Management provides full-service short-term rental management for property owners throughout the greater Charleston area. We specialize in historic downtown properties, Isle of Palms beach homes, and Kiawah Island luxury rentals — navigating Charleston''s permitting requirements with ease.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 167
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Partners', 'lowcountry-str-partners', 'Charleston Airbnb management you can trust',
  'Lowcountry STR Partners manages vacation rental properties throughout the Charleston Lowcountry, from Mount Pleasant suburban homes to Folly Beach oceanfront properties. Our transparent reporting and dynamic pricing approach consistently outperforms market average rates.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 123
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand Vacation Rentals', 'grand-strand-vacation-rentals', 'Full-service STR management on the Myrtle Beach Grand Strand',
  'Grand Strand Vacation Rentals is one of the largest independent STR management companies on the South Carolina coast, managing properties from Little River to Pawleys Island. We handle everything from listing optimization and seasonal pricing to guest services and property maintenance.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 289
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach STR Pro', 'myrtle-beach-str-pro', 'Trusted Airbnb management for Myrtle Beach property owners',
  'Myrtle Beach STR Pro specializes in vacation rental management for oceanfront condos, beach houses, and golf villas throughout the Myrtle Beach area. Our seasonal pricing strategy and guest experience focus deliver above-market returns for our owners.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 198
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Destin Luxury Rentals Management', 'destin-luxury-rentals-management', 'Premium STR management for Destin & 30A property owners',
  'Destin Luxury Rentals Management provides white-glove short-term rental management for luxury vacation properties along the Emerald Coast. We specialize in gulf-front estates, 30A premium homes, and high-end beach condos, delivering VIP guest experiences that command premium nightly rates.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 212
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Property Management Group', '30a-property-management-group', 'Expert Airbnb management along scenic 30A',
  '30A Property Management Group manages vacation rental properties throughout the 30A corridor, from Seaside to Alys Beach. Our local expertise, trusted vendor network, and dynamic pricing strategies consistently deliver top-of-market income for our property owners.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 167
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Cabin Management', 'smoky-mountain-cabin-management', 'Full-service cabin rental management in the Smokies',
  'Smoky Mountain Cabin Management is a leading property management company for cabin and chalet owners throughout Gatlinburg, Pigeon Forge, and Sevierville. We manage everything from Airbnb listing optimization and dynamic pricing to cleaning coordination, hot tub maintenance, and 24/7 guest support.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 334
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Rental Partners', 'appalachian-rental-partners', 'Smoky Mountain STR management for hands-off cabin owners',
  'Appalachian Rental Partners manages short-term rental cabins throughout the Great Smoky Mountains region. Our full-service approach covers listing management, pricing optimization, guest communication, and all property maintenance so you can enjoy passive income from your mountain investment.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 212
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Management Co', 'chicago-str-management-co', 'Full-service Airbnb management throughout Chicago',
  'Chicago STR Management Co provides comprehensive short-term rental management for condo and apartment owners throughout Chicago. We navigate Chicago''s STR licensing requirements, handle all guest communication and cleaning coordination, and use data-driven dynamic pricing to maximize your rental income.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 223
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lake Shore STR Partners', 'lake-shore-str-partners', 'Chicago Airbnb management with local expertise',
  'Lake Shore STR Partners manages vacation rental properties throughout Chicago''s most desirable neighborhoods. Our team specializes in high-rise condo turnovers, Chicago STR permit compliance, and dynamic pricing strategies that maximize occupancy across convention and event demand spikes.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 178
from public.categories c, public.profiles p where c.slug = 'property-management' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- MAINTENANCE & REPAIRS
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Maintenance', 'mile-high-str-maintenance', 'Responsive handyman and maintenance for Denver vacation rentals',
  'Mile High STR Maintenance provides on-call handyman and property maintenance services for short-term rental owners throughout the Denver metro. We handle everything from plumbing and HVAC issues to appliance repairs, lock changes, and seasonal winterization for Colorado properties.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Rocky Mountain Property Repair', 'rocky-mountain-property-repair', 'Fast maintenance and repairs for Colorado STR owners',
  'Rocky Mountain Property Repair serves short-term rental owners across the Denver Front Range and mountain towns with fast, reliable maintenance services. Our licensed technicians handle plumbing, electrical, HVAC, appliances, and general handyman work with STR-priority scheduling.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.7, 98
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Repairs', 'nola-str-repairs', 'Reliable maintenance for New Orleans vacation rental properties',
  'NOLA STR Repairs provides fast, reliable maintenance and handyman services for short-term rental properties throughout New Orleans. We specialize in the unique maintenance needs of historic New Orleans properties — from aging plumbing and HVAC to hurricane prep and post-storm repairs.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Bayou Handyman Services', 'bayou-handyman-services', 'Full-service property maintenance for NOLA STR hosts',
  'Bayou Handyman Services offers comprehensive property maintenance for vacation rental owners in New Orleans and the surrounding metro. Our licensed team handles plumbing, electrical, HVAC, carpentry, and appliance repairs with quick response times for guest-impacting issues.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.6, 87
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Maintenance', 'san-diego-str-maintenance', 'On-call property maintenance for San Diego vacation rentals',
  'San Diego STR Maintenance provides responsive handyman and maintenance services for short-term rental owners throughout San Diego County. We prioritize guest-impacting issues and offer same-day service for urgent repairs so your guests always have a great stay.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Property Fix', 'coastal-property-fix', 'Reliable repairs and maintenance for San Diego STR hosts',
  'Coastal Property Fix handles all maintenance and repair needs for vacation rental owners across San Diego. From routine upkeep and appliance repairs to plumbing emergencies, our licensed technicians respond quickly to keep your property guest-ready.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.7, 109
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Maintenance Co', 'charleston-str-maintenance-co', 'Property maintenance experts for Charleston vacation rentals',
  'Charleston STR Maintenance Co provides reliable maintenance and repair services for short-term rental owners throughout the greater Charleston area. We understand the unique maintenance needs of Charleston''s historic properties and coastal homes, offering responsive service and transparent pricing.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.8, 123
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Handyman Pro', 'lowcountry-handyman-pro', 'Fast, reliable repairs for Charleston area rental properties',
  'Lowcountry Handyman Pro serves vacation rental owners throughout the Charleston Lowcountry with fast, reliable maintenance services. From plumbing and HVAC to exterior repairs and storm prep, our licensed team keeps your STR property in top condition year-round.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 95
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand Property Maintenance', 'grand-strand-property-maintenance', 'STR maintenance across the entire Myrtle Beach Grand Strand',
  'Grand Strand Property Maintenance is a full-service maintenance company serving vacation rental owners from Little River to Pawleys Island. We handle oceanfront condo repairs, beach house maintenance, pool/hot tub servicing, and all general repairs with fast response for guest emergencies.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 187
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach Repair Pros', 'myrtle-beach-repair-pros', 'On-call handyman and repairs for Myrtle Beach STR hosts',
  'Myrtle Beach Repair Pros provides on-call handyman and property repair services for vacation rental owners throughout the Grand Strand. From appliance repairs and plumbing issues to HVAC servicing and exterior maintenance, we respond quickly to protect your rental income.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.6, 134
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Property Maintenance', 'emerald-coast-property-maintenance', 'Responsive maintenance for Destin & 30A vacation rentals',
  'Emerald Coast Property Maintenance provides comprehensive maintenance and repair services for vacation rental owners throughout Destin, Fort Walton Beach, and the 30A corridor. We specialize in coastal property maintenance, including salt-air corrosion prevention, storm prep, and luxury amenity upkeep.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.8, 156
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Home Repair Services', '30a-home-repair-services', 'Trusted repairs and maintenance along scenic 30A',
  '30A Home Repair Services provides reliable property maintenance for vacation rental owners along the 30A corridor. Our licensed team handles all repairs from plumbing and electrical to HVAC and appliances, with same-day service available for guest-impacting issues.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.7, 112
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Cabin Maintenance', 'smoky-mountain-cabin-maintenance', 'Specialized cabin maintenance for Smoky Mountain STR owners',
  'Smoky Mountain Cabin Maintenance provides specialized property maintenance for vacation rental cabin owners throughout Gatlinburg, Pigeon Forge, and Sevierville. We handle hot tub servicing, fireplace maintenance, deck repairs, appliance service, and all cabin-specific maintenance needs.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.8, 234
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Property Services', 'appalachian-property-services', 'Reliable repairs and maintenance for Smokies cabin rentals',
  'Appalachian Property Services serves cabin rental owners throughout the Great Smoky Mountains with reliable maintenance and repair services. From hot tub repairs and HVAC servicing to emergency plumbing and electrical, our local team responds fast to protect your rental income.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 167
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Property Maintenance', 'chicago-str-property-maintenance', 'On-call maintenance for Chicago vacation rental hosts',
  'Chicago STR Property Maintenance provides responsive handyman and maintenance services for short-term rental owners throughout Chicago. We specialize in urban condo and apartment maintenance, handling everything from appliance repairs and plumbing to HVAC servicing and locksmith services.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.8, 178
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City Handyman STR', 'windy-city-handyman-str', 'Fast, reliable repairs for Chicago Airbnb properties',
  'Windy City Handyman STR provides on-call handyman and repair services for Airbnb hosts throughout Chicago. Our licensed technicians handle plumbing, electrical, HVAC, appliances, and general repairs with priority scheduling for guest-impacting issues.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.7, 134
from public.categories c, public.profiles p where c.slug = 'maintenance-repairs' and p.role = 'admin' on conflict (slug) do nothing;
