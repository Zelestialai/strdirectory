-- ============================================================
-- Migration 012 — Tier 2 Vendors: Real Estate, Interior Design,
--                 Renovation & Construction, Accounting & Tax
-- 2 vendors × 4 categories × 8 markets = 64 vendors
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- REAL ESTATE
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Real Estate Group', 'colorado-str-real-estate-group', 'Finding the best STR investment properties across Colorado',
  'Colorado STR Real Estate Group specializes in helping investors find and acquire short-term rental properties throughout Denver, Boulder, and the Colorado mountain towns. Our team combines deep local market knowledge with STR revenue analysis to identify properties with strong income potential.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Realty', 'mile-high-str-realty', 'Denver''s STR-focused real estate experts',
  'Mile High STR Realty works exclusively with short-term rental investors across the Denver metro and Colorado ski country. We analyze Airbnb revenue data, local STR regulations, and market trends to help you buy properties that perform from day one.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 87
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Investment Realty', 'nola-str-investment-realty', 'New Orleans STR property acquisition specialists',
  'NOLA STR Investment Realty helps investors navigate the unique New Orleans vacation rental market. We specialize in identifying short-term rental opportunities in high-demand neighborhoods while ensuring compliance with New Orleans'' STR permitting requirements.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City Property Finders', 'crescent-city-property-finders', 'Finding high-yield STR investments in New Orleans',
  'Crescent City Property Finders specializes in STR investment property acquisition throughout the greater New Orleans area. From French Quarter shotgun houses to Garden District doubles, we analyze revenue potential and regulatory compliance to find your ideal STR investment.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 76
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Realty', 'san-diego-str-realty', 'Short-term rental investment specialists in San Diego',
  'San Diego STR Realty helps investors find and acquire vacation rental properties throughout San Diego County. We combine Airbnb revenue data analysis with deep local market knowledge to identify properties in La Jolla, Pacific Beach, and North County that deliver strong STR returns.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 134
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Investment Properties SD', 'coastal-investment-properties-sd', 'San Diego coastal STR property acquisition experts',
  'Coastal Investment Properties SD focuses exclusively on short-term rental investment properties along the San Diego coast. We identify underperforming properties with high STR upside and guide investors through acquisition, permitting, and setup in this high-demand market.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 103
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Investment Group', 'charleston-str-investment-group', 'Identifying top STR investment opportunities in Charleston',
  'Charleston STR Investment Group helps real estate investors find short-term rental properties throughout the greater Charleston area. We analyze STR revenue data, local permitting rules, and neighborhood demand to identify properties in Mount Pleasant, Isle of Palms, and Kiawah Island with strong income potential.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Property Finders', 'lowcountry-property-finders', 'Charleston Lowcountry STR investment specialists',
  'Lowcountry Property Finders works with STR investors to identify and acquire vacation rental properties throughout the Charleston Lowcountry. From historic downtown income properties to beachfront Isle of Palms homes, we find opportunities that match your investment goals.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 89
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Realty', 'grand-strand-str-realty', 'Myrtle Beach vacation rental investment specialists',
  'Grand Strand STR Realty focuses exclusively on vacation rental investment properties along the South Carolina Grand Strand. We use AirDNA and market revenue data to identify oceanfront condos, beach houses, and golf villas with the strongest short-term rental income potential.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 143
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach Investment Properties', 'myrtle-beach-investment-properties', 'Finding high-yield vacation rentals in Myrtle Beach',
  'Myrtle Beach Investment Properties helps investors acquire top-performing vacation rental properties throughout the Grand Strand. Our STR-focused approach analyzes seasonal revenue patterns, HOA rules, and local rental regulations to identify properties that deliver strong year-round returns.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 112
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Realty', 'emerald-coast-str-realty', 'Destin & 30A vacation rental investment experts',
  'Emerald Coast STR Realty specializes in vacation rental investment properties along the Florida Panhandle, from Destin and Fort Walton Beach to the exclusive 30A corridor. We analyze Airbnb revenue data and help investors identify properties with premium income potential in this high-demand market.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 123
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Property Investments', '30a-property-investments', 'Premium STR investment properties along scenic 30A',
  '30A Property Investments works exclusively with investors seeking short-term rental properties along Florida''s most coveted coastal corridor. We identify undervalued cottages, beach homes, and condos in Seaside, Rosemary Beach, WaterColor, and Alys Beach before they hit the open market.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 97
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Realty', 'smoky-mountain-str-realty', 'Cabin investment specialists in the Great Smoky Mountains',
  'Smoky Mountain STR Realty helps investors find and acquire vacation rental cabin properties throughout the Great Smoky Mountains. With deep knowledge of Gatlinburg, Pigeon Forge, and surrounding markets, we identify cabins with strong revenue potential and guide you through the entire acquisition process.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 178
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Cabin Investments', 'appalachian-cabin-investments', 'Smokies cabin STR investment property finders',
  'Appalachian Cabin Investments specializes in vacation rental cabin acquisitions throughout the Smoky Mountains region. We analyze cabin revenue data, occupancy trends, and amenity demand to help investors buy properties that generate strong returns in one of America''s top vacation markets.',
  c.id, 'Sevierville', 'TN', p.id, true, false, 4.7, 134
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Investment Realty', 'chicago-str-investment-realty', 'Urban STR investment property specialists in Chicago',
  'Chicago STR Investment Realty helps real estate investors identify and acquire short-term rental properties throughout Chicago. We navigate Chicago''s STR licensing landscape and use revenue data to find condos and apartments in high-demand neighborhoods that deliver strong Airbnb income.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 145
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City Property Finders', 'windy-city-property-finders', 'Finding top Airbnb investment properties in Chicago',
  'Windy City Property Finders works exclusively with STR investors in the Chicago market. We identify properties in River North, Lincoln Park, Wicker Park, and other high-demand Chicago neighborhoods with strong Airbnb revenue potential and favorable HOA rules.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'real-estate' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- INTERIOR DESIGN & STAGING
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Alpine STR Interiors', 'alpine-str-interiors', 'Mountain-inspired STR design for Denver & Colorado rentals',
  'Alpine STR Interiors designs and furnishes short-term rental properties throughout Denver and the Colorado mountain towns. We create spaces that capture the Colorado outdoor lifestyle — with mountain-modern aesthetics, durable materials, and photography-ready staging that drives bookings and justifies premium rates.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Front Range STR Design', 'front-range-str-design', 'Full-service STR interior design across the Denver metro',
  'Front Range STR Design transforms vacant properties into fully furnished, guest-ready vacation rentals throughout Denver and Boulder. Our end-to-end service covers concept design, furniture sourcing, installation, and professional photography coordination.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 76
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Design Studio', 'nola-str-design-studio', 'New Orleans-inspired interiors for vacation rental properties',
  'NOLA STR Design Studio creates stunning vacation rental interiors that celebrate the unique culture and character of New Orleans. We blend vibrant local art, antique furnishings, and bold color palettes to create memorable spaces that earn five-star reviews and premium nightly rates.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'French Quarter STR Interiors', 'french-quarter-str-interiors', 'Boutique STR design for New Orleans vacation rentals',
  'French Quarter STR Interiors specializes in designing and furnishing short-term rental properties throughout New Orleans. We create boutique hotel-quality interiors that honor the historic character of the property while providing all the modern amenities guests expect.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal STR Design San Diego', 'coastal-str-design-san-diego', 'California beach lifestyle interiors for San Diego rentals',
  'Coastal STR Design San Diego creates bright, airy vacation rental interiors that capture the California beach lifestyle. We design and furnish properties throughout San Diego with coastal aesthetics — natural textures, ocean-inspired palettes, and indoor-outdoor living setups that delight guests.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 112
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Pacific Palms STR Interiors', 'pacific-palms-str-interiors', 'Full-service vacation rental design in San Diego',
  'Pacific Palms STR Interiors provides end-to-end interior design and furnishing services for short-term rental owners throughout San Diego County. From concept to completion, we create guest-ready spaces that photograph beautifully and command higher nightly rates.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 89
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Interior Design', 'charleston-str-interior-design', 'Southern charm meets modern comfort for Charleston rentals',
  'Charleston STR Interior Design creates vacation rental interiors that blend Charleston''s iconic Southern charm with modern guest comfort. We design and furnish properties throughout the greater Charleston area — from historic downtown homes to coastal beach houses — with an aesthetic that earns rave reviews.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 103
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Staging', 'lowcountry-str-staging', 'Coastal design and staging for Charleston vacation rentals',
  'Lowcountry STR Staging specializes in designing, furnishing, and staging short-term rental properties throughout the Charleston area. We create welcoming coastal-inspired interiors that photograph beautifully and help properties stand out in a competitive market.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 78
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Design', 'grand-strand-str-design', 'Beach vacation rental interiors across the Myrtle Beach area',
  'Grand Strand STR Design creates fun, durable, and photogenic vacation rental interiors for properties throughout the Myrtle Beach Grand Strand. We specialize in beach-themed designs that appeal to families and groups, with durable furnishings that hold up to high-turnover use.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach Vacation Staging', 'myrtle-beach-vacation-staging', 'STR furniture packages and staging for Myrtle Beach',
  'Myrtle Beach Vacation Staging provides complete furniture packages and interior staging for vacation rental owners along the Grand Strand. Our turnkey packages include all furniture, bedding, kitchen essentials, and décor needed to launch your listing fast.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 71
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Design', 'emerald-coast-str-design', 'Luxury beach rental interiors for Destin & 30A properties',
  'Emerald Coast STR Design creates premium vacation rental interiors for properties along the Florida Panhandle. We specialize in the refined coastal aesthetic of the 30A market — blending natural materials, local art, and high-end furnishings that justify premium nightly rates.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 108
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Beach Home Staging', '30a-beach-home-staging', 'Premium STR staging and design along scenic 30A',
  '30A Beach Home Staging designs and furnishes luxury vacation rental properties throughout the 30A corridor. Our team understands the elevated expectations of the Seaside and Rosemary Beach market and creates interiors that match the architectural quality of these premier properties.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 86
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Cabin Design', 'smoky-mountain-cabin-design', 'Rustic-luxury cabin interiors for Smoky Mountain rentals',
  'Smoky Mountain Cabin Design creates the rustic-luxury aesthetic that Smoky Mountain guests love — exposed wood beams, stone fireplaces, cozy plaid textiles, and mountain-themed décor that makes guests feel at home in the wilderness while enjoying every comfort.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Cabin Staging', 'appalachian-cabin-staging', 'Cabin furnishings and staging for Smoky Mountain vacation rentals',
  'Appalachian Cabin Staging provides complete furniture packages and interior staging for cabin owners throughout the Smoky Mountains. We create warm, inviting mountain retreats with durable furnishings, full kitchen packages, and the cozy décor that drives five-star reviews.',
  c.id, 'Pigeon Forge', 'TN', p.id, true, false, 4.7, 112
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Interior Design Co', 'chicago-str-interior-design-co', 'Modern urban STR design for Chicago vacation rentals',
  'Chicago STR Interior Design Co creates stylish, functional vacation rental interiors for condo and apartment owners throughout Chicago. We specialize in the modern urban aesthetic that appeals to business travelers, couples, and groups visiting this world-class city.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 117
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Staging', 'windy-city-str-staging', 'Full-service STR furnishing and staging in Chicago',
  'Windy City STR Staging provides complete furnishing and staging packages for short-term rental owners throughout Chicago. From contemporary River North condos to vintage Wicker Park apartments, we create interiors that photograph beautifully and earn five-star guest reviews.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 91
