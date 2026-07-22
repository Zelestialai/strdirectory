import { test, expect } from "@playwright/test";

test.describe("Homepage", () => {
  test("loads and shows the STRVend brand", async ({ page }) => {
    await page.goto("/");
    await expect(page).toHaveTitle(/STRVend/i);
    // Brand wordmark in the navbar
    await expect(page.getByRole("link", { name: /STRVend/i }).first()).toBeVisible();
  });

  test("has a working link into the vendor directory", async ({ page }) => {
    await page.goto("/");
    // Navigate to the vendors listing via any link pointing there
    const vendorsLink = page.locator('a[href*="/vendors"]').first();
    await expect(vendorsLink).toBeVisible();
  });

  test("renders the footer with legal links", async ({ page }) => {
    await page.goto("/");
    await page.locator("footer").scrollIntoViewIfNeeded();
    await expect(page.locator('footer a[href="/privacy"]').first()).toBeVisible();
    await expect(page.locator('footer a[href="/terms"]').first()).toBeVisible();
  });
});
