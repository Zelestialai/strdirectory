import { test, expect } from "@playwright/test";

test.describe("Vendor directory", () => {
  test("vendor search page loads with results or an empty state", async ({ page }) => {
    await page.goto("/vendors");
    // The page should render its main heading area
    await expect(page.locator("body")).toContainText(/vendor|service|provider/i);
  });

  test("category filter via query param loads", async ({ page }) => {
    const res = await page.goto("/vendors?category=cleaning-turnover");
    expect(res?.status()).toBeLessThan(400);
    await expect(page).toHaveURL(/category=cleaning-turnover/);
  });

  test("markets index page lists markets", async ({ page }) => {
    await page.goto("/markets");
    await expect(page.locator("body")).toContainText(/market/i);
  });
});
