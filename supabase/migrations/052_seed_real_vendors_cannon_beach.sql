-- Migration 052: Real vendor seed — Cannon Beach OR market
-- Genuine, independently verified businesses operating on the North Oregon Coast
-- (Cannon Beach / Seaside / Arch Cape), sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Kukui House Services', 'kukui-house-services-cannon-beach', 'Eco-friendly vacation home cleaning & maintenance on the North Oregon Coast',
  'Kukui House Services provides property care management, house cleaning, and maintenance for vacation homes and rentals in Cannon Beach, Arch Cape, Seaside, and Gearhart, Oregon, servicing over 140 homes using eco-friendly products.',
  'https://www.kukuihouse.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cannon Beach Property Management', 'cannon-beach-property-management', 'Oregon Coast vacation rental management since 1986',
  'Cannon Beach Property Management (CBPM) has provided guests a home away from home on the scenic Oregon Coast since 1986, managing oceanfront and ocean-view homes, cottages, and condominiums throughout Cannon Beach.',
  'https://www.cbpm.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Dan Rice Photography', 'dan-rice-photography-cannon-beach', 'FAA-licensed real estate & drone photography on the Oregon Coast',
  'Dan Rice Photography is an FAA-licensed drone pilot providing real estate photography, aerial imagery, and cinematic video walkthroughs throughout the Oregon Coast, including Cannon Beach, Manzanita, Seaside, Gearhart, Arch Cape, and Pacific City.',
  'https://www.danricephotography.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Beach Home Maintenance', 'beach-home-maintenance-cannon-beach', 'Pacific Northwest coastal home repair, painting & maintenance services',
  'Beach Home Maintenance offers handyman services and Pacific Northwest coastal home maintenance, including home repairs, painting, and cleaning services for vacation properties on the Oregon Coast.',
  'https://beachhomemaintenance.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Duane Johnson Real Estate', 'duane-johnson-real-estate-cannon-beach', 'Cannon Beach''s top real estate office since 1990',
  'Duane Johnson Real Estate, established in 1990, is widely regarded as the leading real estate office in Cannon Beach, serving the Cannon Beach and Arch Cape areas of the Oregon Coast.',
  'https://www.duanejohnson.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'JD Designs', 'jd-designs-cannon-beach', 'Coastal interior design rooted in Cannon Beach',
  'JD Designs is led by Jessica, a designer born and raised in Cannon Beach with deep knowledge of the Oregon Coast and a genuine love for coastal design, serving clients along the North Oregon Coast.',
  'https://jdearingerdesigns.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Coaster Construction', 'coaster-construction-cannon-beach', 'Cannon Beach general contractor shaping the North Oregon Coast since 1973',
  'Coaster Construction is a full-service general contractor specializing in new construction, renovations, remodels, and custom cabinetry, based in Cannon Beach and serving the North Oregon Coast since 1973.',
  'https://coasterconstruction.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'William D. Cote, CPA PC', 'william-cote-cpa-seaside', 'Full-service tax, accounting & business consulting firm in Seaside',
  'William D. Cote, CPA PC is a full-service tax, accounting, and business consulting firm located in Seaside, Oregon, serving individuals and businesses throughout the North Oregon Coast.',
  'http://www.billcotecpa.com/',
  c.id, 'Seaside', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Jeremy Mills — State Farm Insurance', 'jeremy-mills-state-farm-seaside', 'Home, auto & rental property insurance serving the North Oregon Coast since 2007',
  'Jeremy Mills State Farm Insurance Agency has served the Oregon and Washington coast since 2007, offering home, auto, rental property, and life insurance from an office in Seaside covering Cannon Beach, Tillamook, and the surrounding coast.',
  'https://insuresthecoast.com/',
  c.id, 'Seaside', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Sesame + Lilies', 'sesame-and-lilies-cannon-beach', 'Independently owned coastal home furnishings & design store since the 1990s',
  'Sesame + Lilies is an independently owned interior design and home furnishings store in Cannon Beach, Oregon, serving the West Coast with curated furniture and decor for over 20 years.',
  'https://www.sesameandlilies.com/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Oregon Coast Security', 'oregon-coast-security-cannon-beach', 'Home automation, alarms & video surveillance for North Coast properties',
  'Oregon Coast Security provides alarms, video surveillance, and home automation system installation for homes and businesses across the North Oregon Coast, including Cannon Beach and Seaside.',
  'https://www.oregoncoastsecurity.com/home-automation/',
  c.id, 'Cannon Beach', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Lawrence & Lawrence Law, P.C.', 'lawrence-and-lawrence-law-seaside', 'Real estate, estate planning & contracts attorneys serving the Oregon Coast',
  'Lawrence & Lawrence Law, P.C. is a Seaside, Oregon law firm providing real estate, contracts, estate planning, and probate legal services to clients throughout Clatsop County and the North Oregon Coast.',
  'http://lawlawpc.com/',
  c.id, 'Seaside', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
