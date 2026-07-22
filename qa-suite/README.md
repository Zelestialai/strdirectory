# STRVend QA Suite

A standalone testing project for the STRVend application. It lives inside the main
repo (`qa-suite/`) but is a fully separate npm project with its own dependencies and
config, so it never interferes with the app's build.

## What it covers

- **Unit tests** (`tests/unit/`) — pure functions in the app's `lib/`: `slugify`,
  `formatDate`, `truncate`, `cn`, profile-completeness scoring, and Stripe plan config.
- **Component tests** (`tests/component/`) — React components rendered with
  Testing Library (`StarRating`, `OnboardingChecklist`).
- **E2E tests** (`e2e/`) — real browser flows via Playwright against the deployed
  site: homepage, vendor directory, markets, auth pages, and all legal pages.

Unit and component tests import the app's **real source** through the `@/` alias
(configured in `vitest.config.ts` to point at the parent directory), so they test
the actual shipping code — not copies.

## Setup

```bash
cd qa-suite
npm install
npx playwright install   # one-time: download browser binaries for E2E
```

## Running

```bash
npm test                 # unit + component (Vitest, jsdom)
npm run test:watch       # Vitest watch mode
npm run test:coverage    # coverage report → coverage/index.html
npm run test:e2e         # Playwright against https://strvend.com
npm run test:all         # everything
```

### Testing a local dev server

```bash
# In the app: npm run dev  (http://localhost:3000)
BASE_URL=http://localhost:3000 npm run test:e2e
```

## Structure

```
qa-suite/
├── package.json
├── vitest.config.ts        # @/ alias → ../  (the app root)
├── playwright.config.ts    # BASE_URL, chromium + mobile projects
├── tsconfig.json
├── setup/
│   └── vitest.setup.ts     # jest-dom, next/link + next/image mocks, dummy env
├── tests/
│   ├── unit/               # *.test.ts
│   └── component/          # *.test.tsx
└── e2e/                    # *.e2e.ts (Playwright only)
```
