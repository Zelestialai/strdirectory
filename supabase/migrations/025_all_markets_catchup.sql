-- ============================================================
-- Migration 025 — All-markets catch-up
-- Run this once in Supabase SQL Editor to ensure all 106 markets
-- are present. Every insert uses ON CONFLICT (slug) DO NOTHING
-- so it is fully idempotent — safe to run multiple times.
-- Also fixes the is_active NULL issue from migration 024.
-- ============================================================

-- 1. Fix is_active nulls
update public.markets set is_active = true where is_active is null;
alter table public.markets alter column is_active set not null;
alter table public.markets alter column is_active set default true;

-- 2. Drop & recreate RLS policies so admins can see inactive markets too
drop policy if exists "Markets are publicly readable" on public.markets;
drop policy if exists "Admins can manage markets"    on public.markets;

create policy "Markets are publicly readable"
  on public.markets for select
  using (
    is_active = true
    or exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

create policy "Admins can manage markets"
  on public.markets for all
  using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- 3. TIER 1 — 8 markets
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Nashville', 'nashville', 'TN',
  ARRAY['Nashville','Brentwood','Franklin','Murfreesboro','Hendersonville','Goodlettsville','Smyrna','Nolensville'],
  'Music City — bachelorette parties, live music & year-round demand',
  'Nashville is one of the fastest-growing short-term rental markets in the US, driven by bachelorette parties, live music, and major events like CMA Fest and NFL games. The greater Nashville metro — including Brentwood, Franklin, and Murfreesboro — has thousands of active STR listings with strong year-round occupancy and rising nightly rates.'),

('Miami', 'miami', 'FL',
  ARRAY['Miami','Miami Beach','Fort Lauderdale','Hollywood','Boca Raton','Coral Gables','Wynwood','Brickell','Aventura','Doral','Hialeah'],
  'Year-round sunshine, international tourism & luxury beach rentals',
  'Miami''s STR market is fueled by international tourism, world-class beaches, and a vibrant nightlife scene. The greater Miami area — spanning Miami Beach oceanfront condos, Wynwood art district lofts, and Fort Lauderdale waterfront homes — offers diverse STR opportunities with some of the highest nightly rates in Florida.'),

('Orlando', 'orlando', 'FL',
  ARRAY['Orlando','Kissimmee','Davenport','Clermont','St. Cloud','Celebration','Champions Gate','Reunion','Haines City','Winter Garden'],
  'The vacation home capital of the world',
  'Orlando is the #1 vacation rental market in the US by volume, driven by Disney World, Universal Studios, EPCOT, and year-round family tourism. The greater Orlando area — including Kissimmee, Davenport, and Champions Gate — hosts the highest concentration of purpose-built vacation rental homes anywhere in America.'),

('Los Angeles', 'los-angeles', 'CA',
  ARRAY['Los Angeles','West Hollywood','Santa Monica','Venice','Malibu','Pasadena','Long Beach','Burbank','Glendale','Culver City','Manhattan Beach','Hermosa Beach'],
  'California entertainment capital — beach cities, hills & urban lofts',
  'Los Angeles offers a diverse and highly competitive STR market spanning beach cities, Hollywood Hills estates, and urban lofts. From Venice Beach bungalows to Malibu ocean-view rentals, the greater LA area serves entertainment industry travelers, tourists, and remote workers year-round.'),

('Austin', 'austin', 'TX',
  ARRAY['Austin','Round Rock','Cedar Park','Dripping Springs','Wimberley','Lago Vista','Bee Cave','Bastrop','Lockhart','Kyle','Buda'],
  'Live music, tech, and Hill Country lake retreats',
  'Austin''s STR market is driven by SXSW, ACL Music Festival, Formula 1 Grand Prix, and a booming tech-industry travel scene. The greater Austin area extends into the Texas Hill Country — with Dripping Springs, Wimberley, and Lago Vista offering popular lakefront and nature retreat STR properties.'),

('Las Vegas', 'las-vegas', 'NV',
  ARRAY['Las Vegas','Henderson','North Las Vegas','Summerlin','Boulder City','Paradise','Enterprise','Spring Valley'],
  'Entertainment capital — conventions, sports & year-round visitors',
  'Las Vegas is one of the most visited cities in the world, generating consistent year-round STR demand from entertainment seekers, convention attendees, and sports fans. The greater Las Vegas Valley — including Henderson and Summerlin — offers strong Airbnb income potential with a streamlined licensing process.'),

('Scottsdale', 'scottsdale', 'AZ',
  ARRAY['Scottsdale','Phoenix','Tempe','Mesa','Chandler','Sedona','Paradise Valley','Fountain Hills','Cave Creek','Peoria','Gilbert'],
  'Desert luxury — golf, spring training & year-round sunshine',
  'Scottsdale and the greater Phoenix metro is a premier STR destination driven by golf tourism, MLB spring training, and winter snowbird travelers. The market spans luxury Old Town Scottsdale properties, Sedona''s red rock retreats, and Paradise Valley estates — with strong demand virtually every month of the year.'),

('New York City', 'new-york-city', 'NY',
  ARRAY['New York','Brooklyn','Queens','Bronx','Staten Island','Jersey City','Hoboken','Long Island City','Astoria','Williamsburg','Harlem'],
  'World''s most visited city — navigating Local Law 18',
  'New York City''s STR market is among the most complex in the world following the implementation of Local Law 18. Despite strict regulations, the NYC metro — including Brooklyn townhouses and Jersey City apartments — still offers strong income potential for owner-occupants operating legally.')

on conflict (slug) do nothing;

-- ============================================================
-- 4. TIER 2 — 8 markets
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Denver', 'denver', 'CO',
  ARRAY['Denver','Aurora','Lakewood','Boulder','Fort Collins','Arvada','Westminster','Thornton','Broomfield','Vail','Breckenridge','Steamboat Springs','Aspen'],
  'Mile High City — ski season, outdoor adventure & year-round tourism',
  'Denver and the greater Colorado Front Range is a booming STR market driven by proximity to world-class ski resorts, outdoor recreation, and a thriving tech and startup scene. From Denver urban condos to Breckenridge ski chalets and Vail mountain estates, Colorado offers diverse STR opportunities with strong year-round demand.'),

('New Orleans', 'new-orleans', 'LA',
  ARRAY['New Orleans','Metairie','Kenner','Slidell','Covington','Mandeville','Gretna','Harvey','Marrero','Chalmette'],
  'Festivals, jazz, Mardi Gras & French Quarter magic',
  'New Orleans is one of the most culturally unique STR markets in America, driven by Mardi Gras, Jazz Fest, French Quarter tourism, and a thriving food and nightlife scene. The greater New Orleans metro delivers some of the highest occupancy spikes in the country during festival season.'),

('San Diego', 'san-diego', 'CA',
  ARRAY['San Diego','La Jolla','Coronado','Encinitas','Carlsbad','Oceanside','Chula Vista','Pacific Beach','Mission Beach','Ocean Beach','North Park','Del Mar','Solana Beach'],
  'Year-round sunshine, beaches & military demand',
  'San Diego offers one of the most consistent STR markets in California, benefiting from year-round 70°F weather, stunning beaches, and strong military/contractor travel demand. The market spans La Jolla oceanfront luxury, Pacific Beach surf culture, and Coronado island retreats.'),

