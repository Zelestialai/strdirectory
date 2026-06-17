-- ============================================================
-- Migration 019 — Tier 5 Markets
-- 10 Beach/Coastal + 10 Mountain/Nature + 10 Urban = 30 markets
-- ============================================================

insert into public.markets (name, slug, state, cities, tagline, description) values

-- ────────────────────────────────────────────────────────────
-- BEACH / COASTAL
-- ────────────────────────────────────────────────────────────

('Clearwater', 'clearwater', 'FL',
  ARRAY['Clearwater','St. Petersburg','Clearwater Beach','Dunedin','Safety Harbor','Tarpon Springs','Palm Harbor','Largo','Seminole','Indian Rocks Beach','Madeira Beach','St. Pete Beach','Pass-A-Grille'],
  'Tampa Bay''s Gulf Coast jewel — award-winning beaches and year-round sunshine',
  'Clearwater Beach consistently ranks among America''s best beaches, with its stunning white sand, calm Gulf waters, and spectacular sunsets drawing millions of visitors year-round. The greater Clearwater and St. Pete Beach STR market offers investors exceptional year-round occupancy driven by warm weather tourism, the Tampa Bay area''s growing convention and corporate travel, and a diverse visitor base ranging from spring break crowds to winter snowbirds and destination wedding groups.'),

('Fort Lauderdale', 'fort-lauderdale', 'FL',
  ARRAY['Fort Lauderdale','Pompano Beach','Deerfield Beach','Lauderdale-by-the-Sea','Hollywood','Hallandale Beach','Dania Beach','Oakland Park','Wilton Manors','Lighthouse Point','Sea Ranch Lakes'],
  'South Florida''s yachting capital — beaches, waterways and international flair',
  'Fort Lauderdale is one of South Florida''s most vibrant vacation destinations, famous for its extensive network of navigable waterways (earning it the nickname "Venice of America"), 23 miles of beautiful Atlantic beaches, and a thriving international tourism scene. The Fort Lauderdale STR market benefits from its position between Miami and Palm Beach, proximity to one of the world''s busiest cruise ports, and a diverse guest demographic spanning beach vacationers, boating enthusiasts, LGBTQ+ travelers, and international visitors.'),

('Nantucket', 'nantucket', 'MA',
  ARRAY['Nantucket','Siasconset','Madaket','Surfside','Cisco','Wauwinet','Quidnet','Tom Nevers'],
  'America''s most exclusive island retreat — cobblestones, grey shingles and pristine beaches',
  'Nantucket is one of America''s most coveted and expensive vacation destinations — a historic whaling island 30 miles off Cape Cod with strict architectural preservation, pristine beaches, and an ultra-affluent seasonal community. The Nantucket STR market commands some of the highest weekly vacation rental rates in the United States, driven by extremely limited supply, no new development, and a loyal wealthy guest base that returns summer after summer to one of New England''s most beautiful and exclusive island retreats.'),

('Martha''s Vineyard', 'marthas-vineyard', 'MA',
  ARRAY['Edgartown','Vineyard Haven','Oak Bluffs','West Tisbury','Chilmark','Aquinnah','Menemsha','Chappaquiddick'],
  'New England''s beloved island escape — celebrities, lighthouses and sandy shores',
  'Martha''s Vineyard is one of America''s most beloved island vacation destinations, a 100-square-mile island off Cape Cod that has drawn presidents, celebrities, and discerning summer visitors for generations. The Vineyard''s STR market spans gracious Edgartown sea captain''s homes, charming Oak Bluffs gingerbread cottages, and private Chilmark farm estates — all commanding premium seasonal rates in a market defined by extremely limited inventory and intense year-round demand from Boston and New York.'),

('Bar Harbor', 'bar-harbor', 'ME',
  ARRAY['Bar Harbor','Mount Desert Island','Southwest Harbor','Northeast Harbor','Seal Harbor','Acadia National Park','Ellsworth','Trenton','Blue Hill','Deer Isle','Stonington','Camden','Rockport ME'],
  'Maine''s crown jewel — Acadia National Park gateway and coastal New England charm',
  'Bar Harbor is the gateway to Acadia National Park, one of America''s most visited national parks, and the heart of Maine''s most spectacular coastal region. The greater Bar Harbor STR market — spanning Mount Desert Island and Maine''s mid-coast — draws outdoor adventurers, leaf peepers, seafood lovers, and anyone seeking the quintessential rugged New England coastal experience. With Acadia''s limited park lodging options, vacation rental properties in the Bar Harbor area are essential accommodations for the park''s millions of annual visitors.'),

