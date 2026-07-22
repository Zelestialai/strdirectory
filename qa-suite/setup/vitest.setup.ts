import "@testing-library/jest-dom/vitest";
import { cleanup } from "@testing-library/react";
import { afterEach } from "vitest";

// Dummy env vars so app modules that read process.env at import time
// (e.g. lib/stripe.ts instantiating the Stripe client) don't throw.
process.env.STRIPE_SECRET_KEY ??= "sk_test_dummy";
process.env.STRIPE_PRO_PRICE_ID ??= "price_pro_monthly";
process.env.STRIPE_PRO_ANNUAL_PRICE_ID ??= "price_pro_annual";
process.env.STRIPE_FEATURED_PRICE_ID ??= "price_featured_monthly";
process.env.STRIPE_FEATURED_ANNUAL_PRICE_ID ??= "price_featured_annual";
process.env.NEXT_PUBLIC_SUPABASE_URL ??= "https://dummy.supabase.co";
process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ??= "dummy-anon-key";

// next/link, next/image and next/navigation are stubbed via resolve.alias
// in vitest.config.ts — no vi.mock needed here.

afterEach(() => {
  cleanup();
});
