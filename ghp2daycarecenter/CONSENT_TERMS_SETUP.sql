-- GREENHILLS PHASE II DAYCARE CENTER
-- Mandatory Parent/Guardian Consent for Enrollment
-- Run once in Supabase SQL Editor. Safe to re-run.

begin;

alter table public.enrollments add column if not exists consent_agreed boolean not null default false;
alter table public.enrollments add column if not exists consent_timestamp timestamptz;
alter table public.enrollments add column if not exists consent_version text;

-- Existing imported records are historical records. Do not mark them as newly collected consent.
-- New enrollment submissions from the updated system must explicitly send consent_agreed=true.

notify pgrst, 'reload schema';
commit;