('Mississippi Gulf Coast', 'mississippi-gulf-coast', 'MS',
  ARRAY['Biloxi','Gulfport','Ocean Springs','Pascagoula','Long Beach','Pass Christian','Bay St. Louis','Waveland','D''Iberville','Gautier','Moss Point'],
  'Gulf Coast casinos, beaches and Southern hospitality on the Mississippi shore',
  'The Mississippi Gulf Coast stretches 62 miles along the Gulf of Mexico and has reinvented itself as a major tourism destination, anchored by world-class casino resorts in Biloxi and Gulfport alongside beautiful natural beaches and the charming historic town of Ocean Springs. The Mississippi Gulf Coast STR market draws casino-focused visitors, beach vacationers from across the South, and increasing numbers of remote workers and retirees discovering the region''s exceptional value, warm climate, and authentic Southern Gulf Coast character.'),

('Crystal Coast', 'crystal-coast', 'NC',
  ARRAY['Emerald Isle','Atlantic Beach','Pine Knoll Shores','Indian Beach','Salter Path','Beaufort','Morehead City','Cape Carteret','Swansboro','Cedar Island','Harkers Island','Core Banks'],
  'North Carolina''s undiscovered coast — crystal clear waters and Cape Lookout wilderness',
  'The Crystal Coast of North Carolina is one of the East Coast''s best-kept vacation rental secrets, offering pristine barrier island beaches, the wild Cape Lookout National Seashore, and the charming maritime town of Beaufort — all at price points well below the Outer Banks. The Crystal Coast STR market attracts families, outdoor enthusiasts, and visitors seeking the natural beauty and authenticity of North Carolina''s southern coast without the crowds, with strong seasonal demand from the Raleigh-Durham and Charlotte metropolitan areas.'),

('Newport', 'newport', 'RI',
  ARRAY['Newport','Middletown','Portsmouth','Bristol','Tiverton','Little Compton','Jamestown','Narragansett','South Kingstown','Wakefield','Watch Hill'],
  'Rhode Island''s gilded-age resort — Gilded Age mansions, sailing and Atlantic beaches',
  'Newport is one of America''s most historically rich and beautiful coastal resort destinations, famous for its extraordinary Gilded Age mansions, world-class sailing heritage, and stunning Ocean Drive and Bellevue Avenue. The greater Newport STR market — spanning Narragansett Bay''s coastline and Rhode Island''s South County beaches — attracts history enthusiasts, sailing fans, wedding parties, and affluent New England families seeking the genuine charm and beauty of one of America''s most architecturally distinctive seaside cities.'),

('Port Aransas', 'port-aransas', 'TX',
  ARRAY['Port Aransas','Mustang Island','Aransas Pass','Rockport','Fulton','Corpus Christi','Flour Bluff','Portland TX','Gregory','Ingleside'],
  'Texas''s favorite island beach town — Mustang Island surf, fishing and Gulf Coast fun',
  'Port Aransas on Mustang Island is Texas''s most beloved beach town, a laid-back fishing village turned vacation paradise on the Gulf Coast with miles of undeveloped beach, world-class sport fishing, excellent surfing, and the warm, welcoming atmosphere of a classic Texas Gulf Coast beach community. The Port Aransas STR market draws millions of Texas families annually, with strong year-round demand driven by the proximity to San Antonio, Austin, and Houston and the island''s exceptional value compared to Florida beach destinations.'),

('Amelia Island', 'amelia-island', 'FL',
  ARRAY['Amelia Island','Fernandina Beach','Nassau County','Yulee','Callahan','Hilliard','St. Marys GA','Kingsland GA'],
  'Florida''s northernmost barrier island — Victorian charm, pristine beaches and sea turtles',
  'Amelia Island is one of Florida''s most beloved and unspoiled barrier islands, famous for its gorgeous Victorian-era downtown Fernandina Beach, miles of uncrowded Atlantic beaches, and exceptional Ritz-Carlton resort. The Amelia Island STR market attracts couples, families, and retirees seeking a refined, quieter alternative to Florida''s more commercial beach destinations — with strong demand from Jacksonville, Atlanta, and Charlotte visitors drawn by the island''s historic character, sea turtle nesting beaches, and outstanding golf courses.'),

