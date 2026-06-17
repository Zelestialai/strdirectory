-- ============================================================
-- Migration 005 — Extended vendor seed data (Tier 1 markets)
-- Categories: Maintenance, Interior Design, Accounting/Tax,
--             Insurance, Furniture, Smart Home, Legal
-- ============================================================

do $$
declare
  cat_maint     uuid;
  cat_interior  uuid;
  cat_acct      uuid;
  cat_insure    uuid;
  cat_furniture uuid;
  cat_smart     uuid;
  cat_legal     uuid;
  dummy_user    uuid;
begin
  select id into cat_maint    from public.categories where slug = 'maintenance-repairs';
  select id into cat_interior from public.categories where slug = 'interior-design';
  select id into cat_acct     from public.categories where slug = 'accounting-tax';
  select id into cat_insure   from public.categories where slug = 'insurance';
  select id into cat_furniture from public.categories where slug = 'furniture-supplies';
  select id into cat_smart    from public.categories where slug = 'smart-home-tech';
  select id into cat_legal    from public.categories where slug = 'legal-regulations';

  select id into dummy_user from public.profiles where role = 'admin' limit 1;
  if dummy_user is null then
    raise notice 'No admin profile found. Create your admin account first.';
    return;
  end if;

  -- ============================================================
  -- MAINTENANCE & REPAIRS
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Axiom Rentals Miami', 'axiom-rentals-miami',
    'On-call STR handyman service across Miami',
    'Axiom Rentals provides on-call handyman services for Miami short-term rental properties. In-depth knowledge of the Miami STR market — skilled handymen available last-minute to make repairs prior to guest arrival. Trusted by Airbnb hosts across Miami Beach, Brickell, and Wynwood.',
    'https://axiom-rentals.com', 'Miami', 'FL', true, true, 4.8, 93)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'FunStay Maintenance Orlando', 'funstay-maintenance-orlando',
    'Complete repairs & ongoing maintenance for Orlando rentals',
    'FunStay Florida handles complete repairs and ongoing maintenance for vacation rental properties in Orlando, Kissimmee, and Davenport. Regular inspections and detailed reports — from quick fixes to complex issues. Available 7 days a week.',
    'https://funstayflorida.com', 'Orlando', 'FL', true, false, 4.7, 68)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Keybee STR Maintenance', 'keybee-str-maintenance',
    'Vacation rental maintenance to keep your rankings high',
    'Keybee helps keep vacation rental properties running smoothly to maintain high rankings on Airbnb. Services include repairs, maintenance work, and deep cleaning across multiple major US markets. Fast response times and detailed reporting.',
    'https://keybeehosting.com', 'Nashville', 'TN', true, true, 4.9, 142)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Open Air Homes Maintenance LA', 'open-air-homes-maintenance-la',
    'No markup on maintenance, handyman or supply costs in LA',
    'Open Air Homes has been managing and maintaining homes in Los Angeles since 2011. They never mark up maintenance, handyman, or supply costs — transparent pricing for repairs, plumbing, electrical, and general maintenance across greater LA.',
    'https://openairhomes.com', 'Los Angeles', 'CA', true, true, 4.8, 117)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Speed Keyz Austin', 'speed-keyz-austin',
    'STR handyman & maintenance across Austin and Central Texas',
    'Speed Keyz operates in Texas, California, Florida, and New York — providing reliable handyman and maintenance services for short-term rental properties. Repairs, appliance fixes, HVAC, plumbing, and electrical for STR hosts.',
    'https://theairbnbmanagement.com', 'Austin', 'TX', true, false, 4.6, 54)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Air Concierge Maintenance Scottsdale', 'air-concierge-maintenance-scottsdale',
    'Handyman, plumber & electrician coordination for Scottsdale STRs',
    'Air Concierge coordinates all maintenance needs for short-term rental properties in Scottsdale and Phoenix — calling in the handyman, plumber, electrician, and landscaper when needed. Serving Scottsdale, Peoria, Chandler, and the East & West Valley.',
    'https://airconcierge.net', 'Scottsdale', 'AZ', true, false, 4.7, 78)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Speed Keyz New York', 'speed-keyz-new-york',
    'STR handyman & property maintenance across New York City',
    'Speed Keyz provides professional handyman and maintenance services for short-term rental properties in New York City. Fast response, reliable repairs, and transparent pricing for Airbnb hosts across Manhattan, Brooklyn, and Queens.',
    'https://theairbnbmanagement.com/new-york', 'New York', 'NY', true, true, 4.7, 86)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_maint, 'Happy Home Helpers Maintenance LV', 'happy-home-helpers-maintenance-lv',
    'Full-service maintenance & repairs for Las Vegas vacation rentals',
    'Happy Home Helpers provides maintenance and repair services for Airbnb and vacation rental properties across the Las Vegas Valley. From appliance repairs to HVAC, plumbing, and general handyman work — available 7 days a week.',
    'https://happyhomehelpers.com', 'Las Vegas', 'NV', true, false, 4.6, 49)
  on conflict (slug) do nothing;

  -- ============================================================
  -- INTERIOR DESIGN & STAGING
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'Brickell Line Staging Miami', 'brickell-line-staging-miami',
    'Vacation rental staging & decor for South Florida homes',
    'Brickell Line specializes in staging and furnishing vacation rental properties in Miami and South Florida for Airbnb and VRBO. Instagram-worthy interiors that command higher nightly rates and drive more bookings.',
    'https://brickellline.com', 'Miami', 'FL', true, true, 4.9, 76)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'STR Design Lab', 'str-design-lab-national',
    'Interior design built specifically for Airbnbs & vacation rentals',
    'STR Design Lab specializes in interior design for Airbnbs and vacation rentals across the US. Data-driven design that maximizes your rental income — from concept to complete furnished property. Available in all major STR markets.',
    'https://strdesignlab.com', 'Nashville', 'TN', true, true, 4.9, 134)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'Guest Haus Austin', 'guest-haus-austin',
    'Airbnb staging & STR design in Austin',
    'Guest Haus provides professional Airbnb staging and short-term rental design services in Austin. Strategic staging that helps your property rise above the competition, perform better, and deliver an unforgettable guest experience.',
    'https://guesthausrentals.com', 'Austin', 'TX', true, true, 4.8, 88)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'By Design SA Austin', 'by-design-sa-austin',
    'Turnkey STR styling & furnishing in Austin & San Antonio',
    'By Design SA offers turnkey STR design for Austin and San Antonio Airbnb projects — designing and installing your VRBO or Airbnb top-to-bottom for style, function, safety, and marketability. Complete project management from concept to launch.',
    'https://bydesignsa.com', 'Austin', 'TX', true, false, 4.7, 52)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'STR Cribs Los Angeles', 'str-cribs-los-angeles',
    '40% higher ADR with data-driven STR design in LA',
    'STR Cribs is the premier provider of Airbnb design and renovation in Los Angeles. Clients see on average 40% higher ADRs, 64% more occupancy, and $50,000+ more per year. Full design, furnishing, and renovation services for vacation rentals.',
    'https://strcribs.com', 'Los Angeles', 'CA', true, true, 4.9, 167)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'Showplace Design', 'showplace-design-national',
    'Turnkey furnishing & design for short and mid-term rentals',
    'Showplace has launched more than 1,000 rental properties nationwide since 2020. Specializing in designing and furnishing rental properties for short-term and mid-term rentals — remote-friendly, fast turnaround, and beautifully styled results.',
    'https://showplacehq.com', 'Las Vegas', 'NV', true, false, 4.8, 98)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'Awning Furnishing & Design', 'awning-furnishing-design',
    'Vacation rental furnishing analyzed against nearby comparables',
    'Awning analyzes nearby vacation rentals to develop a design strategy tailored to your market. Ensures durability for vacation rental use, stocks homes with the right amenities, and helps hosts launch guest-ready properties faster.',
    'https://awning.com/vacation-rental-furnishing', 'Scottsdale', 'AZ', true, false, 4.7, 64)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_interior, 'Laurie Mattson Interiors Nashville', 'laurie-mattson-interiors-nashville',
    'Short-term rental interior design in the Nashville area',
    'Laurie Mattson Interiors offers specialized short-term rental design in the Nashville area. Creating beautiful, functional spaces that guests love and that consistently earn 5-star reviews. Portfolio of successful Nashville and Tennessee STR transformations.',
    'https://lauriemattsoninteriors.com', 'Nashville', 'TN', true, false, 4.9, 41)
  on conflict (slug) do nothing;

  -- ============================================================
  -- ACCOUNTING & TAX
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'Bette Hochberger CPA', 'bette-hochberger-cpa-miami',
    'South Florida''s short-term rental CPA & tax strategist',
    'Bette Hochberger, CPA, CGMA is a short-term rental CPA and investor who appreciates the unique niche STRs play in the Tax Code and investor portfolio. Serving STR hosts across South Florida with tax preparation, entity selection, and depreciation strategies.',
    'https://bettehochberger.com', 'Miami', 'FL', true, true, 5.0, 67)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'Shared Economy Tax', 'shared-economy-tax-national',
    'Airbnb tax preparation specialists for US hosts nationwide',
    'Shared Economy Tax provides professional Airbnb CPAs and accountants for individual and business income tax return preparation, entity selection, and compliance with local, state, and federal regulatory requirements. Nationwide service for STR hosts.',
    'https://sharedeconomycpa.com', 'Austin', 'TX', true, true, 4.9, 213)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'The Real Estate CPA', 'the-real-estate-cpa-national',
    'Real estate tax experts specializing in STR tax strategies',
    'The Real Estate CPA — Brandon Hall, CPA, and Thomas Castelli, CPA — work with real estate investors to optimize tax positions and streamline accounting. Specialists in short-term rental tax secrets, cost segregation, and depreciation strategies.',
    'https://therealestatecpa.com', 'Nashville', 'TN', true, true, 4.9, 178)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'David Weinstein CPA Miami', 'david-weinstein-cpa-miami',
    'Airbnb tax accounting & bookkeeping for South Florida hosts',
    'David Weinstein MBA CPA CFE offers comprehensive Airbnb tax advice, business startup assistance, QuickBooks setup, and bookkeeping for vacation rental hosts in South Florida. Dedicated to the unique tax needs of STR investors.',
    'https://davidweinsteincpa.com', 'Miami', 'FL', true, false, 4.8, 54)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'Robert Hall & Associates', 'robert-hall-associates-la',
    'Airbnb host tax services since 1971 in Los Angeles',
    'Robert Hall & Associates has been providing tailored tax services since 1971 — now specializing in serving the community of short-term rental hosts across Los Angeles to navigate the complex STR tax landscape. Income tax, deductions, and entity planning.',
    'https://roberthalltaxes.com', 'Los Angeles', 'CA', true, false, 4.7, 89)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_acct, 'Elite Way CPAs', 'elite-way-cpas-national',
    'STR property tax services to minimize liability & maximize profit',
    'Elite Way CPAs specializes in real estate taxation, helping Airbnb hosts take advantage of various tax deductions and strategies to minimize tax liabilities and maximize profits. Serving STR investors across major US markets.',
    'https://elitewaycpas.com', 'Las Vegas', 'NV', true, false, 4.8, 72)
  on conflict (slug) do nothing;

  -- ============================================================
  -- INSURANCE
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_insure, 'Proper Insurance', 'proper-insurance-national',
    'The nation''s leading short-term vacation rental insurance',
    'Proper Insurance is the nation''s leading short-term vacation rental insurance provider, offering comprehensive coverage in all 50 states. Purpose-built for Airbnb and STR hosts — protecting your property, rental revenue, and business liability. Starting at $100/month.',
    'https://proper.insure', 'Nashville', 'TN', true, true, 4.9, 432)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_insure, 'Steadily STR Insurance', 'steadily-insurance-national',
    'Purpose-built STR insurance — get a quote in minutes',
    'Steadily was built from the ground up for rental property investors by rental property investors. Get a quote and bind a policy online in minutes. Competitive rates, comprehensive coverage, and purpose-built for short-term rental hosts nationwide.',
    'https://steadily.com', 'Austin', 'TX', true, true, 4.8, 298)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_insure, 'Safely STR Insurance', 'safely-insurance-national',
    'STR insurance combined with guest screening technology',
    'Safely offers a unique approach combining specialized short-term rental insurance with guest screening technology. An integrated risk management solution for hosts and property managers — protecting your property while vetting your guests.',
    'https://safely.com', 'Miami', 'FL', true, false, 4.7, 187)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_insure, 'Wister Co-Host Insurance', 'wister-insurance-national',
    'Specialty insurance for vacation rental managers & co-hosts',
    'Wister provides a bundle of specialty protections you won''t find in most standard business insurance policies — coverages designed specifically for vacation rental managers and co-hosts. Nationwide coverage for STR professionals.',
    'https://wister.insure', 'Los Angeles', 'CA', true, false, 4.8, 124)
  on conflict (slug) do nothing;

  -- ============================================================
  -- FURNITURE & SUPPLIES
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_furniture, 'CORT Furniture Rental', 'cort-furniture-rental-national',
    'Furnish your entire Airbnb in as little as 48 hours',
    'CORT provides flexible furniture rental services for Airbnb properties nationwide. Furnish entire homes in as little as 48 hours with on-trend furniture on flexible lease terms. Scale your STR business across multiple locations without large upfront costs.',
    'https://cort.com/airbnb', 'Miami', 'FL', true, true, 4.7, 203)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_furniture, 'STR Goods', 'str-goods-national',
    'The best value products curated for short-term rental hosts',
    'STR Goods curates the best value products for vacation rental hosts — from furniture and linens to kitchen essentials and guest amenities. Everything you need to furnish, stock, and maintain a successful STR property.',
    'https://strgoods.com', 'Austin', 'TX', true, true, 4.8, 156)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_furniture, 'Furnishr STR Furnishing', 'furnishr-str-furnishing',
    'Turnkey remote furnishing platform for STR properties',
    'Furnishr is a turnkey furnishing platform that helps STR owners furnish and launch their property remotely. Complete furniture packages delivered and installed — ideal for investors managing properties across multiple markets.',
    'https://furnishr.com', 'Los Angeles', 'CA', true, false, 4.6, 87)
  on conflict (slug) do nothing;

  -- ============================================================
  -- SMART HOME & TECHNOLOGY
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_smart, 'Rental Home Automator', 'rental-home-automator-national',
    'Smart home automation built specifically for STRs',
    'Rental Home Automator connects your smart home devices — locks, thermostats, lights, and water valves — to your Airbnb and VRBO calendars. Purpose-built for short-term rentals, not just smart home enthusiasts. Automate by location across your entire portfolio.',
    'https://rentalhomeautomator.com', 'Austin', 'TX', true, true, 4.9, 187)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_smart, 'Miami AV Company', 'miami-av-company',
    'Smart home automation & AV installation for Miami properties',
    'Miami AV Company offers smart home automation installation solutions tailored to residential and vacation rental properties across Miami. Smart locks, thermostats, security cameras, and full AV systems — everything your STR needs to impress guests.',
    'https://miamiavcompany.com', 'Miami', 'FL', true, true, 4.8, 94)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_smart, 'Lunis Systems Miami', 'lunis-systems-miami',
    'Smart home automation services across South Florida',
    'Lunis Systems provides professional smart home automation services in Miami and South Florida. Smart locks, lighting, thermostats, and security systems for vacation rental properties. Expert installation and ongoing support.',
    'https://lunissystems.com', 'Miami', 'FL', true, false, 4.7, 58)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_smart, 'Geeks on Site LA', 'geeks-on-site-la',
    'Smart home installation experts across Los Angeles',
    'Geeks on Site transforms homes in Los Angeles into smart living spaces — intelligent lighting, thermostats, security systems, and smart home hubs. Expert installation for Airbnb and vacation rental hosts across the greater LA area.',
    'https://geeksonsite.com', 'Los Angeles', 'CA', true, false, 4.6, 71)
  on conflict (slug) do nothing;

  -- ============================================================
  -- LEGAL & REGULATIONS
  -- ============================================================

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_legal, 'STR Requirements Consulting', 'str-requirements-consulting',
    'Short-term rental permit & compliance experts nationwide',
    'STRRequirements.com helps hosts and investors navigate short-term rental requirements by city across the US. Expert consultants who track permit rules, license requirements, zoning laws, and regulatory changes so you stay compliant and avoid costly fines.',
    'https://strrequirements.com', 'Nashville', 'TN', true, true, 4.9, 123)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_legal, 'McSeveney Law Nashville', 'mcseveney-law-nashville',
    'Nashville STR permit & real estate law specialists',
    'McSeveney Law specializes in short-term rental law in Nashville and Davidson County. Expert guidance on STR permits, what you can and can''t do with each permit type, and risk evaluation before you purchase. An attorney in your corner can save you from very expensive mistakes.',
    'https://mcseveneylaw.com', 'Nashville', 'TN', true, true, 5.0, 78)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_legal, 'Comparent STR Regulations', 'comparent-regulations-national',
    'STR regulation research & compliance consulting by city',
    'Comparent tracks short-term rental rules by city and state across the US. Consulting services for hosts and investors who need to understand local regulations, permit processes, and compliance requirements before investing or operating.',
    'https://regulations.comparent.com', 'Austin', 'TX', true, false, 4.7, 56)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_legal, 'RedAwning STR Legal Advisory', 'redawning-legal-advisory',
    'Navigating STR laws & regulations in major US cities',
    'RedAwning provides expert guidance on navigating short-term rental laws and regulations in major US cities including Miami, Nashville, New York, Austin, and Los Angeles. Compliance consulting that protects your investment and keeps you operating legally.',
    'https://redawning.com', 'Los Angeles', 'CA', true, false, 4.8, 91)
  on conflict (slug) do nothing;

  insert into public.vendors (user_id, category_id, business_name, slug, tagline, description, website, city, state, is_verified, is_featured, avg_rating, review_count)
  values (dummy_user, cat_legal, 'Minut NYC STR Compliance', 'minut-nyc-str-compliance',
    'New York STR law compliance & regulatory guidance',
    'Minut provides expert guidance on New York City short-term rental laws — one of the most complex STR regulatory environments in the US. Helping hosts understand Local Law 18, registration requirements, and compliance obligations to operate legally in NYC.',
    'https://minut.com', 'New York', 'NY', true, true, 4.8, 104)
  on conflict (slug) do nothing;

  raise notice 'Extended seed data inserted successfully.';
end;
$$;
