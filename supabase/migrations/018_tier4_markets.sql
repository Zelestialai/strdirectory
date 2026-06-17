-- ============================================================
-- Migration 018 — Tier 4 Markets
-- 12 Beach/Coastal + 12 Mountain/Ski = 24 markets
-- ============================================================

insert into public.markets (name, slug, state, cities, tagline, description) values

-- ────────────────────────────────────────────────────────────
-- BEACH / COASTAL
-- ────────────────────────────────────────────────────────────

('Gulf Shores', 'gulf-shores', 'AL',
  ARRAY['Gulf Shores','Orange Beach','Fort Morgan','Gulf State Park','Perdido Key','Foley','Fairhope','Daphne','Spanish Fort'],
  'Alabama''s Gulf Coast — white sand beaches and laid-back Southern charm',
  'Gulf Shores and Orange Beach form Alabama''s beloved Gulf Coast destination, offering some of the South''s most beautiful white sand beaches at a more accessible price point than Florida neighbors. The Gulf Shores STR market spans beachfront condos, canal-front homes, and family beach houses across the Alabama Gulf Coast, with strong summer family tourism, a growing shoulder season, and consistently high demand from Southeast travelers.'),

('Panama City Beach', 'panama-city-beach', 'FL',
  ARRAY['Panama City Beach','Panama City','Inlet Beach','Seacrest','Rosemary Beach','Mexico Beach','Callaway','Lynn Haven'],
  'Florida''s Gulf Coast party and family beach — the Redneck Riviera',
  'Panama City Beach is one of Florida''s most visited beach destinations, famous for its brilliant emerald waters, sugar-white sand, and high-energy Gulf Coast atmosphere. The PCB STR market spans beachfront towers, Gulf-view condos, and beach cottage communities — with massive spring break demand, strong summer family occupancy, and growing shoulder seasons driven by the area''s stunning natural beauty.'),

('Naples', 'naples', 'FL',
  ARRAY['Naples','Marco Island','Bonita Springs','Estero','Fort Myers Beach','Cape Coral','Sanibel','Captiva','Goodland','Everglades City'],
  'Southwest Florida''s luxury coast — world-class beaches and refined living',
  'Naples is the crown jewel of Southwest Florida''s vacation rental market, consistently ranking among America''s most desirable destinations for upscale travelers and retirees. The greater Naples area — encompassing Marco Island, Bonita Springs, Fort Myers Beach, and the iconic barrier islands of Sanibel and Captiva — offers STR investors access to a high-income guest demographic seeking pristine beaches, world-class dining, and the refined Floridian lifestyle that this stretch of Gulf Coast does better than anywhere else.'),

('Anna Maria Island', 'anna-maria-island', 'FL',
  ARRAY['Anna Maria','Holmes Beach','Bradenton Beach','Longboat Key','Siesta Key','Sarasota','Bradenton','Cortez','Lakewood Ranch'],
  'Old Florida charm on the Gulf — pristine beaches and relaxed island life',
  'Anna Maria Island is one of Florida''s most cherished and sought-after vacation rental destinations, known for preserving the Old Florida character that has been lost in more developed areas. The Anna Maria Island area — including the legendary white quartz sand of Siesta Key and the sophisticated cultural scene of Sarasota — draws travelers who want exceptional Gulf Coast beaches without the mega-resort atmosphere, driving premium nightly rates for well-positioned vacation rental properties.'),

('Cape Cod', 'cape-cod', 'MA',
  ARRAY['Hyannis','Falmouth','Yarmouth','Dennis','Brewster','Chatham','Orleans','Wellfleet','Provincetown','Barnstable','Sandwich','Bourne','Mashpee','Harwich','Eastham','Truro'],
  'New England''s iconic summer peninsula — beaches, lobster and lighthouse towns',
  'Cape Cod is one of the most iconic vacation destinations in America, drawing millions of summer visitors to its historic lighthouse towns, pristine National Seashore beaches, and legendary New England seafood. The Cape Cod STR market spans everything from charming Falmouth cottages to Provincetown waterfront homes and Chatham classic Cape houses — with an affluent, repeat-visitor demographic that generates some of the Northeast''s strongest seasonal vacation rental revenue.'),

('Hamptons', 'hamptons', 'NY',
  ARRAY['Southampton','East Hampton','Sag Harbor','Montauk','Bridgehampton','Westhampton','Shelter Island','Water Mill','Amagansett','Quogue','Hampton Bays'],
  'New York''s exclusive summer playground — beaches, estates and celebrity culture',
  'The Hamptons is America''s most glamorous summer destination and one of the world''s highest-value vacation rental markets. Southampton, East Hampton, and Montauk attract New York City''s wealthiest residents and international celebrities each summer, driving extraordinary weekly and seasonal rental rates. The Hamptons STR market offers sophisticated investors access to a guest demographic with virtually unlimited discretionary spend and extremely high standards — making premium properties here some of the most lucrative vacation rentals in the country.'),