-- ────────────────────────────────────────────────────────────
-- MOUNTAIN / NATURE
-- ────────────────────────────────────────────────────────────

('Blue Ridge', 'blue-ridge', 'GA',
  ARRAY['Blue Ridge','Ellijay','Blairsville','Dahlonega','Helen','Hiawassee','Murphy NC','Mineral Bluff','McCaysville','Epworth','Morganton'],
  'North Georgia''s mountain escape — cabins, wine trails and Appalachian beauty',
  'Blue Ridge is the capital of North Georgia''s fast-growing mountain vacation rental market, a charming small town surrounded by the Blue Ridge Mountains with a thriving arts scene, excellent hiking, wine trails, and some of the Southeast''s most stunning fall foliage. The greater Blue Ridge STR market — extending into the Ellijay apple country, the gold rush town of Dahlonega, and the alpine village of Helen — has emerged as one of the South''s hottest vacation rental investment markets, driven by strong demand from Atlanta''s massive metropolitan population just 90 minutes away.'),

('Poconos', 'poconos', 'PA',
  ARRAY['Mount Pocono','Stroudsburg','East Stroudsburg','Delaware Water Gap','Jim Thorpe','Lake Harmony','Hawley','Honesdale','Milford PA','Matamoras','Bushkill','Tannersville','Tobyhanna','Pocono Summit','Pocono Manor'],
  'Pennsylvania''s mountain playground — lakes, ski slopes and year-round Northeast escapes',
  'The Pocono Mountains of northeastern Pennsylvania is one of the East Coast''s most popular year-round vacation destinations, offering skiing, lake recreation, hiking, and casino entertainment within easy driving distance of New York City, Philadelphia, and New Jersey. The Pocono STR market spans lakefront cabins, ski chalet communities, and luxury resort homes — with one of the densest concentrations of vacation rental properties on the East Coast and a massive metropolitan feeder market of 30+ million people within a three-hour drive.'),

('Flagstaff', 'flagstaff', 'AZ',
  ARRAY['Flagstaff','Williams','Sedona','Jerome','Clarkdale','Page','Tusayan','Cameron','Winslow','Holbrook','Show Low','Pinetop-Lakeside'],
  'Arizona''s mountain city — Grand Canyon gateway and cool pine forest escape',
  'Flagstaff is Arizona''s mountain escape — a vibrant university city at 7,000 feet elevation surrounded by the largest contiguous ponderosa pine forest in North America, an hour from the South Rim of the Grand Canyon. The Flagstaff STR market benefits from year-round Grand Canyon gateway tourism, Arizona Snowbowl ski demand, and the enormous Phoenix market seeking relief from desert summer heat — creating diversified four-season vacation rental demand in a market that offers far more authenticity and natural beauty than Arizona''s resort cities.'),

('Durango', 'durango', 'CO',
  ARRAY['Durango','Purgatory Resort','Bayfield','Ignacio','Silverton','Ouray','Cortez','Mancos','Hesperus','Fort Lewis','Hermosa'],
  'Southwest Colorado''s adventure hub — Purgatory skiing, Mesa Verde and the Animas River',
  'Durango is one of Colorado''s most complete and authentic mountain towns — a historic mining city in the San Juan Mountains with a thriving outdoor recreation scene spanning Purgatory Resort skiing, world-class mountain biking, fly fishing the Animas River, and proximity to Mesa Verde National Park. The Durango STR market draws outdoor adventurers, families exploring the Four Corners region, and travelers seeking Colorado mountain character without the luxury resort price premiums of Vail, Aspen, or Telluride.'),

('Boone', 'boone', 'NC',
  ARRAY['Boone','Banner Elk','Blowing Rock','Linville','Valle Crucis','Sugar Mountain','Beech Mountain','West Jefferson','Jefferson','Newland','Elk Park','Crossnore','Grandfather Mountain'],
  'North Carolina High Country — skiing, Appalachian Trail access and mountain culture',
  'Boone and the North Carolina High Country is one of the Southeast''s most beloved mountain vacation destinations, offering Appalachian State University''s vibrant college town energy alongside excellent skiing at Sugar Mountain, Beech Mountain, and App Ski Mountain, spectacular Blue Ridge Parkway access, and some of the East Coast''s most dramatic mountain scenery. The greater Boone STR market draws families, couples, outdoor enthusiasts, and Appalachian Trail hikers seeking genuine mountain character in a destination that feels authentically Appalachian.'),