('Charleston', 'charleston', 'SC',
  ARRAY['Charleston','Mount Pleasant','Isle of Palms','Sullivan''s Island','Folly Beach','Kiawah Island','James Island','Johns Island','Summerville','Goose Creek','North Charleston'],
  'Historic charm, destination weddings & coastal luxury',
  'Charleston is one of the most desirable STR markets in the Southeast, known for its historic architecture, world-class restaurants, and status as a top wedding and bachelorette destination. The market spans downtown historic homes, Isle of Palms beach houses, and Kiawah Island luxury rentals.'),

('Myrtle Beach', 'myrtle-beach', 'SC',
  ARRAY['Myrtle Beach','North Myrtle Beach','Surfside Beach','Pawleys Island','Litchfield Beach','Murrells Inlet','Conway','Garden City Beach','Little River'],
  'Golf capital, family beach vacations & seasonal peaks',
  'Myrtle Beach is one of the largest and most visited beach resort areas on the East Coast, hosting over 14 million visitors annually. The Grand Strand — stretching from Little River to Pawleys Island — is a premier STR market for oceanfront condos, golf villas, and family vacation homes.'),

('Destin', 'destin', 'FL',
  ARRAY['Destin','Fort Walton Beach','Niceville','Santa Rosa Beach','Seaside','Rosemary Beach','Panama City Beach','Navarre','Pensacola Beach','30A','Inlet Beach','WaterColor','Alys Beach'],
  'Emerald Coast — sugar-white beaches, 30A & snowbird retreats',
  'Destin and the Emerald Coast is one of Florida''s most beautiful and profitable STR markets, famous for its sugar-white sand beaches and emerald-green Gulf waters. The 30A corridor — home to Seaside, Rosemary Beach, and WaterColor — commands premium nightly rates for architecturally distinctive beach cottages.'),

('Smoky Mountains', 'smoky-mountains', 'TN',
  ARRAY['Gatlinburg','Pigeon Forge','Sevierville','Townsend','Bryson City','Cherokee','Cosby','Newport','Dandridge','Wears Valley'],
  'Cabin capital of America — 12 million annual visitors',
  'The Great Smoky Mountains is the most visited national park in America with over 12 million annual visitors, making Gatlinburg and Pigeon Forge one of the top STR markets in the country for cabin and mountain retreat rentals. Uniquely year-round demand across all seasons.'),

('Chicago', 'chicago', 'IL',
  ARRAY['Chicago','Evanston','Oak Park','Naperville','Rosemont','Schaumburg','Wicker Park','Lincoln Park','Logan Square','River North','West Loop','South Loop','Hyde Park','Andersonville'],
  'Urban STRs — conventions, sports & world-class dining',
  'Chicago is the third-largest city in the US and a top STR market for convention travelers, sports fans, and urban tourists. The greater Chicago area — from River North luxury condos to lakefront Hyde Park apartments — offers strong year-round demand anchored by McCormick Place conventions and championship sports.')

on conflict (slug) do nothing;

-- ============================================================
-- 5. TIER 3 — 10 markets
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Asheville', 'asheville', 'NC',
  ARRAY['Asheville','Black Mountain','Weaverville','Woodfin','Swannanoa','Arden','Fletcher','Hendersonville','Brevard','Waynesville','Canton','Marshall'],
  'Blue Ridge Mountains — arts, breweries & mountain retreats',
  'Asheville is one of America''s most beloved mountain cities and a top-performing STR market, known for its vibrant arts scene, world-class craft brewery culture, and stunning Blue Ridge Mountain setting. Year-round visitors for festivals, leaf peeping, hiking, and culinary tourism.'),

('Outer Banks', 'outer-banks', 'NC',
  ARRAY['Kill Devil Hills','Kitty Hawk','Nags Head','Duck','Corolla','Southern Shores','Manteo','Avon','Buxton','Hatteras','Ocracoke'],
  'North Carolina''s barrier island paradise — beach houses & wild horses',
  'The Outer Banks of North Carolina is one of the East Coast''s premier vacation rental destinations, famous for its wide beaches, wild horse herds, and charming lighthouse towns. Massive group-travel beach houses drive some of the highest weekly rental revenues on the East Coast.'),

('Hilton Head', 'hilton-head', 'SC',
  ARRAY['Hilton Head Island','Bluffton','Hardeeville','Beaufort','Port Royal','Daufuskie Island'],
  'Golf, tennis & resort living on South Carolina''s Lowcountry island',
  'Hilton Head Island is one of the most refined resort destinations in the Southeast, famous for its world-class golf courses, pristine beaches, and upscale plantation communities. Strong demand from golf groups, family reunions, and corporate retreats year-round.'),

('Key West', 'key-west', 'FL',
  ARRAY['Key West','Stock Island','Big Coppitt Key','Sugarloaf Key','Marathon','Islamorada','Key Largo'],
  'Southernmost US destination — sunset cruises, conch houses & year-round sun',
  'Key West is the southernmost point of the continental United States and one of Florida''s most iconic vacation destinations. The Florida Keys STR market offers historic Conch houses in Old Town Key West, waterfront fishing cottages, and eco-tourism properties near Key Largo.'),

('Lake Tahoe', 'lake-tahoe', 'CA',
  ARRAY['South Lake Tahoe','North Lake Tahoe','Tahoe City','Kings Beach','Incline Village','Truckee','Carnelian Bay','Tahoma','Homewood','Stateline','Crystal Bay'],
  'America''s alpine lake — ski season, summer recreation & year-round demand',
  'Lake Tahoe is one of the most stunning natural settings in North America and a premier four-season STR market. The basin spans California ski towns like South Lake Tahoe and Truckee to Nevada''s Incline Village — all with exceptional natural beauty driving strong multi-season demand.'),

('Park City', 'park-city', 'UT',
  ARRAY['Park City','Heber City','Midway','Kamas','Jeremy Ranch','Snyderville','Silver Creek Village'],
  'Utah''s premier ski resort town — Sundance, world-class skiing & mountain life',
  'Park City is Utah''s most famous mountain resort town and home to two of North America''s top ski resorts — Park City Mountain Resort and Deer Valley. Exceptional STR performance across ski season, the Sundance Film Festival, and summer mountain recreation.'),

('Sedona', 'sedona', 'AZ',
  ARRAY['Sedona','Village of Oak Creek','Cottonwood','Clarkdale','Jerome','Cornville','Camp Verde','Oak Creek Canyon'],
  'Red rock country — spiritual retreats, hiking & luxury desert wellness',
  'Sedona is one of the most visually dramatic destinations in America, famous for its towering red rock formations, spiritual vortex sites, and world-class luxury spa resorts. High average nightly rates driven by limited lodging supply and extraordinary natural setting.'),

('Savannah', 'savannah', 'GA',
  ARRAY['Savannah','Tybee Island','Pooler','Richmond Hill','Hinesville','Garden City','Thunderbolt'],
  'Georgia''s coastal gem — historic squares, ghost tours & Southern hospitality',
  'Savannah is one of the most beautiful historic cities in America and a fast-growing STR market, known for its stunning Spanish moss-draped squares, antebellum architecture, and vibrant food and arts scene. Strong year-round tourism driven by SCAD, corporate travel, and destination weddings.'),

('Virginia Beach', 'virginia-beach', 'VA',
  ARRAY['Virginia Beach','Norfolk','Chesapeake','Hampton','Newport News','Suffolk','Williamsburg','Sandbridge','Chincoteague'],
  'Mid-Atlantic beach destination — the longest pleasure beach in the world',
  'Virginia Beach is the most populous city in Virginia and home to one of the East Coast''s most popular beach resort areas. The market spans oceanfront condos, peaceful Sandbridge vacation homes, and historic Williamsburg rentals — with strong summer family tourism and military-related travel.'),

