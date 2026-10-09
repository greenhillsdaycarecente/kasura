GREENHILLS PHASE II DAYCARE CENTER
2026-2027 MASTERLIST IMPORT

Source:
- GREENHILLS CSC 2026-2027
- ADDITIONAL 2026-2027

Prepared records:
- 69 children
- 62 parent accounts

What is included:
1. seed_2026_2027.sql
   Run this in Supabase SQL Editor. It:
   - sets school year to 2026-2027
   - creates/updates parent accounts
   - imports the 2026-2027 children as APPROVED/enrolled records
   - keeps class_section = Daycare
   - leaves session NULL because the masterlist does not specify Morning/Afternoon
   - is safe to rerun for the imported child IDs

2. parent_accounts_2026_2027.csv
   Contains the generated parent usernames and temporary passwords.
   Parents should change their password after first login.

Important:
- 2025-2026 data was NOT imported as active records.
- Morning/Afternoon was NOT guessed from the Excel file.
- One source date contained "03-AUG-20021"; it was normalized to 2021-08-03.
- Source spellings were preserved where possible.

After running the SQL:
- Open the Admin Dashboard.
- School Year should show 2026-2027.
- Enrollment Details should show the imported children.


REGISTRATION FIX:
- Run SUPABASE_REGISTRATION_FIX.sql once in Supabase SQL Editor if the parent
  registration/enrollment form shows a database permission (RLS) error.
- The updated enrollment page now shows the actual Supabase error and disables
  the submit button while the request is being saved.