from public.categories c, public.profiles p where c.slug = 'interior-design' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- RENOVATION & CONSTRUCTION
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Renovations', 'colorado-str-renovations', 'STR-focused remodeling for Denver & mountain properties',
  'Colorado STR Renovations specializes in remodeling and renovation work designed specifically to maximize short-term rental performance. We transform dated properties across Denver and the Colorado mountains into high-earning vacation rentals with kitchen upgrades, bathroom remodels, and outdoor living additions.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.8, 89
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High Property Remodel', 'mile-high-property-remodel', 'Denver STR renovation specialists with fast turnarounds',
  'Mile High Property Remodel provides renovation and remodeling services for short-term rental property owners throughout the Denver metro. We specialize in high-ROI upgrades — kitchen and bath remodels, flooring, painting, and deck additions — with turnaround timelines designed around your rental calendar.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.7, 67
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Renovation Co', 'nola-str-renovation-co', 'Historic property renovation for New Orleans STR investors',
  'NOLA STR Renovation Co specializes in renovating historic New Orleans properties for short-term rental use. We are experienced in restoring shotgun houses, Creole cottages, and Victorian doubles while meeting historic preservation guidelines and modernizing for STR guest comfort.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.8, 78
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City Contractors', 'crescent-city-contractors', 'Full-service STR remodeling across New Orleans',
  'Crescent City Contractors provides comprehensive renovation and remodeling services for vacation rental property owners throughout the greater New Orleans area. From gut rehabs of blighted properties to targeted kitchen and bath upgrades, we transform properties into high-performing STRs.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 61
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Construction', 'san-diego-str-construction', 'Vacation rental renovation specialists in San Diego',
  'San Diego STR Construction provides renovation and remodeling services tailored to short-term rental property owners throughout San Diego County. We specialize in ADU conversions, outdoor living upgrades, kitchen and bath remodels, and whole-property STR transformations.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.8, 94
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal Remodel SD', 'coastal-remodel-sd', 'STR-focused remodeling for San Diego vacation properties',
  'Coastal Remodel SD helps vacation rental owners in San Diego maximize their property''s earning potential through targeted renovations. Our team focuses on high-impact improvements — outdoor spaces, modern kitchens, and spa bathrooms — that drive premium rates and better guest reviews.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.7, 72
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Renovation Group', 'charleston-str-renovation-group', 'Historic home renovation for Charleston vacation rentals',
  'Charleston STR Renovation Group specializes in renovating historic and coastal properties throughout the greater Charleston area for short-term rental use. We balance historic preservation with modern STR guest expectations, creating properties that earn premium rates and glowing reviews.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.8, 87
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry Property Renovations', 'lowcountry-property-renovations', 'STR remodeling for Charleston Lowcountry properties',
  'Lowcountry Property Renovations provides renovation and construction services for vacation rental property owners throughout the Charleston area. From beach house refreshes and outdoor entertainment additions to full property transformations, we deliver projects on time and within budget.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 65
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Renovations', 'grand-strand-str-renovations', 'Vacation rental remodeling across the Myrtle Beach area',
  'Grand Strand STR Renovations provides remodeling and renovation services for vacation rental property owners throughout the Myrtle Beach Grand Strand. We specialize in oceanfront condo upgrades, beach house renovations, and amenity additions that increase rental income.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 97
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach Property Remodel', 'myrtle-beach-property-remodel', 'STR renovation specialists in Myrtle Beach',
  'Myrtle Beach Property Remodel helps vacation rental owners increase their income through targeted property improvements. From kitchen and bath upgrades to game room additions and outdoor living spaces, we deliver high-ROI renovations designed for the vacation rental market.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.6, 74
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Renovations', 'emerald-coast-str-renovations', 'Premium vacation rental remodeling in Destin & 30A',
  'Emerald Coast STR Renovations provides luxury renovation services for vacation rental properties along the Florida Panhandle. We specialize in high-end kitchen and bath remodels, outdoor entertainment areas, and whole-property transformations that command top-tier nightly rates in the Destin and 30A market.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.8, 103
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A Beach House Renovations', '30a-beach-house-renovations', 'STR renovation experts along scenic 30A',
  '30A Beach House Renovations transforms vacation rental properties along the 30A corridor into premium income-generating assets. We work with investors and owners to identify the highest-impact improvements for the luxury 30A market and execute them with quality craftsmanship.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.7, 81
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain Cabin Builders', 'smoky-mountain-cabin-builders', 'Custom cabin construction and renovation in the Smokies',
  'Smoky Mountain Cabin Builders specializes in custom cabin construction and renovation for vacation rental owners throughout the Great Smoky Mountains. We build new cabins from the ground up and renovate existing properties with hot tub additions, game rooms, theater rooms, and mountain-luxury finishes.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 134
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian Property Renovation', 'appalachian-property-renovation', 'Cabin renovation and construction for Smoky Mountain STRs',
  'Appalachian Property Renovation provides renovation and construction services for cabin rental owners throughout the Smoky Mountains. From rustic cabin refreshes and deck expansions to new cabin builds and luxury amenity additions, we deliver quality work that increases your rental income.',
  c.id, 'Sevierville', 'TN', p.id, true, false, 4.7, 98
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Renovation Pros', 'chicago-str-renovation-pros', 'Condo and apartment renovations for Chicago STR owners',
  'Chicago STR Renovation Pros provides remodeling and renovation services for short-term rental condo and apartment owners throughout Chicago. We specialize in urban space optimization, kitchen and bath upgrades, and whole-unit renovations designed to maximize Airbnb revenue.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.8, 112
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City Property Remodel', 'windy-city-property-remodel', 'STR-focused remodeling for Chicago vacation rental properties',
  'Windy City Property Remodel helps Chicago short-term rental owners increase their property''s income potential through strategic renovations. We focus on high-ROI improvements — open-concept kitchen remodels, spa bathrooms, and smart home integration — that attract higher-paying guests.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.7, 87
