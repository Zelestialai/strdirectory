-- Migration 045: Real vendor seed — Bend OR market
-- Genuine, independently verified businesses operating in Bend / Central
-- Oregon, sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Bend Quality Maintenance', 'bend-quality-maintenance', 'Family-run vacation rental cleaning serving Central Oregon since 1991',
  'Bend Quality Maintenance (BQM) is a locally owned, family-run cleaning company serving Central Oregon since 1991, handling vacation rental turnovers with the same crew every turn, linen service, restocking, and photo-verified completion for Airbnb, VRBO, and direct-booking hosts.',
  'https://bendqualitymaintenance.com/air-bnb-cleaning-service/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'BookVRC', 'bookvrc-bend', 'Full-service vacation rental management in Bend, Oregon',
  'BookVRC provides full-service vacation rental property management in Bend, Oregon, handling listing optimization, reservations, guest communication, cleaning coordination, and maintenance for short-term rental owners.',
  'https://bookvrc.com/bend-property-management/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Dry Sky Photography', 'dry-sky-photography-bend', 'Real estate and drone photography across Central Oregon',
  'Dry Sky Photography specializes in real estate photography, drone video, and 3D tours, serving Bend, Redmond, Sunriver, and Sisters with listing-ready imagery for real estate and rental properties.',
  'https://www.dryskyphoto.com',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Fix It Right Handyman Services', 'fix-it-right-handyman-bend', 'Licensed handyman and repair services in Bend, Sisters & Redmond',
  'Fix It Right Handyman Services offers painting, tiling, and general home repairs across Bend, Sisters, and Redmond, Oregon, with licensed and insured pros and more than eight years of experience.',
  'https://www.fixitrightbend.com/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Bend Premier Real Estate', 'bend-premier-real-estate', 'Central Oregon''s #1 independent, locally owned brokerage',
  'Bend Premier Real Estate was the first brokerage in Bend, Oregon recognized by Who''s Who in Luxury Real Estate, representing buyers and sellers across Tetherow, Broken Top, and the wider Central Oregon market with roughly 80 agents.',
  'https://www.bendpremierrealestate.com/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Fishhouse Design Studio', 'fishhouse-design-studio-bend', 'Full-service residential interior design in Bend, Oregon',
  'Fishhouse Design Studio is a full-service residential interior design firm based in Bend, OR, serving Central Oregon clients on complete home renovations, new builds, and furnishing and styling projects.',
  'https://www.fishhousedesign.com/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Bend Craftsmen Company', 'bend-craftsmen-company', 'Custom remodels, new builds & ADUs across Central Oregon',
  'Bend Craftsmen Company is a full-service residential and small commercial general contractor serving all of Central Oregon, specializing in remodels, new builds, additions, finish carpentry, and custom ADUs.',
  'https://www.bendcraftsmencompany.com/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Jones & Roth CPAs & Business Advisors', 'jones-and-roth-cpas-bend', 'Leading CPA and business advisory firm in Central Oregon',
  'Jones & Roth CPAs & Business Advisors is a leading CPA and business advisory firm in Central Oregon with a Bend office serving clients across Bend, Redmond, Sisters, Madras, and Prineville with tax planning, accounting, and advisory services.',
  'https://www.jrcpa.com/locations/bend/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Bend Insurance Agency', 'bend-insurance-agency', 'Independent homeowners & landlord insurance agency in Central Oregon',
  'Bend Insurance Agency is an independent insurance agency in Central Oregon offering homeowners, landlord, auto, and commercial business insurance policies sourced from multiple carriers.',
  'https://bendinsuranceagency.com/services/personal-homeowners-insurance/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Bend Furniture & Design', 'bend-furniture-and-design', 'Modern North American-made furniture store in Bend, Oregon',
  'Bend Furniture & Design operates two showrooms on NW Galveston Ave in Bend, offering quality, largely North American-made furniture and home decor for residential and rental properties.',
  'https://www.bendfurnitureanddesign.com',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'SecuraCore', 'securacore-bend', 'Smart home automation and security installs across Central Oregon',
  'SecuraCore designs and installs home security cameras, Wi-Fi networks, audio, and integrated smart home technology systems, serving Bend, Redmond, Sisters, Sunriver, Tumalo, and Terrebonne.',
  'https://www.mysecuracore.com/bend',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Francis Hansen & Martin LLP', 'francis-hansen-martin-bend', 'Full-service business & real estate law firm in Bend since generations',
  'Francis Hansen & Martin LLP is a full-service law firm specializing in business, real estate, and employment law, providing services throughout Central Oregon for several generations from its Bend office.',
  'https://www.francishansen.com/',
  c.id, 'Bend', 'OR', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
