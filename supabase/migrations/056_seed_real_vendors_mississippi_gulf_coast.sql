-- Migration 056: Real vendor seed — Mississippi Gulf Coast MS market
-- Genuine, independently verified businesses operating along the Mississippi Gulf Coast
-- (Biloxi, Gulfport, Ocean Springs, etc.), sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).
-- Note: this market already contained 24 fictional Tier 5 seed vendors which were
-- previously deactivated (is_active=false); those are untouched by this migration.

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Coastal Carpet Care', 'coastal-carpet-care-biloxi', 'Fast turnover cleaning for vacation rentals across the Mississippi Gulf Coast',
  'Coastal Carpet Care offers fast, thorough turnover cleanings for vacation rentals, Airbnbs, and short-term rental properties across Biloxi, Gulfport, Ocean Springs, and D''Iberville, Mississippi, working around guest booking schedules.',
  'https://www.coastalcarpetcares.com/biloxi-ms',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Christie''s Gulf Beach Rentals', 'christies-gulf-beach-rentals-biloxi', 'Vacation rental management spanning the entire Mississippi Gulf Coast',
  'Christie''s Gulf Beach Rentals (Gulf Coast Property Management) manages vacation rental properties across Pascagoula, Moss Point, Gautier, Ocean Springs, D''Iberville, Biloxi, Gulfport, Long Beach, Pass Christian, Bay St. Louis, and Waveland, Mississippi.',
  'https://christiesgulfbeachrentals.com/about-us/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'G-Hub Photo', 'g-hub-photo-ocean-springs', 'Real estate, drone & video walkthrough photography for the Mississippi Gulf Coast',
  'G-Hub Photo provides professional real estate photography, drone video, and walkthrough media serving Biloxi, Ocean Springs, Pascagoula, and Gulfport, Mississippi.',
  'https://www.ghubphoto.com/',
  c.id, 'Ocean Springs', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Back Bay Handymen', 'back-bay-handymen-biloxi', 'Quick & efficient handyman services across the Mississippi Gulf Coast',
  'Back Bay Handymen serves Biloxi, D''Iberville, Gulfport, Ocean Springs, and other Gulf Coast Mississippi communities with quick and efficient general home repair and maintenance services.',
  'https://www.backbayhandymen.com/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The Demoran Realty Group', 'demoran-realty-group-ocean-springs', 'Boutique real estate brokerage serving the Mississippi Gulf Coast',
  'The Demoran Realty Group is a trusted boutique real estate brokerage based in Ocean Springs, Mississippi, serving Ocean Springs, D''Iberville, Biloxi, Gulfport, Long Beach, Pass Christian, Moss Point, Gautier, and Pascagoula.',
  'https://www.demoranrealtygroup.com/',
  c.id, 'Ocean Springs', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'MLR Interior Design', 'mlr-interior-design-ocean-springs', 'Full-service interior design firm based in Ocean Springs, MS',
  'MLR Interior Design is a full-service interior design firm based in Ocean Springs, Mississippi, with projects across the Mississippi Gulf Coast including Biloxi, Bay St. Louis, Gulfport, and Long Beach, specializing in new construction and furniture planning.',
  'https://www.mlrinteriordesign.com/',
  c.id, 'Ocean Springs', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Mendenhall Contracting', 'mendenhall-contracting-gulfport', 'Veteran-owned general contracting & renovation across the Mississippi Gulf Coast',
  'Mendenhall Contracting provides licensed, veteran-owned general contracting, construction, and renovation services on the Mississippi Gulf Coast, serving Gulfport, Ocean Springs, Bay St. Louis, and Saucier.',
  'https://www.mendenhallcontracting.com/',
  c.id, 'Gulfport', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Piltz, Williams, LaRosa & Company', 'piltz-williams-larosa-biloxi', 'Certified public accountants serving the Mississippi Gulf Coast',
  'Piltz, Williams, LaRosa & Company is a certified public accounting firm located at 1077 Tommy Munro Drive in Biloxi, Mississippi, providing tax, accounting, and consulting services to the Mississippi Gulf Coast.',
  'https://pwlcpa.com/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Betsy Taylor Insurance Agency', 'betsy-taylor-insurance-biloxi', 'Full-service independent insurance agency on the Mississippi Gulf Coast',
  'Betsy Taylor Insurance Agency is a full-service independent insurance agency located at 2436D Pass Road in Biloxi, Mississippi, providing comprehensive business and personal insurance, including homeowners and flood coverage, to the Mississippi Gulf Coast.',
  'https://www.betsytaylorins.com/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Luckies Furniture Warehouse', 'luckies-furniture-warehouse-biloxi', 'Family-owned furniture & mattress warehouse serving the Mississippi Gulf Coast',
  'Luckies Furniture Warehouse is a family owned furniture and mattress store located in Biloxi, Mississippi, offering home furniture and mattresses to Biloxi, Gulfport, and Ocean Springs at discount prices.',
  'https://www.luckiesfurniturebiloxi.com/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Tapper Security, Inc.', 'tapper-security-biloxi', 'Locally owned security & home automation company with 30+ years on the Gulf Coast',
  'Tapper Security & Home Management Systems is a locally owned, Mississippi Gulf Coast-based company at 15113 Lemoyne Boulevard in Biloxi, with more than 30 years of experience installing and monitoring residential security and home automation systems.',
  'https://www.tappersecurity.com/',
  c.id, 'Biloxi', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Rushing & Guice, P.L.L.C.', 'rushing-guice-ocean-springs', 'Mississippi Gulf Coast law firm in practice for over 100 years',
  'Rushing & Guice, P.L.L.C. offers business, family, real estate, personal injury, and estate law legal services on the Mississippi Gulf Coast, based in Ocean Springs with an additional Biloxi office, and has been an active law firm for over 100 years.',
  'https://rushingguice.com/',
  c.id, 'Ocean Springs', 'MS', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
