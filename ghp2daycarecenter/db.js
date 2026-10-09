/* =========================================================================
   GREENHILLS PHASE II DAYCARE — DATA LAYER (db.js)
   -------------------------------------------------------------------------
   This file is the ONLY place that talks to the database. It used to store
   everything in localStorage; it now stores everything in a real Supabase
   (Postgres) database via supabaseClient (see supabase.js).

   Every page still only calls DB.xxx() — never localStorage, never
   supabaseClient directly — but because real network calls are involved,
   every DB function is now ASYNC. Any page code calling these functions
   must use `await` inside an `async function`. See the HTML files for
   examples.

   The session (which user is currently logged in on THIS device/browser)
   still uses sessionStorage, since that is a per-browser concept, not
   something that needs to live in the shared database.

   PERFORMANCE DATA MODEL (updated):
   The `performance.areas` jsonb column now stores:
   {
     domains: [
       { name: "Gross Motor Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Fine Motor Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Self-Help Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Receptive Language Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Expressive Language Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Cognitive Domain", e1: 0, e2: 0, e3: 0 },
       { name: "Social-Emotional Domain", e1: 0, e2: 0, e3: 0 }
     ],
     evalComments: { e1: "", e2: "", e3: "" },
     finalComment: ""
   }
   Ratings are numeric (0–5, 0.5 steps) instead of quarters/stars.
   ========================================================================= */