('San Antonio', 'san-antonio', 'TX',
  ARRAY['San Antonio','New Braunfels','Boerne','Schertz','Universal City','Seguin','Kerrville','Fredericksburg','Helotes','Leon Valley'],
  'Texas''s most visited city — the Alamo, River Walk & Hill Country gateway',
  'San Antonio is the most visited city in Texas, anchored by the iconic River Walk, the Alamo, and a thriving convention and tourism industry. The market extends into the Texas Hill Country through New Braunfels, Boerne, and Fredericksburg for vineyard retreats and natural swimming holes.')

on conflict (slug) do nothing;

-- ============================================================
-- 6. TIER 4 — 24 markets (Beach/Coastal + Mountain/Ski)
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Gulf Shores', 'gulf-shores', 'AL',
  ARRAY['Gulf Shores','Orange Beach','Fort Morgan','Gulf State Park','Foley','Fairhope','Daphne','Spanish Fort'],
  'Alabama''s Gulf Coast — white sand beaches and laid-back Southern charm',
  'Gulf Shores and Orange Beach form Alabama''s beloved Gulf Coast destination, offering some of the South''s most beautiful white sand beaches at a more accessible price point than Florida neighbors. Strong summer family tourism and consistently high demand from Southeast travelers.'),

('Panama City Beach', 'panama-city-beach', 'FL',
  ARRAY['Panama City Beach','Panama City','Inlet Beach','Seacrest','Rosemary Beach','Mexico Beach','Callaway','Lynn Haven'],
  'Florida''s Gulf Coast party and family beach — the Redneck Riviera',
  'Panama City Beach is one of Florida''s most visited beach destinations, famous for its brilliant emerald waters, sugar-white sand, and high-energy Gulf Coast atmosphere. Massive spring break demand, strong summer family occupancy, and growing shoulder seasons.'),

('Naples', 'naples', 'FL',
  ARRAY['Naples','Marco Island','Bonita Springs','Estero','Fort Myers Beach','Cape Coral','Sanibel','Captiva'],
  'Southwest Florida''s luxury coast — world-class beaches and refined living',
  'Naples is the crown jewel of Southwest Florida''s vacation rental market, consistently ranking among America''s most desirable destinations for upscale travelers. The area encompasses Marco Island, Bonita Springs, Fort Myers Beach, and the iconic barrier islands of Sanibel and Captiva.'),

('Anna Maria Island', 'anna-maria-island', 'FL',
  ARRAY['Anna Maria','Holmes Beach','Bradenton Beach','Longboat Key','Siesta Key','Sarasota','Bradenton','Cortez','Lakewood Ranch'],
  'Old Florida charm on the Gulf — pristine beaches and relaxed island life',
  'Anna Maria Island is one of Florida''s most cherished vacation rental destinations, preserving the Old Florida character lost in more developed areas. Siesta Key''s legendary white quartz sand and Sarasota''s cultural scene attract travelers who want exceptional Gulf Coast beaches without mega-resort atmosphere.'),

('Cape Cod', 'cape-cod', 'MA',
  ARRAY['Hyannis','Falmouth','Yarmouth','Dennis','Brewster','Chatham','Orleans','Wellfleet','Provincetown','Barnstable','Sandwich','Bourne','Mashpee','Harwich','Eastham','Truro'],
  'New England''s iconic summer peninsula — beaches, lobster and lighthouse towns',
  'Cape Cod is one of the most iconic vacation destinations in America, drawing millions of summer visitors to its historic lighthouse towns, pristine National Seashore beaches, and legendary New England seafood. An affluent, repeat-visitor demographic generates some of the Northeast''s strongest seasonal vacation rental revenue.'),

('Hamptons', 'hamptons', 'NY',
  ARRAY['Southampton','East Hampton','Sag Harbor','Montauk','Bridgehampton','Westhampton','Shelter Island','Water Mill','Amagansett','Quogue','Hampton Bays'],
  'New York''s exclusive summer playground — beaches, estates and celebrity culture',
  'The Hamptons is America''s most glamorous summer destination and one of the world''s highest-value vacation rental markets. Southampton, East Hampton, and Montauk attract New York City''s wealthiest residents each summer, driving extraordinary weekly and seasonal rental rates.'),

('Jersey Shore', 'jersey-shore', 'NJ',
  ARRAY['Ocean City NJ','Cape May','Wildwood','Stone Harbor','Avalon','Sea Isle City','Brigantine','Long Beach Island','Point Pleasant','Asbury Park','Spring Lake','Seaside Heights','Bay Head'],
  'New Jersey''s beloved coastline — boardwalks, beaches and classic American summers',
  'The Jersey Shore spans more than 130 miles of Atlantic Ocean beaches from Sandy Hook to Cape May. The STR market encompasses upscale Avalon, vibrant boardwalk communities, and Victorian Cape May — all within a few hours of tens of millions of Northeast visitors.'),

('Ocean City', 'ocean-city', 'MD',
  ARRAY['Ocean City MD','West Ocean City','Assateague Island','Berlin','Ocean Pines','Bethany Beach DE','Fenwick Island','Rehoboth Beach DE','Lewes','Milton'],
  'Mid-Atlantic''s favorite beach resort — Maryland''s iconic oceanfront destination',
  'Ocean City, Maryland is the quintessential Mid-Atlantic beach resort, drawing millions of visitors each summer to its 10-mile stretch of Atlantic beach and famous boardwalk. The market extends into Delaware''s quieter beaches at Bethany Beach, Fenwick Island, and Rehoboth Beach.'),

('Galveston', 'galveston', 'TX',
  ARRAY['Galveston','Jamaica Beach','Crystal Beach','Bolivar Peninsula','Surfside Beach','Tiki Island','La Marque','Texas City','League City','Kemah'],
  'Texas Gulf Coast island city — beaches, history and year-round Gulf breezes',
  'Galveston is the primary beach vacation destination for millions of Texans and the only island city on the Texas Gulf Coast. Oceanfront beach houses, historic Strand district properties, and Crystal Beach fishing cottages benefit from proximity to Houston''s massive metropolitan population.'),

('Rehoboth Beach', 'rehoboth-beach', 'DE',
  ARRAY['Rehoboth Beach','Dewey Beach','Bethany Beach','Fenwick Island','Lewes','Milton','Millsboro','Long Neck'],
  'Delaware''s beach resort — the Nation''s Summer Capital',
  'Rehoboth Beach is Delaware''s premier coastal resort destination, nicknamed "The Nation''s Summer Capital" for its popularity with Washington DC politicians. The greater area includes Dewey Beach''s lively scene, family-friendly Bethany Beach, and quiet Fenwick Island.'),

('South Padre Island', 'south-padre-island', 'TX',
  ARRAY['South Padre Island','Port Isabel','Laguna Vista','Brownsville','Harlingen','Los Fresnos','San Benito'],
  'Texas''s southernmost beach destination — Gulf Coast paradise near the border',
  'South Padre Island is Texas''s premier beach resort island at the southern tip of Texas with clear Gulf waters, excellent fishing, and world-class kite surfing. Strong spring break demand, summer family tourism, winter snowbirds, and year-round ecotourism.'),

