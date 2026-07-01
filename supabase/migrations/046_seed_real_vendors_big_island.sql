-- Migration 046: Real vendor seed — Big Island HI market
-- Genuine, independently verified businesses operating on Hawaii Island,
-- sourced via public web research on 2026-06-24.
-- is_verified/avg_rating/review_count left at honest defaults (false / 0 / 0).

-- cleaning-turnover
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Akamai Cleaning Services', 'akamai-cleaning-services-kona', 'Vacation rental turnover cleaning on the Kona Coast for 20+ years',
  'Akamai Cleaning Services is a licensed, bonded, and insured cleaning company serving the Kona Coast of Hawaii Island for more than two decades, performing vacation rental turnovers with a consistent in-house crew rather than subcontractors.',
  'https://www.akamaicleaningkona.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'cleaning-turnover' and p.role = 'admin'
on conflict (slug) do nothing;

-- property-management
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Knutson & Associates', 'knutson-and-associates-kona', 'Boutique vacation rental management on the Kona Coast since 1974',
  'Knutson & Associates is a boutique real estate and vacation rental management brokerage that has served the Kona Coast of Hawaii Island for fifty years, managing roughly 300 properties along with sales and second-home purchases.',
  'https://www.konahawaiirentals.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'property-management' and p.role = 'admin'
on conflict (slug) do nothing;

-- photography-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'PanaViz', 'panaviz-kona', 'Real estate and resort photography across the Kona-Kohala Coast',
  'PanaViz is a Kona-based real estate and resort photography studio shooting listings, vacation rentals, and resort properties across Hualalai, Mauna Kea, Waikoloa, and the Kohala Coast of Hawaii Island.',
  'https://www.panaviz.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'photography-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- maintenance-repairs
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Kona Handyman Service LLC', 'kona-handyman-service', 'General handyman and home repair services in Kailua-Kona',
  'Kona Handyman Service LLC provides general home repair, maintenance, and handyman work for homeowners and rental property managers throughout the Kailua-Kona area of Hawaii Island.',
  'https://www.handymankailuakonahi.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'maintenance-repairs' and p.role = 'admin'
on conflict (slug) do nothing;

-- real-estate
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Penn Henderson Real Estate', 'penn-henderson-real-estate-kona', '25 years of Kona Coast luxury and investment real estate expertise',
  'Penn Henderson is a Kona-based REALTOR with 25 years of experience on Hawaii Island, specializing in luxury homes, oceanfront property, condos, and investment real estate along the Kona and Kohala coasts.',
  'https://pennhenderson.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'real-estate' and p.role = 'admin'
on conflict (slug) do nothing;

-- interior-design
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Studio Palomino', 'studio-palomino-kona', 'Award-winning boutique interior design studio in Kailua-Kona',
  'Studio Palomino is an award-winning boutique interior design studio based in Kailua-Kona, led by principal designer Barbie Palomino, with more than 15 years of experience designing homes across Hawaii Island.',
  'https://www.studio-palomino.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'interior-design' and p.role = 'admin'
on conflict (slug) do nothing;

-- renovation
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Benchmark Construction', 'benchmark-construction-kona', 'General contractor for new construction & remodels in Kona since the 1980s',
  'Benchmark Construction is a Kailua-Kona general contractor with more than 40 years of experience handling new construction, remodeling, additions, and restoration for residential and commercial clients on Hawaii Island.',
  'https://benchmarkhawaii.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'renovation' and p.role = 'admin'
on conflict (slug) do nothing;

-- accounting-tax
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Egdamin, Hu CPA Inc.', 'egdamin-hu-cpa-hilo', 'Tax, bookkeeping & payroll serving Hawaii Island since the 1980s',
  'Egdamin, Hu CPA Inc. is a Hilo-based accounting firm providing bookkeeping, payroll, GE tax filings, and business tax preparation to clients across Hawaii Island, including Waimea, Pahoa, Hilo, Volcano, and Kailua-Kona.',
  'https://www.eghucpa.com/',
  c.id, 'Hilo', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'accounting-tax' and p.role = 'admin'
on conflict (slug) do nothing;

-- insurance
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Paradise Insurance LLC', 'paradise-insurance-kona', 'Independent home, landlord & rental insurance agency in Kailua-Kona',
  'Paradise Insurance LLC is an independent insurance agency in Kailua-Kona offering homeowners, landlord, business liability, and general liability insurance sourced from multiple carriers for Hawaii Island property owners.',
  'https://paradiseinsurance.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'insurance' and p.role = 'admin'
on conflict (slug) do nothing;

-- furniture-supplies
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Kaloko Furniture', 'kaloko-furniture-kona', 'Hawaii Island''s largest in-stock furniture selection',
  'Kaloko Furniture, located in the Kaloko Industrial area of Kailua-Kona, offers the largest in-stock selection of living room, dining room, and bedroom furniture on Hawaii Island for homeowners and rental property owners.',
  'https://kalokofurniture.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'furniture-supplies' and p.role = 'admin'
on conflict (slug) do nothing;

-- smart-home-tech
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'LunaKai Hawaii LLC', 'lunakai-hawaii-kona', 'Licensed AV and smart home integration on the Kona-Kohala Coast',
  'LunaKai Hawaii LLC is a licensed audio-visual design and integration contractor based on Hawaii Island, serving the Kona-Kohala coast with home theater, whole-home audio/video, networking, lighting, and smart home automation installs.',
  'https://www.lunakaihawaii.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'smart-home-tech' and p.role = 'admin'
on conflict (slug) do nothing;

-- legal-regulations
insert into public.vendors (business_name, slug, tagline, description, website, category_id, city, state, user_id, is_verified, is_featured, is_active, avg_rating, review_count)
select 'Olson & Sons, Attorneys-at-Law', 'olson-and-sons-attorneys-kona', 'Real estate, property law & civil litigation on Hawaii Island since 1973',
  'Olson & Sons, Attorneys-at-Law is a Kailua-Kona and Waimea law firm practicing on Hawaii Island since 1973, handling real estate and property law, land use, construction law, and business law matters.',
  'https://hawaiinuilawyer.com/',
  c.id, 'Kona', 'HI', p.id, false, false, true, 0, 0
from public.categories c, public.profiles p
where c.slug = 'legal-regulations' and p.role = 'admin'
on conflict (slug) do nothing;
