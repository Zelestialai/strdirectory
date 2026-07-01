-- Migration 049: Real vendor seed — Boone NC market
-- Genuine, independently verified businesses operating in the North Carolina
-- High Country (Boone / Blowing Rock / Banner Elk), sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'High Country Cleaning Service', 'high-country-cleaning-service-boone', 'Locally owned Airbnb & VRBO turnover cleaning for Watauga County',
  'High Country Cleaning Service is a locally owned and operated full-service cleaning company serving Watauga County and the surrounding High Country, specializing in Airbnb turnover, VRBO, vacation property, and deep cleaning.',
  'https://www.highcountrycleaningservice.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Carolina Cabin Rentals, Inc.', 'carolina-cabin-rentals-boone', 'Family-owned vacation rental management for 430+ High Country properties',
  'Carolina Cabin Rentals, Inc., founded in 2008, is a family-owned full-service vacation rental management company serving over 430 properties across Boone, Blowing Rock, Banner Elk, Linville, Beech Mountain, Sugar Mountain, and Valle Crucis, North Carolina.',
  'https://www.carolinacabinrentals.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Jaybird Aerial Photography', 'jaybird-aerial-photography-boone', 'High Country''s premier luxury real estate and aerial media provider',
  'Jaybird Aerial Photography is the High Country''s premier luxury real estate media provider, offering drone aerials, HDR photography, cinematic video, and 3D tours for listings and rentals across Boone, Blowing Rock, Banner Elk, and Linville, North Carolina.',
  'https://www.jaybirdaerials.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Doe Valley Custom Services', 'doe-valley-custom-services-boone', 'Home maintenance and repair across the North Carolina High Country',
  'Doe Valley Custom Services is a home maintenance and repair company based in Boone, NC, serving Boone and most of the High Country including Deep Gap, Blowing Rock, Seven Devils, Foscoe, Banner Elk, Sugar Mountain, and Beech Mountain.',
  'https://www.doevalleycustom.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blue Ridge Realty & Investments', 'blue-ridge-realty-investments-boone', 'Locally owned High Country real estate brokerage since 1981',
  'Blue Ridge Realty & Investments (BRRI) is a locally owned and operated real estate company established in 1981 in the North Carolina High Country, serving Boone, Banner Elk, Beech Mountain, Blowing Rock, West Jefferson, Linville, and Valle Crucis.',
  'https://www.blueridgerealty.net/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Dianne Davant and Associates', 'dianne-davant-and-associates-banner-elk', 'High Country interior design firm serving the region since 1979',
  'Dianne Davant and Associates, founded in 1979 and headquartered in Banner Elk at the foot of Grandfather Mountain, is one of the longest-established interior design firms serving Boone, Blowing Rock, Banner Elk, and Beech Mountain, North Carolina.',
  'https://www.davant-interiors.com/',
  c.id, 'Banner Elk', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Mountain Construction', 'mountain-construction-boone', 'Custom home building, remodeling & restoration in the Boone area',
  'Mountain Construction is a local general contractor based in Boone, NC, designing and building fine custom homes and handling remodeling, restoration, and additions throughout the High Country.',
  'https://www.mountainconstruction.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'S. E. Wilson CPA, P.C.', 'se-wilson-cpa-boone', 'Licensed accounting firm serving Boone, North Carolina',
  'S. E. Wilson CPA, P.C. is a licensed certified public accounting firm based in Boone, North Carolina, providing accounting, bookkeeping, and tax services to individuals and small businesses in the High Country.',
  'https://www.sewilsoncpa.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blue Ridge Insurance Service Inc.', 'blue-ridge-insurance-service-boone', 'Independent homeowners, auto & rental property insurance agency in Boone since 1995',
  'Blue Ridge Insurance Service Inc., started in 1995, is an independent insurance agency in Boone, North Carolina, representing multiple companies to meet clients'' auto, home, and rental property insurance needs.',
  'https://www.blueridgeinsuranceservice.com/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blowing Rock Furniture Gallery', 'blowing-rock-furniture-gallery', 'Family-owned 20,000 sq ft furniture & mattress showroom in Blowing Rock',
  'Blowing Rock Furniture Gallery is a family-owned, 20,000-square-foot furniture and mattress showroom in Blowing Rock, North Carolina, serving Boone, Banner Elk, Linville, Valle Crucis, and the wider High Country.',
  'https://www.blowingrockfurniture.com/',
  c.id, 'Blowing Rock', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Creekside Electronics', 'creekside-electronics-boone', 'High Country home theater & automation specialists since 1976',
  'Creekside Electronics has been locally owned and operated since 1976, serving Boone, Blowing Rock, Valle Crucis, and Banner Elk with home theater installation, home automation systems, and security systems for over 45 years.',
  'https://www.creeksideelectronics.com/about-us/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Deal Moseley di Santi Garrett & Martin, LLP', 'deal-moseley-disanti-garrett-martin-boone', 'Real estate, estate planning & civil litigation attorneys in Boone',
  'Deal Moseley di Santi Garrett & Martin, LLP is a Boone, North Carolina law firm handling real estate transactions, estate planning, and civil litigation for clients throughout Boone, Blowing Rock, Banner Elk, and Linville.',
  'https://www.dealmoseleysmith.com/real-estate/',
  c.id, 'Boone', 'NC', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