('30A', 'thirty-a', 'FL',
  ARRAY['Seaside','Rosemary Beach','Alys Beach','WaterColor','Grayton Beach','Santa Rosa Beach','Blue Mountain Beach','Seagrove Beach','Inlet Beach','Seacrest','Watersound','Miramar Beach'],
  'Florida''s most beautiful coastal corridor — emerald waters and New Urbanist villages',
  'Scenic Highway 30A in Florida''s Walton County is widely considered the most beautiful stretch of Gulf Coast in the US, home to Seaside, Rosemary Beach, and Alys Beach. Commands the highest nightly rates in the Florida Panhandle.'),

('Breckenridge', 'breckenridge', 'CO',
  ARRAY['Breckenridge','Frisco','Dillon','Silverthorne','Keystone','Copper Mountain','Blue River','Alma','Fairplay'],
  'Colorado''s favorite ski town — historic Main Street and world-class skiing',
  'Breckenridge is one of Colorado''s most beloved mountain resort towns and home to the state''s most-visited ski resort. Exceptional performance across winter ski season, summer mountain biking and hiking, and a vibrant festival calendar.'),

('Vail', 'vail', 'CO',
  ARRAY['Vail','Beaver Creek','Avon','Eagle-Vail','Edwards','Minturn','Eagle','Gypsum'],
  'Colorado''s legendary world-class ski resort — European-inspired alpine village',
  'Vail is one of the most prestigious ski resorts in the world and home to Colorado''s most exclusive mountain vacation rental market. The Vail Valley including Beaver Creek attracts an international ultra-high-net-worth guest demographic.'),

('Aspen', 'aspen', 'CO',
  ARRAY['Aspen','Snowmass Village','Basalt','El Jebel','Carbondale','Glenwood Springs','Woody Creek'],
  'America''s most glamorous mountain resort — world-class skiing and cultural prestige',
  'Aspen is the most internationally recognized mountain resort in America and one of the world''s premier luxury vacation destinations. Commands the highest vacation rental nightly rates in Colorado and some of the highest in the United States.'),

('Steamboat Springs', 'steamboat-springs', 'CO',
  ARRAY['Steamboat Springs','Steamboat Resort','Clark','Hayden','Craig','Oak Creek','Phippsburg','Yampa'],
  'Colorado''s Ski Town USA — champagne powder and authentic Western mountain culture',
  'Steamboat Springs is "Ski Town USA" — a Colorado mountain town with deep authentic Western roots and legendary champagne powder snow. Growing year-round appeal makes it one of Colorado''s most consistently-performing vacation rental markets.'),

('Telluride', 'telluride', 'CO',
  ARRAY['Telluride','Mountain Village','Ophir','Sawpit','Rico','Placerville','Norwood','Ridgway','Ouray'],
  'Colorado''s most dramatic ski resort — a Victorian box canyon surrounded by 14,000-foot peaks',
  'Telluride is arguably Colorado''s most breathtaking mountain destination — a Victorian mining town nestled in a stunning box canyon. World-class film and music festivals create premium demand far beyond ski season. Geographic isolation and strict growth controls limit supply.'),

('Jackson Hole', 'jackson-hole', 'WY',
  ARRAY['Jackson','Teton Village','Wilson','Kelly','Moose','Moran','Alta','Star Valley Ranch','Etna','Afton'],
  'Wyoming''s iconic mountain valley — Grand Teton views and world-class skiing',
  'Jackson Hole combines the extraordinary natural beauty of Grand Teton National Park and Yellowstone''s southern gateway with some of North America''s most challenging ski terrain. Attracts affluent outdoor enthusiasts and luxury travelers year-round.'),

('Big Sky', 'big-sky', 'MT',
  ARRAY['Big Sky','Gallatin Gateway','Four Corners','Manhattan MT','Belgrade','Bozeman','West Yellowstone','Gardiner','Livingston'],
  'Montana''s fastest-growing mountain resort — biggest skiing and Yellowstone gateway',
  'Big Sky Resort is North America''s largest ski resort by acreage, and has emerged as one of the fastest-growing luxury mountain resort markets in the US. Combines exceptional ski terrain, stunning Montana wilderness, and proximity to Yellowstone National Park.'),

('Sun Valley', 'sun-valley', 'ID',
  ARRAY['Sun Valley','Ketchum','Hailey','Bellevue','Carey','Picabo','Fairfield','Blaine County'],
  'Idaho''s legendary ski resort — America''s first destination ski resort since 1936',
  'Sun Valley is one of America''s oldest and most legendary ski resorts, developed in 1936 and still attracting the Hollywood elite and Fortune 500 executives. Exceptional year-round performance in one of the Mountain West''s most exclusive vacation rental markets.'),

('Mammoth Lakes', 'mammoth-lakes', 'CA',
  ARRAY['Mammoth Lakes','June Lake','Lee Vining','Crowley Lake','Bishop','Bridgeport'],
  'California''s premier ski resort — Eastern Sierra alpine paradise year-round',
  'Mammoth Lakes is California''s most popular ski destination, situated at 8,000 feet in the Eastern Sierra Nevada. Serves Southern California''s enormous population base with world-class skiing, summer mountain biking, and proximity to Yosemite''s eastern gateway.'),

('Big Bear', 'big-bear', 'CA',
  ARRAY['Big Bear Lake','Big Bear City','Fawnskin','Moonridge','Sugarloaf','Running Springs','Arrowbear','Lake Arrowhead','Blue Jay','Twin Peaks'],
  'Southern California''s mountain escape — skiing and lake recreation above LA',
  'Big Bear Lake is Southern California''s most accessible mountain resort destination, just two hours from Los Angeles. Benefits from 20+ million Southern California residents within driving distance, creating strong weekend and holiday demand for lakeside cabins and ski chalets.'),

('Bend', 'bend', 'OR',
  ARRAY['Bend','Sunriver','Sisters','Redmond','La Pine','Tumalo','Terrebonne','Prineville','Madras'],
  'Oregon''s outdoor adventure capital — four seasons of recreation in the high desert',
  'Bend combines exceptional year-round outdoor activities — skiing at Mt. Bachelor, world-class fly fishing, mountain biking, and whitewater rafting — with a vibrant craft beer scene and stunning high desert landscape. One of the Pacific Northwest''s strongest and most diversified outdoor recreation markets.'),

('Whitefish', 'whitefish', 'MT',
  ARRAY['Whitefish','Kalispell','Columbia Falls','Glacier National Park','West Glacier','Bigfork','Lakeside','Polson','Marion'],
  'Montana''s Glacier Country — world-class skiing and Glacier National Park gateway',
  'Whitefish is a charming Montana mountain town and gateway to both Whitefish Mountain Resort and Glacier National Park, one of America''s most spectacular national parks. Strong year-round tourism driven by ski season and the intense Glacier summer season.')

on conflict (slug) do nothing;

-- ============================================================
-- 7. TIER 5 — 30 markets (Beach + Mountain/Nature + Urban)
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Clearwater', 'clearwater', 'FL',
  ARRAY['Clearwater','St. Petersburg','Clearwater Beach','Dunedin','Safety Harbor','Tarpon Springs','Palm Harbor','Largo','Seminole','Indian Rocks Beach','Madeira Beach','St. Pete Beach'],
  'Tampa Bay''s Gulf Coast jewel — award-winning beaches and year-round sunshine',
  'Clearwater Beach consistently ranks among America''s best beaches. The greater Clearwater and St. Pete Beach STR market offers exceptional year-round occupancy from warm weather tourism, Tampa Bay conventions, and a diverse visitor base from spring breakers to winter snowbirds.'),