('Door County', 'door-county', 'WI',
  ARRAY['Sturgeon Bay','Fish Creek','Ephraim','Sister Bay','Egg Harbor','Baileys Harbor','Ellison Bay','Gills Rock','Washington Island','Jacksonport','Forestville','Brussels'],
  'Wisconsin''s Cape Cod — Great Lakes peninsula of cherry orchards and charming harbor towns',
  'Door County is the thumb-shaped peninsula jutting into Lake Michigan that has been called "the Cape Cod of the Midwest" — 250 miles of shoreline, five state parks, charming harbor villages, cherry and apple orchards, and a thriving arts scene that draws three million visitors annually. The Door County STR market benefits from fierce loyalty among Midwest vacationers who return year after year to the peninsula''s unspoiled natural beauty, outstanding dining, and genuine small-town Wisconsin character.'),

('Traverse City', 'traverse-city', 'MI',
  ARRAY['Traverse City','Suttons Bay','Leland','Glen Arbor','Empire','Frankfort','Elk Rapids','Bellaire','Charlevoix','Petoskey','Harbor Springs','Sleeping Bear Dunes','Northport','Lake Leelanau'],
  'Michigan''s cherry capital — Sleeping Bear Dunes, crystal-clear lakes and wine country',
  'Traverse City is the heart of Michigan''s stunning Old Mission and Leelanau peninsulas, home to the Sleeping Bear Dunes National Lakeshore (voted "Most Beautiful Place in America"), world-class freshwater beaches, and a booming wine country that produces excellent cool-climate varietals. The Traverse City STR market draws visitors from across the Midwest seeking Northern Michigan''s exceptional natural beauty, outstanding dining, and the charming lakeside towns that make this corner of Michigan one of the Great Lakes'' finest vacation destinations.'),

('Joshua Tree', 'joshua-tree', 'CA',
  ARRAY['Joshua Tree','Twentynine Palms','Yucca Valley','Desert Hot Springs','Pioneertown','Morongo Valley','Landers','Wonder Valley','Palm Springs','Palm Desert','Indio'],
  'California''s high desert escape — surreal landscapes, stargazing and bohemian culture',
  'Joshua Tree has emerged as one of California''s most exciting and rapidly growing vacation rental markets, driven by the National Park''s extraordinary landscapes, world-class rock climbing, and proximity to the Coachella Valley. The Joshua Tree STR market attracts a uniquely creative guest demographic — artists, musicians, design lovers, outdoor adventurers, and festival-goers — seeking the surreal beauty and profound quiet of the Mojave Desert. Architecturally distinctive vacation rentals command exceptional premium rates in this Instagram-famous destination.'),

('Palm Springs', 'palm-springs', 'CA',
  ARRAY['Palm Springs','Palm Desert','Rancho Mirage','Indian Wells','La Quinta','Indio','Desert Hot Springs','Cathedral City','Coachella','Thermal','Bermuda Dunes'],
  'Southern California''s desert resort — mid-century architecture, Coachella and pool culture',
  'Palm Springs is one of California''s most iconic vacation destinations — a desert oasis of stunning mid-century modern architecture, world-class golf courses, luxury spa resorts, and near-perfect winter sunshine just two hours from Los Angeles. The greater Coachella Valley STR market delivers exceptional year-round performance, with winter snowbird season, Coachella and Stagecoach festivals driving peak-season rates to extraordinary levels, and a year-round pool culture and golf demographic that keeps occupancy strong across all seasons.'),

('Napa Valley', 'napa-valley', 'CA',
  ARRAY['Napa','Yountville','St. Helena','Calistoga','Rutherford','Oakville','American Canyon','Sonoma','Healdsburg','Petaluma','Sebastopol','Santa Rosa','Guerneville','Bodega Bay'],
  'America''s wine country — world-famous vintages, Michelin-starred dining and vineyard retreats',
  'Napa Valley and neighboring Sonoma County constitute America''s premier wine country destination, attracting sophisticated travelers from around the world for tastings, farm-to-table dining, hot air balloon rides, and the uniquely elegant Wine Country lifestyle. The Napa-Sonoma STR market commands premium nightly rates across vineyard cottages, luxury estate rentals, and Healdsburg''s boutique vacation homes — benefiting from strong year-round demand, harvest season peaks, and a high-income guest demographic that spends generously throughout their stay.'),

