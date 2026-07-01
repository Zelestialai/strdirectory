-- Migration 057: Real vendor seed — Washington DC market
-- Genuine, independently verified businesses operating in Washington, D.C.,
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'GuestPrep', 'guestprep-washington-dc', 'Tailored Airbnb & short-term rental cleaning led by Airbnb superhosts',
  'GuestPrep is a tailored cleaning and laundry service for Airbnb and short-term rental hosts in Washington, DC, led by current Airbnb superhosts and operators with 20 years of experience managing 5-star hotels.',
  'https://www.guestprep.com/airbnb-cleaning-dc',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Great Dwellings', 'great-dwellings-washington-dc', 'Full-service Airbnb & short-term rental management based in Washington, DC',
  'Great Dwellings is a Washington, DC-based property management company helping homeowners maximize Airbnb and short-term vacation rentals, with revenue performance, dynamic pricing, host relations, 24/7 hospitality, and maintenance services.',
  'https://www.greatdwellings.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'iSky Films', 'isky-films-washington-dc', 'Part 107-certified drone photography & aerial video for DC real estate',
  'iSky Films provides Part 107 certified drone photography and aerial videography services for real estate listings throughout Washington, DC, navigating the city''s restricted Special Flight Rules Area with proper FAA certifications.',
  'https://iskyfilms.com/washington-dc',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Ace Handyman Services', 'ace-handyman-services-washington-dc', 'Professional home repair serving Capitol Hill, Georgetown & Dupont Circle',
  'Ace Handyman Services serves homeowners throughout the District including Capitol Hill, Georgetown, Dupont Circle, Kalorama, Adams Morgan, and Southeast DC, with a 1-year service warranty on all handyman work.',
  'https://www.acehandymanservices.com/offices/washington-dc',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Washingtopia Real Estate', 'washingtopia-real-estate-washington-dc', 'Locally owned residential real estate brokerage serving DC neighborhoods',
  'Washingtopia is a locally owned residential real estate brokerage with a friendly, professional approach to buying and selling homes in Washington, DC, serving Georgetown, Capitol Hill, and other DC neighborhoods.',
  'https://washingtopia.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Lorla Studio', 'lorla-studio-washington-dc', 'Luxury residential interior design studio based in Washington, DC',
  'Lorla Studio is a Washington, DC based interior design studio specializing in luxury residential renovations, remodels, and custom hospitality space design, with services in Bethesda, Chevy Chase, Georgetown, and throughout DC.',
  'https://www.lorlastudio.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'BBCDC Construction & Renovations', 'bbcdc-construction-renovations-washington-dc', 'Premier construction company for high-end home renovations in DC',
  'BBCDC Construction & Renovations is a Washington, DC general contractor specializing in high-end home renovations, working with homeowners across the District on whole-home remodels and custom construction projects.',
  'https://bbcbuildsdc.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'John C. Walsh, CPA', 'john-walsh-cpa-washington-dc', 'Full-service tax, accounting & business consulting firm in Washington, DC',
  'John C. Walsh, CPA is a full-service tax, accounting, and business consulting firm located in Washington, DC, providing experienced tax and accounting professionals to small businesses and individuals.',
  'https://www.jcwcpa.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'GEBCO Insurance', 'gebco-insurance-washington-dc', 'Independent insurance agency serving Washington DC & Maryland since 1971',
  'GEBCO Insurance has provided homeowners, renters, auto, and motorcycle insurance plans to Washington, DC and Maryland residents since 1971, with multiple locations and one-on-one service from trained insurance experts.',
  'https://www.gogebco.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Room & Board', 'room-and-board-washington-dc', 'Modern furniture & home decor showroom in downtown Washington, DC',
  'Room & Board operates a modern furniture store in Washington, DC with four floors of design inspiration spanning living rooms, dining rooms, bedrooms, and outdoor furniture for DC-area homes.',
  'https://www.roomandboard.com/stores/washington-dc',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Poseidon Systems', 'poseidon-systems-washington-dc', 'Smart home & security system installation serving Washington DC since 1983',
  'Poseidon Systems offers advanced smart home and security system installations for homeowners and businesses across the Washington, DC area, serving local clients since 1983.',
  'https://poseidonsystems.net/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Antonoplos & Associates', 'antonoplos-associates-washington-dc', 'Residential real estate law firm serving DC, Maryland & Virginia',
  'Antonoplos & Associates represents residential real property owners throughout Washington, DC, Maryland, and Virginia in all aspects of residential real estate transactions and disputes.',
  'https://www.antonlegal.com/',
  c.id, 'Washington DC', 'DC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