('Jersey Shore', 'jersey-shore', 'NJ',
  ARRAY['Ocean City','Cape May','Wildwood','Stone Harbor','Avalon','Sea Isle City','Brigantine','Long Beach Island','Point Pleasant','Asbury Park','Spring Lake','Manasquan','Lavallette','Seaside Heights','Bay Head'],
  'New Jersey''s beloved coastline — boardwalks, beaches and classic American summers',
  'The Jersey Shore is one of the East Coast''s most beloved and densely visited summer vacation destinations, spanning more than 130 miles of Atlantic Ocean beaches from Sandy Hook to Cape May. The Jersey Shore STR market encompasses a remarkable range of vacation rental opportunities — from the upscale family beach community of Avalon to the vibrant boardwalk scenes of Point Pleasant and Wildwood to the Victorian elegance of Cape May — all within a few hours of tens of millions of Northeast visitors.'),

('Ocean City', 'ocean-city', 'MD',
  ARRAY['Ocean City','West Ocean City','Assateague Island','Berlin','Ocean Pines','Bethany Beach','Fenwick Island','Rehoboth Beach','Lewes','Milton'],
  'Mid-Atlantic''s favorite beach resort — Maryland''s iconic oceanfront destination',
  'Ocean City, Maryland is the quintessential Mid-Atlantic beach resort, drawing millions of visitors each summer to its 10-mile stretch of Atlantic beach, famous boardwalk, and classic beach-town atmosphere. The greater Ocean City STR market — extending into Delaware''s quieter beaches at Bethany Beach, Fenwick Island, and Rehoboth Beach — offers diverse vacation rental investment opportunities across a region that attracts tens of millions of visitors from the densely populated Baltimore-Washington corridor.'),

('Galveston', 'galveston', 'TX',
  ARRAY['Galveston','Jamaica Beach','Crystal Beach','Bolivar Peninsula','Surfside Beach','Tiki Island','La Marque','Texas City','League City','Kemah'],
  'Texas Gulf Coast island city — beaches, history and year-round Gulf breezes',
  'Galveston is the primary beach vacation destination for millions of Texans and the only island city on the Texas Gulf Coast. The Galveston STR market spans oceanfront beach houses, historic Strand district properties, and Crystal Beach fishing cottages on the Bolivar Peninsula — all benefiting from proximity to Houston''s massive metropolitan population and a year-round tourism season driven by Gulf Coast weather, Mardi Gras celebrations, and the island''s rich Victorian architectural heritage.'),

('Rehoboth Beach', 'rehoboth-beach', 'DE',
  ARRAY['Rehoboth Beach','Dewey Beach','Bethany Beach','Fenwick Island','Lewes','Milton','Millsboro','Long Neck','Angola Neck','Slaughter Beach'],
  'Delaware''s beach resort — the Nation''s Summer Capital',
  'Rehoboth Beach is Delaware''s premier coastal resort destination, nicknamed "The Nation''s Summer Capital" for its popularity with Washington DC politicians and diplomats. The greater Rehoboth area — including Dewey Beach''s lively bar scene, the family-friendly tranquility of Bethany Beach, and the quiet beauty of Fenwick Island — offers STR investors access to the Mid-Atlantic''s most loyal seasonal vacation rental market, within easy reach of DC, Baltimore, Philadelphia, and New York.'),

('South Padre Island', 'south-padre-island', 'TX',
  ARRAY['South Padre Island','Port Isabel','Laguna Vista','Brownsville','Harlingen','Los Fresnos','Rancho Viejo','San Benito'],
  'Texas''s southernmost beach destination — Gulf Coast paradise near the border',
  'South Padre Island is Texas''s premier beach resort island, a 34-mile barrier island at the southern tip of Texas with clear Gulf waters, excellent fishing, and world-class kite surfing and windsurfing. The South Padre STR market draws strong spring break demand, summer family tourism, winter snowbirds, and year-round ecotourism from the Laguna Madre''s extraordinary birding and wildlife — creating a diverse, multi-season vacation rental market at the far southern tip of the Lone Star State.'),

('30A', 'thirty-a', 'FL',
  ARRAY['Seaside','Rosemary Beach','Alys Beach','WaterColor','Grayton Beach','Santa Rosa Beach','Blue Mountain Beach','Seagrove Beach','Inlet Beach','Seacrest','Watersound','Miramar Beach'],
  'Florida''s most beautiful coastal corridor — emerald waters and New Urbanist villages',
  'Scenic Highway 30A in Florida''s Walton County is widely considered the most beautiful stretch of Gulf Coast in the United States, home to the award-winning New Urbanist communities of Seaside, Rosemary Beach, and Alys Beach. The 30A STR market commands the highest nightly rates in the Florida Panhandle, attracting affluent families, designers, and tastemakers drawn to the area''s extraordinary emerald water dune lakes, pristine state forest, and architecturally stunning beach communities.'),

