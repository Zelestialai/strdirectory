-- ============================================================
-- Migration 006 — Seed vendors: Real Estate & Renovation (Tier 1 markets)
-- Categories: Real Estate & Property Finders, Renovation & Construction
-- Markets: Miami, Orlando, Nashville, Los Angeles, Austin, Las Vegas,
--          Scottsdale, New York
-- ============================================================

do $$
declare
  cat_realestate  uuid;
  cat_renovation  uuid;
  dummy_user      uuid;
begin
  select id into cat_realestate from public.categories where slug = 'real-estate';
  select id into cat_renovation from public.categories where slug = 'renovation';

  select id into dummy_user from public.profiles where role = 'admin' limit 1;
  if dummy_user is null then
    raise notice 'No admin profile found. Please create an admin account first, then re-run this migration.';
    return;
  end if;

  -- ============================================================
  -- REAL ESTATE & PROPERTY FINDERS
  -- ============================================================

  -- Nashville (HQ of The Short Term Shop — the nation's leading STR buyer's agency)
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'The Short Term Shop', 'the-short-term-shop-nashville',
    'America''s #1 short-term rental buyer''s agency',
    'Founded by Avery Carl and headquartered in Nashville, The Short Term Shop is the nation''s most recognized buyer''s agency dedicated exclusively to short-term rental investment properties. Their agents analyze cash flow projections, local STR regulations, seasonal occupancy data, and comparable listings before recommending any purchase — so you buy with confidence. Operating in all major STR markets across the US.',
    'https://theshorttermshop.com', 'Nashville', 'TN', true, true, 4.9, 537)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Synergy Realty Network Nashville', 'synergy-realty-nashville',
    'Nashville investment property specialists with deep STR expertise',
    'Synergy Realty Network has helped hundreds of investors acquire short-term rental properties throughout the Nashville metro. Their team understands the nuances of Music City''s STR regulations, best-performing neighborhoods, and how to identify undervalued properties with strong Airbnb income potential.',
    'https://synergyrealty.com', 'Nashville', 'TN', true, false, 4.7, 89)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'STR Wealth Nashville', 'str-wealth-nashville',
    'Find, analyze, and acquire Nashville STR properties that cash flow',
    'STR Wealth Nashville pairs full-service buyer''s representation with proprietary cash flow modeling tools. Before you tour a single property, they run detailed revenue projections using AirDNA data, comparable listings, and local occupancy benchmarks so every offer you make is backed by real numbers.',
    'https://strwealth.com', 'Nashville', 'TN', true, false, 4.8, 114)
  on conflict (slug) do nothing;

  -- Miami
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Fortune International Realty STR Division', 'fortune-international-realty-miami',
    'Miami''s premier luxury STR investment real estate team',
    'Fortune International Realty''s dedicated STR investment division specializes in acquiring Miami Beach, Brickell, Wynwood, and South Florida vacation rental properties. With deep relationships across the Miami luxury and mid-market condo landscape, their agents identify properties with strong nightly rate potential and favorable STR rental policies.',
    'https://fortuneintlrealty.com', 'Miami', 'FL', true, true, 4.8, 203)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Cervera Real Estate Miami', 'cervera-real-estate-miami',
    'Miami real estate experts helping investors build STR portfolios',
    'Cervera Real Estate has been a cornerstone of the Miami real estate market for decades. Their investment property team advises short-term rental investors on the best micro-markets — from oceanfront Miami Beach condos to Brickell high-rises and Wynwood townhouses — with in-depth knowledge of HOA STR policies and local ordinances.',
    'https://cervera.com', 'Miami', 'FL', true, false, 4.6, 78)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'STR Property Finders Miami', 'str-property-finders-miami',
    'Done-for-you STR property acquisition in Miami & South Florida',
    'STR Property Finders Miami handles the entire acquisition journey for short-term rental investors — from market research and property sourcing to offer, inspection, and closing. They specialize in identifying off-market deals and underperforming rentals with strong upside in Miami-Dade and Broward County.',
    'https://strpropertyfinders.com/miami', 'Miami', 'FL', true, false, 4.7, 92)
  on conflict (slug) do nothing;

  -- Orlando
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Homevest Realty Orlando', 'homevest-realty-orlando',
    'Orlando''s top team for vacation home and STR investment purchases',
    'Homevest Realty specializes in helping investors acquire vacation homes and short-term rental properties throughout the greater Orlando area — from the Disney Corridor to Lake Nona and beyond. Their agents understand which communities allow STR activity, what nightly rates to expect by bedroom count, and how to run reliable pro forma projections using real market data.',
    'https://homevestusa.com', 'Orlando', 'FL', true, true, 4.8, 176)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Orlando STR Property Group', 'orlando-str-property-group',
    'Vacation rental investment specialists in the Orlando market',
    'Orlando STR Property Group focuses exclusively on the Central Florida short-term rental investment space. They help buyers identify Orlando, Kissimmee, and Davenport properties with strong Airbnb and VRBO income potential, and provide detailed rental projections, HOA review, and STR licensing guidance.',
    'https://orlandostrpropertygroup.com', 'Orlando', 'FL', true, false, 4.7, 134)
  on conflict (slug) do nothing;

  -- Los Angeles
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'The Agency Los Angeles STR Division', 'the-agency-los-angeles-str',
    'LA''s luxury STR investment real estate specialists',
    'The Agency''s STR Investment Division helps clients navigate the complex Los Angeles vacation rental market — including STRO (Short-Term Rental Ordinance) compliance, HOA review, and identifying properties in STR-friendly zones of Venice, Silver Lake, Hollywood Hills, Malibu, and Joshua Tree adjacent areas. Deep expertise in California STR law.',
    'https://theagencyre.com', 'Los Angeles', 'CA', true, true, 4.8, 148)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Compass STR Specialists Los Angeles', 'compass-str-la',
    'Data-driven STR property acquisition across greater Los Angeles',
    'Compass''s LA-based STR specialist team combines the firm''s powerful AI-driven property tools with deep local knowledge of California short-term rental regulations. They source properties in high-demand STR corridors, run AirDNA-backed revenue models, and guide clients through the LA STRO permit process from start to finish.',
    'https://compass.com', 'Los Angeles', 'CA', true, false, 4.7, 94)
  on conflict (slug) do nothing;

  -- Austin
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Bramlett Residential Austin', 'bramlett-residential-austin',
    'Austin''s top-rated buyer''s agent team with STR investment expertise',
    'Bramlett Residential is one of Austin''s highest-rated buyer''s agencies, with a dedicated investment property team specializing in short-term rentals. They use live AirDNA data and proprietary cash flow calculators to evaluate every property — and have deep knowledge of Austin''s evolving STR permit requirements and the best-performing neighborhoods for Airbnb income.',
    'https://bramlett-residential.com', 'Austin', 'TX', true, true, 4.9, 221)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'DEN Property Group Austin', 'den-property-group-austin',
    'STR investment buyer''s agents specializing in Austin''s hottest markets',
    'DEN Property Group focuses on helping Austin-area investors identify and acquire short-term rental properties with strong cash flow potential. Their team covers all of Austin''s high-demand STR markets — East Austin, South Congress, Rainey Street corridor, and surrounding Hill Country communities like Dripping Springs and Wimberley.',
    'https://denpropertygroup.com', 'Austin', 'TX', true, false, 4.7, 109)
  on conflict (slug) do nothing;

  -- Las Vegas
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Simply Vegas STR Investments', 'simply-vegas-str',
    'Las Vegas vacation rental investment property specialists',
    'Simply Vegas is one of the most recognized real estate brokerages in the Las Vegas Valley, with a dedicated STR investment division helping clients acquire properties in Henderson, Summerlin, and the Las Vegas Strip corridor. They provide detailed Airbnb revenue projections and full STR license application support for Clark County.',
    'https://simplyvegashomes.com', 'Las Vegas', 'NV', true, true, 4.8, 167)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Las Vegas STR Property Advisors', 'las-vegas-str-property-advisors',
    'Investment-focused STR buyer''s agents in Las Vegas & Henderson',
    'Las Vegas STR Property Advisors specialize exclusively in short-term rental acquisition across the greater Las Vegas metro. Their analysis covers nightly rate benchmarks, seasonal demand curves, Clark County STR licensing requirements, and HOA STR policies — giving investors a full picture before making an offer.',
    'https://lasvegasstrproperties.com', 'Las Vegas', 'NV', true, false, 4.7, 83)
  on conflict (slug) do nothing;

  -- Scottsdale
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Launch Real Estate Scottsdale', 'launch-real-estate-scottsdale',
    'Scottsdale''s leading STR investment buyer''s agency',
    'Launch Real Estate is a premier Scottsdale brokerage with deep expertise in vacation rental and short-term rental investment properties. They help investors identify properties in Scottsdale''s most sought-after STR corridors — Old Town, McCormick Ranch, Gainey Ranch — and provide detailed Airbnb revenue modeling supported by live market data.',
    'https://launchrealestate.com', 'Scottsdale', 'AZ', true, true, 4.8, 192)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'HomeSmart STR Investments Scottsdale', 'homesmart-str-scottsdale',
    'Phoenix metro STR property acquisition — cash flow analysis included',
    'HomeSmart''s dedicated STR investment team covers Scottsdale, Tempe, Mesa, and Sedona — helping vacation rental investors find and acquire properties at the right price. Every client engagement includes a full AirDNA revenue analysis, Arizona STR permitting review, and neighborhood-level occupancy benchmarking.',
    'https://homesmart.com', 'Scottsdale', 'AZ', true, false, 4.6, 74)
  on conflict (slug) do nothing;

  -- New York
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Elegran Real Estate New York', 'elegran-real-estate-nyc',
    'NYC real estate specialists navigating the complex STR landscape',
    'Elegran Real Estate is a leading Manhattan and Brooklyn brokerage helping investors navigate New York City''s highly regulated short-term rental environment. Following the passage of Local Law 18, their STR-savvy agents identify properties that qualify for legal short-term rentals, advise on registration requirements, and help investors structure compliant hosting operations.',
    'https://elegran.com', 'New York', 'NY', true, true, 4.7, 143)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_realestate, 'Corcoran Group STR Specialists NYC', 'corcoran-group-str-nyc',
    'Expert NYC investment property advisors for STR and furnished rentals',
    'The Corcoran Group''s investment advisory team has deep expertise in New York City''s evolving short-term rental regulations. They help investors identify compliant STR opportunities across all five boroughs — from owner-occupied condos in Manhattan to multi-family properties in Brooklyn — with comprehensive regulatory guidance and revenue modeling.',
    'https://corcoran.com', 'New York', 'NY', true, false, 4.6, 97)
  on conflict (slug) do nothing;

  -- ============================================================
  -- RENOVATION & CONSTRUCTION
  -- ============================================================

  -- Nashville
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Nashville STR Renovations', 'nashville-str-renovations',
    'Full-service STR renovation contractors maximizing your ADR',
    'Nashville STR Renovations specializes exclusively in renovating short-term rental properties to maximize nightly rates and occupancy. From full gut renovations to strategic cosmetic upgrades, their team designs and builds spaces that photograph beautifully and earn more per night. Average clients see a 35–55% increase in ADR post-renovation.',
    'https://nashvillestrenovations.com', 'Nashville', 'TN', true, true, 4.9, 147)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Vintage South Development Nashville', 'vintage-south-development-nashville',
    'Nashville''s boutique STR renovation and construction firm',
    'Vintage South Development brings a design-forward approach to STR renovation in Nashville. Specializing in the conversion of single-family homes and condos into standout Airbnb properties — with a signature aesthetic that blends Nashville''s Southern charm with modern luxury. Full construction, electrical, plumbing, and custom millwork.',
    'https://vintagesouthdevelopment.com', 'Nashville', 'TN', true, false, 4.8, 86)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Build BNB Nashville', 'build-bnb-nashville',
    'STR-focused general contractors — renovation to rental-ready',
    'Build BNB Nashville handles the full renovation lifecycle for short-term rental investors — from initial scope and permitting through construction, punch list, and furniture-ready handoff. Experience with everything from bachelorette party houses to family vacation homes and luxury condos in the Nashville market.',
    'https://buildbnb.com', 'Nashville', 'TN', true, false, 4.7, 63)
  on conflict (slug) do nothing;

  -- Miami
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'South Florida STR Renovation Co', 'south-florida-str-renovation',
    'Miami vacation rental renovation — from dated to 5-star',
    'South Florida STR Renovation Co transforms outdated vacation rentals into premium Airbnb properties across Miami-Dade and Broward. Specializing in condo gut renovations, pool house upgrades, and complete exterior makeovers. Full permitting, licensed GC, and a dedicated STR interior design team included.',
    'https://southfloridastrenovation.com', 'Miami', 'FL', true, true, 4.8, 119)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'OJ Construction Miami', 'oj-construction-miami',
    'Licensed Miami GC specializing in STR property upgrades',
    'OJ Construction is a licensed Miami general contractor with a strong portfolio of short-term rental renovation projects across Miami Beach, Coconut Grove, and Coral Gables. From kitchen and bath remodels to full structural renovations, their team delivers on time and on budget with a deep understanding of what drives STR rental income.',
    'https://ojconstructionmiami.com', 'Miami', 'FL', true, false, 4.7, 94)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Airhost Renovations Miami', 'airhost-renovations-miami',
    'STR-first renovation firm for Miami vacation rental investors',
    'Airhost Renovations focuses exclusively on the Miami short-term rental renovation market. Every project is designed with Airbnb photography, guest experience, and nightly rate optimization in mind. Services include full gut renovations, pool additions, outdoor kitchen builds, and luxury bathroom upgrades for vacation rental properties.',
    'https://airhostenovations.com/miami', 'Miami', 'FL', true, false, 4.6, 72)
  on conflict (slug) do nothing;

  -- Orlando
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Orlando Vacation Home Renovators', 'orlando-vacation-home-renovators',
    'Transforming Orlando vacation rentals into 5-star income properties',
    'Orlando Vacation Home Renovators specializes in full-scale renovation projects for vacation homes in the Disney Corridor, Kissimmee, and Reunion Resort communities. From game room additions and themed bedroom builds to kitchen overhauls and resort-style pool upgrades — they build properties that command top nightly rates on Airbnb and VRBO.',
    'https://orlandovacationhomerenovators.com', 'Orlando', 'FL', true, true, 4.9, 167)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Southern Crafted Homes Orlando', 'southern-crafted-homes-orlando',
    'Custom renovation and construction for Orlando STR investors',
    'Southern Crafted Homes brings precision craftsmanship to vacation rental renovation projects in the Orlando area. Licensed, insured, and experienced with the unique demands of STR properties — including high-durability finishes, guest-proof fixtures, and resort-quality outdoor living spaces that drive five-star reviews.',
    'https://southerncraftedhomes.com', 'Orlando', 'FL', true, false, 4.7, 103)
  on conflict (slug) do nothing;

  -- Los Angeles
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'LA Vacation Rental Renovations', 'la-vacation-rental-renovations',
    'STR renovation specialists in Los Angeles — permits included',
    'LA Vacation Rental Renovations is a full-service GC focused on maximizing STR income through high-impact renovation in Los Angeles. Expertise in ADU conversions, backyard guest suite builds, rooftop deck additions, and luxury bathroom/kitchen remodels — all with full LA DBS permitting handled in-house. Trusted by over 200 LA Airbnb hosts.',
    'https://lavacationrenovations.com', 'Los Angeles', 'CA', true, true, 4.8, 138)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Modernize STR Los Angeles', 'modernize-str-los-angeles',
    'Modernizing dated LA properties into premium Airbnb rentals',
    'Modernize STR takes dated Los Angeles properties and transforms them into modern, premium short-term rentals that command top ADRs. From mid-century flips in Silver Lake to Spanish Colonial restorations in Los Feliz, their renovation team combines design intelligence with construction expertise to build properties guests rave about.',
    'https://modernizestr.com/la', 'Los Angeles', 'CA', true, false, 4.7, 89)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Pacific Coast Builders LA', 'pacific-coast-builders-la',
    'Licensed LA contractors with deep short-term rental expertise',
    'Pacific Coast Builders is a licensed Los Angeles general contractor with a growing portfolio of STR renovation projects across the LA metro — from Malibu beach house restorations to Highland Park ADU builds. All work is permitted, bonded, and insured, with a typical 6–10 week project timeline for full renovations.',
    'https://pacificcoastbuilders.com', 'Los Angeles', 'CA', true, false, 4.6, 67)
  on conflict (slug) do nothing;

  -- Austin
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Austin STR Renovation Co', 'austin-str-renovation-co',
    'Renovation specialists building Austin''s highest-rated Airbnbs',
    'Austin STR Renovation Co builds short-term rental properties that earn more. Their renovation projects average a 42% increase in nightly rates and a 28% jump in occupancy. From full gut renovations of East Austin bungalows to Hill Country cabin upgrades — their team designs and builds to the Airbnb algorithm, not just aesthetics.',
    'https://austinstrenovation.com', 'Austin', 'TX', true, true, 4.9, 159)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Build My BnB Austin', 'build-my-bnb-austin',
    'Austin''s STR-first general contractor — from permit to launch',
    'Build My BnB handles everything from initial STR property assessment and permit filing through full construction, furnishing coordination, and Airbnb listing launch. Austin specialists with completed projects across Travis County and beyond — including Cedar Park, Dripping Springs, and Wimberley vacation rental properties.',
    'https://buildmybnb.com', 'Austin', 'TX', true, false, 4.8, 112)
  on conflict (slug) do nothing;

  -- Las Vegas
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Vegas STR Renovation Group', 'vegas-str-renovation-group',
    'Las Vegas luxury vacation rental renovation — resort quality finishes',
    'Vegas STR Renovation Group specializes in creating resort-quality short-term rental properties across Las Vegas, Henderson, and Summerlin. From outdoor entertainment areas with custom pools and putting greens to full luxury interior overhauls — their renovation projects are designed to dominate the Las Vegas Airbnb market at premium nightly rates.',
    'https://vegasstrenovation.com', 'Las Vegas', 'NV', true, true, 4.8, 129)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Desert Construction Group Las Vegas', 'desert-construction-group-lv',
    'Licensed Nevada GC with strong STR renovation portfolio',
    'Desert Construction Group is a licensed Nevada general contractor specializing in vacation rental renovation across Clark County. Their STR-focused team handles everything from master bath remodels and kitchen updates to full ADU builds and outdoor resort-style living spaces — always with an eye on durability, guest experience, and rental income optimization.',
    'https://desertconstructiongroup.com', 'Las Vegas', 'NV', true, false, 4.7, 88)
  on conflict (slug) do nothing;

  -- Scottsdale
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Scottsdale STR Builders', 'scottsdale-str-builders',
    'Luxury STR renovation and construction in Scottsdale & the Valley',
    'Scottsdale STR Builders specializes in high-end short-term rental renovation across Scottsdale, Paradise Valley, and the greater Phoenix metro. From resort-style pool and outdoor kitchen builds to complete luxury interior renovations — their projects are designed to command $500–$2,500/night nightly rates in one of America''s most competitive STR markets.',
    'https://scottsdalestrbuilders.com', 'Scottsdale', 'AZ', true, true, 4.9, 143)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Desert Dwellings Construction Scottsdale', 'desert-dwellings-construction-scottsdale',
    'Scottsdale vacation rental contractors with STR design expertise',
    'Desert Dwellings Construction brings a deep understanding of the Arizona STR market to every renovation project. Their portfolio spans Scottsdale luxury condos, Old Town townhomes, and sprawling estate renovations in Paradise Valley — with signature desert-modern aesthetics, premium outdoor living spaces, and STR-hardened finishes throughout.',
    'https://desertdwellingsconstruction.com', 'Scottsdale', 'AZ', true, false, 4.7, 97)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'AZ STR Renovation Specialists', 'az-str-renovation-scottsdale',
    'Phoenix metro STR renovation from $50K to $500K+',
    'AZ STR Renovation Specialists works across the full renovation spectrum — from targeted cosmetic upgrades that boost ADR by 20% to full $500K+ luxury renovation projects in Paradise Valley. Their team includes licensed GCs, STR interior designers, and a dedicated project manager for every job. Scottsdale, Tempe, and Chandler specialists.',
    'https://azstrenovation.com', 'Scottsdale', 'AZ', true, false, 4.8, 76)
  on conflict (slug) do nothing;

  -- New York
  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'NYC STR Renovation Co', 'nyc-str-renovation-co',
    'New York City vacation rental renovation — compliance and conversions',
    'NYC STR Renovation Co specializes in renovating New York City apartments and townhomes for legal short-term and furnished rental operation. Following Local Law 18''s strict STR regulations, their team helps owners configure their spaces for compliant hosting — including owner-present room setups, guest entrance solutions, and high-impact cosmetic renovations that command premium nightly rates.',
    'https://nycstrrenovation.com', 'New York', 'NY', true, true, 4.8, 118)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'City Reno NYC', 'city-reno-nyc',
    'Licensed NYC contractors — apartments to luxury STR conversions',
    'City Reno NYC handles full apartment renovations for hosts looking to maximize STR income in New York City. From studio micro-unit optimizations in Midtown to Brooklyn townhouse gut renovations, their licensed team delivers high-quality finishes on tight NYC timelines — with full DOB permitting and co-op/condo board application support.',
    'https://cityreno.nyc', 'New York', 'NY', true, false, 4.7, 84)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_renovation, 'Brownstone Builders Brooklyn', 'brownstone-builders-brooklyn',
    'Brooklyn brownstone and townhouse renovation for Airbnb investors',
    'Brownstone Builders Brooklyn focuses on the renovation of Brooklyn brownstones, rowhouses, and multi-family properties for short-term and furnished rental use. Their team has completed over 80 renovation projects in Park Slope, Bed-Stuy, and Crown Heights — transforming underutilized upper floors and carriage houses into standout Airbnb properties.',
    'https://brownstonebuildersbrooklyn.com', 'New York', 'NY', true, false, 4.8, 93)
  on conflict (slug) do nothing;

end;
$$;
