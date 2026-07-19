-- Add street address + state for listing discovery by location
ALTER TABLE public.listings
  ADD COLUMN IF NOT EXISTS address text,
  ADD COLUMN IF NOT EXISTS state text;
