// Creates the Stripe webhook endpoint and returns the signing secret
// Usage: node scripts/setup-stripe-webhook.mjs
import Stripe from "stripe";

const SK = process.env.STRIPE_SECRET_KEY;
if (!SK) {
  console.error("Set STRIPE_SECRET_KEY first");
  process.exit(1);
}

const stripe = new Stripe(SK, { apiVersion: "2026-06-24.dahlia" });

const webhook = await stripe.webhookEndpoints.create({
  url: "https://www.strvend.com/api/stripe/webhook",
  enabled_events: [
    "checkout.session.completed",
    "customer.subscription.updated",
    "customer.subscription.deleted",
    "invoice.payment_failed",
  ],
  description: "STRVend production webhook",
});

console.log("\n✅  Webhook created!\n");
console.log(`STRIPE_WEBHOOK_SECRET=${webhook.secret}`);
console.log("\nAlso grab your publishable key from:");
console.log("Stripe Dashboard → Developers → API keys → Publishable key (pk_test_...)");
console.log("Then paste both back to Claude.");