-- ────────────────────────────────────────────────────────────
-- MAJOR URBAN CITIES
-- ────────────────────────────────────────────────────────────

('San Francisco', 'san-francisco', 'CA',
  ARRAY['San Francisco','Oakland','Berkeley','Sausalito','Tiburon','Mill Valley','San Jose','Santa Cruz','Half Moon Bay','Pacifica','Daly City','South San Francisco','Emeryville'],
  'The City by the Bay — iconic culture, tech innovation and breathtaking scenery',
  'San Francisco is one of the world''s great cities and a perennial top-10 STR market, combining extraordinary natural beauty with unmatched cultural richness, world-class dining, and its role as the center of global technology innovation. The greater San Francisco Bay Area STR market spans iconic neighborhoods from the Mission to Pacific Heights, bayview Sausalito cottages, and East Bay urban retreats — all within reach of tech industry conferences, the city''s year-round tourism, and a global visitor base that makes San Francisco one of America''s most consistently high-performing vacation rental markets.'),

('Seattle', 'seattle', 'WA',
  ARRAY['Seattle','Bellevue','Kirkland','Redmond','Tacoma','Olympia','Bainbridge Island','Vashon Island','Snoqualmie','North Bend','Leavenworth','Edmonds','Everett','Gig Harbor'],
  'The Emerald City — tech culture, coffee, Pike Place and Pacific Northwest adventure',
  'Seattle is the Pacific Northwest''s dominant city — a stunning metropolis surrounded by water, mountains, and forests with a world-class food scene, booming tech industry, and extraordinary proximity to outdoor adventure. The greater Seattle STR market benefits from Amazon, Microsoft, and Boeing-driven corporate travel, robust cruise passenger traffic through the Port of Seattle, year-round tourism to Pike Place Market and the waterfront, and proximity to Mount Rainier, Olympic National Park, and Cascade skiing.'),

('Dallas', 'dallas', 'TX',
  ARRAY['Dallas','Fort Worth','Plano','Frisco','McKinney','Allen','Irving','Arlington','Grapevine','Southlake','Addison','Richardson','Garland','Mesquite','Grand Prairie'],
  'Texas''s largest metro — business travel, sports and thriving arts and entertainment',
  'Dallas-Fort Worth is the fourth-largest metropolitan area in the United States and one of America''s fastest-growing economic powerhouses, anchored by a thriving corporate headquarters economy, three major professional sports teams, a world-class arts district, and DFW International Airport as one of the busiest air travel hubs in the world. The Dallas STR market delivers strong year-round performance driven by corporate relocations, conventions, Cowboys and Rangers games, and a hospitality-driven Texas culture that creates excellent conditions for vacation rental success.'),

('Houston', 'houston', 'TX',
  ARRAY['Houston','The Woodlands','Sugar Land','Katy','Pearland','League City','Friendswood','Clear Lake','Galveston','Baytown','Pasadena','Humble','Conroe','Tomball','Spring'],
  'Space City — energy capital of the world, world-class medical center and diverse culture',
  'Houston is America''s fourth-largest city and a global energy, medical, and aerospace capital with extraordinary cultural diversity, world-class museums, and a famously bold food scene that reflects its status as one of the most ethnically diverse cities in the United States. The Houston STR market benefits from the Texas Medical Center (the world''s largest medical complex), NASA''s Johnson Space Center, relentless convention and corporate travel demand, and the city''s position as a hub for the global energy industry.'),

('Atlanta', 'atlanta', 'GA',
  ARRAY['Atlanta','Decatur','Sandy Springs','Marietta','Buckhead','Midtown','Old Fourth Ward','Inman Park','Virginia-Highland','East Atlanta','Smyrna','Alpharetta','Roswell','Dunwoody','Peachtree City'],
  'Georgia''s capital — New South energy, film production and Southern hospitality',
  'Atlanta is the capital of the New South — a dynamic, fast-growing metropolis that has become a major global business hub, one of America''s top film production cities, and the cultural capital of the African American experience. The Atlanta STR market benefits from Hartsfield-Jackson International Airport (the world''s busiest), a massive convention and corporate travel base, Georgia''s booming film industry driving production crew housing demand, and a thriving arts, music, and food scene that draws leisure visitors year-round.'),

