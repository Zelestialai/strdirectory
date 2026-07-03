import Stripe from "stripe";

// Fallback prevents "apiKey not provided" crash when module is imported
// during Next.js build analysis before env vars are available at runtime.
export const stripe = new Stripe(
  process.env.STRIPE_SECRET_KEY || "sk_not_configured",
  { apiVersion: "2026-06-24.dahlia" }
);

export const STRIPE_PLANS = {
  pro: {
    name: "Pro",
    priceId: process.env.STRIPE_PRO_PRICE_ID!,
    amount: 2900, // $29/mo in cents
    tier: "pro" as const,
  },
  featured: {
    name: "Featured",
    priceId: process.env.STRIPE_FEATURED_PRICE_ID!,
    amount: 7900, // $79/mo in cents
    tier: "featured" as const,
  },
} as const;

export type PlanKey = keyof typeof STRIPE_PLANS;
