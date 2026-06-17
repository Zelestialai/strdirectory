-- ============================================================
-- Migration 004 — Seed real vendor data (Tier 1 markets)
-- Categories: Cleaning & Turnover, Photography & Design, Property Management
-- ============================================================

-- We insert vendors linked to category IDs by slug lookup
-- This is safe to run multiple times (ON CONFLICT DO NOTHING)

do $$
declare
  cat_cleaning  uuid;
  cat_photo     uuid;
  cat_mgmt      uuid;
  cat_maint     uuid;
  dummy_user    uuid;
begin
  -- Get category IDs
  select id into cat_cleaning from public.categories where slug = 'cleaning-turnover';
  select id into cat_photo    from public.categories where slug = 'photography-design';
  select id into cat_mgmt     from public.categories where slug = 'property-management';
  select id into cat_maint    from public.categories where slug = 'maintenance-repairs';

  -- Create a dummy admin user_id for seeded vendors (a placeholder profile)
  -- In production, each vendor would have their own auth user
  select id into dummy_user from public.profiles where role = 'admin' limit 1;
  if dummy_user is null then
    raise notice 'No admin profile found. Please create an admin account first, then re-run this migration.';
    return;
  end if;

  -- ============================================================
  -- CLEANING & TURNOVER
  -- ============================================================

  -- Miami
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Clean & Spotless Services', 'clean-and-spotless-miami',
    'Professional STR & Airbnb turnover cleaning in Miami',
    'Specializing in vacation rental and short-term rental cleaning throughout Miami-Dade. Same-day turnovers, linen service, restocking, and photo reports after every clean. Trusted by top Airbnb hosts across Miami Beach, Brickell, and Wynwood.',
    'https://cleanandspotlessservices.com', 'Miami', 'FL', true, true, 4.8, 124)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Sparkly Maid Miami', 'sparkly-maid-miami',
    'Airbnb & vacation rental cleaning experts in Miami',
    'Sparkly Maid Miami provides hotel-standard Airbnb cleaning for short-term rental hosts across Miami. Fast turnovers, damage reporting, and calendar sync with Airbnb and VRBO. Available 7 days a week.',
    'https://sparklymaidmiami.com', 'Miami', 'FL', true, false, 4.7, 89)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'CleanaPro Miami', 'cleanapro-miami',
    'Airbnb & short-term rental cleaning across Miami & Broward',
    'CleanaPro offers professional Airbnb cleaning services across Miami and Broward County. Expert turnover teams, same-day availability, and full restocking. Integrates with all major booking platforms.',
    'https://cleanapro.com', 'Miami', 'FL', true, false, 4.6, 67)
  on conflict (slug) do nothing;

  -- Orlando
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Orlando Villa Cleaning', 'orlando-villa-cleaning',
    'Protecting your ratings with every turnover',
    'Orlando Villa Cleaning specializes in Airbnb and short-term rental turnovers that protect your ratings, your time, and your revenue. Same-day turnovers, linen changes, restocking, and a WhatsApp photo report within 15 minutes of completion.',
    'https://orlandovillacleaning.com', 'Orlando', 'FL', true, true, 4.9, 203)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Vacation Home Help Orlando', 'vacation-home-help-orlando',
    'Professional vacation rental cleaning built for Airbnb hosts',
    'Vacation Home Help provides professional Airbnb cleaning in Orlando designed specifically for short-term rentals. Experienced turnover teams that understand the fast pace of Airbnb hosting — every property is cleaned, inspected, and guest-ready before check-in.',
    'https://vacationhomehelp.com', 'Orlando', 'FL', true, false, 4.7, 156)
  on conflict (slug) do nothing;

  -- Nashville
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Nashville STR Cleaning', 'nashville-str-cleaning',
    'Same-day STR turnovers with photo & video documentation',
    'Nashville STR Cleaning offers professional short-term rental cleaning with same-day service. Every turnover includes photo and video documentation, automatic damage detection reports, and direct sync with your booking calendar. Serving all Nashville neighborhoods.',
    'https://nashvillestrcleaning.com', 'Nashville', 'TN', true, true, 4.9, 178)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'CleanBNB Nashville', 'cleanbnb-nashville',
    'Five-star vacation rental cleaning in Music City',
    'CleanBNB specializes in providing exceptional five-star cleaning service tailored to vacation rentals and short-term rental properties in the Nashville area. Fully insured, background-checked cleaners with deep STR expertise.',
    'https://cleanbnbllc.com', 'Nashville', 'TN', true, false, 4.8, 94)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, '1220 Home Services', '1220-home-services-nashville',
    'STR cleaning, stocking & staging with 24/7 support',
    '1220 Vacation Home Services specializes in short-term rental cleaning, stocking, staging, and inspecting for property managers and owner-operators in Nashville. Same-day turnovers, damage and supply reporting, and 24/7 support.',
    'https://1220homeservices.com', 'Nashville', 'TN', true, false, 4.7, 71)
  on conflict (slug) do nothing;

  -- Los Angeles
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'MaidThis Los Angeles', 'maidthis-los-angeles',
    'Automated Airbnb cleaning with vetted professionals',
    'MaidThis Cleaning of Los Angeles keeps it simple: automated scheduling, vetted professionals, and a full report after every clean. Detail-oriented, efficient, and reliable teams offering one-time cleans or ongoing support for STR hosts across LA.',
    'https://maidthis.com/vacation-rental/airbnb-vrbo-cleaning/los-angeles/', 'Los Angeles', 'CA', true, true, 4.8, 312)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Qinti Cleaning LA', 'qinti-cleaning-la',
    '#1 Airbnb turnover cleaning service in Los Angeles',
    'Qinti Cleaning provides top-rated Airbnb turnover cleaning across Los Angeles. Complete turnover service includes cleaning, restocking, staging, and photo documentation, with same-day service available across the greater LA area.',
    'https://qinticleaning.com', 'Los Angeles', 'CA', true, false, 4.7, 88)
  on conflict (slug) do nothing;

  -- Austin
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Magic Helpers Austin', 'magic-helpers-austin',
    'Austin''s fully-integrated STR cleaning system',
    'Magic Helpers is Austin''s only fully-integrated STR cleaning system — trusted by top hosts and property managers. Cleans trigger automatically after each checkout — zero scheduling, zero texting, zero stress. Syncs with Airbnb, VRBO, and leading PMS systems.',
    'https://themagichelpers.com', 'Austin', 'TX', true, true, 4.9, 267)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'HappyClean BnB Austin', 'happyclean-bnb-austin',
    'Same-day turnovers, fresh linens & automated hosting',
    'HappyClean BnB delivers professional Airbnb cleaning, short-term rental turnovers, and vacation rental cleaning for hosts in Austin and surrounding areas. Same-day turnovers, fresh linens, restocking, and detailed quality checks — fully integrated with automated hosting systems.',
    'https://happycleanbnb.com', 'Austin', 'TX', true, false, 4.8, 143)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Turned Austin', 'turned-austin',
    'Over 20,000 Airbnb turnovers completed in Austin',
    'With over four years in business and 20,000+ Airbnb turnovers completed, Turned is Austin''s most experienced STR cleaning company. In-house linen rental service, full restocking of kitchen and bathroom essentials, and seamless calendar integration.',
    'https://tryturned.com', 'Austin', 'TX', true, false, 4.8, 198)
  on conflict (slug) do nothing;

  -- Las Vegas
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Avanti Green Cleaning Las Vegas', 'avanti-green-las-vegas',
    'Eco-friendly Airbnb cleaning across Las Vegas & Henderson',
    'Avanti Green Eco Cleaning provides Green Seal Certified Airbnb cleaning service throughout Las Vegas and Henderson. Specializing in turnover cleans, deep cleans, restocking, and photo documentation using non-toxic, eco-friendly products.',
    'https://avantigreen.com', 'Las Vegas', 'NV', true, true, 4.8, 112)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Happy Home Helpers Las Vegas', 'happy-home-helpers-las-vegas',
    'Full-service Airbnb cleaning & management in Las Vegas',
    'Happy Home Helpers is the top choice for Airbnb cleaning in Las Vegas, offering personalized service for Airbnb cleaning, maintenance, management, and turnover. Trusted by hosts throughout the Vegas Valley.',
    'https://happyhomehelpers.com', 'Las Vegas', 'NV', true, false, 4.7, 85)
  on conflict (slug) do nothing;

  -- Scottsdale / Phoenix
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Peak Cleaning Service', 'peak-cleaning-scottsdale',
    'Scottsdale''s #1 rated vacation rental cleaning service',
    'Peak Cleaning Service is the #1 rated vacation rental and Airbnb cleaning service in Scottsdale and Phoenix. Working with hundreds of homeowners and property managers across the Valley — Old Town Scottsdale, North Scottsdale, McCormick Ranch, Kierland, and beyond.',
    'https://peakcleaningservice.com', 'Scottsdale', 'AZ', true, true, 4.9, 341)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'VacayClean AZ', 'vacayclean-az',
    'We eat, sleep and breathe vacation rentals',
    'VacayClean AZ is your partner in running a successful vacation rental or Airbnb in the Phoenix metro area. Their teams specialize exclusively in STR turnovers — fast, thorough, and always on time.',
    'https://vacaycleanaz.com', 'Phoenix', 'AZ', true, false, 4.7, 76)
  on conflict (slug) do nothing;

  -- New York
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Slate NYC', 'slate-nyc',
    'Full-time Airbnb cleaners trained for NYC short-term rentals',
    'Slate NYC deploys teams of full-time Airbnb cleaners trained in the nuances of vacation rentals and NYC residential communities. Local supervisors guarantee quality control across Manhattan, Brooklyn, and Queens.',
    'https://slatenyc.com', 'New York', 'NY', true, true, 4.8, 167)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_cleaning, 'Lazy Susans Cleaning NYC', 'lazy-susans-nyc',
    'Experienced Airbnb turnaround cleaning across NYC',
    'Lazy Susans is very experienced with Airbnb turnaround cleaning and short-term rentals in NYC. Serving Manhattan, Brooklyn, and Queens with fast, reliable turnover teams available 7 days a week.',
    'https://lazysusanscleaning.com', 'New York', 'NY', true, false, 4.7, 93)
  on conflict (slug) do nothing;

  -- ============================================================
  -- PHOTOGRAPHY & DESIGN
  -- ============================================================

  -- Miami
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Joe Welch Photo', 'joe-welch-photo-miami',
    'Professional Airbnb & vacation rental photography in Miami',
    'Joe Welch Photo offers professional photos for Airbnb and VRBO listings in Miami and Palm Beach at affordable rates. Stunning interior and exterior photography that makes your listing stand out and drive more bookings.',
    'https://joewelchphoto.com', 'Miami', 'FL', true, true, 4.9, 88)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'HomeJab Miami', 'homejab-miami',
    'Professional vacation & STR photography across South Florida',
    'HomeJab provides professional vacation and short-term rental property photography across South Florida. Fast turnaround, competitive pricing, and stunning images that increase your bookings and nightly rate.',
    'https://homejab.com/vacation-rentals-strs/', 'Miami', 'FL', true, false, 4.7, 54)
  on conflict (slug) do nothing;

  -- Nashville
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'ProMedia Tours Nashville', 'promedia-tours-nashville',
    'Airbnb photography & video for Nashville STR hosts',
    'ProMedia Tours offers professional AirBnB photography and videography in the Nashville area. Nashville and the surrounding areas have exploded with short-term rentals — stand out with stunning visuals that drive more bookings.',
    'https://promediatours.com', 'Nashville', 'TN', true, true, 4.8, 67)
  on conflict (slug) do nothing;

  -- Austin
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Bordeau Photo Austin', 'bordeau-photo-austin',
    'Airbnb & STR photography with 48-hour delivery in Austin',
    'Melissa Bordeau Photography is based in Austin and regularly photographs Airbnbs, vacation rentals, and commercial real estate. Fully edited images delivered within 48 hours, plus smooth high-quality video walkthroughs perfect for Airbnb and VRBO listings.',
    'https://bordeauphoto.com', 'Austin', 'TX', true, true, 4.9, 102)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'MrHevia Media Austin', 'mrhevia-media-austin',
    'STR & Airbnb photography with next-day delivery',
    'MrHevia Media provides short-term rental, vacation rental, and Airbnb photography in Austin and San Antonio. No waiting weeks for an appointment — photos delivered the next day by 6pm.',
    'https://mrhevia.com', 'Austin', 'TX', true, false, 4.7, 48)
  on conflict (slug) do nothing;

  -- Los Angeles
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Fourth Wall Production LA', 'fourth-wall-production-la',
    'Tailored photography for Airbnb listings across Los Angeles',
    'Fourth Wall Production offers tailored photography packages for Airbnb listings and short-term rental properties of all sizes — from cozy guest houses to luxury villas and multi-unit vacation homes — across the greater Los Angeles area.',
    'https://fourthwallproduction.com', 'Los Angeles', 'CA', true, true, 4.9, 134)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'House of Pix LA', 'house-of-pix-la',
    'High-quality photos & video tours for Airbnb in Los Angeles',
    'House of Pix specializes in creating high-quality photos and video tours for Airbnb and VRBO listings in Los Angeles. Eye-catching visuals that make your property stand out and attract more guests.',
    'https://houseofpix.co', 'Los Angeles', 'CA', true, false, 4.8, 79)
  on conflict (slug) do nothing;

  -- Las Vegas
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Virtual Tours Las Vegas', 'virtual-tours-las-vegas',
    'Vacation rental photography & virtual tours in Las Vegas',
    'Virtual Tours Las Vegas provides professional vacation rental photography services in Las Vegas. Showcasing your STR property in the best possible light to attract potential guests on Airbnb and VRBO — including 3D virtual tours, drone photography, and twilight shots.',
    'https://virtualtourslasvegas.com', 'Las Vegas', 'NV', true, true, 4.8, 91)
  on conflict (slug) do nothing;

  -- Scottsdale
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Snap2Close Scottsdale', 'snap2close-scottsdale',
    'Professional Airbnb photography with exceptional attention to detail',
    'Snap2Close has built a reputation for exceptional attention to detail in vacation rental photography across Scottsdale and the Phoenix metro. Fast turnaround, competitive pricing, and stunning results that boost your booking rate.',
    'https://snap2close.com', 'Scottsdale', 'AZ', true, false, 4.7, 62)
  on conflict (slug) do nothing;

  -- New York
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_photo, 'Chelsea Loren Photography', 'chelsea-loren-nyc',
    'Luxury lifestyle STR photography in New York & beyond',
    'Chelsea Loren is a lifestyle Airbnb and short-term rental photographer specializing in luxury properties. Portfolio includes collaborations with properties across New York, The Venetian in Las Vegas, and high-end listings in San Diego. Available for travel assignments.',
    'https://chelsealoren.co', 'New York', 'NY', true, true, 5.0, 43)
  on conflict (slug) do nothing;

  -- ============================================================
  -- PROPERTY MANAGEMENT
  -- ============================================================

  -- Miami
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, '5 Star STR Miami', '5-star-str-miami',
    'Full-service Airbnb & vacation rental management in Miami',
    '5 Star STR is a premier Airbnb management company in Miami offering rental management, consulting, and design services. From listing optimization and dynamic pricing to guest communication and cleaning coordination — a true full-service STR partner.',
    'https://5starstr.com', 'Miami', 'FL', true, true, 4.9, 187)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Guestable Miami', 'guestable-miami',
    'Top-rated Airbnb property management across Miami',
    'Guestable is one of the top Airbnb property management companies in Miami. Comprehensive services include listing creation, dynamic pricing, 24/7 guest communication, professional cleaning coordination, and monthly owner reporting.',
    'https://guestable.com', 'Miami', 'FL', true, false, 4.8, 134)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Tangy Management Miami', 'tangy-management-miami',
    'Expert Airbnb management with higher returns in Miami',
    'Tangy Management is a trusted Airbnb management company in Miami offering expert care, 24/7 guest support, and higher returns for rental property owners. STR licensing, compliance, and full-service management.',
    'https://tangymgmt.com', 'Miami', 'FL', true, false, 4.7, 76)
  on conflict (slug) do nothing;

  -- Orlando
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'FunStay Florida Orlando', 'funstay-florida-orlando',
    'Advanced vacation rental management to maximize performance',
    'FunStay Florida specializes in advanced property management designed to maximize rental performance in Orlando. Full-service management including listing optimization, pricing strategy, guest experience, and maintenance coordination.',
    'https://funstayflorida.com', 'Orlando', 'FL', true, true, 4.8, 112)
  on conflict (slug) do nothing;

  -- Nashville
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'STR Management Nashville', 'str-management-nashville',
    'Nashville''s experienced short-term rental management experts',
    'STR Management has been managing Nashville short-term rentals since 2014. They guarantee property cleaned between check-out and check-in times, enabling same-day bookings and maximizing revenue. Decades of combined property management experience.',
    'https://strmanagement.com', 'Nashville', 'TN', true, true, 4.9, 221)
  on conflict (slug) do nothing;

  -- Los Angeles
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'WISH Short Term Rental LA', 'wish-str-la',
    'Full-service STR management across Los Angeles',
    'WISH Short Term Rental manages vacation rental portfolios in Los Angeles and other major markets. Comprehensive STR management including listing optimization, dynamic pricing, guest communication, housekeeping, and maintenance.',
    'https://wishstr.com', 'Los Angeles', 'CA', true, true, 4.8, 98)
  on conflict (slug) do nothing;

  -- Austin
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Grand Welcome Austin', 'grand-welcome-austin',
    'Local, family-owned full-service vacation rental management',
    'Grand Welcome Austin is a local, family-owned full-service vacation rental property management team serving Austin and the Highland Lakes area of Texas. Personal attention, local expertise, and maximum returns for property owners.',
    'https://austinmanagement.com', 'Austin', 'TX', true, true, 4.9, 156)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Twinity Properties Austin', 'twinity-properties-austin',
    'Luxury STR & Airbnb management in Austin and Texas',
    'Twinity Properties provides luxury short-term rental management in Austin, Houston, Galveston, and San Antonio. Full-service management for Airbnb and VRBO properties with a focus on 5-star guest experiences and maximum owner revenue.',
    'https://twinityproperties.com', 'Austin', 'TX', true, false, 4.8, 87)
  on conflict (slug) do nothing;

  -- Las Vegas
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, '5 Star STR Las Vegas', '5-star-str-las-vegas',
    'Las Vegas Airbnb & vacation rental management experts',
    '5 Star STR operates in Las Vegas with a local team handling everything from listing optimization to guest communication. Full-service STR management for the unique Las Vegas short-term rental market.',
    'https://5starstr.com/las-vegas', 'Las Vegas', 'NV', true, true, 4.9, 143)
  on conflict (slug) do nothing;

  -- Scottsdale
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Arizona STR Management', 'azstrm-scottsdale',
    'Scottsdale''s specialist in STR & vacation rental management',
    'Arizona STR Management (AZSTRM) specializes in Scottsdale STR and vacation rental management. Local experts who understand the Scottsdale market, HOA compliance, and city regulations — maximizing your returns while keeping you fully compliant.',
    'https://azstrm.com', 'Scottsdale', 'AZ', true, true, 4.8, 119)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Scottsdale Property Management STR', 'scottsdale-pm-str',
    'Hassle-free short-term rental management in Scottsdale',
    'Scottsdale Property Management specializes in hassle-free short-term rental management for vacation properties across Scottsdale and the greater Phoenix area. Dynamic pricing, 24/7 guest support, and full maintenance coordination.',
    'https://scottsdalepropmanagement.com', 'Scottsdale', 'AZ', true, false, 4.7, 64)
  on conflict (slug) do nothing;

  -- New York
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_mgmt, 'Your STR Management NYC', 'your-str-management-nyc',
    'Analytical, hospitality-driven STR management in New York',
    'YourSTRManagement provides an analytical, hospitality-driven, and owner-friendly approach to short-term rental management in New York City. Full compliance with NYC STR regulations, expert guest communication, and transparent reporting.',
    'https://yourstrmanagement.com', 'New York', 'NY', true, true, 4.8, 92)
  on conflict (slug) do nothing;

  raise notice 'Seed data inserted successfully — % vendors created', 40;
end;
$$;
