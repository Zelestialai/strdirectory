import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

// GET /api/stripe/connect/return
// Stripe redirects here after the host completes (or skips) onboarding.
// We verify the account status and update the DB.
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
    .select('stripe_account_id')
    .eq('id', user.id)
    .single()

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'

  if (profile?.stripe_account_id) {
    try {
      const account = await stripe.accounts.retrieve(profile.stripe_account_id)
      const isComplete = !!(account.charges_enabled && account.details_submitted)

      await supabase
        .from('profiles')
        .update({ stripe_onboarding_complete: isComplete })
        .eq('id', user.id)
    } catch (err) {
      console.error('Stripe account retrieve failed:', err)
    }
  }

  return NextResponse.redirect(new URL('/host/dashboard/payouts', baseUrl))
}