('Fort Lauderdale', 'fort-lauderdale', 'FL',
  ARRAY['Fort Lauderdale','Pompano Beach','Deerfield Beach','Lauderdale-by-the-Sea','Hollywood','Hallandale Beach','Dania Beach','Oakland Park','Wilton Manors','Lighthouse Point'],
  'South Florida''s yachting capital — beaches, waterways and international flair',
  'Fort Lauderdale is one of South Florida''s most vibrant vacation destinations, famous for its extensive network of navigable waterways and 23 miles of Atlantic beaches. Benefits from its position between Miami and Palm Beach and proximity to one of the world''s busiest cruise ports.'),

('Nantucket', 'nantucket', 'MA',
  ARRAY['Nantucket','Siasconset','Madaket','Surfside','Cisco','Wauwinet','Quidnet'],
  'America''s most exclusive island retreat — cobblestones, grey shingles and pristine beaches',
  'Nantucket is one of America''s most coveted and expensive vacation destinations — a historic whaling island 30 miles off Cape Cod with strict architectural preservation, pristine beaches, and an ultra-affluent seasonal community that returns summer after summer.'),

('Martha''s Vineyard', 'marthas-vineyard', 'MA',
  ARRAY['Edgartown','Vineyard Haven','Oak Bluffs','West Tisbury','Chilmark','Aquinnah','Menemsha','Chappaquiddick'],
  'New England''s beloved island escape — celebrities, lighthouses and sandy shores',
  'Martha''s Vineyard is one of America''s most beloved island vacation destinations, a 100-square-mile island off Cape Cod that has drawn presidents, celebrities, and discerning summer visitors for generations. Extremely limited inventory and intense year-round demand from Boston and New York.'),

('Bar Harbor', 'bar-harbor', 'ME',
  ARRAY['Bar Harbor','Mount Desert Island','Southwest Harbor','Northeast Harbor','Seal Harbor','Acadia National Park','Ellsworth','Trenton','Blue Hill','Camden','Rockport ME'],
  'Maine''s crown jewel — Acadia National Park gateway and coastal New England charm',
  'Bar Harbor is the gateway to Acadia National Park, one of America''s most visited national parks. The STR market spans Mount Desert Island and Maine''s mid-coast, drawing outdoor adventurers, leaf peepers, and seafood lovers seeking the quintessential rugged New England coastal experience.'),

('Mississippi Gulf Coast', 'mississippi-gulf-coast', 'MS',
  ARRAY['Biloxi','Gulfport','Ocean Springs','Pascagoula','Long Beach','Pass Christian','Bay St. Louis','Waveland','D''Iberville','Gautier'],
  'Gulf Coast casinos, beaches and Southern hospitality on the Mississippi shore',
  'The Mississippi Gulf Coast stretches 62 miles along the Gulf of Mexico and has reinvented itself as a major tourism destination anchored by world-class casino resorts in Biloxi alongside beautiful natural beaches and the charming historic town of Ocean Springs.'),

('Crystal Coast', 'crystal-coast', 'NC',
  ARRAY['Emerald Isle','Atlantic Beach','Pine Knoll Shores','Indian Beach','Salter Path','Beaufort','Morehead City','Cape Carteret','Swansboro','Cedar Island','Harkers Island'],
  'North Carolina''s undiscovered coast — crystal clear waters and Cape Lookout wilderness',
  'The Crystal Coast of North Carolina offers pristine barrier island beaches, the wild Cape Lookout National Seashore, and the charming maritime town of Beaufort — all at price points well below the Outer Banks. Strong seasonal demand from Raleigh-Durham and Charlotte.'),

('Newport', 'newport', 'RI',
  ARRAY['Newport','Middletown','Portsmouth','Bristol','Tiverton','Little Compton','Jamestown','Narragansett','South Kingstown','Watch Hill'],
  'Rhode Island''s gilded-age resort — Gilded Age mansions, sailing and Atlantic beaches',
  'Newport is one of America''s most historically rich coastal resort destinations, famous for its extraordinary Gilded Age mansions, world-class sailing heritage, and stunning Ocean Drive. Attracts history enthusiasts, sailing fans, wedding parties, and affluent New England families.'),

('Port Aransas', 'port-aransas', 'TX',
  ARRAY['Port Aransas','Mustang Island','Aransas Pass','Rockport','Fulton','Corpus Christi','Flour Bluff','Portland TX','Gregory','Ingleside'],
  'Texas''s favorite island beach town — Mustang Island surf, fishing and Gulf Coast fun',
  'Port Aransas on Mustang Island is Texas''s most beloved beach town, a laid-back fishing village turned vacation paradise on the Gulf Coast. Draws millions of Texas families annually with strong year-round demand and exceptional value compared to Florida beach destinations.'),

('Amelia Island', 'amelia-island', 'FL',
  ARRAY['Amelia Island','Fernandina Beach','Nassau County','Yulee','Callahan','Hilliard','St. Marys GA','Kingsland GA'],
  'Florida''s northernmost barrier island — Victorian charm, pristine beaches and sea turtles',
  'Amelia Island is one of Florida''s most beloved and unspoiled barrier islands, famous for its gorgeous Victorian-era downtown Fernandina Beach and miles of uncrowded Atlantic beaches. Strong demand from Jacksonville, Atlanta, and Charlotte visitors seeking a refined, quieter alternative.'),

('Blue Ridge', 'blue-ridge', 'GA',
  ARRAY['Blue Ridge','Ellijay','Blairsville','Dahlonega','Helen','Hiawassee','Murphy NC','McCaysville','Epworth','Morganton'],
  'North Georgia''s mountain escape — cabins, wine trails and Appalachian beauty',
  'Blue Ridge is the capital of North Georgia''s fast-growing mountain vacation rental market, a charming small town surrounded by the Blue Ridge Mountains with a thriving arts scene, excellent hiking, and wine trails. One of the South''s hottest vacation rental investment markets.'),

('Poconos', 'poconos', 'PA',
  ARRAY['Mount Pocono','Stroudsburg','East Stroudsburg','Delaware Water Gap','Jim Thorpe','Lake Harmony','Hawley','Honesdale','Milford PA','Bushkill','Tannersville','Tobyhanna','Pocono Summit'],
  'Pennsylvania''s mountain playground — lakes, ski slopes and year-round Northeast escapes',
  'The Pocono Mountains of northeastern Pennsylvania is one of the East Coast''s most popular year-round vacation destinations, offering skiing, lake recreation, hiking, and casino entertainment within easy driving distance of New York City and Philadelphia.'),

('Flagstaff', 'flagstaff', 'AZ',
  ARRAY['Flagstaff','Williams','Sedona','Jerome','Clarkdale','Page','Tusayan','Cameron','Winslow','Holbrook','Show Low','Pinetop-Lakeside'],
  'Arizona''s mountain city — Grand Canyon gateway and cool pine forest escape',
  'Flagstaff is Arizona''s mountain escape — a vibrant university city at 7,000 feet elevation surrounded by the largest contiguous ponderosa pine forest in North America, an hour from the South Rim of the Grand Canyon. Diversified four-season vacation rental demand.'),

('Durango', 'durango', 'CO',
  ARRAY['Durango','Purgatory Resort','Bayfield','Ignacio','Silverton','Ouray','Cortez','Mancos','Hesperus','Fort Lewis','Hermosa'],
  'Southwest Colorado''s adventure hub — Purgatory skiing, Mesa Verde and the Animas River',
  'Durango is one of Colorado''s most complete and authentic mountain towns in the San Juan Mountains with a thriving outdoor recreation scene spanning Purgatory Resort skiing, world-class mountain biking, fly fishing, and proximity to Mesa Verde National Park.'),

