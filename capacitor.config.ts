import type { CapacitorConfig } from "@capacitor/cli";

/**
 * STRVend native shell (iOS + Android) via Capacitor.
 *
 * Strategy: the app is a thin native wrapper that loads the live, server-rendered
 * STRVend site (server.url). This keeps one codebase and all SSR/auth working,
 * while native plugins (Camera, Push, StatusBar) add the "app at the job" value
 * that also satisfies App Store minimum-functionality review.
 *
 * For local development against a dev server, override server.url via
 * CAP_SERVER_URL (e.g. http://192.168.1.20:3000) before `npx cap sync`.
 */
const SERVER_URL = process.env.CAP_SERVER_URL || "https://www.strvend.com";

const config: CapacitorConfig = {
  appId: "com.strvend.app",
  appName: "STRVend",
  // Fallback bundle shown only if the remote URL can't load (offline splash).
  webDir: "capacitor-shell",
  server: {
    url: SERVER_URL,
    cleartext: false,
    androidScheme: "https",
    // Allow the site's own origin + Supabase/Stripe endpoints it talks to.
    allowNavigation: [
      "www.strvend.com",
      "strvend.com",
      "*.supabase.co",
      "*.stripe.com",
    ],
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 1200,
      backgroundColor: "#0d9488",
      showSpinner: false,
    },
    PushNotifications: {
      presentationOptions: ["badge", "sound", "alert"],
    },
  },
  ios: {
    contentInset: "always",
  },
};

export default config;
