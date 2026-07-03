import Stripe from "stripe";

export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: "2026-06-24.dahlia",
});

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