-- ────────────────────────────────────────────────────────────
-- MOUNTAIN / SKI
-- ────────────────────────────────────────────────────────────

('Breckenridge', 'breckenridge', 'CO',
  ARRAY['Breckenridge','Frisco','Dillon','Silverthorne','Keystone','Copper Mountain','Blue River','Alma','Fairplay'],
  'Colorado''s favorite ski town — historic Main Street and world-class skiing',
  'Breckenridge is one of Colorado''s most beloved mountain resort towns and home to the state''s most-visited ski resort. The Breckenridge STR market combines a charming, walkable Victorian downtown with ski-in/ski-out access, delivering exceptional performance across winter ski season, summer mountain biking and hiking, and the vibrant shoulder seasons driven by Breckenridge''s rich festival calendar. Summit County''s ski corridor — including Frisco, Keystone, and Copper Mountain — offers STR investors a range of price points within one of Colorado''s highest-performing vacation rental markets.'),

('Vail', 'vail', 'CO',
  ARRAY['Vail','Beaver Creek','Avon','Eagle-Vail','Edwards','Minturn','Eagle','Gypsum','Wolcott'],
  'Colorado''s legendary world-class ski resort — European-inspired alpine village',
  'Vail is one of the most prestigious ski resorts in the world and home to Colorado''s most exclusive mountain vacation rental market. The greater Vail Valley — including neighboring Beaver Creek, one of North America''s most refined ski resorts — attracts an international, ultra-high-net-worth guest demographic that demands uncompromising luxury and is willing to pay the premium rates that make Vail properties among the most lucrative vacation rental investments in the mountain West.'),

('Aspen', 'aspen', 'CO',
  ARRAY['Aspen','Snowmass Village','Basalt','El Jebel','Carbondale','Glenwood Springs','Woody Creek'],
  'America''s most glamorous mountain resort — world-class skiing and cultural prestige',
  'Aspen is the most internationally recognized mountain resort in America and one of the world''s premier luxury vacation destinations. The greater Aspen area — including Snowmass Village and the Roaring Fork Valley — commands the highest vacation rental nightly rates in Colorado and some of the highest in the United States. Aspen''s extraordinary confluence of world-class skiing, Aspen Ideas Festival, Music Festival, and year-round luxury cultural programming creates exceptional STR demand across all seasons.'),

('Steamboat Springs', 'steamboat-springs', 'CO',
  ARRAY['Steamboat Springs','Steamboat Resort','Clark','Hayden','Craig','Oak Creek','Phippsburg','Yampa','Milner'],
  'Colorado''s Ski Town USA — champagne powder and authentic Western mountain culture',
  'Steamboat Springs is famously known as "Ski Town USA" — a Colorado mountain town with deep authentic Western roots that has produced more Winter Olympians than any other city in the US. The Steamboat STR market offers ski-in/ski-out access, legendary champagne powder snow, and a genuinely local mountain culture that sophisticated travelers increasingly prefer over Vail and Aspen''s more commercial atmosphere. Steamboat''s growing year-round appeal makes it one of Colorado''s most consistently-performing vacation rental markets.'),

('Telluride', 'telluride', 'CO',
  ARRAY['Telluride','Mountain Village','Ophir','Sawpit','Rico','Placerville','Norwood','Ridgway','Ouray'],
  'Colorado''s most dramatic ski resort — a Victorian box canyon surrounded by 14,000-foot peaks',
  'Telluride is arguably Colorado''s most breathtaking mountain destination — a Victorian mining town nestled in a stunning box canyon surrounded by 14,000-foot San Juan Mountain peaks. The Telluride STR market is defined by its extreme exclusivity, extraordinary natural beauty, and world-class film and music festivals that create premium demand far beyond ski season. Telluride''s geographic isolation and strict growth controls limit supply, creating persistent upward pressure on nightly rates.'),

('Jackson Hole', 'jackson-hole', 'WY',
  ARRAY['Jackson','Teton Village','Wilson','Kelly','Moose','Moran','Alta','Star Valley Ranch','Etna','Afton'],
  'Wyoming''s iconic mountain valley — Grand Teton views and world-class skiing',
  'Jackson Hole is one of America''s most spectacular and sought-after mountain destinations, combining the extraordinary natural beauty of Grand Teton National Park and Yellowstone''s southern gateway with some of North America''s most challenging and exciting ski terrain. The Jackson Hole STR market attracts affluent outdoor enthusiasts, National Park visitors, and luxury travelers year-round — with ski season, summer Grand Teton access, and fall foliage creating exceptional multi-season occupancy at premium Wyoming nightly rates.'),

