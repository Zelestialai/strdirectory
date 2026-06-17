-- ============================================================
-- Migration 013 — Tier 2 Vendors: Insurance, Furniture & Supplies,
--                 Smart Home & Tech, Legal & Regulations
-- 2 vendors × 4 categories × 8 markets = 64 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- INSURANCE
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Insurance Group', 'colorado-str-insurance-group', 'Short-term rental insurance specialists in Colorado',
  'Colorado STR Insurance Group provides specialized insurance solutions for short-term rental property owners throughout Colorado. We offer STR-specific coverage that fills the gaps left by standard homeowners and landlord policies — protecting you against guest liability, property damage, and lost income.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.8, 76
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High Vacation Rental Insurance', 'mile-high-vacation-rental-insurance', 'Comprehensive STR coverage for Denver & mountain properties',
  'Mile High Vacation Rental Insurance offers tailored insurance packages for Airbnb and VRBO hosts across the Denver metro and Colorado ski markets. Our brokers shop multiple carriers to find the right combination of host liability, property, and income protection coverage for your needs.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Insurance Advisors', 'nola-str-insurance-advisors', 'Vacation rental insurance for New Orleans properties',
  'NOLA STR Insurance Advisors provides specialized short-term rental insurance for property owners in New Orleans and coastal Louisiana. We understand the unique risks of the Gulf Coast market — including hurricane coverage, flood insurance requirements, and historic property considerations.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Coverage', 'crescent-city-str-coverage', 'STR insurance solutions for New Orleans vacation rental hosts',
  'Crescent City STR Coverage helps New Orleans vacation rental owners find the right insurance coverage for their properties. From comprehensive STR policies to flood insurance and guest liability coverage, we protect your investment in one of America''s most unique rental markets.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 52
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Insurance', 'san-diego-str-insurance', 'Vacation rental insurance specialists in San Diego',
  'San Diego STR Insurance provides tailored insurance solutions for short-term rental property owners throughout San Diego County. We specialize in coastal property coverage — including earthquake insurance, landlord liability, and Airbnb host protection — for La Jolla, Pacific Beach, and coastal San Diego properties.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.8, 83
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Coverage SD', 'coastal-coverage-sd', 'STR insurance and liability coverage for San Diego hosts',
  'Coastal Coverage SD helps San Diego vacation rental owners secure proper insurance protection. We offer STR-specific policies that cover guest injuries, property damage, and rental income loss — filling the coverage gaps that standard homeowner policies leave for Airbnb and VRBO hosts.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Insurance Group', 'charleston-str-insurance-group', 'Vacation rental insurance for Charleston area properties',
  'Charleston STR Insurance Group provides specialized insurance coverage for short-term rental owners throughout the greater Charleston area. We understand coastal South Carolina risks — hurricane exposure, flood zones, and historic property values — and build customized policies that fully protect your STR investment.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Coverage', 'lowcountry-str-coverage', 'STR liability and property insurance in Charleston',
  'Lowcountry STR Coverage helps vacation rental owners in the Charleston area find comprehensive insurance protection. Our team sources coverage across multiple carriers to build policies that address coastal flood risk, guest liability, historic property concerns, and income protection.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 55
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Insurance', 'grand-strand-str-insurance', 'Vacation rental insurance across the Myrtle Beach Grand Strand',
  'Grand Strand STR Insurance provides short-term rental insurance for property owners throughout the South Carolina coast. We specialize in coastal coverage for oceanfront condos and beach houses — including wind and hail insurance, flood protection, and guest liability coverage.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 89
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach STR Coverage', 'myrtle-beach-str-coverage', 'STR insurance solutions for Myrtle Beach vacation rental owners',
  'Myrtle Beach STR Coverage helps vacation rental owners along the Grand Strand find the right insurance for their properties. We shop multiple carriers to find coverage that protects against coastal weather events, guest accidents, and rental income loss.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Insurance', 'emerald-coast-str-insurance', 'Vacation rental insurance for Destin & 30A property owners',
  'Emerald Coast STR Insurance provides specialized coverage for vacation rental owners along the Florida Panhandle. We address the unique risks of Gulf Coast properties — including hurricane and storm surge exposure, flood insurance requirements, and high-value luxury property coverage for Destin and 30A homes.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.8, 78
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Vacation Rental Insurance', '30a-vacation-rental-insurance', 'Premium STR insurance coverage along scenic 30A',
  '30A Vacation Rental Insurance provides comprehensive insurance solutions for luxury vacation rental owners along Florida''s 30A corridor. Our policies cover high-value gulf-front properties with appropriate hurricane, flood, guest liability, and income replacement coverage.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Insurance', 'smoky-mountain-str-insurance', 'Cabin insurance specialists in the Great Smoky Mountains',
  'Smoky Mountain STR Insurance provides specialized insurance for vacation rental cabin owners throughout the Great Smoky Mountains. We understand the unique risks of mountain cabin rentals — wildfire exposure, steep terrain, hot tub liability, and remote property concerns — and build policies that fully protect your investment.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Cabin Insurance', 'appalachian-cabin-insurance', 'STR cabin coverage for Smoky Mountain rental owners',
  'Appalachian Cabin Insurance helps vacation rental cabin owners throughout the Smokies region find the right insurance protection. We source coverage that addresses wildfire risk, guest liability at remote properties, hot tub accidents, and seasonal income protection.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 87
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Insurance Specialists', 'chicago-str-insurance-specialists', 'Vacation rental insurance for Chicago Airbnb hosts',
  'Chicago STR Insurance Specialists provides tailored insurance coverage for short-term rental property owners throughout Chicago. We offer STR-specific policies that cover guest liability, property damage, and rental income loss in Chicago''s urban condo and apartment rental market.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.8, 93
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Coverage', 'windy-city-str-coverage', 'STR insurance solutions for Chicago vacation rental owners',
  'Windy City STR Coverage helps Chicago vacation rental owners find comprehensive insurance protection for their properties. Our team shops multiple carriers to build policies that cover urban STR risks — guest injuries, property damage, theft, and rental income loss.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p where c.slug = 'insurance' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- FURNITURE & SUPPLIES
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Furnishings', 'colorado-str-furnishings', 'Turnkey furniture packages for Denver & Colorado STR properties',
  'Colorado STR Furnishings provides complete turnkey furniture packages for short-term rental properties across Colorado. Our mountain-inspired packages include all living, dining, and bedroom furniture, plus kitchen essentials, linens, and décor — everything needed to launch a guest-ready listing fast.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.8, 84
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Supplies', 'mile-high-str-supplies', 'STR startup kits and ongoing supplies for Denver hosts',
  'Mile High STR Supplies provides comprehensive startup kits and ongoing supply restocking for short-term rental owners across the Denver area. From initial setup packages with all furniture and essentials to monthly consumable restocking services, we keep your property guest-ready.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.7, 64
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Furnishings', 'nola-str-furnishings', 'Vacation rental furniture and supply packages in New Orleans',
  'NOLA STR Furnishings provides complete furniture packages and supply solutions for vacation rental owners throughout New Orleans. We offer curated collections that blend New Orleans character with durable, guest-ready furnishings — from Creole-inspired accent pieces to fully outfitted kitchen packages.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.8, 72
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Supply Co', 'crescent-city-str-supply-co', 'STR startup and restocking supplies for New Orleans hosts',
  'Crescent City STR Supply Co provides vacation rental startup packages and ongoing supply restocking for hosts throughout the greater New Orleans area. Our packages include all toiletries, kitchen supplies, linens, and consumables needed to maintain a five-star guest experience.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Furniture Co', 'san-diego-str-furniture-co', 'Turnkey furniture packages for San Diego vacation rentals',
  'San Diego STR Furniture Co provides complete turnkey furniture and supply packages for vacation rental owners throughout San Diego County. Our coastal-inspired collections feature durable, stylish furnishings that hold up to the beach lifestyle while impressing guests with a premium aesthetic.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.8, 91
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal STR Supply SD', 'coastal-str-supply-sd', 'STR supplies and essentials for San Diego vacation rental hosts',
  'Coastal STR Supply SD provides vacation rental startup kits and ongoing supply services for hosts throughout San Diego. From hotel-quality linens and toiletries to complete kitchen supply packages and outdoor entertainment essentials, we have everything your rental needs.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.7, 68
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Furnishings', 'charleston-str-furnishings', 'Vacation rental furniture packages for Charleston properties',
  'Charleston STR Furnishings provides complete furniture and supply packages for vacation rental owners throughout the greater Charleston area. Our Southern-inspired collections feature elegant, durable furnishings that complement the historic character of Charleston properties while meeting all guest comfort expectations.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.8, 79
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Supply Co', 'lowcountry-str-supply-co', 'STR startup kits and supplies for Charleston area hosts',
  'Lowcountry STR Supply Co provides vacation rental startup packages and ongoing supply restocking for hosts throughout the Charleston area. We deliver hotel-quality linens, toiletries, kitchen essentials, and all consumables needed to maintain a five-star guest experience.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Furnishings', 'grand-strand-str-furnishings', 'Beach vacation rental furniture packages in Myrtle Beach',
  'Grand Strand STR Furnishings provides complete furniture and supply packages for vacation rental owners along the South Carolina coast. Our beach-inspired packages feature durable, fun furnishings designed for the high-turnover vacation rental market — all delivered and set up at your property.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 87
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach STR Supplies', 'myrtle-beach-str-supplies', 'Vacation rental supplies and essentials for Myrtle Beach hosts',
  'Myrtle Beach STR Supplies provides startup kits and ongoing supply services for vacation rental owners along the Grand Strand. From premium linens and toiletries to beach gear packages and kitchen essentials, we supply everything your rental needs for stellar guest reviews.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 66
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Furnishings', 'emerald-coast-str-furnishings', 'Luxury vacation rental furniture for Destin & 30A properties',
  'Emerald Coast STR Furnishings provides premium furniture and supply packages for vacation rental properties along the Florida Panhandle. We specialize in the luxury beach aesthetic of the 30A market — high-quality furnishings, premium linens, and curated décor that elevates your property above the competition.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Supply Company', '30a-str-supply-company', 'Premium STR supplies and essentials along scenic 30A',
  '30A STR Supply Company provides premium startup packages and ongoing supply services for vacation rental owners along the 30A corridor. Our curated packages include boutique hotel-quality linens, luxury toiletries, kitchen essentials, and beach supplies tailored to the 30A guest experience.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.7, 73
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Furnishings', 'smoky-mountain-str-furnishings', 'Cabin furniture packages for Smoky Mountain vacation rentals',
  'Smoky Mountain STR Furnishings provides complete cabin furniture and supply packages for vacation rental owners throughout the Great Smoky Mountains. Our rustic-luxury collections include all living, sleeping, and kitchen furnishings plus the cozy mountain décor that Smokies guests love.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.8, 134
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian STR Supplies', 'appalachian-str-supplies', 'Cabin rental startup kits and supplies in the Smokies',
  'Appalachian STR Supplies provides vacation rental startup kits and ongoing supply services for cabin owners throughout the Smoky Mountains. From cozy plaid linens and premium toiletries to fully stocked kitchen packages and outdoor fire pit supplies, we set your cabin up for five-star reviews.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 103
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Furniture Co', 'chicago-str-furniture-co', 'Modern furniture packages for Chicago vacation rental hosts',
  'Chicago STR Furniture Co provides contemporary furniture packages and supply solutions for short-term rental owners throughout Chicago. Our urban-modern collections are designed for Chicago condo and apartment STRs — stylish, durable, and photographically stunning.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.8, 97
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Supplies', 'windy-city-str-supplies', 'STR supply kits and essentials for Chicago Airbnb hosts',
  'Windy City STR Supplies provides comprehensive startup kits and ongoing supply restocking for vacation rental owners throughout Chicago. From hotel-quality linens and premium toiletries to fully stocked kitchen packages, we supply everything your Chicago rental needs.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.7, 74
