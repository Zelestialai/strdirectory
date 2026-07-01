-- Migration 047: Real vendor seed — Big Sky MT market
-- Genuine, independently verified businesses operating in Big Sky and the
-- greater Bozeman/Gallatin Valley area, sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'MT Cleaning Services', 'mt-cleaning-services-big-sky', 'Airbnb & VRBO turnover cleaning throughout the Big Sky resort area',
  'MT Cleaning Services, based in Big Sky, offers Airbnb and VRBO turnover cleaning throughout Big Sky, Gallatin Gateway, Yellowstone Club, Spanish Peaks, and Moonlight Basin for vacation rental owners and managers.',
  'https://mtcleaningservices.com/big-sky-vacation-rental-cleaning/',
  c.id, 'Big Sky', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Alpine Property Management', 'alpine-property-management-big-sky', 'Veteran-owned vacation rental management in Big Sky, Montana',
  'Alpine Property Management is a veteran-owned vacation rental company managing condos, cabins, and vacation homes throughout Big Sky, Montana, with a local team handling guest service and property maintenance.',
  'https://rentals-alpinebigsky.com/',
  c.id, 'Big Sky', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Messner Media', 'messner-media-big-sky', 'Real estate and rental media for Bozeman and Big Sky listings',
  'Messner Media produces high-quality real estate photography, video, aerial, and floorplan media for real estate agents and rental owners across Bozeman and Big Sky, Montana.',
  'https://messnermedia.co/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Montana Home Services', 'montana-home-services-bozeman', 'Dependable handyman services across Bozeman and Big Sky',
  'Montana Home Services proudly serves the Bozeman and Big Sky area with dependable handyman work, from routine maintenance and quick repairs to custom upgrades and seasonal property care.',
  'https://montanahomeservices.com/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'The Big Sky Real Estate Co.', 'big-sky-real-estate-co', 'Big Sky''s top-producing real estate brokerage since 2016',
  'The Big Sky Real Estate Co. has consecutively ranked as Big Sky, Montana''s top-producing brokerage since its 2016 founding, with more than $6.3 billion in total sales and roughly 53% market share in Big Sky.',
  'https://bigskyrealestate.com/',
  c.id, 'Big Sky', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Big Sky Home Interiors', 'big-sky-home-interiors', 'Premier interior design studio serving Big Sky and Bozeman since the 1990s',
  'Big Sky Home Interiors is a premier interior design studio founded by ASID member Jodee March with over 30 years of experience, serving clients in Big Sky and Bozeman, Montana from its Meadow Village Center showroom.',
  'https://bigskyhomeinteriors.com/',
  c.id, 'Big Sky', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Martel Construction', 'martel-construction-bozeman', 'Residential, commercial & civic contracting across Bozeman and Big Sky',
  'Martel Construction is a leading general contractor serving Bozeman, Big Sky, Kalispell, and Missoula, Montana, with a trusted track record across residential, commercial, and civic construction and remodeling projects.',
  'https://www.martelconstruction.com/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Toran Accounting', 'toran-accounting-bozeman', 'CPA, tax & bookkeeping services across Bozeman, Belgrade, Livingston & Big Sky',
  'Toran Accounting proudly serves businesses and individuals across Bozeman and nearby communities, including Belgrade, Livingston, Big Sky, and Gallatin Gateway, with CPA, tax, accounting, and bookkeeping services.',
  'https://toranaccounting.com/locations/bozeman-mt/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Insurance Unlimited of Bozeman', 'insurance-unlimited-bozeman', 'Independent homeowners, landlord & renters insurance agency in Bozeman',
  'Insurance Unlimited of Bozeman is an independent insurance agency offering homeowners, landlord, and renters insurance policies sourced from multiple carriers for property owners across the Gallatin Valley and Big Sky area.',
  'https://www.insuranceunlimitedofbozeman.com/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Montana Expressions', 'montana-expressions-bozeman', 'Furniture, decor & interior design serving Bozeman and Big Sky for 20+ years',
  'Montana Expressions has served Bozeman, Big Sky, Livingston, Paradise Valley, and the wider Southwest Montana region for more than twenty years with furniture, home decor, and interior design services.',
  'https://montanaexpressions.com/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Smart Home Systems', 'smart-home-systems-bozeman', 'Custom home automation, entertainment & security installs in Bozeman',
  'Smart Home Systems designs and installs customized home automation, entertainment, lighting, and security solutions for residential properties throughout the Bozeman and Big Sky, Montana area.',
  'https://shs-mt.com/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Schwasinger & Fallaw, PC', 'schwasinger-and-fallaw-bozeman', 'Real estate, business & probate law firm in Bozeman, Montana',
  'Schwasinger & Fallaw, PC is a Bozeman, Montana law firm practicing in real estate, business, and probate law, serving property owners and businesses throughout the Gallatin Valley and Big Sky area.',
  'https://www.sflawmt.com/practice-areas/real-estate/',
  c.id, 'Bozeman', 'MT', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
