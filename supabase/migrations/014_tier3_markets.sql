-- ============================================================
-- Migration 014 — Tier 3 Markets
-- ============================================================

insert into public.markets (name, slug, state, cities, tagline, description) values

('Asheville', 'asheville', 'NC',
  ARRAY['Asheville','Black Mountain','Weaverville','Woodfin','Swannanoa','Arden','Fletcher','Hendersonville','Brevard','Waynesville','Canton','Marshall'],
  'Blue Ridge Mountains — arts, breweries & mountain retreats',
  'Asheville is one of America''s most beloved mountain cities and a top-performing STR market, known for its vibrant arts scene, world-class craft brewery culture, and stunning Blue Ridge Mountain setting. The greater Asheville area — spanning downtown loft rentals, Hendersonville wine country, and Brevard waterfall retreats — draws year-round visitors for festivals, leaf peeping, hiking, and culinary tourism.'),

('Outer Banks', 'outer-banks', 'NC',
  ARRAY['Kill Devil Hills','Kitty Hawk','Nags Head','Duck','Corolla','Southern Shores','Manteo','Avon','Buxton','Hatteras','Ocracoke'],
  'North Carolina''s barrier island paradise — beach houses & wild horses',
  'The Outer Banks of North Carolina is one of the East Coast''s premier vacation rental destinations, famous for its wide beaches, wild horse herds, and charming lighthouse towns. The OBX STR market spans everything from Corolla oceanfront estates to Hatteras Island surf cottages, with massive group-travel beach houses driving some of the highest weekly rental revenues on the East Coast.'),

('Hilton Head', 'hilton-head', 'SC',
  ARRAY['Hilton Head Island','Bluffton','Hardeeville','Beaufort','Port Royal','Daufuskie Island'],
  'Golf, tennis & resort living on South Carolina''s Lowcountry island',
  'Hilton Head Island is one of the most refined resort destinations in the Southeast, famous for its world-class golf courses, pristine beaches, and upscale plantation communities. The greater Hilton Head area — including Bluffton and Beaufort — offers STR investors access to a high-income traveler demographic seeking luxury resort experiences, with strong demand from golf groups, family reunions, and corporate retreats year-round.'),

('Key West', 'key-west', 'FL',
  ARRAY['Key West','Stock Island','Big Coppitt Key','Sugarloaf Key','Cudjoe Key','Summerland Key','Marathon','Islamorada','Key Largo'],
  'Southernmost US destination — sunset cruises, conch houses & year-round sun',
  'Key West is the southernmost point of the continental United States and one of Florida''s most iconic vacation destinations. The Florida Keys STR market offers a unique blend of historic Conch houses in Old Town Key West, waterfront fishing cottages in the Middle Keys, and eco-tourism properties near Key Largo — all with near-perfect year-round weather and strong international tourism demand.'),

('Lake Tahoe', 'lake-tahoe', 'CA',
  ARRAY['South Lake Tahoe','North Lake Tahoe','Tahoe City','Kings Beach','Incline Village','Truckee','Carnelian Bay','Tahoma','Homewood','Stateline','Crystal Bay'],
  'America''s alpine lake — ski season, summer recreation & year-round demand',
  'Lake Tahoe is one of the most stunning natural settings in North America and a premier four-season STR market. The greater Lake Tahoe basin — spanning California ski towns like South Lake Tahoe and Truckee to Nevada''s Incline Village — offers short-term rental investors access to strong winter ski demand, summer lake recreation, and shoulder-season visitors drawn by the area''s legendary natural beauty.'),

('Park City', 'park-city', 'UT',
  ARRAY['Park City','Heber City','Midway','Kamas','Coalville','Oakley','Peoa','Jeremy Ranch','Snyderville','Silver Creek Village'],
  'Utah''s premier ski resort town — Sundance, world-class skiing & mountain life',
  'Park City is Utah''s most famous mountain resort town and home to two of North America''s top ski resorts — Park City Mountain Resort and Deer Valley. The greater Park City area delivers exceptional STR performance across ski season, the Sundance Film Festival, and summer mountain recreation, with high average nightly rates and wealthy guests who expect premium accommodations and impeccable service.'),

('Sedona', 'sedona', 'AZ',
  ARRAY['Sedona','Village of Oak Creek','Cottonwood','Clarkdale','Jerome','Cornville','Camp Verde','Oak Creek Canyon'],
  'Red rock country — spiritual retreats, hiking & luxury desert wellness',
  'Sedona is one of the most visually dramatic destinations in America, famous for its towering red rock formations, spiritual vortex sites, and world-class luxury spa resorts. The Sedona STR market attracts wellness-focused travelers, couples seeking romantic getaways, and outdoor adventurers — with high average nightly rates driven by the area''s limited lodging supply and extraordinary natural setting.'),

('Savannah', 'savannah', 'GA',
  ARRAY['Savannah','Tybee Island','Pooler','Richmond Hill','Hinesville','Statesboro','Rincon','Garden City','Thunderbolt'],
  'Georgia''s coastal gem — historic squares, ghost tours & Southern hospitality',
  'Savannah is one of the most beautiful historic cities in America and a fast-growing STR market, known for its stunning Spanish moss-draped squares, antebellum architecture, and vibrant food and arts scene. The greater Savannah area — including Tybee Island beach rentals and the Historic District''s boutique vacation homes — benefits from strong year-round tourism driven by SCAD students'' families, corporate travel, and destination wedding groups.'),

('Virginia Beach', 'virginia-beach', 'VA',
  ARRAY['Virginia Beach','Norfolk','Chesapeake','Hampton','Newport News','Suffolk','Williamsburg','Sandbridge','Chincoteague'],
  'Mid-Atlantic beach destination — the longest pleasure beach in the world',
  'Virginia Beach is the most populous city in Virginia and home to one of the East Coast''s most popular beach resort areas. The Virginia Beach STR market spans oceanfront condos on the main strip, peaceful Sandbridge vacation homes, and historic Williamsburg colonial rentals — with strong summer family tourism, military-related travel demand from the region''s massive military presence, and growing year-round occupancy.'),

('San Antonio', 'san-antonio', 'TX',
  ARRAY['San Antonio','New Braunfels','Boerne','Schertz','Converse','Universal City','Seguin','Kerrville','Fredericksburg','Helotes','Leon Valley'],
  'Texas''s most visited city — the Alamo, River Walk & Hill Country gateway',
  'San Antonio is the most visited city in Texas, anchored by the iconic River Walk, the Alamo, and a thriving convention and tourism industry. The greater San Antonio STR market — extending into the Texas Hill Country through New Braunfels, Boerne, and Fredericksburg — offers diverse investment opportunities ranging from downtown lofts near the River Walk to Hill Country vineyard retreats that attract couples and groups year-round.')

on conflict (slug) do nothing;
