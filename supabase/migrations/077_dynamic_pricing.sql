-- Migration 077: built-in dynamic pricing for direct booking sites
-- Adds weekend/seasonal rate rules on top of the flat nightly rate. A separate
-- PriceLabs sync can later populate seasonal rates automatically.

ALTER TABLE public.booking_listings
  ADD COLUMN IF NOT EXISTS weekend_multiplier numeric NOT NULL DEFAULT 1.0
    CHECK (weekend_multiplier >= 1 AND weekend_multiplier <= 5),
  ADD COLUMN IF NOT EXISTS min_price_cents integer;

COMMENT ON COLUMN public.booking_listings.weekend_multiplier IS 'Fri/Sat nights are priced × this factor';
COMMENT ON COLUMN public.booking_listings.min_price_cents IS 'Never quote a night below this floor';

-- Date-range overrides (seasonal / event pricing). Also the target for a future
-- PriceLabs sync (source = 'pricelabs').
CREATE TABLE IF NOT EXISTS public.booking_seasonal_rates (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id         uuid NOT NULL REFERENCES public.booking_listings(id) ON DELETE CASCADE,
  label              text,
  start_date         date NOT NULL,
  end_date           date NOT NULL,               -- inclusive
  nightly_rate_cents integer NOT NULL CHECK (nightly_rate_cents >= 0),
  source             text NOT NULL DEFAULT 'manual', -- 'manual' | 'pricelabs'
  created_at         timestamptz NOT NULL DEFAULT now(),
  CHECK (end_date >= start_date)
);

CREATE INDEX IF NOT EXISTS booking_seasonal_rates_listing_idx
  ON public.booking_seasonal_rates (listing_id, start_date, end_date);

ALTER TABLE public.booking_seasonal_rates ENABLE ROW LEVEL SECURITY;

-- Public can read seasonal rates (needed to price a public booking page)
CREATE POLICY "seasonal rates are publicly readable"
  ON public.booking_seasonal_rates FOR SELECT
  USING (true);

-- Hosts manage seasonal rates for listings on their own booking sites
CREATE POLICY "hosts manage own seasonal rates"
  ON public.booking_seasonal_rates FOR ALL
  USING (
    listing_id IN (
      SELECT bl.id FROM public.booking_listings bl
      JOIN public.booking_sites bs ON bs.id = bl.site_id
      WHERE bs.host_id = auth.uid()
    )
  )
  WITH CHECK (
    listing_id IN (
      SELECT bl.id FROM public.booking_listings bl
      JOIN public.booking_sites bs ON bs.id = bl.site_id
      WHERE bs.host_id = auth.uid()
    )
  );

CREATE POLICY "service role manages seasonal rates"
  ON public.booking_seasonal_rates FOR ALL
  USING (auth.role() = 'service_role');
