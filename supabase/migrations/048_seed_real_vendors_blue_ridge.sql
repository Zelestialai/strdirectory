-- Migration 048: Real vendor seed — Blue Ridge GA market
-- Genuine, independently verified businesses operating in North Georgia's
-- Blue Ridge / Ellijay mountain region, sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The MountainClean Team', 'mountainclean-team-blue-ridge', 'Detail-focused turnover cleaning for Blue Ridge & Ellijay cabins',
  'The MountainClean Team serves vacation rental owners across Blue Ridge and Ellijay, Georgia, delivering guest-ready cabins between every stay with careful attention to detail and dependable scheduling.',
  'https://www.mountaincleanteam.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Southern Comfort Cabin Rentals', 'southern-comfort-cabin-rentals-blue-ridge', 'Cabin rental management across North Georgia for nearly 20 years',
  'Southern Comfort Cabin Rentals has managed cabin and vacation rentals across North Georgia for nearly two decades, serving owners from Blue Ridge and Ellijay to Big Canoe and Blairsville.',
  'https://www.southerncomfortcabinrentals.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blue Ridge Drones', 'blue-ridge-drones', 'FAA-certified real estate & vacation rental photography in North Georgia',
  'Blue Ridge Drones is an FAA Part 107 certified and fully insured real estate media company based in Blue Ridge, GA, offering photography, video, drone, and floor plan services for real estate listings and vacation rentals across the North Georgia mountains.',
  'https://blueridgedrone.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Eagle Home Repair Services', 'eagle-home-repair-services-ellijay', 'Home repair, remodeling & handyman work across North Georgia',
  'Eagle Home Repair Services serves Ellijay, Jasper, Blue Ridge, and the surrounding North Georgia area with home repair, remodeling, and general handyman work including bathroom and kitchen remodeling, deck repairs, and painting.',
  'https://www.eaglehomerepairservices.com/',
  c.id, 'Ellijay', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Mountain Place Realty', 'mountain-place-realty-blue-ridge', 'Helping families find mountain homes across North Georgia for 20+ years',
  'Mountain Place Realty has helped families find mountain homes in Blue Ridge, Ellijay, Blairsville, and the surrounding North Georgia mountains for more than 20 years, led by broker Rhonda Thomas.',
  'https://mountainplacerealty.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Studio Trimble', 'studio-trimble-blue-ridge', 'Full-service interior design & furniture dealership in Historic Downtown Blue Ridge',
  'Studio Trimble is a full-service interior design firm and furniture dealership located in Historic Downtown Blue Ridge, Georgia, offering professional design and decoration services for North Georgia mountain homes.',
  'https://studiotrimble.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'RWB Contracting', 'rwb-contracting-ellijay', 'Construction, remodeling & renovation across North Georgia for 20+ years',
  'RWB Contracting has spent more than 20 years delivering quality construction, remodeling, and renovation work to homeowners and builders throughout Gilmer, Pickens, Fannin, Dawson, Murray, and Lumpkin counties in North Georgia.',
  'http://rwbhomebuilder.com/',
  c.id, 'Ellijay', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Strickland and Associates, P.C.', 'strickland-and-associates-blairsville', 'Tax, accounting & payroll firm serving Blairsville and North Georgia',
  'Strickland and Associates, P.C. is a Blairsville, Georgia tax, accounting, and payroll firm serving individuals and businesses throughout the North Georgia mountain region.',
  'https://www.stricklandcpas.com/',
  c.id, 'Blairsville', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blue Ridge Insurance', 'blue-ridge-insurance', 'Independent homeowners, landlord & renters insurance agency in Blue Ridge',
  'Blue Ridge Insurance is an independent insurance agency located in Blue Ridge, Georgia, offering homeowners, landlord protection, renters, commercial, auto, and flood insurance from multiple carriers.',
  'https://www.blueridgeins.net/landlord-protection',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Town & Country Furniture & Appliances', 'town-and-country-furniture-blue-ridge', 'Family-owned furniture & appliance store in Blue Ridge, Georgia',
  'Town & Country Furniture & Appliances is a family-owned furniture and appliance store located in Blue Ridge, Georgia, serving homeowners and rental property owners throughout the North Georgia mountains.',
  'https://www.tcfurn.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blue Ridge Surveillance', 'blue-ridge-surveillance', 'Custom home automation & security camera installs in Blue Ridge, GA',
  'Blue Ridge Surveillance provides home automation solutions and security camera installation in Blue Ridge, Georgia, with customized plans ranging from single smart-device automation to full smart-home systems.',
  'https://www.blueridgesecuritycameras.com/services/home-automation-systems-installation/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Wilson Pruitt LLC', 'wilson-pruitt-blue-ridge', 'North Georgia real estate closing attorneys serving Blue Ridge & Ellijay',
  'Wilson Pruitt LLC is a North Georgia real estate closing law firm with offices in Blue Ridge and Ellijay, bringing more than 40 years of combined expertise to complex mountain titles, easements, and real estate transactions across Fannin, Gilmer, and Union counties.',
  'https://wilsonpruittlaw.com/',
  c.id, 'Blue Ridge', 'GA', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
