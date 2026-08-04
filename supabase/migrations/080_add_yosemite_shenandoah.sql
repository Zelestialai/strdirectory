-- Migration 080: Add two markets — Yosemite (Oakhurst/Mariposa), CA and
-- Shenandoah, VA. Idempotent via ON CONFLICT (slug).

insert into public.markets (name, slug, state, cities, tagline, description) values
(
  'Yosemite (Oakhurst / Mariposa)', 'yosemite', 'CA',
  ARRAY['Oakhurst','Mariposa','Bass Lake','Fish Camp','Coarsegold','Ahwahnee','Groveland','El Portal','Midpines','Wawona','Yosemite Valley','North Fork'],
  'The gateway to Yosemite National Park — cabins, lodges & year-round park tourism',
  'The communities around Yosemite National Park — Oakhurst, Mariposa, Bass Lake, and Fish Camp — form a busy short-term rental market driven by millions of annual park visitors. Cabins, A-frames, and lodge-style homes see strong seasonal demand from spring waterfalls through fall color, making reliable local cleaning and turnover services essential for hosts on the park''s southern and western gateways.'
),
(
  'Shenandoah', 'shenandoah', 'VA',
  ARRAY['Luray','Front Royal','Harrisonburg','Staunton','Waynesboro','Shenandoah','Woodstock','New Market','Elkton','Stanley','Sperryville','Madison'],
  'Shenandoah National Park & Skyline Drive — mountain cabins and valley getaways',
  'Virginia''s Shenandoah Valley and the Blue Ridge foothills — Luray, Front Royal, Harrisonburg, Staunton, and Waynesboro — are a growing short-term rental destination anchored by Shenandoah National Park, Skyline Drive, Luray Caverns, and the wineries and breweries of the valley. Cabins and cottages here draw weekenders from the DC metro year-round, with peak demand during fall foliage season.'
)
on conflict (slug) do nothing;
