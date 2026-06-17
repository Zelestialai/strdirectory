# STR Pro Directory

A short-term rental service provider directory — like Angi/Thumbtack for the STR industry. Built with **Next.js 14**, **Supabase**, and deployed on **Vercel**.

## Features

- Vendor registration by category (Cleaning, Photography, Maintenance, Property Management)
- Supabase Auth (email/password, magic link ready)
- Location-based vendor search with filters
- Review system (star ratings + written reviews)
- Vendor inquiry/contact forms
- Vendor dashboard (manage listing, view inquiries & reviews)
- RLS-secured database with auto-rating computation

---

## Project Structure

```
str-directory/
├── app/
│   ├── (auth)/             # Login, Register, Forgot Password
│   ├── (main)/             # Public pages: Home, Vendors, Vendor Profile
│   ├── (dashboard)/        # Protected vendor dashboard
│   ├── api/                # REST API routes (vendors, reviews, inquiries)
│   └── auth/callback/      # Supabase OAuth / email link handler
├── components/             # Reusable UI components
├── lib/
│   ├── supabase/           # Browser + server Supabase clients
│   └── utils.ts
├── types/                  # TypeScript types
└── supabase/
    └── migrations/
        └── 001_initial_schema.sql
```

---

## Setup

### 1. Create a Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project.
2. In the SQL Editor, run the entire contents of `supabase/migrations/001_initial_schema.sql`.
3. Note your **Project URL** and **Anon Key** from Settings → API.

### 2. Configure Environment Variables

Copy `.env.example` to `.env.local` and fill in your values:

```bash
cp .env.example .env.local
```

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key   # optional, for admin tasks
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

### 3. Install & Run Locally

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

---

## Deploy to Vercel

1. Push your repo to GitHub.
2. Import into [Vercel](https://vercel.com).
3. Add the same environment variables under **Project Settings → Environment Variables**.
4. Set `NEXT_PUBLIC_SITE_URL` to your production domain (e.g. `https://strprodirectory.com`).
5. Deploy — Vercel handles the rest.

### Supabase Auth redirect URLs

In Supabase Dashboard → Authentication → URL Configuration, add:

- **Site URL**: `https://your-vercel-domain.vercel.app`
- **Redirect URLs**: `https://your-vercel-domain.vercel.app/auth/callback`

---

## Key Pages

| Route | Description |
|---|---|
| `/` | Homepage — hero search, category grid, featured vendors |
| `/vendors` | Browse/search all vendors with filters |
| `/vendors/[slug]` | Public vendor profile with reviews & inquiry form |
| `/vendors/[slug]/review` | Write a review (authenticated) |
| `/register` | Sign up (vendor or host) |
| `/login` | Sign in |
| `/dashboard` | Vendor dashboard overview |
| `/dashboard/profile` | Create/edit vendor listing |
| `/dashboard/inquiries` | View incoming inquiries |
| `/dashboard/reviews` | View reviews received |

---

## Extending

- **Image uploads**: Wire up Supabase Storage for logo/cover photos in the profile editor.
- **Featured listings**: Add a Stripe payment flow to toggle `is_featured = true`.
- **Verified badge**: Build an admin panel to review and verify vendor profiles.
- **Email notifications**: Use Resend or Supabase Edge Functions to email vendors on new inquiries.
- **Map view**: Add a Mapbox or Google Maps component to the search page.