const DB = (function () {
  const SESSION_KEY = "daycare_session_v1";

  // Lightweight in-memory cache: avoids repeating identical Supabase reads
  // every time the user switches tabs or opens a view/edit modal.
  const CACHE_TTL = 20000;
  const cache = new Map();
  function _cacheGet(key) {
    const hit = cache.get(key);
    if (!hit || (Date.now() - hit.time) > CACHE_TTL) {
      cache.delete(key);
      return null;
    }
    return hit.value;
  }
  function _cacheSet(key, value) {
    cache.set(key, { value, time: Date.now() });
    return value;
  }
  function _cacheClear(...keys) {
    if (!keys.length) { cache.clear(); return; }
    keys.forEach(k => cache.delete(k));
  }

  function _uid(prefix) {
    return (
      prefix +
      "-" +
      Date.now().toString(36) +
      "-" +
      Math.random().toString(36).slice(2, 8)
    );
  }

  function _throwIfError(error, context) {
    if (error) {
      console.error("Supabase error (" + context + "):", error);
      throw new Error(error.message || ("Database error in " + context));
    }
  }

  /* ------------------------ ROW <-> OBJECT MAPPING ------------------------ */

  function userFromRow(row) {
    if (!row) return null;
    return {
      id: row.id,
      role: row.role,
      fullName: row.full_name,
      username: row.username,
      password: row.password,
      email: row.email,
      contact: row.contact,
      address: row.address,
      guardianName: row.guardian_name,
      createdAt: row.created_at,
    };
  }

  function enrollmentFromRow(row) {
    if (!row) return null;
    return {
      id: row.id,
      parentUsername: row.parent_username,
      status: row.status,
      childId: row.child_id,
      // The system now has one class only: Daycare.
      classSection: row.class_section ? 'Daycare' : null,
      session: row.session,
      firstName: row.first_name,
      middleName: row.middle_name,
      lastName: row.last_name,
      dob: row.dob,
      gender: row.gender,
      childAddress: row.child_address,
      nickname: row.nickname,
      photoDataUrl: row.photo_data_url,
      docBirthCert: row.doc_birth_cert,
      docMedicalCert: row.doc_medical_cert,
      guardianName: row.guardian_name,
      guardianRelationship: row.guardian_relationship,
      guardianPhone: row.guardian_phone,
      guardianAltPhone: row.guardian_alt_phone,
      guardianAddress: row.guardian_address,
      emName: row.em_name,
      emRelationship: row.em_relationship,
      emPhone: row.em_phone,
      emAltPhone: row.em_alt_phone,
      emAddress: row.em_address,
      allergies: row.allergies,
      bloodType: row.blood_type,
      submittedAt: row.submitted_at,
      decidedAt: row.decided_at,
      rejectReason: row.reject_reason,
      consentAgreed: row.consent_agreed,
      consentTimestamp: row.consent_timestamp,
      consentVersion: row.consent_version,
    };
  }

  function enrollmentToRow(form) {
    return {
      first_name: form.firstName,
      middle_name: form.middleName,
      last_name: form.lastName,
      dob: form.dob,
      gender: form.gender,
      child_address: form.childAddress,
      nickname: form.nickname,
      photo_data_url: form.photoDataUrl,
      doc_birth_cert: form.docBirthCert,
      doc_medical_cert: form.docMedicalCert,
      guardian_name: form.guardianName,
      guardian_relationship: form.guardianRelationship,
      guardian_phone: form.guardianPhone,
      guardian_alt_phone: form.guardianAltPhone,
      guardian_address: form.guardianAddress,
      em_name: form.emName,
      em_relationship: form.emRelationship,
      em_phone: form.emPhone,
      em_alt_phone: form.emAltPhone,
      em_address: form.emAddress,
      allergies: form.allergies,
      blood_type: form.bloodType,
      consent_agreed: form.consentAgreed === true,
      consent_timestamp: form.consentTimestamp || null,
      consent_version: form.consentVersion || null,
    };
  }

  function commentFromRow(row) {
    if (!row) return null;
    return { from: row.from_role, text: row.text, date: row.date };
  }

  function defaultPerformanceAreas() {
    return {
      domains: [
        { name: "Gross Motor Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Fine Motor Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Self-Help Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Receptive Language Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Expressive Language Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Cognitive Domain", e1: 0, e2: 0, e3: 0 },
        { name: "Social-Emotional Domain", e1: 0, e2: 0, e3: 0 },
      ],
      evalComments: { e1: "", e2: "", e3: "" },
      finalComment: "",
    };
  }

  /* ---------------------- INPUT SECURITY ------------------------- */
  const _NAME_RE = /^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+(?:[ .'-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$/;
  const _PHONE_RE = /^(?:09\d{9}|\+639\d{9}|\(\+63\)\s?9\d{9})$/;
  const _EMAIL_RE = /^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)+$/;
  const _USERNAME_RE = /^[A-Za-z0-9][A-Za-z0-9._-]{2,29}$/;
  function _safe(v, max) { return String(v ?? '').replace(/[\u0000-\u001F\u007F<>]/g, '').trim().slice(0, max || 300); }
  function _name(v, req) { v = _safe(v,80); return (!v && !req) || (_NAME_RE.test(v) && v.length >= 2); }
  function _phone(v, req) { v = String(v ?? '').replace(/\s+/g,'').trim(); return (!v && !req) || _PHONE_RE.test(v); }
  function _email(v) { v = _safe(v,254).toLowerCase(); return _EMAIL_RE.test(v); }
  function _username(v) { return _USERNAME_RE.test(_safe(v,30)); }
  function _address(v, req) { v = _safe(v,200); return (!v && !req) || (v.length >= 5 && /[A-Za-zÀ-ÖØ-öø-ÿÑñ0-9]/.test(v)); }
  function _validateSignup(profile) {
    if (!_name(profile.fullName,true)) throw new Error('Invalid full name. Use letters, spaces, hyphens, apostrophes, or periods only.');
    if (!_email(profile.email)) throw new Error('Invalid email address.');
    if (!_phone(profile.contact,true)) throw new Error('Invalid Philippine mobile contact number.');
    if (!_address(profile.address,true)) throw new Error('Invalid address.');
    if (!_name(profile.guardianName,true)) throw new Error('Invalid guardian name.');
    if (!_username(profile.username)) throw new Error('Invalid username.');
    if (String(profile.password || '').length < 8 || String(profile.password || '').length > 128) throw new Error('Password must be 8 to 128 characters.');
  }
  function _validateEnrollment(form) {
    if (!_name(form.firstName,true) || !_name(form.middleName,false) || !_name(form.lastName,true)) throw new Error('Invalid child name.');
    if (!/^\d{4}-\d{2}-\d{2}$/.test(form.dob || '') || new Date(form.dob + 'T00:00:00') > new Date()) throw new Error('Invalid date of birth.');
    if (!['Male','Female'].includes(form.gender)) throw new Error('Invalid gender selection.');
    if (!_address(form.childAddress,true) || !_name(form.guardianName,true) || !_phone(form.guardianPhone,true) || !_phone(form.guardianAltPhone,false) || !_address(form.guardianAddress,true)) throw new Error('Invalid child or guardian information.');
    if (!_name(form.emName,true) || !_phone(form.emPhone,true) || !_phone(form.emAltPhone,false) || !_address(form.emAddress,true)) throw new Error('Invalid emergency contact information.');
  }

  /* ---------------------------- AUTH ---------------------------- */

  async function signUp(profile) {
    _validateSignup(profile);
    const { data: existing, error: findErr } = await supabaseClient
      .from("users")
      .select("id")
      .ilike("username", profile.username)
      .maybeSingle();
    _throwIfError(findErr, "signUp/check username");
    if (existing) {
      return { ok: false, error: "Username is already taken." };
    }

    const user = {
      id: _uid("u"),
      role: "parent",
      full_name: profile.fullName,
      email: profile.email,
      contact: profile.contact,
      address: profile.address,
      guardian_name: profile.guardianName,
      username: profile.username,
      password: profile.password, // NOTE: plaintext for this demo only.
    };

    const { data, error } = await supabaseClient
      .from("users")
      .insert(user)
      .select()
      .single();
    _throwIfError(error, "signUp/insert");
    return { ok: true, user: userFromRow(data) };
  }

  async function login(username, password, role) {
    const { data, error } = await supabaseClient
      .from("users")
      .select("*")
      .ilike("username", username)
      .eq("role", role)
      .maybeSingle();
    _throwIfError(error, "login");

    if (!data || data.password !== password) {
      return { ok: false, error: "Invalid username, password, or role." };
    }
    const user = userFromRow(data);
    sessionStorage.setItem(SESSION_KEY, JSON.stringify(user));
    return { ok: true, user };
  }

  function currentUser() {
    const raw = sessionStorage.getItem(SESSION_KEY);
    return raw ? JSON.parse(raw) : null;
  }

  function logout() {
    sessionStorage.removeItem(SESSION_KEY);
  }

  async function changePassword(username, currentPwd, newPwd) {
    const { data: user, error: findErr } = await supabaseClient
      .from("users")
      .select("*")
      .eq("username", username)
      .maybeSingle();
    _throwIfError(findErr, "changePassword/find");
    if (!user) return { ok: false, error: "User not found." };
    if (user.password !== currentPwd)
      return { ok: false, error: "Current password is incorrect." };

    const { error } = await supabaseClient
      .from("users")
      .update({ password: newPwd })
      .eq("username", username);
    _throwIfError(error, "changePassword/update");
    return { ok: true };
  }

  async function requestPasswordReset(role, username, email) {
    const code = String(Math.floor(100000 + Math.random() * 900000));
    const hashBuffer = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(code));
    const codeHash = Array.from(new Uint8Array(hashBuffer)).map(b => b.toString(16).padStart(2, "0")).join("");
    const { data, error } = await supabaseClient.rpc("prepare_password_reset", {
      p_role: role,
      p_username: username,
      p_email: email,
      p_code_hash: codeHash
    });
    _throwIfError(error, "requestPasswordReset");
    if (!data || data.ok !== true) {
      return { ok: false, error: "We couldn't find an account matching that role, username, and email." };
    }
    return { ok: true, code };
  }

  async function completePasswordReset(role, username, email, code, newPwd) {
    const hashBuffer = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(code));
    const codeHash = Array.from(new Uint8Array(hashBuffer)).map(b => b.toString(16).padStart(2, "0")).join("");
    const { data, error } = await supabaseClient.rpc("complete_password_reset", {
      p_role: role,
      p_username: username,
      p_email: email,
      p_code_hash: codeHash,
      p_new_password: newPwd
    });
    _throwIfError(error, "completePasswordReset");
    if (!data || data.ok !== true) {
      return { ok: false, error: (data && data.error) || "Invalid or expired verification code." };
    }
    return { ok: true };
  }

  // Legacy direct reset is intentionally removed from the UI. Password changes
  // must go through the email verification flow above.
  async function resetPassword(role, username, email, newPwd) {
    return { ok: false, error: "Email verification is required before resetting your password." };
  }

  /* ------------------------- ENROLLMENT -------------------------- */

  async function createEnrollment(parentUsername, form) {
    _validateEnrollment(form);
    if (form.consentAgreed !== true) {
      throw new Error('Parent/Guardian consent is required before an enrollment application can be submitted.');
    }
    if (!parentUsername) throw new Error("Your parent account session is missing. Please log in again.");

    // Safety check: do not create another application while one is already
    // pending/approved. A rejected application may be submitted again.
    const { data: existing, error: existingError } = await supabaseClient
      .from("enrollments")
      .select("id,status")
      .eq("parent_username", parentUsername)
      .order("submitted_at", { ascending: false })
      .limit(1);
    _throwIfError(existingError, "createEnrollment/check existing");
    const latest = existing && existing[0];
    if (latest && (latest.status === "pending" || latest.status === "approved")) {
      throw new Error("You already have an " + latest.status + " enrollment application.");
    }

    const row = Object.assign({}, enrollmentToRow(form), {
      id: _uid("child"),
      parent_username: parentUsername,
      status: "pending",
      child_id: null,
      class_section: "Daycare",
      session: null,
      submitted_at: new Date().toISOString(),
      decided_at: null,
      reject_reason: null,
    });

    const { data, error } = await supabaseClient
      .from("enrollments")
      .insert(row)
      .select()
      .single();
    _throwIfError(error, "createEnrollment/insert");
    _cacheClear("allEnrollments", "enrollmentByParent:" + String(parentUsername || "").toLowerCase());
    return enrollmentFromRow(data);
  }

  async function getEnrollmentByParent(parentUsername) {
    const key = "enrollmentByParent:" + String(parentUsername || "").toLowerCase();
    const cached = _cacheGet(key);
    if (cached !== null) return cached;
    const { data, error } = await supabaseClient
      .from("enrollments")
      .select("*")
      .eq("parent_username", parentUsername)
      .order("submitted_at", { ascending: true });
    _throwIfError(error, "getEnrollmentByParent");
    const result = (!data || !data.length) ? null : enrollmentFromRow(data[data.length - 1]);
    return _cacheSet(key, result);
  }

  async function getAllEnrollments() {
    const cached = _cacheGet("allEnrollments");
    if (cached !== null) return cached;
    const { data, error } = await supabaseClient
      .from("enrollments")
      .select("*")
      .order("submitted_at", { ascending: true });
    _throwIfError(error, "getAllEnrollments");
    return _cacheSet("allEnrollments", (data || []).map(enrollmentFromRow));
  }

  async function approveEnrollment(id, assignment) {
    const { data, error } = await supabaseClient
      .from("enrollments")
      .update({
        status: "approved",
        child_id: assignment.childId,
        class_section: 'Daycare',
        session: assignment.session,
        decided_at: new Date().toISOString(),
      })
      .eq("id", id)
      .select()
      .maybeSingle();
    _throwIfError(error, "approveEnrollment");
    _cacheClear("allEnrollments");
    if (!data) return { ok: false, error: "Enrollment not found." };
    return { ok: true, record: enrollmentFromRow(data) };
  }

  async function rejectEnrollment(id, reason) {
    const { data, error } = await supabaseClient
      .from("enrollments")
      .update({
        status: "rejected",
        reject_reason: reason || "Not specified",
        decided_at: new Date().toISOString(),
      })
      .eq("id", id)
      .select()
      .maybeSingle();
    _throwIfError(error, "rejectEnrollment");
    _cacheClear("allEnrollments");
    if (!data) return { ok: false, error: "Enrollment not found." };
    return { ok: true, record: enrollmentFromRow(data) };
  }

  /* -------------------------- PERFORMANCE ------------------------- */

  async function getPerformance(childId) {
    const key = "performance:" + String(childId || "");
    const cached = _cacheGet(key);
    if (cached !== null) return cached;
    const { data, error } = await supabaseClient
      .from("performance")
      .select("*")
      .eq("child_id", childId)
      .maybeSingle();
    _throwIfError(error, "getPerformance");
    if (!data || !data.areas || !data.areas.domains) {
      return _cacheSet(key, Object.assign({}, defaultPerformanceAreas(), {
        updatedAt: data ? data.updated_at : null,
      }));
    }
    return _cacheSet(key, Object.assign({}, data.areas, { updatedAt: data.updated_at }));
  }

  async function setPerformance(childId, perf) {
    const domains = perf.domains;
    const evalComments = perf.evalComments || { e1: "", e2: "", e3: "" };
    const finalComment = perf.finalComment || "";
    const checklists = perf.checklists || {};
    const domainComments = perf.domainComments || {};
    const { error } = await supabaseClient
      .from("performance")
      .upsert({
        child_id: childId,
        areas: { domains: domains, evalComments: evalComments, finalComment: finalComment, domainComments: domainComments, checklists: checklists, teacherComment: perf.teacherComment || "" },
        updated_at: new Date().toISOString(),
      });
    _throwIfError(error, "setPerformance");
    _cacheClear("performance:" + String(childId || ""));
    return { ok: true };
  }

  /* --------------------------- COMMENTS ---------------------------- */
  /* NOTE: General teacher/parent comment thread (separate from the
     per-evaluation and final comments stored on the performance record
     itself). Kept for any other part of the app that still uses it. */

  async function getComments(childId) {
    const { data, error } = await supabaseClient
      .from("comments")
      .select("*")
      .eq("child_id", childId)
      .order("date", { ascending: true });
    _throwIfError(error, "getComments");
    return (data || []).map(commentFromRow);
  }

  async function addComment(childId, from, text) {
    const { error } = await supabaseClient.from("comments").insert({
      child_id: childId,
      from_role: from,
      text,
    });
    _throwIfError(error, "addComment");
    return { ok: true };
  }

  /* ------------------------ AGE CALCULATION ------------------------ */
  /* Pure math, no database access needed, so this stays synchronous. */

  function calculateAge(dobStr, asOfDateStr) {
    if (!dobStr) return { years: 0, months: 0, days: 0 };
    const dob = new Date(dobStr);
    const asOf = asOfDateStr ? new Date(asOfDateStr) : new Date();

    let years = asOf.getFullYear() - dob.getFullYear();
    let months = asOf.getMonth() - dob.getMonth();
    let days = asOf.getDate() - dob.getDate();

    if (days < 0) {
      months -= 1;
      const prevMonth = new Date(asOf.getFullYear(), asOf.getMonth(), 0);
      days += prevMonth.getDate();
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }
    if (years < 0) years = months = days = 0;
    return { years, months, days };
  }

  async function _getSettings() {
    const cached = _cacheGet("settings");
    if (cached !== null) return cached;
    const { data, error } = await supabaseClient
      .from("settings")
      .select("*")
      .eq("id", 1)
      .single();
    _throwIfError(error, "_getSettings");
    return _cacheSet("settings", data);
  }

  // "Age at End of School Year" = the child's current age, plus the
  // daycare's 9-month school year duration (not tied to the settings
  // end-of-school-year date).
  function ageAtEndOfSchoolYear(dobStr) {
    const age = calculateAge(dobStr);
    let years = age.years;
    let months = age.months + 9;
    if (months >= 12) {
      years += Math.floor(months / 12);
      months = months % 12;
    }
    return { years, months, days: age.days };
  }

  async function getSchoolYear() {
    const settings = await _getSettings();
    return settings.school_year;
  }

  async function getSchoolYearInfo() {
    const settings = await _getSettings();
    return {
      schoolYear: settings.school_year,
      schoolYearEnd: settings.school_year_end,
    };
  }

  async function setSchoolYear(schoolYear, schoolYearEnd) {
    const { error } = await supabaseClient
      .from("settings")
      .update({
        school_year: schoolYear,
        school_year_end: schoolYearEnd,
      })
      .eq("id", 1);
    _throwIfError(error, "setSchoolYear");
    _cacheClear("settings");
    return { ok: true };
  }

  /* -------------------------- ADMIN: MANAGE ACCOUNTS -------------------------- */

  async function getAllParents() {
    const cached = _cacheGet("allParents");
    if (cached !== null) return cached;
    const { data, error } = await supabaseClient
      .from("users")
      .select("*")
      .eq("role", "parent")
      .order("created_at", { ascending: true });
    _throwIfError(error, "getAllParents");
    return _cacheSet("allParents", (data || []).map(userFromRow));
  }

  async function deleteParentAccount(username) {
    const { data: user, error: findErr } = await supabaseClient
      .from("users")
      .select("id")
      .eq("username", username)
      .eq("role", "parent")
      .maybeSingle();
    _throwIfError(findErr, "deleteParentAccount/find");
    if (!user) return { ok: false, error: "Parent account not found." };

    // Clean up performance/comments tied to this parent's enrollment first.
    const { data: enrollment } = await supabaseClient
      .from("enrollments")
      .select("id, child_id")
      .eq("parent_username", username)
      .maybeSingle();

    if (enrollment) {
      const childKey = enrollment.child_id || enrollment.id;
      await supabaseClient.from("performance").delete().eq("child_id", childKey);
      await supabaseClient.from("comments").delete().eq("child_id", childKey);
    }

    // Deleting the user row also cascades to their enrollments (FK ON DELETE CASCADE).
    const { error } = await supabaseClient.from("users").delete().eq("username", username);
    _throwIfError(error, "deleteParentAccount/delete");
    _cacheClear("allParents", "allEnrollments", "enrollmentByParent:" + String(username || "").toLowerCase());
    return { ok: true };
  }

  /* --------------------------------------------------------------- */

  return {
    signUp,
    login,
    currentUser,
    logout,
    changePassword,
    requestPasswordReset,
    completePasswordReset,
    resetPassword,
    createEnrollment,
    getEnrollmentByParent,
    getAllEnrollments,
    approveEnrollment,
    rejectEnrollment,
    getPerformance,
    setPerformance,
    getComments,
    addComment,
    calculateAge,
    ageAtEndOfSchoolYear,
    getAllParents,
    deleteParentAccount,
    getSchoolYear,
    getSchoolYearInfo,
    setSchoolYear,
  };
})();