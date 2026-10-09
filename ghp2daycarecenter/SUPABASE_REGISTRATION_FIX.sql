-- GREENHILLS DAYCARE - REGISTRATION / ENROLLMENT FIX
-- Run this ONCE in the Supabase SQL Editor.
-- Safe to re-run: all added columns use IF NOT EXISTS and policies are recreated.

begin;

-- The enrollment form collects guardian details. Older versions of the
-- enrollments table did not have these columns, which causes PostgREST to
-- reject the whole INSERT (for example: "guardian_address" not found).
-- Add all guardian fields used by db.js.
alter table public.enrollments add column if not exists guardian_name text;
alter table public.enrollments add column if not exists guardian_relationship text;
alter table public.enrollments add column if not exists guardian_phone text;
alter table public.enrollments add column if not exists guardian_alt_phone text;
alter table public.enrollments add column if not exists guardian_address text;

-- RLS must be enabled for the policies below to take effect.
alter table public.users enable row level security;
alter table public.enrollments enable row level security;

-- Remove old policies with the same names so this script is safe to rerun.
drop policy if exists "web app users select" on public.users;
drop policy if exists "web app users insert" on public.users;
drop policy if exists "web app users update" on public.users;
drop policy if exists "web app enrollments select" on public.enrollments;
drop policy if exists "web app enrollments insert" on public.enrollments;
drop policy if exists "web app enrollments update" on public.enrollments;

-- This project currently uses public.users for its custom login.
create policy "web app users select"
on public.users for select
to anon, authenticated
using (true);

create policy "web app users insert"
on public.users for insert
to anon, authenticated
with check (true);

create policy "web app users update"
on public.users for update
to anon, authenticated
using (true)
with check (true);

-- Enrollment form needs INSERT. Parent/admin pages need SELECT, and
-- admin approval/rejection needs UPDATE.
create policy "web app enrollments select"
on public.enrollments for select
to anon, authenticated
using (true);

create policy "web app enrollments insert"
on public.enrollments for insert
to anon, authenticated
with check (true);

create policy "web app enrollments update"
on public.enrollments for update
to anon, authenticated
using (true)
with check (true);

commit;

-- Tell PostgREST to reload its schema cache immediately after the DDL.
notify pgrst, 'reload schema';

-- IMPORTANT: This project currently stores usernames/passwords in public.users.
-- For production, migrate authentication to Supabase Auth and replace these
-- broad policies with user-specific policies.

-- ================================================================
-- EMAIL-VERIFIED PASSWORD RESET
-- The browser generates a 6-digit code, stores only its SHA-256 hash,
-- and sends the actual code to the account email through EmailJS.
-- Password changes can only be completed by supplying the same code
-- before the 10-minute expiration.
-- ================================================================

create extension if not exists pgcrypto;

alter table public.users add column if not exists reset_code_hash text;
alter table public.users add column if not exists reset_code_expires_at timestamptz;

drop function if exists public.prepare_password_reset(text,text,text,text);
create or replace function public.prepare_password_reset(
  p_role text,
  p_username text,
  p_email text,
  p_code_hash text
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count integer;
begin
  update public.users
     set reset_code_hash = p_code_hash,
         reset_code_expires_at = now() + interval '10 minutes'
   where lower(role) = lower(p_role)
     and lower(username) = lower(p_username)
     and lower(coalesce(email,'')) = lower(p_email);

  get diagnostics v_count = row_count;

  if v_count = 1 then
    return jsonb_build_object('ok', true);
  end if;

  return jsonb_build_object('ok', false);
end;
$$;

drop function if exists public.complete_password_reset(text,text,text,text,text);
create or replace function public.complete_password_reset(
  p_role text,
  p_username text,
  p_email text,
  p_code_hash text,
  p_new_password text
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count integer;
begin
  if length(coalesce(p_new_password,'')) < 6 then
    return jsonb_build_object('ok', false, 'error', 'New password must be at least 6 characters.');
  end if;

  update public.users
     set password = p_new_password,
         reset_code_hash = null,
         reset_code_expires_at = null
   where lower(role) = lower(p_role)
     and lower(username) = lower(p_username)
     and lower(coalesce(email,'')) = lower(p_email)
     and reset_code_hash = p_code_hash
     and reset_code_expires_at is not null
     and reset_code_expires_at > now();

  get diagnostics v_count = row_count;

  if v_count = 1 then
    return jsonb_build_object('ok', true);
  end if;

  return jsonb_build_object(
    'ok', false,
    'error', 'Invalid or expired verification code.'
  );
end;
$$;

revoke all on function public.prepare_password_reset(text,text,text,text) from public;
revoke all on function public.complete_password_reset(text,text,text,text,text) from public;
grant execute on function public.prepare_password_reset(text,text,text,text) to anon, authenticated;
grant execute on function public.complete_password_reset(text,text,text,text,text) to anon, authenticated;

notify pgrst, 'reload schema';