('Boston', 'boston', 'MA',
  ARRAY['Boston','Cambridge','Somerville','Brookline','Newton','Quincy','Waltham','Lexington','Concord','Salem','Plymouth','Gloucester','Marblehead','Provincetown'],
  'America''s walking city — Revolutionary history, world-class universities and New England charm',
  'Boston is one of America''s most walkable, historically rich, and internationally celebrated cities — a compact urban jewel where the Freedom Trail, Harvard and MIT, world-class museums, and an extraordinary restaurant and bar scene converge in a city that defines New England at its finest. The Boston STR market benefits from one of the country''s highest concentrations of universities and hospitals, a huge international visitor base, the region''s cultural tourism appeal, and major conventions and sporting events that drive peak-season demand to extraordinary levels.'),

('Washington DC', 'washington-dc', 'DC',
  ARRAY['Washington DC','Arlington VA','Alexandria VA','Bethesda MD','Silver Spring MD','Rockville MD','Chevy Chase MD','Capitol Hill','Georgetown','Dupont Circle','Adams Morgan','Foggy Bottom','Navy Yard','Shaw'],
  'America''s capital — monuments, museums, power and world-class cultural institutions',
  'Washington DC is America''s most visited domestic tourism destination, home to the National Mall''s extraordinary collection of free Smithsonian museums, iconic monuments, the US Capitol, and the White House. The DC STR market delivers exceptional year-round performance driven by political and government tourism, school group trips, conventions, international diplomacy, and the city''s own thriving food, arts, and entertainment scene — all in a compact, walkable city where demand for well-located vacation rental properties consistently outpaces supply.'),

('Philadelphia', 'philadelphia', 'PA',
  ARRAY['Philadelphia','Camden NJ','Cherry Hill NJ','King of Prussia','Conshohocken','Ardmore','Wayne','Newtown Square','Media','Chester','Wilmington DE','Society Hill','Fishtown','Northern Liberties','Old City'],
  'America''s first great city — Liberty Bell, cheesesteaks and world-class art',
  'Philadelphia is America''s first great city and one of the East Coast''s most underrated urban tourism destinations, combining extraordinary Revolutionary history in Old City, a world-class art museum, one of America''s best restaurant scenes, and the electric energy of one of the country''s most passionate sports fan bases. The Philadelphia STR market benefits from its position between New York and DC, a massive population base, strong convention activity at the Pennsylvania Convention Center, and explosive growth in leisure tourism driven by the city''s reinvented neighborhoods.'),

('Tampa', 'tampa', 'FL',
  ARRAY['Tampa','St. Petersburg','Clearwater','Brandon','Wesley Chapel','Land O'' Lakes','Lutz','Temple Terrace','Plant City','Riverview','Apollo Beach','Ruskin','Sun City Center','New Port Richey','Safety Harbor'],
  'Florida''s west coast hub — Ybor City, championship sports and Gulf Coast gateway',
  'Tampa is one of Florida''s fastest-growing metropolitan areas and an increasingly powerful STR market, combining the energy of a major sports city (Buccaneers, Lightning, Rays), the rich Cuban heritage of Ybor City, and its role as one of the world''s busiest cruise ports with the beautiful beaches and outdoor recreation of the greater Tampa Bay area. The Tampa Bay STR market benefits from year-round warm weather, massive Super Bowl and convention hosting capacity, and a growing leisure tourism base discovering the region''s waterfront culture.'),

('Portland', 'portland', 'OR',
  ARRAY['Portland','Beaverton','Hillsboro','Gresham','Lake Oswego','Tigard','Tualatin','Milwaukie','Oregon City','Troutdale','Hood River','Sandy','Cannon Beach','Seaside OR','Astoria'],
  'The City of Roses — food culture, craft everything and Pacific Northwest authenticity',
  'Portland is one of America''s most uniquely creative and livable cities — a Pacific Northwest original famous for its extraordinary food cart scene, thriving craft brewing culture, bike-friendly neighborhoods, and fierce commitment to local businesses and sustainability. The greater Portland STR market benefits from a distinctive urban tourism appeal unlike any other American city, proximity to Mount Hood skiing and Columbia River Gorge recreation, and Hood River''s world-class windsurfing — making Portland one of the Pacific Northwest''s most diversified year-round vacation rental markets.')

on conflict (slug) do nothing;
