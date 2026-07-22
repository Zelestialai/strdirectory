import { describe, it, expect } from "vitest";
import {
  slugify,
  formatDate,
  truncate,
  cn,
  CATEGORY_COVERS,
  CATEGORY_COLORS,
  COLOR_CLASSES,
} from "@/lib/utils";

describe("slugify", () => {
  it("lowercases and hyphenates spaces", () => {
    expect(slugify("Hello World")).toBe("hello-world");
  });

  it("strips special characters", () => {
    expect(slugify("Bob's Cleaning & Turnover!")).toBe("bob-s-cleaning-turnover");
  });

  it("collapses multiple separators into one hyphen", () => {
    expect(slugify("a   b---c")).toBe("a-b-c");
  });

  it("trims leading and trailing hyphens", () => {
    expect(slugify("  Nashville, TN  ")).toBe("nashville-tn");
  });

  it("handles already-slugified input idempotently", () => {
    expect(slugify("smoky-mountains")).toBe("smoky-mountains");
  });
});

describe("formatDate", () => {
  it("formats an ISO date into a long US date", () => {
    // Use midday UTC to avoid timezone rollover on the day boundary
    expect(formatDate("2026-07-20T12:00:00Z")).toBe("July 20, 2026");
  });

  it("formats a plain date string", () => {
    expect(formatDate("2025-01-01T12:00:00Z")).toBe("January 1, 2025");
  });
});

describe("truncate", () => {
  it("returns the string unchanged when under the limit", () => {
    expect(truncate("short", 120)).toBe("short");
  });

  it("truncates and appends an ellipsis when over the limit", () => {
    const long = "a".repeat(200);
    const result = truncate(long, 50);
    expect(result.endsWith("…")).toBe(true);
    expect(result.length).toBe(51); // 50 chars + ellipsis
  });

  it("trims trailing whitespace before the ellipsis", () => {
    const result = truncate("hello world foo", 11);
    expect(result).toBe("hello world…");
  });

  it("respects the default max length of 120", () => {
    const exactly120 = "x".repeat(120);
    expect(truncate(exactly120)).toBe(exactly120);
    expect(truncate("y".repeat(121)).endsWith("…")).toBe(true);
  });
});

describe("cn (class merge)", () => {
  it("joins truthy class names", () => {
    expect(cn("a", "b")).toBe("a b");
  });

  it("drops falsy values", () => {
    expect(cn("a", false, null, undefined, "b")).toBe("a b");
  });

  it("dedupes conflicting tailwind classes, last one wins", () => {
    expect(cn("px-2", "px-4")).toBe("px-4");
  });
});

describe("category constant maps", () => {
  const categorySlugs = Object.keys(CATEGORY_COLORS);

  it("has 12 categories", () => {
    expect(categorySlugs.length).toBe(12);
  });

  it("has a cover image for every category color entry", () => {
    for (const slug of categorySlugs) {
      expect(CATEGORY_COVERS[slug], `missing cover for ${slug}`).toBeTruthy();
    }
  });

  it("maps every category color to a valid COLOR_CLASSES token", () => {
    for (const slug of categorySlugs) {
      const color = CATEGORY_COLORS[slug];
      expect(COLOR_CLASSES[color], `no COLOR_CLASSES for ${color}`).toBeDefined();
    }
  });

  it("every COLOR_CLASSES entry has bg, text and border", () => {
    for (const [, cls] of Object.entries(COLOR_CLASSES)) {
      expect(cls).toHaveProperty("bg");
      expect(cls).toHaveProperty("text");
      expect(cls).toHaveProperty("border");
    }
  });
});
