/* GREENHILLS PHASE II DAYCARE - INPUT SECURITY / VALIDATION
 * Client-side protection for normal users. Database validation should also be enforced with SQL/RLS.
 */
(function () {
  'use strict';

  const NAME_RE = /^[A-Za-zÀ-ÖØ-öø-ÿÑñ]+(?:[ .'-][A-Za-zÀ-ÖØ-öø-ÿÑñ]+)*$/;
  const PHONE_RE = /^(?:09\d{9}|\+639\d{9}|\(\+63\)\s?9\d{9})$/;
  const EMAIL_RE = /^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)+$/;
  const USERNAME_RE = /^[A-Za-z0-9][A-Za-z0-9._-]{2,29}$/;
  const CHILD_ID_RE = /^GH-\d{4}-\d{3,6}$/i;

  function cleanText(value, max) {
    return String(value ?? '')
      .replace(/[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]/g, '')
      .replace(/[<>]/g, '')
      .slice(0, max || 200);
  }

  function normalizePhone(value) {
    return String(value ?? '').replace(/[\u2010-\u2015]/g, '-').replace(/\s+/g, '').trim();
  }

  function validName(value, required) {
    const v = cleanText(value, 80).trim();
    return !v && !required ? true : NAME_RE.test(v) && v.length >= 2;
  }

  function validPhone(value, required) {
    const v = normalizePhone(value);
    return !v && !required ? true : PHONE_RE.test(v);
  }

  function validEmail(value) {
    const v = cleanText(value, 254).trim();
    return EMAIL_RE.test(v) && v.length <= 254;
  }

  function validUsername(value) {
    const v = cleanText(value, 30).trim();
    return USERNAME_RE.test(v);
  }

  function validAddress(value, required) {
    const v = cleanText(value, 200).trim();
    if (!v && !required) return true;
    return v.length >= 5 && /[A-Za-zÀ-ÖØ-öø-ÿÑñ0-9]/.test(v);
  }

  function validChildId(value) {
    return CHILD_ID_RE.test(cleanText(value, 20).trim());
  }

  function validDateOfBirth(value) {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
    const d = new Date(value + 'T00:00:00');
    const now = new Date();
    if (Number.isNaN(d.getTime()) || d > now) return false;
    // Reject implausible daycare DOBs older than 10 years.
    const min = new Date(now.getFullYear() - 10, now.getMonth(), now.getDate());
    return d >= min;
  }

  function validateEnrollment(data) {
    const errors = [];
    if (!validName(data.firstName, true)) errors.push('First name may contain letters, spaces, hyphens, apostrophes, or periods only.');
    if (!validName(data.middleName, false)) errors.push('Middle name contains invalid characters.');
    if (!validName(data.lastName, true)) errors.push('Last name may contain letters, spaces, hyphens, apostrophes, or periods only.');
    if (!validDateOfBirth(data.dob)) errors.push('Please enter a valid date of birth that is not in the future.');
    if (!['Male', 'Female'].includes(data.gender)) errors.push('Please select a valid gender.');
    if (!validAddress(data.childAddress, true)) errors.push('Please enter a valid child address.');
    if (!validName(data.nickname, false)) errors.push('Nickname contains invalid characters.');
    if (!validName(data.guardianName, true)) errors.push('Guardian name contains invalid characters.');
    if (!validPhone(data.guardianPhone, true)) errors.push('Primary contact number must be a valid Philippine mobile number (09XXXXXXXXX or +639XXXXXXXXX).');
    if (!validPhone(data.guardianAltPhone, false)) errors.push('Alternate contact number is invalid.');
    if (!validAddress(data.guardianAddress, true)) errors.push('Please enter a valid guardian address.');
    if (!validName(data.emName, true)) errors.push('Emergency contact name contains invalid characters.');
    if (!validPhone(data.emPhone, true)) errors.push('Emergency contact number must be a valid Philippine mobile number.');
    if (!validPhone(data.emAltPhone, false)) errors.push('Emergency alternate contact number is invalid.');
    if (!validAddress(data.emAddress, true)) errors.push('Please enter a valid emergency contact address.');
    return errors;
  }

  function validateSignup(data) {
    const errors = [];
    if (!validName(data.fullName, true)) errors.push('Full name may contain letters, spaces, hyphens, apostrophes, or periods only.');
    if (!validEmail(data.email)) errors.push('Please enter a valid Gmail/email address.');
    if (!validPhone(data.contact, true)) errors.push('Contact number must be a valid Philippine mobile number (09XXXXXXXXX or +639XXXXXXXXX).');
    if (!validAddress(data.address, true)) errors.push('Please enter a valid address.');
    if (!validName(data.guardianName, true)) errors.push('Guardian name contains invalid characters.');
    if (!validUsername(data.username)) errors.push('Username must be 3–30 characters and may contain only letters, numbers, dot, underscore, or hyphen.');
    if (String(data.password || '').length < 8) errors.push('Password must be at least 8 characters.');
    if (String(data.password || '').length > 128) errors.push('Password is too long.');
    return errors;
  }

  function validateReset(data) {
    const errors = [];
    if (!validUsername(data.username)) errors.push('Invalid username format.');
    if (!validEmail(data.email)) errors.push('Please enter a valid email address.');
    if (!/^\d{6}$/.test(String(data.code || ''))) errors.push('Verification code must contain exactly 6 digits.');
    return errors;
  }

  // Sanitize ordinary free-text fields while typing. Passwords and files are never modified.
  function sanitizeInput(el) {
    if (!el || ['password', 'file', 'date', 'email', 'number'].includes(el.type)) return;
    if (el.tagName === 'SELECT' || el.type === 'checkbox') return;
    const old = el.value;
    let value = cleanText(old, el.maxLength > 0 ? el.maxLength : 300);
    if (['guardianPhone','guardianAltPhone','emPhone','emAltPhone','contact'].includes(el.id)) {
      value = value.replace(/[^0-9+()\s-]/g, '');
    }
    if (el.id === 'fCode') value = value.replace(/\D/g, '').slice(0, 6);
    if (el.id === 'username' || el.id === 'fUsername') value = value.replace(/[^A-Za-z0-9._-]/g, '').slice(0, 30);
    if (old !== value) {
      const pos = Math.min(el.selectionStart || value.length, value.length);
      el.value = value;
      try { el.setSelectionRange(pos, pos); } catch (_) {}
    }
  }

  function setup() {
    document.addEventListener('input', function (e) {
      if (e.target && (e.target.matches('input[type="text"],input[type="email"],textarea') || e.target.id === 'fCode')) sanitizeInput(e.target);
    }, true);

    document.addEventListener('blur', function (e) {
      const el = e.target;
      if (!el || !el.id) return;
      if (['guardianPhone','guardianAltPhone','emPhone','emAltPhone','contact'].includes(el.id)) el.value = normalizePhone(el.value);
      if (['email','fEmail'].includes(el.id)) el.value = cleanText(el.value, 254).trim().toLowerCase();
      if (['username','fUsername'].includes(el.id)) el.value = cleanText(el.value, 30).trim();
    }, true);
  }

  window.SecurityValidation = {
    cleanText, validName, validPhone, validEmail, validUsername, validAddress,
    validChildId, validDateOfBirth, validateEnrollment, validateSignup, validateReset,
    sanitizeInput
  };

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', setup);
  else setup();
})();
