import { NextRequest, NextResponse } from 'next/server'

// GET /api/stripe/connect/refresh
// Stripe redirects here if the onboarding link expires.
// We just restart the onboarding flow.
export async function GET(request: NextRequest) {
  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'
  return NextResponse.redirect(new URL('/api/stripe/connect', baseUrl))
}
