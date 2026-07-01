-- Migration 053: Real vendor seed — Chattanooga TN market
-- Genuine, independently verified businesses operating in Chattanooga, Tennessee,
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Nooga Maids', 'nooga-maids-chattanooga', 'Airbnb & vacation rental turnover cleaning across Chattanooga',
  'Nooga Maids provides Airbnb and vacation rental cleaning across Chattanooga and Tennessee, offering fast turnover cleaning, restocking, and a guest-ready guarantee between stays.',
  'https://noogamaids.com/services/airbnb',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'ChattaStays', 'chattastays-chattanooga', 'Trusted local Airbnb, VRBO & vacation home management in Chattanooga',
  'ChattaStays is a trusted Chattanooga property management company for Airbnb, VRBO, and vacation homes, having earned Airbnb Superhost, Guest Favorite, and VRBO Premiere Host status for five consecutive years.',
  'https://chattastays.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Gig City Drones', 'gig-city-drones-chattanooga', 'Family-owned licensed & insured drone photography serving Chattanooga',
  'Gig City Drones is a trusted local, family-owned drone photography and mapping company serving Chattanooga, Tennessee and Northern Georgia with licensed and insured aerial operators.',
  'https://gigcitydrones.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Andy OnCall Chattanooga', 'andy-oncall-chattanooga', 'Licensed, bonded & insured handyman services across Chattanooga',
  'Andy OnCall Chattanooga makes handyman projects, repairs, and maintenance hassle-free, sending skilled local handymen across the Chattanooga region and is licensed, bonded, and insured to work in Tennessee and Georgia.',
  'https://www.andyoncall.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The Group Real Estate Brokerage', 'the-group-real-estate-brokerage-chattanooga', 'Locally focused residential real estate brokerage in Chattanooga',
  'The Group Real Estate Brokerage is a Chattanooga, Tennessee real estate firm helping buyers and sellers navigate residential transactions throughout the Chattanooga metro area.',
  'https://www.thegroupchattanooga.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Frost Designs Inc.', 'frost-designs-chattanooga', 'Premier residential & commercial interior design in Chattanooga',
  'Frost Designs Inc. provides top-tier interior design solutions in Chattanooga, Tennessee, specializing in both residential and commercial projects that transform spaces into functional, elegant environments.',
  'https://frostdesignsinc.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Mountain City Construction', 'mountain-city-construction-chattanooga', 'Trusted Chattanooga remodeling & custom construction for 40+ years',
  'Mountain City Construction has more than 40 years of experience in home remodeling and is one of the most trusted construction companies in Chattanooga, specializing in bathroom remodels and custom construction.',
  'https://www.mtncityconstruction.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Ruhling & Associates, CPAs', 'ruhling-associates-cpas-chattanooga', 'Full-service tax, accounting & business consulting firm in Chattanooga',
  'Ruhling & Associates, CPAs is a full-service tax, accounting, and business consulting firm located in Chattanooga, Tennessee, serving individuals and businesses throughout the region.',
  'https://www.ruhlingcpas.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Atlas Insurance Agency LLC', 'atlas-insurance-agency-chattanooga', 'Independent insurance agency headquartered in Chattanooga',
  'Atlas Insurance Agency LLC is an independent insurance agency headquartered in Chattanooga, Tennessee, providing home, auto, business, and life insurance guidance to individuals, families, and businesses across the region.',
  'https://www.atlasinsurancetn.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Huck and Peck Furniture Store', 'huck-and-peck-furniture-chattanooga', 'Voted Best Furniture Store in Chattanooga nine years running',
  'Huck and Peck Furniture Store has been voted Best Furniture Store in Chattanooga nine years in a row, with a 20,000-square-foot showroom stocked with sofas, sectionals, beds, dining tables, and office furniture from quality brands.',
  'https://huckandpeck.com/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Morgan Alarm Systems', 'morgan-alarm-systems-chattanooga', 'Custom home automation & security installation throughout Chattanooga',
  'Morgan Alarm Systems installs fully customized home automation solutions including smart lighting, smart thermostats, automated door locks, garage door control, and integrated security cameras throughout Chattanooga and the surrounding area.',
  'https://www.morganalarmsystems.com/home-automation',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Wooden Law Firm', 'wooden-law-firm-chattanooga', 'Award-winning Chattanooga real estate & business law firm with 30+ years of experience',
  'Wooden Law Firm has more than 30 years of award-winning experience handling real estate and business law matters in Chattanooga, Tennessee, and is licensed to practice in Tennessee, Georgia, Alabama, Oklahoma, Arkansas, and Texas, with an affiliated title company.',
  'https://www.woodenlaw.com/practice-areas/real-estate-law/',
  c.id, 'Chattanooga', 'TN', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