('Boone', 'boone', 'NC',
  ARRAY['Boone','Banner Elk','Blowing Rock','Linville','Valle Crucis','Sugar Mountain','Beech Mountain','West Jefferson','Jefferson','Newland','Elk Park','Grandfather Mountain'],
  'North Carolina High Country — skiing, Appalachian Trail access and mountain culture',
  'Boone and the North Carolina High Country offers Appalachian State University''s vibrant college town energy alongside excellent skiing, spectacular Blue Ridge Parkway access, and some of the East Coast''s most dramatic mountain scenery.'),

('Door County', 'door-county', 'WI',
  ARRAY['Sturgeon Bay','Fish Creek','Ephraim','Sister Bay','Egg Harbor','Baileys Harbor','Ellison Bay','Gills Rock','Washington Island','Jacksonport','Forestville','Brussels'],
  'Wisconsin''s Cape Cod — Great Lakes peninsula of cherry orchards and charming harbor towns',
  'Door County is the thumb-shaped peninsula jutting into Lake Michigan, called "the Cape Cod of the Midwest." 250 miles of shoreline, five state parks, charming harbor villages, and cherry orchards draw three million visitors annually with fierce Midwest visitor loyalty.'),

('Traverse City', 'traverse-city', 'MI',
  ARRAY['Traverse City','Suttons Bay','Leland','Glen Arbor','Empire','Frankfort','Elk Rapids','Bellaire','Charlevoix','Petoskey','Harbor Springs','Sleeping Bear Dunes','Northport'],
  'Michigan''s cherry capital — Sleeping Bear Dunes, crystal-clear lakes and wine country',
  'Traverse City is the heart of Michigan''s stunning Old Mission and Leelanau peninsulas, home to the Sleeping Bear Dunes National Lakeshore (voted "Most Beautiful Place in America"), world-class freshwater beaches, and a booming wine country.'),

('Joshua Tree', 'joshua-tree', 'CA',
  ARRAY['Joshua Tree','Twentynine Palms','Yucca Valley','Desert Hot Springs','Pioneertown','Morongo Valley','Landers','Wonder Valley','Palm Springs','Palm Desert','Indio'],
  'California''s high desert escape — surreal landscapes, stargazing and bohemian culture',
  'Joshua Tree has emerged as one of California''s most exciting vacation rental markets, driven by the National Park''s extraordinary landscapes, world-class rock climbing, and proximity to the Coachella Valley. A uniquely creative guest demographic seeks the surreal beauty and profound quiet of the Mojave Desert.'),

('Palm Springs', 'palm-springs', 'CA',
  ARRAY['Palm Springs','Palm Desert','Rancho Mirage','Indian Wells','La Quinta','Indio','Desert Hot Springs','Cathedral City','Coachella'],
  'Southern California''s desert resort — mid-century architecture, Coachella and pool culture',
  'Palm Springs is one of California''s most iconic vacation destinations — a desert oasis of stunning mid-century modern architecture, world-class golf courses, and near-perfect winter sunshine just two hours from Los Angeles. Exceptional year-round performance with Coachella festival peak rates.'),

('Napa Valley', 'napa-valley', 'CA',
  ARRAY['Napa','Yountville','St. Helena','Calistoga','Rutherford','Oakville','American Canyon','Sonoma','Healdsburg','Petaluma','Sebastopol','Santa Rosa','Guerneville','Bodega Bay'],
  'America''s wine country — world-famous vintages, Michelin-starred dining and vineyard retreats',
  'Napa Valley and neighboring Sonoma County constitute America''s premier wine country destination, attracting sophisticated travelers for tastings, farm-to-table dining, and the uniquely elegant Wine Country lifestyle. Strong year-round demand with harvest season peaks.'),

('San Francisco', 'san-francisco', 'CA',
  ARRAY['San Francisco','Oakland','Berkeley','Sausalito','Tiburon','Mill Valley','San Jose','Santa Cruz','Half Moon Bay','Pacifica'],
  'The City by the Bay — iconic culture, tech innovation and breathtaking scenery',
  'San Francisco is one of the world''s great cities and a perennial top-10 STR market, combining extraordinary natural beauty with unmatched cultural richness, world-class dining, and its role as the center of global technology innovation.'),

('Seattle', 'seattle', 'WA',
  ARRAY['Seattle','Bellevue','Kirkland','Redmond','Tacoma','Olympia','Bainbridge Island','Vashon Island','Snoqualmie','North Bend','Leavenworth','Edmonds','Everett','Gig Harbor'],
  'The Emerald City — tech culture, coffee, Pike Place and Pacific Northwest adventure',
  'Seattle is the Pacific Northwest''s dominant city — a stunning metropolis surrounded by water, mountains, and forests with a world-class food scene, booming tech industry, and extraordinary proximity to outdoor adventure.'),

('Dallas', 'dallas', 'TX',
  ARRAY['Dallas','Fort Worth','Plano','Frisco','McKinney','Allen','Irving','Arlington','Grapevine','Southlake','Addison','Richardson','Garland','Mesquite','Grand Prairie'],
  'Texas''s largest metro — business travel, sports and thriving arts and entertainment',
  'Dallas-Fort Worth is the fourth-largest metropolitan area in the United States, anchored by a thriving corporate headquarters economy, three major professional sports teams, a world-class arts district, and DFW International Airport as one of the busiest air travel hubs in the world.'),

('Houston', 'houston', 'TX',
  ARRAY['Houston','The Woodlands','Sugar Land','Katy','Pearland','League City','Friendswood','Clear Lake','Galveston','Baytown','Pasadena','Humble','Conroe','Tomball','Spring'],
  'Space City — energy capital of the world, world-class medical center and diverse culture',
  'Houston is America''s fourth-largest city and a global energy, medical, and aerospace capital with extraordinary cultural diversity, world-class museums, and a famously bold food scene. Benefits from the Texas Medical Center and relentless convention and corporate travel demand.'),

('Atlanta', 'atlanta', 'GA',
  ARRAY['Atlanta','Decatur','Sandy Springs','Marietta','Buckhead','Midtown','Old Fourth Ward','Inman Park','Virginia-Highland','Smyrna','Alpharetta','Roswell','Dunwoody','Peachtree City'],
  'Georgia''s capital — New South energy, film production and Southern hospitality',
  'Atlanta is the capital of the New South — a dynamic metropolis that has become a major global business hub, one of America''s top film production cities, and the cultural capital of the African American experience. Benefits from Hartsfield-Jackson International Airport and a massive convention base.'),

('Boston', 'boston', 'MA',
  ARRAY['Boston','Cambridge','Somerville','Brookline','Newton','Quincy','Waltham','Lexington','Concord','Salem','Plymouth','Gloucester','Marblehead','Provincetown'],
  'America''s walking city — Revolutionary history, world-class universities and New England charm',
  'Boston is one of America''s most walkable, historically rich, and internationally celebrated cities. Benefits from one of the country''s highest concentrations of universities and hospitals, a huge international visitor base, and major conventions that drive peak-season demand to extraordinary levels.'),

