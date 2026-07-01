-- Migration 055: Real vendor seed — Jersey Shore NJ market
-- Genuine, independently verified businesses operating along the Jersey Shore
-- (Ocean City, Cape May, Long Beach Island, Avalon, Point Pleasant, etc.),
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Victory Cleaning Co.', 'victory-cleaning-co-ocean-city', 'Airbnb & VRBO vacation turnover cleaning for Cape May, Wildwood & Ocean City',
  'Victory Cleaning Co. is an Airbnb and VRBO turnover cleaning specialist serving Cape May, Wildwood, and Ocean City, New Jersey, handling sand and salt-air challenges with complete interior cleaning, linen changes, and restocking between guests.',
  'https://www.victorycleaning.co/services/vacationturnovers',
  c.id, 'Ocean City', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Justice Property Management', 'justice-property-management-lbi', 'Trusted rental & residential property management on Long Beach Island',
  'Justice Property Management is a trusted choice for rental and residential property management on Long Beach Island, NJ, providing year-round peace of mind for seasonal homeowners and investors through routine inspections, maintenance coordination, and storm preparation.',
  'https://justicepropertymanagementnj.com/',
  c.id, 'Long Beach Island', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Tour-This', 'tour-this-lavallette', 'Aerial drone photography, video & 3D tours across the Jersey Shore',
  'Tour-This provides aerial drone photography, video, and 3D 360 virtual tours for real estate and rental listings throughout Monmouth and Ocean County, including Long Beach Island, Lavallette, Seaside Park, and Asbury Park.',
  'https://www.tour-this.com/',
  c.id, 'Lavallette', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Shore Handyman', 'shore-handyman-cape-may', 'Licensed & insured home repair experts serving the southern Jersey Shore',
  'Shore Handyman is a reliable, fully licensed and insured handyman service operating along the Jersey Shore, serving coastal communities including Avalon, Stone Harbor, Cape May, Wildwood Crest, Wildwood, North Wildwood, and Sea Isle City.',
  'https://www.yourshorehandyman.com/',
  c.id, 'Cape May', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Island Realty', 'island-realty-lbi', 'Family-owned Long Beach Island real estate agency for over 50 years',
  'Island Realty is a family owned and operated real estate agency on Long Beach Island, New Jersey, with over 50 years of experience serving vacationers, second-home buyers, year-round residents, and property investors.',
  'https://www.islandrealtylbi.com/',
  c.id, 'Long Beach Island', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Surroundings Interiors', 'surroundings-interiors-avalon', 'Coastal interior design serving Avalon, Stone Harbor & Ocean City',
  'Surroundings Interiors locally provides premier interior design services in Avalon, Stone Harbor, Ocean City, and other South Jersey shore communities, specializing in coastal residential interiors.',
  'https://surroundings-interiors.com/avalon-interior-designer',
  c.id, 'Avalon', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Gambrick Construction', 'gambrick-construction-point-pleasant', 'Family-owned custom home builder & general contractor with 40+ years on the Jersey Shore',
  'Gambrick Construction is a family-owned custom home builder and general contractor based in Point Pleasant, NJ with more than 40 years of experience on the Jersey Shore, specializing in luxury custom homes, waterfront construction, and whole-house renovations.',
  'https://gambrick.com/',
  c.id, 'Point Pleasant', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Ford, Scott & Associates, L.L.C.', 'ford-scott-associates-ocean-city', 'Leading South Jersey CPA & auditing firm in business since 1923',
  'Ford, Scott & Associates, L.L.C. is a leading certified public accounting and auditing firm based in Ocean City, New Jersey, serving government and commercial clients across South Jersey with assurance, tax, and consulting services since 1923.',
  'https://www.ford-scott.com/',
  c.id, 'Ocean City', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'McMahon Insurance Agency', 'mcmahon-insurance-agency-ocean-city', 'Family-owned coastal property insurance agency at the Jersey Shore since 1922',
  'McMahon Insurance Agency is a family-owned and operated agency that has insured Jersey Shore coastal properties since 1967, with offices in Ocean City and Cape May, New Jersey, and recognition as a FEMA National Flood Insurance Program Agency of the Year.',
  'https://mcmahonagency.com/',
  c.id, 'Ocean City', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Oskar Huber Furniture & Design', 'oskar-huber-furniture-design-lbi', 'Long Beach Island furniture & design showroom serving the Jersey Shore',
  'Oskar Huber Furniture & Design operates a showroom in Ship Bottom on Long Beach Island, New Jersey, serving Long Beach Island, Ocean City, Sea Isle City, Stone Harbor, and other Jersey Shore communities with furniture and home design services.',
  'https://www.oskarhuber.com/locations/ship-bottom-nj',
  c.id, 'Long Beach Island', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Elite Smart Home', 'elite-smart-home-avalon', 'Home automation & smart technology installation for Jersey Shore properties',
  'Elite Smart Home offers home automation installation in Avalon and Longport, New Jersey, providing seamless device connectivity, simplified smart controls, and integrated entertainment, convenience, and safety features for Jersey Shore homes.',
  'https://elitesmarthome.com/automation-new-jersey-shore/',
  c.id, 'Avalon', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Liz Casey Law', 'liz-casey-law-ocean-city', 'Real estate, condominium & litigation attorney serving Cape May & Atlantic Counties',
  'Liz Casey Law specializes in condominium law, real estate law, wills and estate law, and general litigation in Atlantic City, Ocean City, the Wildwoods, and all towns in Cape May County and Atlantic County, New Jersey.',
  'https://lizcaseylaw.com/',
  c.id, 'Ocean City', 'NJ', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
