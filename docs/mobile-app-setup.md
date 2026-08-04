# STRVend Mobile App (iOS + Android) — Build & Submit Playbook

The mobile apps are **Capacitor** wrappers around the live STRVend web app. The
native shell loads `https://www.strvend.com` and layers on native **camera** and
**push** so cleaners get an installable, store-listed app that opens straight to
their jobs — while we keep a single codebase (no separate React Native app).

Everything in the repo is already wired. What's left can only be done on your own
machine because it needs Xcode / Android Studio and paid developer accounts.

---

## What's already in the repo

- `capacitor.config.ts` — appId `com.strvend.app`, name **STRVend**, `server.url`
  pointing at the live site, splash screen, and push presentation options.
- `capacitor-shell/index.html` — branded offline/loading fallback (`webDir`).
- `lib/native.ts` — guarded helpers: `isNativePlatform()`, `takeNativePhoto()`,
  `registerPushIfNative()`. These no-op on the web, so the site is unaffected.
- Checklist photo button already calls the native camera when running in the app
  and falls back to the file picker on the web.
- `public/manifest.webmanifest` + theme/apple meta → also an installable PWA.
- `package.json` — Capacitor deps + `cap:sync`, `cap:ios`, `cap:android` scripts.

---

## Prerequisites (one-time)

| Need | For | Cost |
|------|-----|------|
| A **Mac** with **Xcode** | building/submitting iOS | free (Mac required) |
| **Android Studio** | building/submitting Android | free |
| **Apple Developer Program** | App Store listing | **$99/yr** |
| **Google Play Console** | Play Store listing | **$25 once** |
| **Node 18+** | tooling | free |

> Windows can build the **Android** app fine. **iOS builds require macOS** — if you
> don't have a Mac, use a Mac in the cloud (e.g. MacStadium) or a CI service
> (Codemagic, EAS Build, GitHub Actions macOS runners).

---

## 1. Install & add native platforms

From the repo root:

```bash
npm install
npm install -D @capacitor/cli @capacitor/ios @capacitor/android

# generate the native projects (creates ./ios and ./android)
npx cap add ios
npx cap add android

# copy config + web assets into them
npx cap sync
```

Commit the generated `ios/` and `android/` folders if you want reproducible
builds (recommended).

## 2. App icons & splash screens

Put a 1024×1024 PNG at `resources/icon.png` and a 2732×2732 PNG at
`resources/splash.png`, then:

```bash
npm install -D @capacitor/assets
npx capacitor-assets generate --iconBackgroundColor '#0d9488' --splashBackgroundColor '#0d9488'
```

Also drop `icon-192.png`, `icon-512.png`, and `icon-maskable-512.png` into
`public/icons/` so the PWA manifest resolves (any square teal logo works).

## 3. Run locally

```bash
npm run cap:ios       # opens Xcode → pick a simulator/device → Run
npm run cap:android   # opens Android Studio → Run
```

The app will load the live site. To point at a **local dev server** instead,
set `CAP_SERVER_URL` before syncing, e.g.:

```bash
CAP_SERVER_URL=http://192.168.1.20:3000 npx cap sync
```

## 4. Native permissions to declare

- **iOS** (`ios/App/App/Info.plist`): add usage strings —
  `NSCameraUsageDescription` ("Take photos to document completed cleaning
  tasks") and `NSPhotoLibraryAddUsageDescription`.
- **Android** (`android/app/src/main/AndroidManifest.xml`): the Camera plugin
  adds `CAMERA`; confirm `INTERNET` is present (it is by default).

## 5. Push notifications (optional, later)

`lib/native.ts` already has `registerPushIfNative()`. To actually deliver push:

1. **iOS**: create an APNs key in the Apple Developer portal, enable Push in
   Xcode capabilities.
2. **Android**: create a Firebase project, add `google-services.json` to
   `android/app/`.
3. Add a backend endpoint to store the device token (call
   `registerPushIfNative(token => fetch('/api/push/register', …))` after login)
   and a sender (FCM/APNs) triggered from the notification events we already
   create in `lib/notifications.ts`.

This is additive and not required to ship the first version.

## 6. Submit to the stores

**iOS**
1. In Xcode: set your Team, a unique bundle id (`com.strvend.app`), and a version.
2. Product → Archive → Distribute App → App Store Connect.
3. In App Store Connect: fill listing, screenshots, privacy questionnaire, submit.

**Android**
1. In Android Studio: Build → Generate Signed Bundle (`.aab`), create/keep a
   keystore safe.
2. In Play Console: create the app, upload the `.aab`, complete the content
   rating + data-safety forms, submit for review.

### App Store review note (important)
Apple rejects apps that are "just a website" (Guideline **4.2 – Minimum
Functionality**). Our native **camera** (documenting cleaning tasks) and **push**
give it genuine native value — lead with those in the review notes and a demo
video. Providing a working demo cleaner login also speeds review.

---

## When to graduate to fully native

Stick with this Capacitor wrapper until cleaners are actively using it. If you
later need richer offline support, background sync, or heavier native UI, the
API/Supabase layer is already reusable by a React Native/Expo app — only the UI
would be rebuilt.
