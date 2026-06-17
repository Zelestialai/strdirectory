-- Migration 022: Tier 6 markets — Hawaii, Mountain/Nature, Beach/Coastal, Urban
-- Adds 26 major STR markets not previously covered

insert into public.markets (name, slug, state, description, cities) values

-- ─── Hawaii ──────────────────────────────────────────────────────────────────
('Maui', 'maui', 'HI',
 'Maui is Hawaii''s second-largest island and one of the world''s top STR destinations, offering world-class beaches, lush rainforests, and the iconic Road to Hana. Wailea, Kihei, and Lahaina are the primary STR hubs.',
 ARRAY['Wailea','Kihei','Lahaina','Paia','Haiku','Makawao','Kapalua']),

('Oahu', 'oahu', 'HI',
 'Home to Waikiki, the North Shore, and Pearl Harbor, Oahu is Hawaii''s most-visited island. STR demand spans the bustling urban core of Honolulu to the laid-back surf culture of Haleiwa and Sunset Beach.',
 ARRAY['Honolulu','Waikiki','Kailua','Haleiwa','Kaneohe','Hawaii Kai','Ewa Beach']),

('Kauai', 'kauai', 'HI',
 'Known as the "Garden Isle," Kauai offers dramatic cliffs, lush valleys, and pristine beaches. Poipu on the south shore and Princeville on the north shore are the top STR markets.',
 ARRAY['Poipu','Princeville','Hanalei','Kapaa','Lihue','Koloa','Waimea']),

('Big Island', 'big-island', 'HI',
 'Hawaii''s biggest island spans diverse climates from volcanic landscapes to snow-capped peaks. Kona, Waikoloa, and Hilo attract STR guests seeking unique experiences from snorkeling with manta rays to volcano tours.',
 ARRAY['Kona','Waikoloa','Hilo','Volcano','Holualoa','Captain Cook','Pahoa']),

-- ─── Mountain / Nature ───────────────────────────────────────────────────────
('Moab', 'moab', 'UT',
 'Moab is the gateway to Arches and Canyonlands National Parks, drawing adventure travelers for mountain biking, off-roading, and world-class red-rock scenery. Year-round outdoor recreation drives strong STR demand.',
 ARRAY['Moab','Castle Valley']),

('Santa Fe', 'santa-fe', 'NM',
 'Santa Fe is a world-class arts and culture destination set at 7,000 feet. The historic adobe architecture, renowned gallery scene, vibrant dining, and proximity to ski areas make it a perennially strong STR market.',
 ARRAY['Santa Fe','Tesuque','Glorieta','Lamy']),

('Taos', 'taos', 'NM',
 'Taos combines a charming artists'' colony with one of the best ski mountains in the Southwest. The UNESCO World Heritage Taos Pueblo, stunning high-desert landscapes, and boutique lodging scene draw visitors year-round.',
 ARRAY['Taos','Taos Ski Valley','Arroyo Seco','Ranchos de Taos','El Prado']),

('Stowe', 'stowe', 'VT',
 'Stowe is Vermont''s premier mountain resort town, home to Mount Mansfield — the state''s highest peak. World-class skiing, a charming village with farm-to-table dining, and stunning foliage make it a four-season STR destination.',
 ARRAY['Stowe','Morrisville','Hyde Park','Johnson']),

('Catskills', 'catskills', 'NY',
 'The Catskills have experienced a renaissance as the premier weekend escape for New York City. Woodstock, Hudson, and Saugerties anchor the creative scene; hiking, fly-fishing, and farm stays drive STR demand across all seasons.',
 ARRAY['Woodstock','Saugerties','Phoenicia','Catskill','Tannersville','Roxbury','Hunter','Livingston Manor']),

('Finger Lakes', 'finger-lakes', 'NY',
 'New York''s Finger Lakes region is one of the East Coast''s top wine destinations, with over 100 wineries set along eleven glacial lakes. Watkins Glen, Seneca Falls, and Ithaca anchor a robust year-round STR market.',
 ARRAY['Watkins Glen','Seneca Falls','Ithaca','Geneva','Hammondsport','Canandaigua','Ovid']),

('Hudson Valley', 'hudson-valley', 'NY',
 'The Hudson Valley blends historic estates, farm-to-table dining, and world-class arts institutions just 90 minutes from New York City. Kingston, Rhinebeck, and Beacon are hotbeds of STR activity.',
 ARRAY['Kingston','Rhinebeck','Beacon','Woodstock','Hudson','Saugerties','Cold Spring','Millbrook']),

('Broken Bow', 'broken-bow', 'OK',
 'Broken Bow in southeastern Oklahoma has become one of the fastest-growing cabin rental markets in the country. Beavers Bend State Park, the Mountain Fork River, and lush pine forests draw nature lovers seeking secluded retreat-style STRs.',
 ARRAY['Broken Bow','Hochatown','Smithville','Eagletown']),

('Lake of the Ozarks', 'lake-of-the-ozarks', 'MO',
 'Lake of the Ozarks is Missouri''s premier lake destination, with 1,150 miles of shoreline and a thriving waterfront culture. Osage Beach and Lake Ozark are the STR epicenters for boating, watersports, and lakefront cabin stays.',
 ARRAY['Osage Beach','Lake Ozark','Camdenton','Sunrise Beach','Linn Creek','Laurie']),

