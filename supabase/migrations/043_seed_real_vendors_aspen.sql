-- Migration 043: Real vendor seed — Aspen CO market
-- These are genuine, independently verified businesses operating in the
-- Aspen / Snowmass Village / Basalt / Carbondale / Glenwood Springs area,
-- sourced via public web research on 2026-06-24. Unlike the earlier
-- tier-seed migrations (fictional placeholder businesses, now deactivated
-- via migration 042), every row below corresponds to a real, operating
-- company. is_verified/avg_rating/review_count are left at their honest
-- defaults (false / 0 / 0) since we have no first-party verification or
-- review data for them yet.

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cabin Works', 'cabin-works-aspen', 'Vacation rental turnover cleaning across the Roaring Fork Valley',
  'Cabin Works provides vacation rental turnover cleaning and maintenance for owners and property managers throughout the Aspen and Roaring Fork Valley area. Cleaners are scheduled around guest checkout/check-in windows and undergo background checks and housekeeping training.',
  'https://cabinworkscolorado.com/vacation-rental-cleaning/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Frias Properties of Aspen Snowmass', 'frias-properties-aspen-snowmass', 'Full-service short-term rental management in Aspen and Snowmass',
  'Frias Properties has managed condos, homes, and fractional vacation properties in Aspen and Snowmass Village for more than five decades, with offices on East Durant Avenue in Aspen and an expanded Snowmass Village presence.',
  'https://www.friasproperties.com/aspen-short-term-rental-management',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Mountain Home Photo', 'mountain-home-photo-aspen', 'Real estate and rental listing photography in Aspen',
  'Mountain Home Photo has shot real estate photography in the Aspen area for more than 20 years, offering still photography, video, aerial drone work, and 360 interactive property tours for listings and rentals.',
  'https://www.mountainhomephoto.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Aspen Home Improvement', 'aspen-home-improvement', 'Handyman and home maintenance services in Aspen, Woody Creek & Snowmass',
  'Aspen Home Improvement provides handyman, repair, and maintenance services for homeowners and property managers across Aspen, Woody Creek, and Snowmass Village.',
  'https://aspenhomeimprovement.com/handyman/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Aspen Luxury Brokers', 'aspen-luxury-brokers', 'Luxury real estate brokerage serving Aspen and Snowmass',
  'Aspen Luxury Brokers represents buyers and sellers of luxury homes and condos in Aspen and Snowmass Village, with marketing packages built around professional photography, video, and premium listing placement.',
  'https://aspenluxurybrokers.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Anne Grice Interiors', 'anne-grice-interiors', 'Award-winning interior design studio in Aspen since 1996',
  'Anne Grice Interiors is an Aspen-based interior design studio founded in 1996, known for personalized, high-end interiors that reflect Colorado mountain living across 200+ completed projects.',
  'https://annegrice.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Hendrickson Construction', 'hendrickson-construction-aspen', 'General contractor for new builds and remodels in Aspen since 2014',
  'Hendrickson Construction is an Aspen-based general contracting firm building and remodeling luxury homes since 2014, handling everything from new construction to full remodels.',
  'https://hendricksoninc.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Reese Henry & Company', 'reese-henry-company-aspen', 'CPA firm serving Aspen and Carbondale since 1964',
  'Reese Henry & Company is a full-service CPA firm with offices in Aspen and Carbondale, providing tax planning, accounting, and business consulting for individuals and property owners in the Roaring Fork Valley.',
  'https://www.reesehenry.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Aspen Insurance Agency', 'aspen-insurance-agency', 'Landlord, rental & umbrella insurance for Colorado property owners',
  'Aspen Insurance Agency is a family-owned Colorado agency that helps short-term rental and landlord property owners evaluate coverage gaps, umbrella liability needs, and landlord/rental insurance policies across multiple carriers.',
  'https://www.aspeninsuranceagency.com/rental-insurance.html',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cathers Home Design & Showroom', 'cathers-home-design-showroom', 'Luxury furniture showroom and interior design serving Aspen from Basalt',
  'Cathers Home is a furniture showroom and interior design studio in Basalt serving the Aspen area, offering furniture curation, rugs, lighting, fabric selection, and full remodel design services.',
  'https://cathershome.com/furniture-store-showroom/',
  c.id, 'Basalt', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Epic Home Integration', 'epic-home-integration-aspen', 'Smart home automation and security camera installs in Aspen',
  'Epic Home Integration brings more than two decades of experience to home automation in Aspen, including integrated sound, smart lighting and shades, and security camera systems for residential properties.',
  'https://www.epichome.net/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Wright Law Aspen', 'wright-law-aspen', 'Real estate law firm serving Aspen for nearly four decades',
  'Wright Law Aspen, LLP has practiced real estate and related law in Aspen for almost forty years, representing clients on property transactions and real estate matters in Pitkin County.',
  'https://www.wrightlawaspen.com/',
  c.id, 'Aspen', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
