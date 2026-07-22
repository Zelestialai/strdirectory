import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
// The main STRVend app lives one level up from qa-suite/
const APP_ROOT = path.resolve(__dirname, "..");

export default defineConfig({
  plugins: [react()],
  resolve: {
    // Force a single React instance. The app's source (loaded via "@/...")
    // imports React from the app's node_modules; point our test React there too
    // so hooks/context (e.g. next/link, our components) don't hit two copies.
    dedupe: ["react", "react-dom"],
    alias: {
      // Stub Next.js client modules so we don't drag Next internals into jsdom
      "next/link": path.resolve(__dirname, "stubs/next-link.tsx"),
      "next/image": path.resolve(__dirname, "stubs/next-image.tsx"),
      "next/navigation": path.resolve(__dirname, "stubs/next-navigation.ts"),
      // Single React copy (prefer the app's install; falls back to ours if absent)
      react: path.resolve(APP_ROOT, "node_modules/react"),
      "react-dom": path.resolve(APP_ROOT, "node_modules/react-dom"),
      // Mirror the app's "@/..." path alias so we test the real shipping code
      "@": APP_ROOT,
    },
  },
  test: {
    environment: "jsdom",
    globals: true,
    setupFiles: ["./setup/vitest.setup.ts"],
    include: ["tests/**/*.test.{ts,tsx}"],
    exclude: ["node_modules", "e2e"],
    coverage: {
      provider: "v8",
      reporter: ["text", "html"],
      include: ["../lib/**", "../components/**"],
      reportsDirectory: "./coverage",
    },
  },
});