('Washington DC', 'washington-dc', 'DC',
  ARRAY['Washington DC','Arlington VA','Alexandria VA','Bethesda MD','Silver Spring MD','Rockville MD','Chevy Chase MD','Capitol Hill','Georgetown','Dupont Circle','Adams Morgan'],
  'America''s capital — monuments, museums, power and world-class cultural institutions',
  'Washington DC is America''s most visited domestic tourism destination, home to the National Mall''s extraordinary collection of free Smithsonian museums, iconic monuments, and the US Capitol. Exceptional year-round performance driven by political tourism, school groups, conventions, and international diplomacy.'),

('Philadelphia', 'philadelphia', 'PA',
  ARRAY['Philadelphia','Camden NJ','Cherry Hill NJ','King of Prussia','Conshohocken','Ardmore','Wayne','Wilmington DE','Society Hill','Fishtown','Northern Liberties','Old City'],
  'America''s first great city — Liberty Bell, cheesesteaks and world-class art',
  'Philadelphia is America''s first great city and one of the East Coast''s most underrated urban tourism destinations, combining extraordinary Revolutionary history, a world-class art museum, and one of America''s best restaurant scenes. Strong convention activity and explosive growth in leisure tourism.'),

('Tampa', 'tampa', 'FL',
  ARRAY['Tampa','St. Petersburg','Clearwater','Brandon','Wesley Chapel','Land O'' Lakes','Lutz','Temple Terrace','Plant City','Riverview','Apollo Beach','Ruskin'],
  'Florida''s west coast hub — Ybor City, championship sports and Gulf Coast gateway',
  'Tampa is one of Florida''s fastest-growing metropolitan areas combining the energy of a major sports city, the rich Cuban heritage of Ybor City, and its role as one of the world''s busiest cruise ports with the beautiful beaches of the greater Tampa Bay area.'),

('Portland', 'portland', 'OR',
  ARRAY['Portland','Beaverton','Hillsboro','Gresham','Lake Oswego','Tigard','Tualatin','Milwaukie','Oregon City','Troutdale','Hood River','Sandy','Cannon Beach','Seaside OR','Astoria'],
  'The City of Roses — food culture, craft everything and Pacific Northwest authenticity',
  'Portland is one of America''s most uniquely creative and livable cities, famous for its extraordinary food cart scene, thriving craft brewing culture, and fierce commitment to local businesses. Proximity to Mount Hood skiing and Columbia River Gorge recreation makes it a diversified year-round market.')

on conflict (slug) do nothing;

-- ============================================================
-- 8. TIER 6 — 26 markets (Hawaii, Mountain/Nature, Beach, Urban)
-- ============================================================
insert into public.markets (name, slug, state, cities, tagline, description) values

('Maui', 'maui', 'HI',
  ARRAY['Wailea','Kihei','Lahaina','Paia','Haiku','Makawao','Kapalua'],
  'Hawaii''s Valley Isle — world-class beaches, Road to Hana and Haleakalā',
  'Maui is Hawaii''s second-largest island and one of the world''s top STR destinations, offering world-class beaches, lush rainforests, and the iconic Road to Hana. Wailea, Kihei, and Lahaina are the primary STR hubs with extraordinary nightly rates.'),

('Oahu', 'oahu', 'HI',
  ARRAY['Honolulu','Waikiki','Kailua','Haleiwa','Kaneohe','Hawaii Kai','Ewa Beach'],
  'The Gathering Place — Waikiki, North Shore surf and Pearl Harbor',
  'Home to Waikiki, the North Shore, and Pearl Harbor, Oahu is Hawaii''s most-visited island. STR demand spans the bustling urban core of Honolulu to the laid-back surf culture of Haleiwa and Sunset Beach.'),

('Kauai', 'kauai', 'HI',
  ARRAY['Poipu','Princeville','Hanalei','Kapaa','Lihue','Koloa','Waimea'],
  'The Garden Isle — dramatic cliffs, lush valleys and pristine north shore beaches',
  'Known as the "Garden Isle," Kauai offers dramatic cliffs, lush valleys, and pristine beaches. Poipu on the south shore and Princeville on the north shore are the top STR markets on this most naturally dramatic Hawaiian island.'),

('Big Island', 'big-island', 'HI',
  ARRAY['Kona','Waikoloa','Hilo','Volcano','Holualoa','Captain Cook','Pahoa'],
  'Hawaii''s largest island — volcanoes, manta rays and diverse microclimates',
  'Hawaii''s biggest island spans diverse climates from volcanic landscapes to snow-capped peaks. Kona, Waikoloa, and Hilo attract STR guests seeking unique experiences from snorkeling with manta rays to volcano tours at Hawaii Volcanoes National Park.'),

('Moab', 'moab', 'UT',
  ARRAY['Moab','Castle Valley'],
  'Utah''s red rock adventure capital — Arches, Canyonlands and world-class off-roading',
  'Moab is the gateway to Arches and Canyonlands National Parks, drawing adventure travelers for mountain biking, off-roading, and world-class red-rock scenery. Year-round outdoor recreation drives strong STR demand in one of Utah''s most spectacular settings.'),

('Santa Fe', 'santa-fe', 'NM',
  ARRAY['Santa Fe','Tesuque','Glorieta','Lamy'],
  'The City Different — adobe architecture, world-class art and high-desert culture',
  'Santa Fe is a world-class arts and culture destination set at 7,000 feet. The historic adobe architecture, renowned gallery scene, vibrant dining, and proximity to ski areas make it a perennially strong STR market drawing sophisticated travelers from around the world.'),

('Taos', 'taos', 'NM',
  ARRAY['Taos','Taos Ski Valley','Arroyo Seco','Ranchos de Taos','El Prado'],
  'New Mexico''s mountain art colony — world-class skiing and UNESCO heritage',
  'Taos combines a charming artists'' colony with one of the best ski mountains in the Southwest. The UNESCO World Heritage Taos Pueblo, stunning high-desert landscapes, and boutique lodging scene draw visitors year-round for culture and outdoor adventure.'),

('Stowe', 'stowe', 'VT',
  ARRAY['Stowe','Morrisville','Hyde Park','Johnson'],
  'Vermont''s premier ski resort — Mount Mansfield, farm-to-table and fall foliage',
  'Stowe is Vermont''s premier mountain resort town, home to Mount Mansfield — the state''s highest peak. World-class skiing, a charming village with farm-to-table dining, and stunning foliage make it a four-season STR destination with a loyal affluent guest base.'),

('Catskills', 'catskills', 'NY',
  ARRAY['Woodstock','Saugerties','Phoenicia','Catskill','Tannersville','Roxbury','Hunter','Livingston Manor'],
  'New York City''s weekend mountain escape — farms, rivers and creative culture',
  'The Catskills have experienced a renaissance as the premier weekend escape for New York City. Woodstock, Hudson, and Saugerties anchor the creative scene; hiking, fly-fishing, and farm stays drive STR demand across all seasons.'),

('Finger Lakes', 'finger-lakes', 'NY',
  ARRAY['Watkins Glen','Seneca Falls','Ithaca','Geneva','Hammondsport','Canandaigua','Ovid'],
  'New York wine country — glacial lakes, waterfalls and vineyard escapes',
  'New York''s Finger Lakes region is one of the East Coast''s top wine destinations, with over 100 wineries set along eleven glacial lakes. Watkins Glen, Seneca Falls, and Ithaca anchor a robust year-round STR market.'),

