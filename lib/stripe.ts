import Stripe from "stripe";

export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: "2025-06-30.basil",
});

export const STRIPE_PLANS = {
  pro: {
    name: "Pro",
    monthly: {
      priceId: process.env.STRIPE_PRO_PRICE_ID!,
      amount: 2900,      // $29/mo
      amountDisplay: "$29",
    },
    annual: {
      priceId: process.env.STRIPE_PRO_ANNUAL_PRICE_ID!,
      amount: 29000,     // $290/yr (2 months free)
      amountDisplay: "$290",
      monthlyEquivalent: "$24",
    },
    tier: "pro" as const,
  },
  featured: {
    name: "Featured",
    monthly: {
      priceId: process.env.STRIPE_FEATURED_PRICE_ID!,
      amount: 7900,      // $79/mo
      amountDisplay: "$79",
    },
    annual: {
      priceId: process.env.STRIPE_FEATURED_ANNUAL_PRICE_ID!,
      amount: 79000,     // $790/yr (2 months free)
      amountDisplay: "$790",
      monthlyEquivalent: "$66",
    },
    tier: "featured" as const,
  },
} as const;

export type PlanKey = keyof typeof STRIPE_PLANS;
export type BillingInterval = "monthly" | "annual";
