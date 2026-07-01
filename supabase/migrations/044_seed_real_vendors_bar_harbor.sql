-- Migration 044: Real vendor seed — Bar Harbor ME market
-- Genuine, independently verified businesses operating on Mount Desert Island
-- and in Hancock County, Maine, sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'MDI Cleaning Services', 'mdi-cleaning-services', 'Guest-ready turnover cleaning across Mount Desert Island',
  'MDI Cleaning Services provides vacation rental turnover cleaning throughout Mount Desert Island and Ellsworth, including Bar Harbor, Southwest Harbor, and Northeast Harbor, with linens, staging, and detail work geared toward five-star guest reviews.',
  'https://www.mdicleaning.com/',
  c.id, 'Bar Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Salt Air Properties', 'salt-air-properties', 'Full-service vacation rental management in Downeast Maine',
  'Salt Air Properties manages vacation rental homes near Bar Harbor and Acadia National Park, with an in-house turnover team and full-service property management serving owners throughout Hancock and Washington Counties.',
  'https://www.saltairmaine.com/',
  c.id, 'Ellsworth', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Dean Tyler Photography', 'dean-tyler-photography', 'Real estate and vacation rental media for Downeast Maine',
  'Dean Tyler Photography (DTP) is a specialized media provider for the Downeast Maine real estate market, offering high-end real estate and vacation rental photography to help owners and agents make a strong first impression.',
  'https://dtp-realestate.com/',
  c.id, 'Bar Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Brian''s Handyman Service', 'brians-handyman-service-mdi', 'Handyman, remodeling & property caretaking across Hancock County',
  'Brian''s Handyman Service offers exterior, interior, remodeling, minor plumbing/electrical, and seasonal property caretaking services across Bar Harbor, Ellsworth, Hancock, and the surrounding Mount Desert Island region, backed by 20+ years of experience.',
  'https://www.bhsmdi.com/',
  c.id, 'Ellsworth', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The Knowles Company', 'the-knowles-company', 'Real estate and vacation rentals on Mount Desert Island since 1898',
  'The Knowles Company is a Mount Desert Island real estate and vacation rental brokerage founded in 1898, serving Northeast Harbor, Seal Harbor, Bar Harbor, Southwest Harbor, and the broader Downeast Maine coast for more than 125 years.',
  'https://knowlesco.com/',
  c.id, 'Northeast Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Rusticator', 'rusticator-design-mdi', 'Interior design studio and home furnishings shop in Seal Harbor',
  'Rusticator is the design store and showroom of Keeler and Co., an interior design firm that has worked throughout Mount Desert Island since 2017, offering furnishings, decor, and full interior design services from its Seal Harbor location.',
  'https://www.rusticatorshop.com/',
  c.id, 'Seal Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Coastal Maine General Contracting', 'coastal-maine-general-contracting', 'Custom home building and renovation serving Bar Harbor',
  'Coastal Maine General Contracting is a custom home builder and renovation contractor serving the Bar Harbor and Mount Desert Island area, handling framing, finish work, foundations, siding, roofing, and full residential construction.',
  'https://coastalmainegc.com/',
  c.id, 'Bar Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Coston and McIsaac CPAs', 'coston-and-mcisaac-cpas', 'Bar Harbor CPA firm serving Downeast Maine since 1987',
  'Coston and McIsaac CPAs is a full-service tax, accounting, and business consulting firm located in Bar Harbor, providing personalized financial guidance to individuals and businesses, including rental property owners, since 1987.',
  'https://www.costonandmcisaac.com/',
  c.id, 'Bar Harbor', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cross Insurance - Mount Desert Island', 'cross-insurance-mdi', 'Independent insurance agency serving Mount Desert Island homeowners',
  'Cross Insurance is an independent agency with more than seventy years of experience helping homeowners and rental property owners across Mount Desert Island, Bar Harbor, and Ellsworth find homeowner, landlord, and umbrella coverage from multiple carriers.',
  'https://www.crossagency.com/locations/mdi-maine/',
  c.id, 'Mount Desert Island', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Merrill Furniture', 'merrill-furniture-ellsworth', 'Maine''s furniture, mattress & flooring store serving Downeast Maine',
  'Merrill Furniture is an Ellsworth-based furniture store offering living room, bedroom, and dining room furniture, mattresses, home office furniture, and flooring, with delivery throughout the Bar Harbor and Mount Desert Island area.',
  'https://www.merrillfurniture.com/',
  c.id, 'Ellsworth', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Midcoast Smart Systems', 'midcoast-smart-systems', 'Home automation, security & surveillance installs from Bath to MDI',
  'Midcoast Smart Systems designs and installs security, surveillance, and home automation systems for residential and commercial properties across Maine, serving the Mount Desert Island area with over 20 years of low-voltage and smart-home integration experience.',
  'https://midcoastsmartsystems.com/',
  c.id, 'Mount Desert Island', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Gray & Palmer', 'gray-and-palmer-law', 'Real estate law firm serving Hancock County for three decades',
  'Gray & Palmer is a Hancock County law firm with three decades of experience in real estate law, handling leases, contracts, deeds, and closings for clients in Ellsworth, Bar Harbor, Bucksport, and the surrounding Downeast Maine area.',
  'https://grayandpalmerlaw.com/hancock-county/',
  c.id, 'Ellsworth', 'ME', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