('Hudson Valley', 'hudson-valley', 'NY',
  ARRAY['Kingston','Rhinebeck','Beacon','Woodstock','Hudson','Saugerties','Cold Spring','Millbrook'],
  'New York''s most beautiful valley — historic estates, farm dining and arts',
  'The Hudson Valley blends historic estates, farm-to-table dining, and world-class arts institutions just 90 minutes from New York City. Kingston, Rhinebeck, and Beacon are hotbeds of STR activity for NYC weekenders.'),

('Broken Bow', 'broken-bow', 'OK',
  ARRAY['Broken Bow','Hochatown','Smithville','Eagletown'],
  'Oklahoma''s cabin rental capital — Beavers Bend and secluded pine forest retreats',
  'Broken Bow in southeastern Oklahoma has become one of the fastest-growing cabin rental markets in the country. Beavers Bend State Park, the Mountain Fork River, and lush pine forests draw nature lovers seeking secluded retreat-style STRs.'),

('Lake of the Ozarks', 'lake-of-the-ozarks', 'MO',
  ARRAY['Osage Beach','Lake Ozark','Camdenton','Sunrise Beach','Linn Creek','Laurie'],
  'Missouri''s lake playground — 1,150 miles of shoreline and boating culture',
  'Lake of the Ozarks is Missouri''s premier lake destination, with 1,150 miles of shoreline and a thriving waterfront culture. Osage Beach and Lake Ozark are the STR epicenters for boating, watersports, and lakefront cabin stays.'),

('Pigeon Forge', 'pigeon-forge', 'TN',
  ARRAY['Pigeon Forge','Gatlinburg','Sevierville','Wears Valley','Cosby'],
  'Dollywood country — Smoky Mountains gateway, cabins and family entertainment',
  'Pigeon Forge sits at the entrance to Great Smoky Mountains National Park and hosts millions of visitors annually. Dollywood, outlet shopping, and proximity to Gatlinburg make cabin and chalet rentals one of the densest STR markets in the Southeast.'),

('Sarasota', 'sarasota', 'FL',
  ARRAY['Siesta Key','Sarasota','Longboat Key','Lido Key','Nokomis','Venice','Osprey'],
  'Gulf Coast arts city — Siesta Key''s world-famous beach and cultural sophistication',
  'Sarasota is a sophisticated Gulf Coast destination known for Siesta Key''s world-famous quartz-sand beach, a thriving arts scene, and a year-round warm climate. Siesta Key and Longboat Key are the core STR markets.'),

('St. Augustine', 'st-augustine', 'FL',
  ARRAY['St. Augustine','Anastasia Island','St. Augustine Beach','Vilano Beach','Ponte Vedra'],
  'America''s oldest city — Spanish Colonial history and Atlantic beaches',
  'St. Augustine is America''s oldest city, drawing visitors with its Spanish Colonial architecture, historic Castillo de San Marcos, and beautiful Atlantic beaches. STRs in the historic district and on Anastasia Island are in high demand.'),

('Pensacola', 'pensacola', 'FL',
  ARRAY['Pensacola Beach','Gulf Breeze','Navarre Beach','Perdido Key','Pensacola'],
  'Florida''s best kept beach secret — sugar-white Panhandle sand and emerald water',
  'Pensacola Beach''s sugar-white quartz sand and emerald-green water rival any beach in the country. Strong summer demand and growing shoulder seasons from Southeast drive-to tourism make this an increasingly valuable STR market.'),

('Cannon Beach', 'cannon-beach', 'OR',
  ARRAY['Cannon Beach','Seaside','Manzanita','Arch Cape','Tolovana Park','Pacific City'],
  'Pacific Northwest''s most iconic coast — Haystack Rock and gallery towns',
  'Cannon Beach is the Pacific Northwest''s most iconic coastal destination, known for the towering Haystack Rock sea stack, world-class galleries, and boutique shops. Year-round coastal tourism drives consistent STR demand.'),

('Tybee Island', 'tybee-island', 'GA',
  ARRAY['Tybee Island','Savannah','Wilmington Island','Isle of Hope'],
  'Georgia''s beach — 18 miles from Savannah with laid-back coastal charm',
  'Just 18 miles from historic Savannah, Tybee Island is Georgia''s most popular beach community. Beach cottages and oceanfront rentals are in high demand especially from spring through fall.'),

('Kiawah Island', 'kiawah-island', 'SC',
  ARRAY['Kiawah Island','Johns Island','Seabrook Island','Edisto Island'],
  'South Carolina''s premier private resort island — The Ocean Course and pristine beaches',
  'Kiawah Island is a private, master-planned barrier island resort community near Charleston, renowned for world-class golf and pristine natural beaches. Premium vacation villas and cottages command top-tier rental rates.'),

('St. Simons Island', 'st-simons-island', 'GA',
  ARRAY['St. Simons Island','Brunswick','Jekyll Island','Sea Island','Little St. Simons Island'],
  'Georgia''s Golden Isles — live oaks, Spanish moss and Atlantic beaches',
  'St. Simons Island is the largest of Georgia''s Golden Isles, offering Spanish moss-draped live oaks, historic ruins, and beautiful Atlantic beaches. Jekyll Island and Sea Island round out the Golden Isles STR market.'),

('Chattanooga', 'chattanooga', 'TN',
  ARRAY['Chattanooga','Signal Mountain','Lookout Mountain','East Ridge','Red Bank'],
  'Tennessee''s revitalized river city — world-class climbing, aquarium and outdoor culture',
  'Chattanooga has reinvented itself as one of the South''s most vibrant mid-size cities, with a revitalized riverfront, world-class rock climbing, and the Tennessee Aquarium. Its STR market serves both leisure travelers and business visitors.'),

('Fredericksburg, TX', 'fredericksburg-tx', 'TX',
  ARRAY['Fredericksburg','Stonewall','Comfort','Kerrville','Hunt','Ingram'],
  'Texas Hill Country wine capital — German heritage, wineries and wildflowers',
  'Fredericksburg is the heart of the Texas Hill Country wine trail, with over 50 wineries within miles of its charming German-heritage Main Street. STR demand is extremely high, especially for cottages, B&Bs, and "Sunday Houses."'),

('New Braunfels', 'new-braunfels', 'TX',
  ARRAY['New Braunfels','Gruene','Canyon Lake','Wimberley','San Marcos'],
  'Texas''s tubing capital — Guadalupe River, Schlitterbahn and Hill Country fun',
  'New Braunfels sits on the confluence of the Guadalupe and Comal rivers, making it the tubing capital of Texas. Schlitterbahn Waterpark and proximity to San Antonio and Austin drive enormous summer STR demand.'),

('Coeur d''Alene', 'coeur-dalene', 'ID',
  ARRAY['Coeur d''Alene','Post Falls','Hayden','Sandpoint','Rathdrum','Harrison'],
  'Idaho''s lake city — boating, skiing and Pacific Northwest lifestyle',
  'Coeur d''Alene anchors a stunning lake district in the Idaho Panhandle, offering boating, skiing at Schweitzer, and world-class golf. Its growing reputation as a Northwest lifestyle destination is driving a rapidly expanding STR market.'),

('Lake Geneva', 'lake-geneva', 'WI',
  ARRAY['Lake Geneva','Williams Bay','Fontana','Elkhorn','Delavan','Walworth'],
  'Chicago''s lakeside escape — Geneva Lake estates and year-round resort culture',
  'Lake Geneva has been Chicago''s premier lakeside escape for over a century. The Geneva Lake shoreline is lined with historic estates, while boutique shops and year-round events fuel strong STR demand just 90 minutes from Chicago.')

on conflict (slug) do nothing;
