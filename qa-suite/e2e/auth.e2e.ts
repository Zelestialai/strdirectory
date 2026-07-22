import { test, expect } from "@playwright/test";

test.describe("Auth pages", () => {
  test("login page renders a sign-in form", async ({ page }) => {
    await page.goto("/login");
    await expect(page.locator('input[type="email"]').first()).toBeVisible();
    await expect(page.locator('input[type="password"]').first()).toBeVisible();
  });

  test("register page renders", async ({ page }) => {
    const res = await page.goto("/register");
    expect(res?.status()).toBeLessThan(400);
    await expect(page.locator('input[type="email"]').first()).toBeVisible();
  });

  test("protected dashboard redirects unauthenticated users to login", async ({ page }) => {
    await page.goto("/dashboard");
    // Middleware / layout should bounce to /login (optionally with a ?next param)
    await expect(page).toHaveURL(/\/login/);
  });
});
