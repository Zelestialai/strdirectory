-- Migration 054: Real vendor seed — Durango CO market
-- Genuine, independently verified businesses operating in Durango, Colorado,
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Lucky Services', 'lucky-services-durango', 'Vacation rental cleaning, laundry & guest prep across Southwest Colorado',
  'Lucky Services handles cleaning, laundry, restocking, and guest prep for vacation rentals in Durango, Ridgway, and Santa Fe, with a standard turnover including full cleaning, bedding changes, towel refresh, and laundry.',
  'https://www.goluckyservices.com/services/vacation-rental',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Durango Colorado Vacations', 'durango-colorado-vacations', 'Full-service Airbnb property management with 30+ years of combined experience',
  'Durango Colorado Vacations, founded in 2004, offers Airbnb property management with bookings, guest communication, and pricing optimization, led by a team with more than 30 years of combined experience in the Durango market.',
  'https://vacationdurango.com/durango-property-management/airbnb-management-durango/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Stelio Media', 'stelio-media-durango', 'Commercial, real estate & drone photography with 20+ years of experience',
  'Stelio Media offers commercial and real estate photography, video, and drone services in Durango, Colorado, with more than 20 years of experience serving agents, builders, designers, and businesses.',
  'https://www.steliomedia.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Durango HomeFix', 'durango-homefix', 'Reliable small repair & maintenance services for Durango homeowners',
  'Durango HomeFix is a residential handyman and maintenance company in Durango, Colorado, offering reliable small repair and maintenance services for homeowners, second-home owners, and property managers.',
  'https://durangohomefix.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Durango Realty', 'durango-realty', 'Durango''s oldest real estate firm, in business for over 40 years',
  'Durango Realty is the oldest real estate firm in Durango, Colorado, in business for over 40 years and specializing in residential sales, commercial real estate, land, farms and ranches, and vacation rentals.',
  'https://durangorealty.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Berg Haus Interior Design', 'berg-haus-interior-design-durango', 'Boutique interior design & project management serving Southwest Colorado',
  'Berg Haus Interior Design is a boutique interior design and project management company based in Durango, Colorado, providing full-service interior design for high-end residences, vacation homes, restaurants, and commercial projects.',
  'https://www.berghaus.design/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Durango Remodeling, LLC', 'durango-remodeling-llc', 'Top Durango general contractor with 300+ residential projects since 1999',
  'Durango Remodeling, LLC has been recognized as a top general contractor in Durango since 1999, completing over 300 residential projects and specializing in large-scale whole-home renovations.',
  'https://durangoremodel.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Tucker, Bechtolt, & DiPonio, P.C.', 'tucker-bechtolt-diponio-durango', 'Full-service tax, accounting & business consulting firm in Durango',
  'Tucker, Bechtolt, & DiPonio, P.C. is a full-service tax, accounting, and business consulting firm located in Durango, Colorado, licensed in Colorado and specializing in tax and accounting services.',
  'https://www.mydurangocpa.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Schield Insurance, Inc.', 'schield-insurance-durango', 'Independent insurance agency serving the Western Slope since 2013',
  'Schield Insurance, Inc. is a Durango, Colorado independent insurance agency and a member of the Strategic Insurance Agency Alliance, providing price-competitive home and auto insurance to the Western Slope since 2013.',
  'https://schield.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Northpoint Home Furnishings', 'northpoint-home-furnishings-durango', 'Family-owned furniture & mattress showroom in downtown Durango since 1977',
  'Northpoint Home Furnishings is a family-owned furniture and mattress store with a 20,000-square-foot showroom in downtown Durango, Colorado, operating since 1977 with brands including La-Z-Boy, Ekornes, and Tempur-Pedic.',
  'https://www.northpointdurango.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Big Blue Protections', 'big-blue-protections-durango', 'Custom home security & automation installation with 30 years of experience',
  'Big Blue Protections LLC is headquartered in Durango, Colorado, and services Southwest Colorado with 30 years of custom home security and automation installation experience.',
  'https://www.bigblueprotections.com/about-us/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The Reynolds Law Group', 'reynolds-law-group-durango', 'Full-service Durango law firm covering real estate & civil litigation',
  'The Reynolds Law Group is a full-service law firm located in Durango, Colorado, serving communities throughout Southwest Colorado with real estate, business, commercial, and civil litigation legal services.',
  'https://www.reynoldslawdurango.com/',
  c.id, 'Durango', 'CO', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