from public.categories c, public.profiles p where c.slug = 'furniture-supplies' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- SMART HOME & TECHNOLOGY
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado Smart STR Tech', 'colorado-smart-str-tech', 'Smart home automation for Denver & Colorado vacation rentals',
  'Colorado Smart STR Tech installs and configures smart home technology for short-term rental properties across Colorado. We specialize in keyless entry systems, noise monitoring, smart thermostats, and full home automation setups that improve the guest experience and reduce host headaches.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Smart Systems', 'mile-high-str-smart-systems', 'STR technology installation for Denver vacation rental hosts',
  'Mile High STR Smart Systems provides complete smart home technology installation for short-term rental owners throughout the Denver metro. From August smart locks and Ring doorbells to Minut noise monitors and Nest thermostats, we set up the full smart home stack for your rental.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 68
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA Smart Rental Tech', 'nola-smart-rental-tech', 'Smart home technology for New Orleans vacation rentals',
  'NOLA Smart Rental Tech provides smart home technology installation and configuration for vacation rental properties throughout New Orleans. We specialize in noise monitoring (critical for NOLA party properties), keyless entry, and smart HVAC management to keep guests comfortable and neighbors happy.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Automation', 'crescent-city-str-automation', 'Vacation rental smart home setup in New Orleans',
  'Crescent City STR Automation installs and manages smart home systems for vacation rental owners across the greater New Orleans area. Our systems include keyless entry, security cameras, noise sensors, and smart climate control to protect your property and enhance the guest experience.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 59
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Smart Home', 'san-diego-str-smart-home', 'Smart home technology for San Diego vacation rental properties',
  'San Diego STR Smart Home provides professional installation of smart home technology for vacation rental owners throughout San Diego County. We configure keyless entry systems, noise monitors, smart thermostats, and security cameras to give you full control of your property remotely.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Smart Rentals SD', 'coastal-smart-rentals-sd', 'STR automation and smart tech for San Diego hosts',
  'Coastal Smart Rentals SD helps San Diego vacation rental owners automate their properties with professional smart home installations. From keyless entry and noise monitoring to streaming entertainment systems and smart lighting, we create a tech-forward guest experience.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 71
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Smart Home', 'charleston-str-smart-home', 'Vacation rental technology for Charleston properties',
  'Charleston STR Smart Home provides smart home technology installation for short-term rental owners throughout the greater Charleston area. We install and configure keyless entry, noise monitoring, smart climate control, and security systems that give you remote oversight of your property.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 81
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Technology', 'lowcountry-str-technology', 'Smart rental tech and automation for Charleston hosts',
  'Lowcountry STR Technology helps Charleston vacation rental owners automate and protect their properties with professional smart home installations. Our systems include smart locks, security cameras, noise monitors, and smart thermostats configured specifically for STR use.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand Smart STR', 'grand-strand-smart-str', 'Smart home technology across the Myrtle Beach Grand Strand',
  'Grand Strand Smart STR installs and configures smart home systems for vacation rental owners throughout the Myrtle Beach area. We specialize in high-occupancy beach rental tech setups — including keyless entry, noise monitoring, smart TVs, and Wi-Fi optimization for guest satisfaction.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 89
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach STR Automation', 'myrtle-beach-str-automation', 'Vacation rental smart home and automation in Myrtle Beach',
  'Myrtle Beach STR Automation provides smart home technology installation for vacation rental owners along the Grand Strand. Our systems help hosts manage access, monitor noise, and control their properties remotely while providing guests with a seamless tech experience.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast Smart Rentals', 'emerald-coast-smart-rentals', 'Luxury STR smart home technology for Destin & 30A',
  'Emerald Coast Smart Rentals provides premium smart home technology for luxury vacation rental properties along the Florida Panhandle. We specialize in high-end smart home configurations for Destin and 30A properties — including premium AV systems, smart pool controls, and full home automation.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 97
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Smart Home STR', '30a-smart-home-str', 'Smart rental technology for 30A vacation properties',
  '30A Smart Home STR installs smart home systems for vacation rental owners along the 30A corridor. Our installations include keyless entry, noise monitoring, smart climate control, and premium Wi-Fi setups that keep guests connected and give owners full remote control.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Smart Cabins', 'smoky-mountain-smart-cabins', 'Smart home technology for Smoky Mountain cabin rentals',
  'Smoky Mountain Smart Cabins specializes in smart home technology installations for vacation rental cabin owners throughout the Great Smoky Mountains. We configure keyless entry, noise monitors, smart hot tub controls, security cameras, and entertainment systems for remote cabin management.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian STR Tech', 'appalachian-str-tech', 'Cabin rental automation and smart tech in the Smokies',
  'Appalachian STR Tech provides smart home technology installation for cabin rental owners throughout the Smoky Mountains. Our systems include keyless smart locks, security cameras, noise monitoring, smart TV setup, and high-speed Wi-Fi optimization for the remote mountain rental environment.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 109
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Smart Home Co', 'chicago-str-smart-home-co', 'Smart home technology for Chicago Airbnb hosts',
  'Chicago STR Smart Home Co provides professional smart home technology installation for short-term rental owners throughout Chicago. We specialize in urban condo and apartment STR setups — keyless entry, noise monitoring, smart thermostats, and security systems designed for multi-unit buildings.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Automation', 'windy-city-str-automation', 'Vacation rental smart home and automation in Chicago',
  'Windy City STR Automation helps Chicago vacation rental owners automate their properties with professional smart home installations. Our systems include keyless entry, noise monitoring, smart climate control, and security cameras that work seamlessly in Chicago''s high-rise buildings.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 81
