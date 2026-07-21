-- 068_booking_sites.sql
-- Direct booking websites: one site per property, with listing content and booking requests

CREATE TABLE IF NOT EXISTS booking_sites (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  host_id      UUID        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  property_id  UUID        REFERENCES properties(id) ON DELETE SET NULL,
  slug         TEXT        UNIQUE NOT NULL,
  status       TEXT        NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
  custom_domain TEXT,
  theme        TEXT        NOT NULL DEFAULT 'teal',
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS booking_listings (
  id                  UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
  site_id             UUID           NOT NULL UNIQUE REFERENCES booking_sites(id) ON DELETE CASCADE,
  title               TEXT           NOT NULL DEFAULT '',
  tagline             TEXT,
  description         TEXT           NOT NULL DEFAULT '',
  location            TEXT           NOT NULL DEFAULT '',
  photos              JSONB          NOT NULL DEFAULT '[]',
  amenities           JSONB          NOT NULL DEFAULT '[]',
  max_guests          INT            NOT NULL DEFAULT 2,
  bedrooms            INT            NOT NULL DEFAULT 1,
  bathrooms           NUMERIC(3,1)   NOT NULL DEFAULT 1,
  nightly_rate_cents  INT            NOT NULL DEFAULT 0,
  cleaning_fee_cents  INT            NOT NULL DEFAULT 0,
  min_nights          INT            NOT NULL DEFAULT 1,
  house_rules         TEXT,
  airbnb_source_url   TEXT,
  created_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
  updated_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS booking_requests (
  id                        UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  site_id                   UUID        NOT NULL REFERENCES booking_sites(id) ON DELETE CASCADE,
  guest_name                TEXT        NOT NULL,
  guest_email               TEXT        NOT NULL,
  check_in                  DATE        NOT NULL,
  check_out                 DATE        NOT NULL,
  guests                    INT         NOT NULL DEFAULT 1,
  message                   TEXT,
  status                    TEXT        NOT NULL DEFAULT 'pending'
                              CHECK (status IN ('pending','paid','accepted','declined','cancelled')),
  nights                    INT,
  nightly_rate_cents        INT,
  cleaning_fee_cents        INT,
  total_cents               INT,
  stripe_session_id         TEXT,
  stripe_payment_intent_id  TEXT,
  created_at                TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at                TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS
ALTER TABLE booking_sites     ENABLE ROW LEVEL SECURITY;
ALTER TABLE booking_listings  ENABLE ROW LEVEL SECURITY;
ALTER TABLE booking_requests  ENABLE ROW LEVEL SECURITY;

-- booking_sites
CREATE POLICY "hosts manage own sites"
  ON booking_sites FOR ALL
  USING (host_id = auth.uid());

CREATE POLICY "public read published sites"
  ON booking_sites FOR SELECT
  USING (status = 'published');

-- booking_listings
CREATE POLICY "host manages listing"
  ON booking_listings FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM booking_sites
      WHERE id = booking_listings.site_id AND host_id = auth.uid()
    )
  );

CREATE POLICY "public reads listing of published site"
  ON booking_listings FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM booking_sites
      WHERE id = booking_listings.site_id AND status = 'published'
    )
  );

-- booking_requests
CREATE POLICY "host reads own site requests"
  ON booking_requests FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM booking_sites
      WHERE id = booking_requests.site_id AND host_id = auth.uid()
    )
  );

CREATE POLICY "anyone can create booking request"
  ON booking_requests FOR INSERT
  WITH CHECK (true);

-- service role can update (used by Stripe webhook)
CREATE POLICY "service role updates booking"
  ON booking_requests FOR UPDATE
  USING (true);