('Big Sky', 'big-sky', 'MT',
  ARRAY['Big Sky','Gallatin Gateway','Four Corners','Manhattan MT','Belgrade','Bozeman','West Yellowstone','Gardiner','Livingston'],
  'Montana''s fastest-growing mountain resort — biggest skiing and Yellowstone gateway',
  'Big Sky Resort is North America''s largest ski resort by acreage, and the greater Big Sky area has emerged as one of the fastest-growing luxury mountain resort markets in the United States. The Big Sky STR market combines exceptional ski terrain, stunning Montana wilderness, and proximity to Yellowstone National Park with Bozeman''s growing cosmopolitan culture — attracting an increasingly affluent guest demographic that is rapidly elevating the region''s vacation rental performance.'),

('Sun Valley', 'sun-valley', 'ID',
  ARRAY['Sun Valley','Ketchum','Hailey','Bellevue','Carey','Picabo','Fairfield','Blaine County'],
  'Idaho''s legendary ski resort — America''s first destination ski resort since 1936',
  'Sun Valley is one of America''s oldest and most legendary ski resorts, developed in 1936 and still attracting the Hollywood elite, Fortune 500 executives, and serious skiers who have made Ketchum and Sun Valley their preferred mountain destination for generations. The Sun Valley STR market offers exceptional year-round performance in one of the Mountain West''s most exclusive and consistently high-performing vacation rental markets, with Bald Mountain''s world-class skiing and the Wood River Valley''s outdoor recreation driving demand across all seasons.'),

('Mammoth Lakes', 'mammoth-lakes', 'CA',
  ARRAY['Mammoth Lakes','June Lake','Lee Vining','Crowley Lake','Tom''s Place','Bishop','Bridgeport','Mono City'],
  'California''s premier ski resort — Eastern Sierra alpine paradise year-round',
  'Mammoth Lakes is California''s most popular ski destination and a legendary four-season mountain resort, situated at 8,000 feet in the Eastern Sierra Nevada. The Mammoth Lakes STR market serves Southern California''s enormous population base with world-class skiing, summer mountain biking and hiking, stunning Mono Lake access, and proximity to Yosemite''s eastern gateway — creating robust year-round occupancy for vacation rental properties in this high-altitude Eastern Sierra gem.'),

('Big Bear', 'big-bear', 'CA',
  ARRAY['Big Bear Lake','Big Bear City','Fawnskin','Moonridge','Sugarloaf','Running Springs','Arrowbear','Lake Arrowhead','Blue Jay','Twin Peaks'],
  'Southern California''s mountain escape — skiing and lake recreation above LA',
  'Big Bear Lake is Southern California''s most accessible mountain resort destination, just two hours from Los Angeles and home to two ski resorts, a beautiful mountain lake, and a year-round outdoor recreation scene. The Big Bear STR market benefits from one of the largest metropolitan feeder markets in the world — 20+ million Southern California residents within driving distance — creating strong weekend and holiday demand that drives impressive short-term rental performance for lakeside cabins, ski chalets, and mountain homes.'),

('Bend', 'bend', 'OR',
  ARRAY['Bend','Sunriver','Sisters','Redmond','La Pine','Tumalo','Terrebonne','Prineville','Madras','Maupin'],
  'Oregon''s outdoor adventure capital — four seasons of recreation in the high desert',
  'Bend is one of the fastest-growing outdoor recreation destinations in the United States, combining exceptional year-round outdoor activities — skiing at Mt. Bachelor, world-class fly fishing, mountain biking, and whitewater rafting — with a vibrant craft beer scene, sophisticated restaurant culture, and stunning high desert landscape. The greater Bend STR market — including Sunriver and Sisters — offers vacation rental investors access to one of the Pacific Northwest''s strongest and most diversified outdoor recreation demand bases.'),

('Whitefish', 'whitefish', 'MT',
  ARRAY['Whitefish','Kalispell','Columbia Falls','Glacier National Park','West Glacier','Bigfork','Lakeside','Polson','Ronan','Marion'],
  'Montana''s Glacier Country — world-class skiing and Glacier National Park gateway',
  'Whitefish is a charming Montana mountain town and gateway to both Whitefish Mountain Resort and the incomparable Glacier National Park, one of America''s most spectacular and heavily visited national parks. The greater Whitefish STR market — spanning the Flathead Valley and Glacier Country — offers investors access to Montana''s strongest year-round tourism demand, driven by ski season, the short but intense Glacier National Park summer season, and fall foliage that draws visitors from around the world.')

on conflict (slug) do nothing;
