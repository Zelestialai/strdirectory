-- ============================================================
-- Migration 010 — Tier 2 Markets
-- ============================================================

insert into public.markets (name, slug, state, cities, tagline, description) values

('Denver', 'denver', 'CO',
  ARRAY['Denver','Aurora','Lakewood','Boulder','Fort Collins','Arvada','Westminster','Thornton','Broomfield','Vail','Breckenridge','Steamboat Springs','Aspen'],
  'Mile High City — ski season, outdoor adventure & year-round tourism',
  'Denver and the greater Colorado Front Range is a booming STR market driven by proximity to world-class ski resorts, outdoor recreation, and a thriving tech and startup scene. From Denver urban condos and Boulder mountain-view homes to Breckenridge ski chalets and Vail mountain estates, Colorado offers diverse STR opportunities with strong year-round demand across multiple seasons.'),

('New Orleans', 'new-orleans', 'LA',
  ARRAY['New Orleans','Metairie','Kenner','Slidell','Covington','Mandeville','Gretna','Harvey','Marrero','Chalmette'],
  'Festivals, jazz, Mardi Gras & French Quarter magic',
  'New Orleans is one of the most culturally unique STR markets in America, driven by Mardi Gras, Jazz Fest, French Quarter tourism, and a thriving food and nightlife scene. The greater New Orleans metro — from iconic Garden District shotgun houses to lakefront properties in Metairie — delivers some of the highest occupancy spikes in the country during festival season.'),

('San Diego', 'san-diego', 'CA',
  ARRAY['San Diego','La Jolla','Coronado','Encinitas','Carlsbad','Oceanside','Chula Vista','Pacific Beach','Mission Beach','Ocean Beach','North Park','Hillcrest','Del Mar','Solana Beach'],
  'Year-round sunshine, beaches & military demand',
  'San Diego offers one of the most consistent STR markets in California, benefiting from year-round 70°F weather, stunning beaches, and strong military/contractor travel demand. The greater San Diego area spans La Jolla oceanfront luxury, Pacific Beach surf culture, Coronado island retreats, and North County coastal communities — all with high baseline occupancy even outside peak season.'),

('Charleston', 'charleston', 'SC',
  ARRAY['Charleston','Mount Pleasant','Isle of Palms','Sullivan''s Island','Folly Beach','Kiawah Island','James Island','Johns Island','Summerville','Goose Creek','North Charleston'],
  'Historic charm, destination weddings & coastal luxury',
  'Charleston is one of the most desirable STR markets in the Southeast, known for its historic architecture, world-class restaurants, and status as a top wedding and bachelorette destination. The greater Charleston area spans downtown historic homes, Isle of Palms beach houses, Kiawah Island luxury rentals, and the growing suburban markets of Mount Pleasant and Summerville.'),

('Myrtle Beach', 'myrtle-beach', 'SC',
  ARRAY['Myrtle Beach','North Myrtle Beach','Surfside Beach','Pawleys Island','Litchfield Beach','Murrells Inlet','Conway','Garden City Beach','Loris','Little River'],
  'Golf capital, family beach vacations & seasonal peaks',
  'Myrtle Beach is one of the largest and most visited beach resort areas on the East Coast, hosting over 14 million visitors annually. The Grand Strand — stretching from Little River to Pawleys Island — is a premier STR market for oceanfront condos, golf villa rentals, and family vacation homes. Strong seasonal peaks in summer complement solid shoulder-season demand from golf tourists.'),

('Destin', 'destin', 'FL',
  ARRAY['Destin','Fort Walton Beach','Niceville','Santa Rosa Beach','Seaside','Rosemary Beach','Panama City Beach','Navarre','Pensacola Beach','30A','Inlet Beach','WaterColor','Alys Beach'],
  'Emerald Coast — sugar-white beaches, 30A & snowbird retreats',
  'Destin and the Emerald Coast is one of Florida''s most beautiful and profitable STR markets, famous for its sugar-white sand beaches and emerald-green Gulf waters. The 30A corridor — home to Seaside, Rosemary Beach, and WaterColor — commands premium nightly rates for architecturally distinctive beach cottages. Snowbird demand from the Midwest and South provides strong winter occupancy alongside summer peaks.'),

('Smoky Mountains', 'smoky-mountains', 'TN',
  ARRAY['Gatlinburg','Pigeon Forge','Sevierville','Townsend','Bryson City','Cherokee','Cosby','Newport','Dandridge','Wears Valley'],
  'Cabin capital of America — 12 million annual visitors',
  'The Great Smoky Mountains is the most visited national park in America with over 12 million annual visitors, making Gatlinburg and Pigeon Forge one of the top STR markets in the country for cabin and mountain retreat rentals. The Smokies market is uniquely year-round — fall foliage, winter cabin romance, spring wildflowers, and summer family tourism all drive consistent high occupancy across all seasons.'),

('Chicago', 'chicago', 'IL',
  ARRAY['Chicago','Evanston','Oak Park','Naperville','Rosemont','Schaumburg','Wicker Park','Lincoln Park','Logan Square','River North','West Loop','South Loop','Hyde Park','Andersonville'],
  'Urban STRs — conventions, sports & world-class dining',
  'Chicago is the third-largest city in the US and a top STR market for convention travelers, sports fans, and urban tourists. The greater Chicago area — from River North luxury condos and Wicker Park neighborhood flats to lakefront Hyde Park apartments — offers strong year-round demand anchored by McCormick Place conventions, Bears/Cubs/Sox/Bulls games, and Chicago''s world-renowned restaurant and architecture tourism.')

on conflict (slug) do nothing;
