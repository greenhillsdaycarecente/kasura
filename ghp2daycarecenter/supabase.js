/* =========================================================================
   GREENHILLS PHASE II DAYCARE — SUPABASE CLIENT
   -------------------------------------------------------------------------
   Fill in SUPABASE_URL and SUPABASE_ANON_KEY below with the values from
   your own Supabase project (Project Settings -> API -> Project URL /
   anon public key).

   This file must be loaded AFTER the Supabase library <script> tag and
   BEFORE db.js in every HTML page:

     <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>
     <script src="supabase.js"></script>
     <script src="db.js"></script>
   ========================================================================= */

const SUPABASE_URL = "https://xaytpdmmwajvnndhuuml.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_kSAkfdWWg2TBbe5vGgbZOg_WT8zSQXX";

const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
