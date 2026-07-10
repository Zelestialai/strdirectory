-- Migration 065: Review moderation + Google Places integration

-- Add Google Place ID + cached data to vendors
ALTER TABLE vendors
  ADD COLUMN IF NOT EXISTS google_place_id text,
  ADD COLUMN IF NOT EXISTS google_rating numeric(3,2),
  ADD COLUMN IF NOT EXISTS google_review_count integer DEFAULT 0,
  ADD COLUMN IF NOT EXISTS google_reviews_cached_at timestamptz;

-- Add moderation columns to reviews
ALTER TABLE reviews
  ADD COLUMN IF NOT EXISTS is_flagged boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS is_hidden boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS flag_reason text,
  ADD COLUMN IF NOT EXISTS flagged_by uuid REFERENCES auth.users(id),
  ADD COLUMN IF NOT EXISTS flagged_at timestamptz,
  ADD COLUMN IF NOT EXISTS hidden_by uuid REFERENCES auth.users(id),
  ADD COLUMN IF NOT EXISTS hidden_at timestamptz;

-- Index for admin moderation queue
CREATE INDEX IF NOT EXISTS idx_reviews_is_flagged ON reviews(is_flagged) WHERE is_flagged = true;
CREATE INDEX IF NOT EXISTS idx_reviews_is_hidden  ON reviews(is_hidden)  WHERE is_hidden  = true;

-- Public reads should exclude hidden reviews (update existing RLS policy)
DROP POLICY IF EXISTS "reviews_select" ON reviews;
CREATE POLICY "reviews_select" ON reviews
  FOR SELECT USING (is_hidden = false OR auth.uid() IN (
    SELECT user_id FROM vendors WHERE id = vendor_id
  ));

-- Users can flag reviews
CREATE POLICY "reviews_flag" ON reviews
  FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (
    -- Users can only set flag fields, not hide or change content
    is_hidden = (SELECT is_hidden FROM reviews WHERE id = reviews.id)
  );