from public.categories c, public.profiles p where c.slug = 'smart-home-tech' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- LEGAL & REGULATIONS
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Legal Advisors', 'colorado-str-legal-advisors', 'Short-term rental legal compliance across Colorado',
  'Colorado STR Legal Advisors provides specialized legal guidance for short-term rental property owners throughout Colorado. We help hosts navigate Denver''s STR licensing requirements, state lodging laws, HOA restrictions, and lease compliance issues to protect their rental operations.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 72
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Compliance', 'mile-high-str-compliance', 'Denver STR permit assistance and legal compliance',
  'Mile High STR Compliance helps Denver vacation rental owners navigate the city''s short-term rental licensing process. We handle permit applications, primary residence compliance documentation, and ongoing regulatory updates so you can operate with confidence.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 56
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Legal Group', 'nola-str-legal-group', 'New Orleans vacation rental permit and legal specialists',
  'NOLA STR Legal Group provides legal guidance for short-term rental operators in New Orleans. We specialize in navigating NOLA''s complex STR permitting system — including owner-occupied and non-owner-occupied classifications, commercial STR applications, and appeals for denied permits.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 81
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Compliance', 'crescent-city-str-compliance', 'NOLA STR permit assistance and regulatory guidance',
  'Crescent City STR Compliance helps New Orleans vacation rental owners achieve and maintain regulatory compliance. We provide permit application assistance, license renewal support, and ongoing monitoring of New Orleans STR ordinance changes to keep your operation legal.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Legal Advisors', 'san-diego-str-legal-advisors', 'California STR legal compliance for San Diego hosts',
  'San Diego STR Legal Advisors helps vacation rental owners navigate California and San Diego''s evolving short-term rental regulations. We provide guidance on STR permits, TOT compliance, HOA rental restrictions, and state vacation rental laws to protect your hosting operation.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 89
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal STR Compliance SD', 'coastal-str-compliance-sd', 'STR permit and legal guidance for San Diego vacation rental hosts',
  'Coastal STR Compliance SD provides permit application assistance and regulatory compliance guidance for vacation rental owners throughout San Diego County. We track San Diego''s frequently changing STR rules and help hosts stay compliant across all regulatory requirements.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Legal Group', 'charleston-str-legal-group', 'South Carolina STR legal compliance for Charleston hosts',
  'Charleston STR Legal Group provides legal guidance for short-term rental owners throughout the greater Charleston area. We help hosts navigate South Carolina STR regulations, Charleston city permitting requirements, Isle of Palms beach rental rules, and HOA vacation rental restrictions.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Compliance', 'lowcountry-str-compliance', 'STR permit assistance and legal guidance in Charleston',
  'Lowcountry STR Compliance helps vacation rental owners throughout the Charleston area achieve and maintain regulatory compliance. We provide permit application support, license renewal assistance, and ongoing updates on Charleston''s STR ordinance changes.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 57
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Legal', 'grand-strand-str-legal', 'Vacation rental legal compliance along the Myrtle Beach Grand Strand',
  'Grand Strand STR Legal provides legal and compliance guidance for vacation rental owners along the South Carolina coast. We help hosts understand Horry County and Myrtle Beach STR licensing requirements, HOA rental restrictions, and state short-term rental regulations.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 83
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach STR Compliance', 'myrtle-beach-str-compliance', 'STR permit and regulatory guidance for Myrtle Beach hosts',
  'Myrtle Beach STR Compliance provides permit application assistance and regulatory compliance services for vacation rental owners along the Grand Strand. We monitor changes in local STR ordinances and keep our clients informed and compliant.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 63
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Legal', 'emerald-coast-str-legal', 'Florida STR legal compliance for Destin & 30A property owners',
  'Emerald Coast STR Legal provides specialized legal guidance for short-term rental owners along the Florida Panhandle. We help hosts navigate Florida vacation rental licensing requirements, Okaloosa and Walton county regulations, and HOA vacation rental restrictions in the Destin and 30A markets.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Legal Compliance', '30a-str-legal-compliance', 'Vacation rental regulatory guidance along scenic 30A',
  '30A STR Legal Compliance helps vacation rental owners along the 30A corridor navigate Florida''s vacation rental regulatory landscape. We provide Florida DBPR license assistance, county STR compliance guidance, and ongoing regulatory monitoring for 30A property owners.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 66
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Legal', 'smoky-mountain-str-legal', 'Tennessee STR legal compliance for Smoky Mountain cabin owners',
  'Smoky Mountain STR Legal provides legal guidance for vacation rental cabin owners throughout the Great Smoky Mountains. We help hosts navigate Tennessee state vacation rental laws, Sevier County regulations, city-specific STR ordinances, and HOA rental restrictions in the Smokies market.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian STR Compliance', 'appalachian-str-compliance', 'STR permit and legal guidance for Smoky Mountain rental owners',
  'Appalachian STR Compliance helps cabin rental owners throughout the Smoky Mountains achieve and maintain regulatory compliance. We provide Tennessee vacation rental license assistance, county permit support, and ongoing monitoring of STR ordinance changes across Sevier County and surrounding areas.',
  c.id, 'Sevierville', 'TN', p.id, true, false, 4.7, 87
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Legal Specialists', 'chicago-str-legal-specialists', 'Chicago vacation rental legal compliance and permit experts',
  'Chicago STR Legal Specialists provides specialized legal guidance for short-term rental operators in Chicago. We help hosts navigate Chicago''s complex STR regulatory environment — including the Shared Housing Ordinance, platform operator requirements, and building-specific rental restrictions.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 118
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Compliance', 'windy-city-str-compliance', 'STR permit assistance and legal guidance for Chicago hosts',
  'Windy City STR Compliance helps Chicago vacation rental owners navigate the city''s short-term rental licensing process. We provide permit application assistance, condo board approval guidance, and ongoing regulatory monitoring to keep your Chicago STR operation fully compliant.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p where c.slug = 'legal-regulations' and p.role = 'admin' on conflict (slug) do nothing;
