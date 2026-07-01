-- Migration 050: Real vendor seed — Boston MA market
-- Genuine, independently verified businesses operating in Boston, Massachusetts,
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'House Bliss Cleaning', 'house-bliss-cleaning-boston', 'Vacation rental turnover cleaning across Boston neighborhoods',
  'House Bliss Cleaning provides vacation rental turnover cleaning for hosts across Boston and nearby neighborhoods including the South End, Back Bay, South Boston, Charlestown, East Boston, Cambridge, and Brookline.',
  'https://houseblisscleaning.com/vacation-rental-turnover/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'McNiece Management', 'mcniece-management-boston', 'Full-service Airbnb & short-term rental management in Boston',
  'McNiece Management offers full-service Airbnb property management in Boston, handling listing optimization, dynamic pricing, guest communication, and turnover coordination for short-term rental owners.',
  'https://mcniecemanagement.com/airbnb-property-management-boston/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Boston Real Estate Media', 'boston-real-estate-media', 'Photography, video, 3D tours & drone media across Boston and MA',
  'Boston Real Estate Media offers professional real estate photography, video tours, 3D floor plans, and drone media for real estate listings and rental properties across Boston and all of Massachusetts and southern New Hampshire.',
  'https://bostonrealestatemedia.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Best Handyman Boston', 'best-handyman-boston', 'Award-winning home repair & remodeling in the heart of Boston',
  'Best Handyman Boston is an award-winning home repair and remodeling business located in the heart of Boston, Massachusetts, with all work guaranteed for one year.',
  'https://besthandymanboston.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cabot & Company', 'cabot-and-company-boston', 'Boston real estate experts on Newbury Street for over 35 years',
  'Cabot & Company has been a trusted force in Boston''s real estate market for over 35 years, operating from a boutique office on Newbury Street and offering residential sales, rentals, commercial and investment properties, and property management.',
  'https://cabotandcompany.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Eleven Interiors', 'eleven-interiors-boston', 'Boston interior design studio for urban residences & weekend escapes',
  'Eleven Interiors is a Boston-based interior design firm that designs urban residences, metropolitan homes, and weekend escapes, balancing each client''s needs, aesthetics, and personality.',
  'https://eleveninteriors.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'S+H Construction', 's-and-h-construction-boston', 'Boston''s premier award-winning general contractor for 45+ years',
  'S+H Construction is a full-service general contracting firm based in Boston specializing in custom homes, high-end renovations, and complex residential construction, with over 45 years of award-winning experience in the region.',
  'https://www.shconstruction.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'FJV Tax', 'fjv-tax-boston', 'Boston CPA firm with 25+ years of tax & business advisory experience',
  'FJV Tax is a Boston, MA CPA firm with over 25 years of experience providing tax, accounting, and consulting services for businesses ranging from startups to publicly traded companies.',
  'https://www.fjvtax.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Econosurance', 'econosurance-cambridge', 'Independent home, auto & business insurance agency serving Greater Boston since 1992',
  'Econosurance is an independent insurance agency based in Cambridge, Massachusetts, serving Boston-area families, individuals, and small businesses for over 25 years with home, auto, and commercial insurance from top carriers.',
  'https://econosurance.com/',
  c.id, 'Cambridge', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Boston Interiors', 'boston-interiors', 'New England furniture retailer with style, quality & service since the 1970s',
  'Boston Interiors operates showrooms across New England offering stylish, quality home furniture at an affordable price, serving Boston-area homeowners and rental property owners.',
  'https://www.bostoninteriors.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Boston Automations', 'boston-automations', 'Smart home integration & security systems serving Greater Boston',
  'Boston Automations is a smart home integration company in Boston, MA, offering ClareOne security systems with intrusion detection, fire alarms, video surveillance, and full home automation installs.',
  'https://bostonautomations.com/smart-home-integration-company-boston-ma/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Alavi + Braza, P.C.', 'alavi-braza-boston', 'Real estate closing attorneys serving Massachusetts for two decades',
  'Alavi + Braza, P.C. is a team of seasoned real estate closing attorneys who have represented buyers, sellers, investors, developers, and lenders throughout the Commonwealth of Massachusetts for over two decades.',
  'https://www.alavibraza.com/',
  c.id, 'Boston', 'MA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
