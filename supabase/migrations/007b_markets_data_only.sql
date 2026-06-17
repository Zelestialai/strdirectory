-- Run this if 007_markets.sql failed on the policy but the table exists.
-- Safe to re-run — ON CONFLICT (slug) DO NOTHING.

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
  'Los Angeles offers a diverse and highly competitive STR market spanning beach cities, Hollywood Hills estates, and urban lofts. From Venice Beach bungalows to Malibu ocean-view rentals, the greater LA area serves entertainment industry travelers, tourists, and remote workers year-round — though hosts must navigate the LA STRO permit requirements.'),

('Austin', 'austin', 'TX',
  ARRAY['Austin','Round Rock','Cedar Park','Dripping Springs','Wimberley','Lago Vista','Bee Cave','Bastrop','Lockhart','Kyle','Buda'],
  'Live music, tech, and Hill Country lake retreats',
  'Austin''s STR market is driven by SXSW, ACL Music Festival, Formula 1 Grand Prix, and a booming tech-industry travel scene. The greater Austin area extends into the Texas Hill Country — with Dripping Springs, Wimberley, and Lago Vista offering popular lakefront and nature retreat STR properties alongside urban East Austin bungalows.'),

('Las Vegas', 'las-vegas', 'NV',
  ARRAY['Las Vegas','Henderson','North Las Vegas','Summerlin','Boulder City','Paradise','Enterprise','Spring Valley'],
  'Entertainment capital — conventions, sports & year-round visitors',
  'Las Vegas is one of the most visited cities in the world, generating consistent year-round STR demand from entertainment seekers, convention attendees, and sports fans. The greater Las Vegas Valley — including Henderson and Summerlin — offers strong Airbnb income potential with a streamlined licensing process through Clark County.'),

('Scottsdale', 'scottsdale', 'AZ',
  ARRAY['Scottsdale','Phoenix','Tempe','Mesa','Chandler','Sedona','Paradise Valley','Fountain Hills','Cave Creek','Peoria','Gilbert'],
  'Desert luxury — golf, spring training & year-round sunshine',
  'Scottsdale and the greater Phoenix metro is a premier STR destination driven by golf tourism, MLB spring training, and winter "snowbird" travelers. The market spans luxury Old Town Scottsdale properties, Sedona''s red rock retreats, and Paradise Valley estates — with strong demand virtually every month of the year.'),

('New York City', 'new-york-city', 'NY',
  ARRAY['New York','Brooklyn','Queens','Bronx','Staten Island','Jersey City','Hoboken','Long Island City','Astoria','Williamsburg','Harlem'],
  'World''s most visited city — navigating Local Law 18',
  'New York City''s STR market is among the most complex in the world following the implementation of Local Law 18 in 2023. Compliant hosts must register with the city and be present during guest stays. Despite strict regulations, the NYC metro — including Brooklyn townhouses and Jersey City apartments — still offers strong income potential for owner-occupants operating legally.')

on conflict (slug) do nothing;
