-- GREENHILLS PHASE II DAYCARE CENTER
-- INPUT SECURITY / DATA VALIDATION
-- Run in Supabase SQL Editor after deploying the updated files.
-- These CHECK constraints are NOT VALID so existing historical rows are not blocked.
-- New INSERTs and UPDATEs must satisfy the rules.

BEGIN;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_full_name_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_full_name_input_check
      CHECK (full_name IS NULL OR (
        length(trim(full_name)) BETWEEN 2 AND 80
        AND full_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$'
      )) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_guardian_name_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_guardian_name_input_check
      CHECK (guardian_name IS NULL OR (
        length(trim(guardian_name)) BETWEEN 2 AND 80
        AND guardian_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$'
      )) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_contact_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_contact_input_check
      CHECK (contact IS NULL OR contact ~ '^(09[0-9]{9}|\+639[0-9]{9})$') NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_email_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_email_input_check
      CHECK (email IS NULL OR (
        length(email) <= 254
        AND email ~* '^[A-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?(?:\.[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?)+$'
      )) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_username_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_username_input_check
      CHECK (username ~ '^[A-Za-z0-9][A-Za-z0-9._-]{3,29}$') NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'users_address_input_check') THEN
    ALTER TABLE public.users
      ADD CONSTRAINT users_address_input_check
      CHECK (address IS NULL OR (
        length(trim(address)) BETWEEN 5 AND 200
        AND address ~ '^[A-Za-zÀ-ÖØ-öø-ÿ0-9 .,#''/()&:+-]+$'
      )) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_first_name_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_first_name_input_check
      CHECK (first_name IS NULL OR (length(trim(first_name)) BETWEEN 2 AND 80 AND first_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$')) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_middle_name_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_middle_name_input_check
      CHECK (middle_name IS NULL OR (length(trim(middle_name)) BETWEEN 1 AND 80 AND middle_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$')) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_last_name_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_last_name_input_check
      CHECK (last_name IS NULL OR (length(trim(last_name)) BETWEEN 2 AND 80 AND last_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$')) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_guardian_name_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_guardian_name_input_check
      CHECK (guardian_name IS NULL OR (length(trim(guardian_name)) BETWEEN 2 AND 80 AND guardian_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$')) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_em_name_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_em_name_input_check
      CHECK (em_name IS NULL OR (length(trim(em_name)) BETWEEN 2 AND 80 AND em_name ~ '^[A-Za-zÀ-ÖØ-öø-ÿ .''-]+$')) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_phone_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_phone_input_check
      CHECK (
        (guardian_phone IS NULL OR guardian_phone ~ '^(09[0-9]{9}|\+639[0-9]{9})$')
        AND (guardian_alt_phone IS NULL OR guardian_alt_phone = '' OR guardian_alt_phone ~ '^(09[0-9]{9}|\+639[0-9]{9})$')
        AND (em_phone IS NULL OR em_phone ~ '^(09[0-9]{9}|\+639[0-9]{9})$')
        AND (em_alt_phone IS NULL OR em_alt_phone = '' OR em_alt_phone ~ '^(09[0-9]{9}|\+639[0-9]{9})$')
      ) NOT VALID;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'enrollments_address_input_check') THEN
    ALTER TABLE public.enrollments
      ADD CONSTRAINT enrollments_address_input_check
      CHECK (
        (child_address IS NULL OR (length(trim(child_address)) BETWEEN 5 AND 200 AND child_address ~ '^[A-Za-zÀ-ÖØ-öø-ÿ0-9 .,#''/()&:+-]+$'))
        AND (guardian_address IS NULL OR (length(trim(guardian_address)) BETWEEN 5 AND 200 AND guardian_address ~ '^[A-Za-zÀ-ÖØ-öø-ÿ0-9 .,#''/()&:+-]+$'))
        AND (em_address IS NULL OR (length(trim(em_address)) BETWEEN 5 AND 200 AND em_address ~ '^[A-Za-zÀ-ÖØ-öø-ÿ0-9 .,#''/()&:+-]+$'))
      ) NOT VALID;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
