-- Migration 070: inquiry_replies
-- Stores threaded vendor replies to host inquiries

CREATE TABLE IF NOT EXISTS inquiry_replies (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  inquiry_id   uuid NOT NULL REFERENCES inquiries(id) ON DELETE CASCADE,
  vendor_id    uuid NOT NULL REFERENCES vendors(id),
  body         text NOT NULL CHECK (char_length(body) > 0),
  created_at   timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS inquiry_replies_inquiry_id_idx
  ON inquiry_replies (inquiry_id, created_at);

ALTER TABLE inquiry_replies ENABLE ROW LEVEL SECURITY;

-- Vendors can insert replies for inquiries that belong to their listing
CREATE POLICY "vendors insert own replies"
  ON inquiry_replies FOR INSERT
  WITH CHECK (
    vendor_id IN (
      SELECT id FROM vendors WHERE user_id = auth.uid()
    )
    AND
    inquiry_id IN (
      SELECT i.id FROM inquiries i
      JOIN vendors v ON v.id = i.vendor_id
      WHERE v.user_id = auth.uid()
    )
  );

-- Vendors can read all replies on their own inquiries
CREATE POLICY "vendors read own inquiry replies"
  ON inquiry_replies FOR SELECT
  USING (
    inquiry_id IN (
      SELECT i.id FROM inquiries i
      JOIN vendors v ON v.id = i.vendor_id
      WHERE v.user_id = auth.uid()
    )
  );

-- Service-role bypass (for admin + email-sending API routes)
CREATE POLICY "service role full access"
  ON inquiry_replies FOR ALL
  USING (auth.role() = 'service_role');