('Pigeon Forge', 'pigeon-forge', 'TN',
 'Pigeon Forge sits at the entrance to Great Smoky Mountains National Park and hosts millions of visitors annually. Dollywood, outlet shopping, and proximity to Gatlinburg make cabin and chalet rentals one of the densest STR markets in the Southeast.',
 ARRAY['Pigeon Forge','Gatlinburg','Sevierville','Wears Valley','Cosby']),

-- ─── Beach / Coastal ─────────────────────────────────────────────────────────
('Sarasota', 'sarasota', 'FL',
 'Sarasota is a sophisticated Gulf Coast destination known for Siesta Key''s world-famous quartz-sand beach, a thriving arts scene, and a year-round warm climate. Siesta Key and Longboat Key are the core STR markets.',
 ARRAY['Siesta Key','Sarasota','Longboat Key','Lido Key','Nokomis','Venice','Osprey']),

('St. Augustine', 'st-augustine', 'FL',
 'St. Augustine is America''s oldest city, drawing visitors with its Spanish Colonial architecture, historic Castillo de San Marcos, and beautiful Atlantic beaches. STRs in the historic district and on Anastasia Island are in high demand.',
 ARRAY['St. Augustine','Anastasia Island','St. Augustine Beach','Vilano Beach','Ponte Vedra']),

('Pensacola', 'pensacola', 'FL',
 'Pensacola Beach''s sugar-white quartz sand and emerald-green water rival any beach in the country. The Panhandle market benefits from drive-to tourism from the Southeast, with strong summer demand and growing shoulder seasons.',
 ARRAY['Pensacola Beach','Gulf Breeze','Navarre Beach','Perdido Key','Pensacola']),

('Cannon Beach', 'cannon-beach', 'OR',
 'Cannon Beach is the Pacific Northwest''s most iconic coastal destination, known for the towering Haystack Rock sea stack, world-class galleries, and boutique shops. Year-round coastal tourism drives consistent STR demand.',
 ARRAY['Cannon Beach','Seaside','Manzanita','Arch Cape','Tolovana Park','Pacific City']),

('Tybee Island', 'tybee-island', 'GA',
 'Just 18 miles from historic Savannah, Tybee Island is Georgia''s most popular beach community. Beach cottages and oceanfront rentals are in high demand, especially from spring through fall.',
 ARRAY['Tybee Island','Savannah','Wilmington Island','Isle of Hope']),

('Kiawah Island', 'kiawah-island', 'SC',
 'Kiawah Island is a private, master-planned barrier island resort community near Charleston, renowned for world-class golf on The Ocean Course and pristine natural beaches. Premium vacation villas and cottages command top-tier rental rates.',
 ARRAY['Kiawah Island','Johns Island','Seabrook Island','Edisto Island']),

('St. Simons Island', 'st-simons-island', 'GA',
 'St. Simons Island is the largest of Georgia''s Golden Isles, offering Spanish moss-draped live oaks, historic ruins, and beautiful Atlantic beaches. Jekyll Island and Sea Island round out the Golden Isles STR market.',
 ARRAY['St. Simons Island','Brunswick','Jekyll Island','Sea Island','Little St. Simons Island']),

-- ─── Urban / Emerging ────────────────────────────────────────────────────────
('Chattanooga', 'chattanooga', 'TN',
 'Chattanooga has reinvented itself as one of the South''s most vibrant mid-size cities, with a revitalized riverfront, world-class rock climbing, and the Tennessee Aquarium. Its STR market serves both leisure travelers and business visitors.',
 ARRAY['Chattanooga','Signal Mountain','Lookout Mountain','East Ridge','Red Bank']),

('Fredericksburg, TX', 'fredericksburg-tx', 'TX',
 'Fredericksburg is the heart of the Texas Hill Country wine trail, with over 50 wineries within miles of its charming German-heritage Main Street. STR demand is extremely high, especially for cottages, B&Bs, and "Sunday Houses" in and around town.',
 ARRAY['Fredericksburg','Stonewall','Comfort','Kerrville','Hunt','Ingram']),

('New Braunfels', 'new-braunfels', 'TX',
 'New Braunfels sits on the confluence of the Guadalupe and Comal rivers, making it the tubing capital of Texas. Schlitterbahn Waterpark and proximity to San Antonio and Austin drive enormous summer STR demand.',
 ARRAY['New Braunfels','Gruene','Canyon Lake','Wimberley','San Marcos']),

('Coeur d''Alene', 'coeur-dalene', 'ID',
 'Coeur d''Alene anchors a stunning lake district in the Idaho Panhandle, offering boating, skiing at Schweitzer, and world-class golf. Its growing reputation as a Northwest lifestyle destination is driving a rapidly expanding STR market.',
 ARRAY['Coeur d''Alene','Post Falls','Hayden','Sandpoint','Rathdrum','Harrison']),

('Lake Geneva', 'lake-geneva', 'WI',
 'Lake Geneva has been Chicago''s premier lakeside escape for over a century. The Geneva Lake shoreline is lined with historic estates and Victorian B&Bs, while boutique shops and year-round events fuel strong STR demand just 90 minutes from Chicago.',
 ARRAY['Lake Geneva','Williams Bay','Fontana','Elkhorn','Delavan','Walworth'])

on conflict (slug) do nothing;