from public.categories c, public.profiles p where c.slug = 'renovation' and p.role = 'admin' on conflict (slug) do nothing;


-- ────────────────────────────────────────────────────────────
-- ACCOUNTING & TAX
-- ────────────────────────────────────────────────────────────

-- Denver
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Colorado STR Tax Advisors', 'colorado-str-tax-advisors', 'STR tax strategy and accounting for Colorado rental owners',
  'Colorado STR Tax Advisors specializes in tax planning and accounting for short-term rental property owners throughout Colorado. We navigate Colorado lodging tax requirements, federal STR tax rules, depreciation strategies, and the unique tax treatment of mixed-use vacation properties.',
  c.id, 'Denver', 'CO', p.id, true, true, 4.9, 87
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Mile High STR Accounting', 'mile-high-str-accounting', 'Bookkeeping and tax services for Denver vacation rental hosts',
  'Mile High STR Accounting provides dedicated bookkeeping and tax services for short-term rental owners across the Denver metro. We handle rental income tracking, expense categorization, quarterly tax estimates, and annual returns with a focus on maximizing your STR deductions.',
  c.id, 'Denver', 'CO', p.id, true, false, 4.8, 67
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- New Orleans
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'NOLA STR Tax Services', 'nola-str-tax-services', 'New Orleans vacation rental tax and accounting specialists',
  'NOLA STR Tax Services provides specialized tax and accounting services for short-term rental owners in New Orleans and Louisiana. We handle Louisiana state tax compliance, New Orleans city lodging tax registration, and federal STR tax strategy to minimize your tax burden.',
  c.id, 'New Orleans', 'LA', p.id, true, true, 4.9, 76
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Crescent City STR Accounting', 'crescent-city-str-accounting', 'Bookkeeping and tax compliance for NOLA rental hosts',
  'Crescent City STR Accounting helps New Orleans vacation rental owners stay compliant and maximize deductions. We provide monthly bookkeeping, lodging tax filings, and year-end tax preparation with expertise in Louisiana STR tax law.',
  c.id, 'New Orleans', 'LA', p.id, true, false, 4.7, 58
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- San Diego
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'San Diego STR Tax Group', 'san-diego-str-tax-group', 'California STR tax strategy for San Diego rental owners',
  'San Diego STR Tax Group specializes in tax planning and compliance for short-term rental property owners in California. We navigate California''s complex STR tax landscape — including TOT requirements, Prop 13 considerations, and federal passive activity rules — to minimize your tax liability.',
  c.id, 'San Diego', 'CA', p.id, true, true, 4.9, 98
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Coastal STR Accounting SD', 'coastal-str-accounting-sd', 'Vacation rental bookkeeping and tax for San Diego hosts',
  'Coastal STR Accounting provides dedicated bookkeeping and tax services for vacation rental owners throughout San Diego County. We handle Airbnb income tracking, transient occupancy tax compliance, and year-end tax preparation with a focus on California-specific STR tax issues.',
  c.id, 'San Diego', 'CA', p.id, true, false, 4.8, 74
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- Charleston
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Charleston STR Tax Advisors', 'charleston-str-tax-advisors', 'South Carolina STR tax and accounting specialists',
  'Charleston STR Tax Advisors provides specialized tax planning and accounting for short-term rental owners throughout South Carolina. We handle state accommodations tax compliance, local hospitality tax filings, and federal STR tax strategy to maximize deductions for Charleston area hosts.',
  c.id, 'Charleston', 'SC', p.id, true, true, 4.9, 83
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Lowcountry STR Bookkeeping', 'lowcountry-str-bookkeeping', 'STR bookkeeping and tax compliance for Charleston hosts',
  'Lowcountry STR Bookkeeping provides monthly bookkeeping and tax services for vacation rental owners in the greater Charleston area. We handle income and expense tracking, South Carolina accommodations tax filings, and year-end tax preparation for STR investors.',
  c.id, 'Charleston', 'SC', p.id, true, false, 4.7, 62
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- Myrtle Beach
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Grand Strand STR Tax Services', 'grand-strand-str-tax-services', 'Vacation rental tax and accounting for Myrtle Beach hosts',
  'Grand Strand STR Tax Services provides comprehensive tax and accounting services for vacation rental owners along the South Carolina Grand Strand. We handle SC accommodations tax, Horry County hospitality tax, federal STR deductions, and annual tax returns for Myrtle Beach area rental owners.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, true, 4.8, 91
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Myrtle Beach Rental Accounting', 'myrtle-beach-rental-accounting', 'Bookkeeping and tax for Myrtle Beach vacation rental owners',
  'Myrtle Beach Rental Accounting specializes in financial management for vacation rental property owners along the Grand Strand. Our services include monthly bookkeeping, tax compliance, owner statement preparation, and annual tax return filing with a focus on maximizing STR deductions.',
  c.id, 'Myrtle Beach', 'SC', p.id, true, false, 4.7, 69
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- Destin
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Emerald Coast STR Tax Advisors', 'emerald-coast-str-tax-advisors', 'Florida STR tax strategy for Destin & 30A rental owners',
  'Emerald Coast STR Tax Advisors provides specialized tax planning for short-term rental owners along the Florida Panhandle. We handle Florida sales tax on short-term rentals, Okaloosa and Walton county tourist development tax, and federal STR tax strategy for Destin and 30A property owners.',
  c.id, 'Destin', 'FL', p.id, true, true, 4.9, 94
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select '30A STR Accounting Services', '30a-str-accounting-services', 'Bookkeeping and tax for 30A vacation rental owners',
  '30A STR Accounting Services provides dedicated accounting and tax services for vacation rental owners along Florida''s 30A corridor. We handle Florida short-term rental tax compliance, monthly bookkeeping, and year-end returns with expertise in the luxury vacation rental market.',
  c.id, 'Santa Rosa Beach', 'FL', p.id, true, false, 4.8, 73
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- Smoky Mountains
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Smoky Mountain STR Tax Group', 'smoky-mountain-str-tax-group', 'Tennessee STR tax strategy for Smoky Mountain cabin owners',
  'Smoky Mountain STR Tax Group provides specialized tax planning and accounting for vacation rental cabin owners throughout the Great Smoky Mountains. We handle Tennessee sales tax on accommodations, Sevier County business tax, federal STR deductions, and annual returns for Smokies rental owners.',
  c.id, 'Gatlinburg', 'TN', p.id, true, true, 4.9, 143
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Appalachian STR Accounting', 'appalachian-str-accounting', 'Bookkeeping and tax compliance for Smoky Mountain rentals',
  'Appalachian STR Accounting provides monthly bookkeeping and tax services for cabin rental owners throughout the Smoky Mountains region. We specialize in Tennessee short-term rental tax compliance and help cabin owners maximize their federal deductions year after year.',
  c.id, 'Sevierville', 'TN', p.id, true, false, 4.7, 109
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

-- Chicago
insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Chicago STR Tax Specialists', 'chicago-str-tax-specialists', 'Illinois STR tax and accounting for Chicago rental hosts',
  'Chicago STR Tax Specialists provides dedicated tax planning and compliance services for short-term rental owners throughout Chicago. We navigate Illinois''s complex STR tax environment — including Chicago home sharing tax, Illinois hotel tax, and federal STR rules — to keep you compliant and minimize your liability.',
  c.id, 'Chicago', 'IL', p.id, true, true, 4.9, 127
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;

insert into public.vendors (business_name, slug, tagline, description, category_id, city, state, user_id, is_verified, is_featured, avg_rating, review_count)
select 'Windy City STR Accounting', 'windy-city-str-accounting', 'Bookkeeping and tax services for Chicago Airbnb hosts',
  'Windy City STR Accounting provides monthly bookkeeping and annual tax preparation for short-term rental owners throughout Chicago. We handle Chicago home sharing tax remittance, Illinois state tax filings, and federal STR tax returns with expertise in urban vacation rental finances.',
  c.id, 'Chicago', 'IL', p.id, true, false, 4.8, 98
from public.categories c, public.profiles p where c.slug = 'accounting-tax' and p.role = 'admin' on conflict (slug) do nothing;
