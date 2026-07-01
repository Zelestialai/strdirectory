-- Migration 051: Real vendor seed — Broken Bow OK market
-- Genuine, independently verified businesses operating in the Broken Bow / Hochatown
-- cabin rental region of southeastern Oklahoma, sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'DLC Cabin Cleaning & Services', 'dlc-cabin-cleaning-broken-bow', 'Short-term rental turnover cleaning for Broken Bow & Hochatown cabins',
  'DLC Cabin Cleaning & Services specializes in short-term rental turnover cleaning for cabin owners throughout Broken Bow and Hochatown, Oklahoma, helping hosts keep properties guest-ready between stays.',
  'https://cabincleaningpro.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Grand Welcome Broken Bow & SE Oklahoma', 'grand-welcome-broken-bow', 'Boutique full-service vacation rental management in Broken Bow & Hochatown',
  'Grand Welcome Broken Bow & SE Oklahoma is a locally based, full-service vacation rental management company offering listing, dynamic pricing, guest support, housekeeping, and maintenance for cabin owners in Broken Bow and Hochatown.',
  'https://www.grandwelcome.com/destination/oklahoma-broken-bow',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Cameron Photography', 'cameron-photography-broken-bow', 'Real estate, drone & aerial photography based in Broken Bow',
  'Cameron Photography, owned by Matt Cameron, is a Broken Bow, Oklahoma-based photography studio specializing in real estate and aerial drone photography and videography for cabin listings and rental properties.',
  'https://cameronphotographyok.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Samson Handyman Service', 'samson-handyman-service-broken-bow', 'Cabin maintenance, monthly upkeep & yard services in Broken Bow',
  'Samson Handyman Service provides monthly cabin maintenance and yard services for vacation rental owners in Broken Bow, Oklahoma, with same-day emergency repair calls available upon request.',
  'https://www.facebook.com/p/Samson-Handyman-Service-100095701262554/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Kelli Haus, EXP Realty', 'kelli-haus-exp-realty-broken-bow', 'McCurtain County cabin & land real estate specialist',
  'Kelli Haus of EXP Realty specializes in cabin, home, and land listings throughout Broken Bow and McCurtain County, Oklahoma, representing both buyers and sellers of investment cabin properties.',
  'https://www.hauscabins.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Hochatown Mountain Co.', 'hochatown-mountain-co', 'Cabin & home decor destination in the heart of Hochatown',
  'Hochatown Mountain Co. is a cabin and home decor destination in Hochatown, Oklahoma, with over 15 years of experience offering handcrafted furniture and curated mountain-living accents and accessories for vacation rental cabins.',
  'https://www.hochatownmountainco.com/cabin-and-home',
  c.id, 'Hochatown', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Kergos Construction and Design, LLC', 'kergos-construction-design-broken-bow', 'Custom cabin building & remodeling across McCurtain County since 2014',
  'Kergos Construction and Design, LLC serves homeowners throughout McCurtain County, Oklahoma, with over 10 years of experience building custom rustic cabins in Hochatown and homes in Broken Bow and Idabel.',
  'https://www.kergoscabins.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Amelia Daniel CPA, PC', 'amelia-daniel-cpa-broken-bow', 'Broken Bow CPA firm with 20+ years of tax & accounting experience',
  'Amelia Daniel CPA, PC is a certified public accounting firm in Broken Bow, Oklahoma, offering individual and business tax planning and preparation, bookkeeping, payroll, and sales tax services with more than 20 years of experience.',
  'http://ameliadanielcpa.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Oklahoma Farm Bureau Insurance — Broken Bow', 'oklahoma-farm-bureau-insurance-broken-bow', 'Home, farm, auto & cabin insurance agency located in Broken Bow',
  'Oklahoma Farm Bureau Insurance operates a local office at 410 S Park Drive in Broken Bow, Oklahoma, offering home, farm, auto, and cabin insurance products to area residents and vacation rental owners.',
  'https://okfbinsurance.com/broken-bow',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Timber Valley Rustic Furniture', 'timber-valley-rustic-furniture-broken-bow', 'Rustic cabin furniture & custom outdoor poly furniture in Broken Bow',
  'Timber Valley Rustic Furniture operates stores in Broken Bow, Oklahoma, specializing in custom outdoor poly furniture as well as rustic cabin furniture and decor for vacation rental properties.',
  'https://www.timbervalleyrustics.com/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Angwin Electric', 'angwin-electric-broken-bow', 'Security camera & smart home electrical installation in Broken Bow',
  'Angwin Electric provides security camera installation and smart home electrical work in Broken Bow, Oklahoma, helping cabin owners monitor and automate their vacation rental properties.',
  'https://www.angwinelectric.com/security-cameras-broken-bow-ok',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Blocker Law PLLC', 'blocker-law-broken-bow', 'McCurtain County real property & civil litigation law firm',
  'Blocker Law PLLC serves the communities of Broken Bow, Idabel, Hugo, Antlers, and the broader McCurtain County, Oklahoma region, providing legal guidance in real property, construction law, and civil litigation matters.',
  'https://www.blockerlaw.net/',
  c.id, 'Broken Bow', 'OK', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
