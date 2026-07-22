import { describe, it, expect } from "vitest";
import { STRIPE_PLANS } from "@/lib/stripe";

describe("STRIPE_PLANS", () => {
  it("defines pro and featured tiers", () => {
    expect(Object.keys(STRIPE_PLANS).sort()).toEqual(["featured", "pro"]);
  });

  it("annual pricing is cheaper per month than monthly (2 months free)", () => {
    for (const key of ["pro", "featured"] as const) {
      const plan = STRIPE_PLANS[key];
      // Annual total should equal 10x the monthly amount (12 months, 2 free)
      expect(plan.annual.amount).toBe(plan.monthly.amount * 10);
    }
  });

  it("each plan's tier matches its key", () => {
    expect(STRIPE_PLANS.pro.tier).toBe("pro");
    expect(STRIPE_PLANS.featured.tier).toBe("featured");
  });

  it("featured costs more than pro", () => {
    expect(STRIPE_PLANS.featured.monthly.amount).toBeGreaterThan(STRIPE_PLANS.pro.monthly.amount);
  });

  it("exposes display strings for the pricing UI", () => {
    expect(STRIPE_PLANS.pro.monthly.amountDisplay).toBe("$29");
    expect(STRIPE_PLANS.featured.monthly.amountDisplay).toBe("$79");
  });
});
