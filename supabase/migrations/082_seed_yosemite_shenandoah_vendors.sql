-- Migration 082: Seed real STR service providers for the two new markets
-- (Yosemite/Oakhurst/Mariposa CA and Shenandoah VA). Unclaimed listings
-- (user_id NULL). Idempotent via ON CONFLICT (slug).

insert into public.vendors
  (business_name, slug, tagline, description, category_id, city, state, markets, is_verified, is_featured)
values
-- ─── Yosemite (Oakhurst / Mariposa / Bass Lake) ──────────────────────────────
(
  'Spotless Getaway', 'spotless-getaway-yosemite',
  'Same-day STR turnover cleaning for Mariposa & Oakhurst',
  'Spotless Getaway provides vacation-rental turnover cleaning across Mariposa, Oakhurst, and the surrounding Yosemite gateway communities. Their team delivers same-day turnovers with full restocking so your cabin or home is guest-ready between check-out and check-in.',
  (select id from public.categories where slug = 'cleaning-turnover'),
  'Mariposa', 'CA', ARRAY['yosemite'], true, true
),
(
  'Scenic Wonders', 'scenic-wonders-yosemite',
  'Family-owned Yosemite vacation rental management since 1988',
  'Scenic Wonders has managed cabins and vacation homes in and around Yosemite National Park since 1988. This long-standing, family-owned company handles bookings, housekeeping, and maintenance for owners seeking full-service short-term rental management in Mariposa County.',
  (select id from public.categories where slug = 'property-management'),
  'Mariposa', 'CA', ARRAY['yosemite'], true, false
),
(
  'Love Yosemite! Vacation Rentals', 'love-yosemite-vacation-rentals',
  'Full-service management for Yosemite & Bass Lake homes',
  'Love Yosemite! is a full-service vacation rental management company handling day-to-day operations for homes around Yosemite National Park and Bass Lake — guest communication, dynamic pricing, cleaning, and maintenance for owners in the Oakhurst area.',
  (select id from public.categories where slug = 'property-management'),
  'Oakhurst', 'CA', ARRAY['yosemite'], true, false
),
(
  'Yosemite Mountain & Coast Management', 'yosemite-mountain-coast-management',
  'STR management across Bass Lake, Oakhurst & Mariposa',
  'Yosemite Mountain & Coast Management services short-term rentals in Bass Lake, Oakhurst, Coarsegold, Ahwahnee, Mariposa, and North Fork — offering turnkey management, housekeeping, and property maintenance for gateway-community hosts.',
  (select id from public.categories where slug = 'property-management'),
  'Bass Lake', 'CA', ARRAY['yosemite'], true, false
),
(
  'The Redwoods In Yosemite', 'the-redwoods-in-yosemite',
  'Wawona vacation rental management since 1949',
  'Based in Wawona inside Yosemite National Park, The Redwoods In Yosemite has offered year-round, 24/7 turnkey vacation rental management, property maintenance, and hospitality support since 1949.',
  (select id from public.categories where slug = 'property-management'),
  'Wawona', 'CA', ARRAY['yosemite'], true, false
),
(
  'Chris Meyer Photography', 'chris-meyer-photography-yosemite',
  'Real estate & listing photography for the Yosemite foothills',
  'Chris Meyer Photography provides real estate and vacation-rental listing photography across Coarsegold, Oakhurst, Ahwahnee, Mariposa, and the greater Madera/Fresno foothill communities — clean, bright interiors and exteriors to help STR listings stand out.',
  (select id from public.categories where slug = 'photography-design'),
  'Oakhurst', 'CA', ARRAY['yosemite'], true, false
),
(
  'Mariposa Property Maintenance & More', 'mariposa-property-maintenance-and-more',
  'Repairs & yard care for Mariposa-area rentals',
  'Mariposa Property Maintenance & More serves Mariposa, Midpines, Oakhurst, Ahwahnee, Bass Lake, and Coarsegold with home repairs (electrical, plumbing, structural) plus yard services, tree work, and fire-fuel reduction — handy for absentee STR owners.',
  (select id from public.categories where slug = 'maintenance-repairs'),
  'Mariposa', 'CA', ARRAY['yosemite'], true, false
),
(
  'Bass Lake Home Services', 'bass-lake-home-services',
  'Handyman & home services in the Oakhurst / Bass Lake area',
  'Bass Lake Home Services provides handyman and home-repair services throughout Oakhurst and the Bass Lake area, helping short-term rental owners keep properties maintained and guest-ready year-round.',
  (select id from public.categories where slug = 'maintenance-repairs'),
  'Oakhurst', 'CA', ARRAY['yosemite'], true, false
),

