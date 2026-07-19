-- Availability, price period, cover photo index, listing reports
ALTER TABLE public.listings
  ADD COLUMN IF NOT EXISTS available_from date,
  ADD COLUMN IF NOT EXISTS price_period text
    CHECK (price_period IS NULL OR price_period = ANY (ARRAY['monthly'::text, 'yearly'::text, 'negotiable'::text, 'total'::text])),
  ADD COLUMN IF NOT EXISTS cover_photo_index integer NOT NULL DEFAULT 0
    CHECK (cover_photo_index >= 0);

CREATE TABLE IF NOT EXISTS public.listing_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id uuid NOT NULL REFERENCES public.listings(id) ON DELETE CASCADE,
  reporter_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason text NOT NULL CHECK (char_length(trim(reason)) > 0 AND char_length(reason) <= 500),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (listing_id, reporter_id)
);

ALTER TABLE public.listing_reports ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS listing_reports_insert_own ON public.listing_reports;
CREATE POLICY listing_reports_insert_own
  ON public.listing_reports
  FOR INSERT
  TO authenticated
  WITH CHECK (reporter_id = auth.uid());

DROP POLICY IF EXISTS listing_reports_select_own ON public.listing_reports;
CREATE POLICY listing_reports_select_own
  ON public.listing_reports
  FOR SELECT
  TO authenticated
  USING (reporter_id = auth.uid());
