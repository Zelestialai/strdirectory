import { describe, it, expect } from "vitest";
import {
  getChecklistSteps,
  getCompletionScore,
  getNextIncompleteStep,
} from "@/lib/profile-completeness";

// Minimal vendor factory — only the fields the checklist reads.
function makeVendor(overrides: Record<string, any> = {}) {
  return {
    id: "v1",
    business_name: "Test Co",
    category_id: "c1",
    city: null,
    state: null,
    description: null,
    logo_url: null,
    cover_url: null,
    phone: null,
    website: null,
    services: [],
    ...overrides,
  } as any;
}

describe("getChecklistSteps", () => {
  it("returns 7 steps whose weights sum to 100", () => {
    const steps = getChecklistSteps(makeVendor());
    expect(steps).toHaveLength(7);
    expect(steps.reduce((s, x) => s + x.weight, 0)).toBe(100);
  });

  it("marks basic_info done when name and category present", () => {
    const steps = getChecklistSteps(makeVendor());
    expect(steps.find((s) => s.id === "basic_info")?.done).toBe(true);
  });

  it("requires a description of at least 80 chars", () => {
    const shortDesc = getChecklistSteps(makeVendor({ description: "too short" }));
    expect(shortDesc.find((s) => s.id === "description")?.done).toBe(false);

    const longDesc = getChecklistSteps(makeVendor({ description: "x".repeat(80) }));
    expect(longDesc.find((s) => s.id === "description")?.done).toBe(true);
  });

  it("marks contact done when phone OR website present", () => {
    expect(
      getChecklistSteps(makeVendor({ phone: "555-1234" })).find((s) => s.id === "contact")?.done
    ).toBe(true);
    expect(
      getChecklistSteps(makeVendor({ website: "https://x.com" })).find((s) => s.id === "contact")?.done
    ).toBe(true);
  });

  it("marks services done only when at least one service exists", () => {
    expect(getChecklistSteps(makeVendor({ services: [] })).find((s) => s.id === "services")?.done).toBe(false);
    expect(
      getChecklistSteps(makeVendor({ services: [{ id: "s1" }] })).find((s) => s.id === "services")?.done
    ).toBe(true);
  });
});

describe("getCompletionScore", () => {
  it("is 10 for a bare listing (only basic_info done)", () => {
    // basic_info weight = 10
    expect(getCompletionScore(getChecklistSteps(makeVendor()))).toBe(10);
  });

  it("is 0 when nothing is done", () => {
    const steps = getChecklistSteps(makeVendor({ business_name: null, category_id: null }));
    expect(getCompletionScore(steps)).toBe(0);
  });

  it("is 100 for a fully complete profile", () => {
    const complete = makeVendor({
      business_name: "Test Co",
      category_id: "c1",
      city: "Nashville",
      state: "TN",
      description: "x".repeat(100),
      logo_url: "https://x/logo.png",
      cover_url: "https://x/cover.png",
      phone: "555-1234",
      website: "https://x.com",
      services: [{ id: "s1" }],
    });
    expect(getCompletionScore(getChecklistSteps(complete))).toBe(100);
  });
});

describe("getNextIncompleteStep", () => {
  it("returns the first incomplete step", () => {
    const next = getNextIncompleteStep(getChecklistSteps(makeVendor()));
    expect(next?.id).toBe("location");
  });

  it("returns null when everything is complete", () => {
    const complete = makeVendor({
      city: "Nashville", state: "TN",
      description: "x".repeat(100),
      logo_url: "l", cover_url: "c",
      phone: "p", website: "w",
      services: [{ id: "s1" }],
    });
    expect(getNextIncompleteStep(getChecklistSteps(complete))).toBeNull();
  });
});