-- ─── Shenandoah (Luray / Front Royal / Harrisonburg / Staunton) ───────────────
(
  'Shenandoah Valley Property Management & Cleaning', 'svpmc-shenandoah',
  'Airbnb & VRBO turnovers, hot-tub service & maintenance',
  'SVPMC handles short-term rental turnovers, cleaning, hot-tub service, and maintenance across Rockingham, Page, and Shenandoah counties — Luray, Massanutten, and beyond. On-time turnovers within check-in/out windows, restocking, and scheduled maintenance.',
  (select id from public.categories where slug = 'cleaning-turnover'),
  'Luray', 'VA', ARRAY['shenandoah'], true, true
),
(
  'Allstar Lodging', 'allstar-lodging-shenandoah',
  'Luray & Shenandoah Valley cabin management since 2002',
  'Allstar Lodging manages over 100 cabin and vacation rentals within about 15 miles of Luray, VA. Since 2002 they have handled reservations, guest services, payments, and communications for owners across the Shenandoah Valley near Shenandoah National Park.',
  (select id from public.categories where slug = 'property-management'),
  'Luray', 'VA', ARRAY['shenandoah'], true, false
),
(
  'Blue Maple', 'blue-maple-shenandoah',
  'Small-town Virginia vacation rental management',
  'Blue Maple manages vacation rentals across the Shenandoah Valley including Front Royal, Luray, Shenandoah, Mount Jackson, Basye/Bryce Resort, and Massanutten — full-service co-hosting for cabins and cottages near Shenandoah National Park.',
  (select id from public.categories where slug = 'property-management'),
  'Front Royal', 'VA', ARRAY['shenandoah'], true, false
),
(
  'Country Place Cabins', 'country-place-cabins-luray',
  'Year-round cabin rentals & management in Luray',
  'Country Place offers year-round retreat and vacation rental experiences in Luray, VA, managing cabin properties near Luray Caverns and Shenandoah National Park.',
  (select id from public.categories where slug = 'property-management'),
  'Luray', 'VA', ARRAY['shenandoah'], true, false
),
(
  'KBR Co-Hosting', 'kbr-co-hosting-shenandoah',
  'Hands-on Airbnb co-hosting for Shenandoah Valley cabins',
  'KBR Co-Hosting provides hands-on Airbnb co-hosting in Luray and the wider Shenandoah Valley — managing mountain cabins, river-adjacent retreats, and family vacation homes end to end for hosts.',
  (select id from public.categories where slug = 'property-management'),
  'Luray', 'VA', ARRAY['shenandoah'], true, false
),
(
  'LV8 Media', 'lv8-media-shenandoah',
  'Real estate & STR photography and video in the Valley',
  'LV8 Media is a Harrisonburg-based real estate photography and videography agency serving the Shenandoah Valley with HDR photos, 4K video, drone media, and 3D Matterport tours — great for making vacation-rental listings pop.',
  (select id from public.categories where slug = 'photography-design'),
  'Harrisonburg', 'VA', ARRAY['shenandoah'], true, false
),
(
  'Shenandoah Valley 360', 'shenandoah-valley-360',
  'Photography, drone & virtual tours for STR listings',
  'Shenandoah Valley 360 offers camera photography, drone photography, and virtual tours for residents, real estate agents, and vacation rentals across the Shenandoah Valley, with 8+ years of imaging experience.',
  (select id from public.categories where slug = 'photography-design'),
  'Front Royal', 'VA', ARRAY['shenandoah'], true, false
),
(
  'Hambleton Handyman', 'hambleton-handyman-page-county',
  'Handyman & repairs across Page County and Luray',
  'Hambleton Handyman provides handyman and home-repair services across Page County and Luray, VA — plumbing, electrical, and carpentry in one place, helping STR owners keep cabins maintained between guests.',
  (select id from public.categories where slug = 'maintenance-repairs'),
  'Luray', 'VA', ARRAY['shenandoah'], true, false
),
(
  'William A. Plumstead Handyman Services', 'plumstead-handyman-front-royal',
  '30+ years of home repair in Front Royal',
  'William A. Plumstead Handyman Services has provided handyman and home-repair work in the Front Royal, VA area for over 30 years — a reliable option for short-term rental maintenance in the northern Shenandoah Valley.',
  (select id from public.categories where slug = 'maintenance-repairs'),
  'Front Royal', 'VA', ARRAY['shenandoah'], true, false
)
on conflict (slug) do nothing;
