import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

// GET /api/stripe/connect
// Creates (or resumes) a Stripe Express account and redirects to Stripe onboarding.
export async function GET(request: NextRequest) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    return NextResponse.redirect(new URL('/login', request.url))
  }

  const { data: profile } = await supabase
    .from('profiles')
    .select('stripe_account_id, stripe_onboarding_complete, email, full_name')
    .eq('id', user.id)
    .single()

  let accountId = profile?.stripe_account_id

  if (!accountId) {
    // Create a new Stripe Express account for this host
    const account = await stripe.accounts.create({
      type: 'express',
      email: profile?.email || undefined,
      metadata: { supabase_user_id: user.id },
      capabilities: {
        card_payments: { requested: true },
        transfers: { requested: true },
      },
    })
    accountId = account.id

    // Save immediately so refresh flows can reuse it
    await supabase
      .from('profiles')
      .update({ stripe_account_id: accountId })
      .eq('id', user.id)
  }

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'

  const accountLink = await stripe.accountLinks.create({
    account: accountId,
    refresh_url: `${baseUrl}/api/stripe/connect/refresh`,
    return_url: `${baseUrl}/api/stripe/connect/return`,
    type: 'account_onboarding',
  })

  return NextResponse.redirect(accountLink.url)
}
