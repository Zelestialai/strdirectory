import { test, expect } from "@playwright/test";

const POLICY_PAGES = [
  { path: "/privacy", heading: /privacy policy/i },
  { path: "/refund-policy", heading: /refund policy/i },
  { path: "/cookie-policy", heading: /cookie policy/i },
  { path: "/vendor-agreement", heading: /vendor agreement/i },
  { path: "/terms", heading: /terms/i },
];

test.describe("Legal / policy pages", () => {
  for (const { path, heading } of POLICY_PAGES) {
    test(`${path} loads with a heading`, async ({ page }) => {
      const res = await page.goto(path);
      expect(res?.status(), `${path} should return 2xx`).toBeLessThan(400);
      await expect(page.getByRole("heading", { name: heading }).first()).toBeVisible();
    });
  }
});
