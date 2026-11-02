-- Each property belongs to a specific market. Turnover jobs inherit the
-- property's market (not the host's single preferred_market), so a host with
-- properties in different markets no longer tags every job with one market.
alter table public.properties
  add column if not exists market_slug text;

create index if not exists properties_market_slug_idx on public.properties (market_slug);
