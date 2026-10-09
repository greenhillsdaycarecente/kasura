/*
  EMAIL VERIFICATION CONFIGURATION
  This project uses EmailJS only for delivering the one-time
  verification code. The password reset itself is validated by Supabase.

  1. Create an EmailJS account.
  2. Add your email service.
  3. Create a template containing:
       {{to_email}}
       {{username}}
       {{verification_code}}
       {{expires_minutes}}
       {{app_name}}
  4. Put the values below from EmailJS.
*/
window.EMAILJS_CONFIG = {
  PUBLIC_KEY: "X3SS6C0tLs1igRo95",
  SERVICE_ID: "service_w9nookm",
  TEMPLATE_ID: "template_96h7sdh"
};

if (window.emailjs && window.EMAILJS_CONFIG.PUBLIC_KEY && !window.EMAILJS_CONFIG.PUBLIC_KEY.includes("YOUR_")) {
  emailjs.init({ publicKey: window.EMAILJS_CONFIG.PUBLIC_KEY });
}
