-- GREENHILLS PHASE II DAYCARE - DATABASE INPUT VALIDATION
-- Run this AFTER checking existing data. These constraints protect the database
-- even if a browser-side validation is bypassed.

-- Names: letters (including Ñ/ñ), spaces, periods, apostrophes and hyphens.
ALTER TABLE public.enrollments
  DROP CONSTRAINT IF EXISTS enrollments_first_name_format,
  DROP CONSTRAINT IF EXISTS enrollments_middle_name_format,
  DROP CONSTRAINT IF EXISTS enrollments_last_name_format,
  DROP CONSTRAINT IF EXISTS enrollments_guardian_name_format,
  DROP CONSTRAINT IF EXISTS enrollments_em_name_format;

ALTER TABLE public.enrollments
  ADD CONSTRAINT enrollments_first_name_format CHECK (first_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+([ .''-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$'),
  ADD CONSTRAINT enrollments_middle_name_format CHECK (middle_name IS NULL OR middle_name = '' OR middle_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+([ .''-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$'),
  ADD CONSTRAINT enrollments_last_name_format CHECK (last_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+([ .''-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$'),
  ADD CONSTRAINT enrollments_guardian_name_format CHECK (guardian_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+([ .''-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$'),
  ADD CONSTRAINT enrollments_em_name_format CHECK (em_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+([ .''-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$');

-- Philippine mobile number format.
ALTER TABLE public.enrollments
  DROP CONSTRAINT IF EXISTS enrollments_guardian_phone_format,
  DROP CONSTRAINT IF EXISTS enrollments_guardian_alt_phone_format,
  DROP CONSTRAINT IF EXISTS enrollments_em_phone_format,
  DROP CONSTRAINT IF EXISTS enrollments_em_alt_phone_format;

ALTER TABLE public.enrollments
  ADD CONSTRAINT enrollments_guardian_phone_format CHECK (guardian_phone ~ '^(09[0-9]{9}|\\+639[0-9]{9})$'),
  ADD CONSTRAINT enrollments_guardian_alt_phone_format CHECK (guardian_alt_phone IS NULL OR guardian_alt_phone = '' OR guardian_alt_phone ~ '^(09[0-9]{9}|\\+639[0-9]{9})$'),
  ADD CONSTRAINT enrollments_em_phone_format CHECK (em_phone ~ '^(09[0-9]{9}|\\+639[0-9]{9})$'),
  ADD CONSTRAINT enrollments_em_alt_phone_format CHECK (em_alt_phone IS NULL OR em_alt_phone = '' OR em_alt_phone ~ '^(09[0-9]{9}|\\+639[0-9]{9})$');
