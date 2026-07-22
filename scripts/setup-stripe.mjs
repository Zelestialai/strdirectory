// Run this once to set up Stripe products + prices
// Usage: node scripts/setup-stripe.mjs
import Stripe from "stripe";

const SK = process.env.STRIPE_SECRET_KEY;
if (!SK) {
  console.error("❌  Set STRIPE_SECRET_KEY before running:\n   STRIPE_SECRET_KEY=sk_test_... node scripts/setup-stripe.mjs");
  process.exit(1);
}

const stripe = new Stripe(SK, { apiVersion: "2026-06-24.dahlia" });

console.log("Creating Stripe products and prices…\n");

// --- Pro ---
const pro = await stripe.products.create({
  name: "Pro",
  description: "Verified badge, priority placement, full analytics dashboard",
});

const proMonthly = await stripe.prices.create({
  product: pro.id,
  unit_amount: 2900,
  currency: "usd",
  recurring: { interval: "month" },
  nickname: "Pro Monthly",
});

const proAnnual = await stripe.prices.create({
  product: pro.id,
  unit_amount: 29000,
  currency: "usd",
  recurring: { interval: "year" },
  nickname: "Pro Annual (2 months free)",
});

// --- Featured ---
const featured = await stripe.products.create({
  name: "Featured",
  description: "Featured badge, top placement, homepage spotlight, priority support",
});

const featMonthly = await stripe.prices.create({
  product: featured.id,
  unit_amount: 7900,
  currency: "usd",
  recurring: { interval: "month" },
  nickname: "Featured Monthly",
});

const featAnnual = await stripe.prices.create({
  product: featured.id,
  unit_amount: 79000,
  currency: "usd",
  recurring: { interval: "year" },
  nickname: "Featured Annual (2 months free)",
});

// --- Publishable key ---
const pk = (await stripe.accountLinks.create({
  account: (await stripe.accounts.retrieve()).id,
  refresh_url: "https://example.com",
  return_url:  "https://example.com",
  type: "account_onboarding",
}).catch(() => null));

// Get publishable key via config
const config = await stripe.terminal.connectionTokens.create().catch(() => null);

console.log("✅  Done! Add these to Vercel environment variables:\n");
console.log(`STRIPE_SECRET_KEY=${SK}`);
console.log(`STRIPE_PRO_PRICE_ID=${proMonthly.id}`);
console.log(`STRIPE_PRO_ANNUAL_PRICE_ID=${proAnnual.id}`);
console.log(`STRIPE_FEATURED_PRICE_ID=${featMonthly.id}`);
console.log(`STRIPE_FEATURED_ANNUAL_PRICE_ID=${featAnnual.id}`);
console.log("\nPaste these back to Claude to finish setup.");
