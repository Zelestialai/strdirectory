import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

// GET /api/stripe/connect/dashboard
// Returns a one-time Stripe Express dashboard login link.
export async function GET(request: NextRequest) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { data: profile } = await supabase
    .from('profiles')
    .select('stripe_account_id, stripe_onboarding_complete')
    .eq('id', user.id)
    .single()

  if (!profile?.stripe_account_id) {
    return NextResponse.json({ error: 'No Stripe account connected' }, { status: 400 })
  }
  if (!profile.stripe_onboarding_complete) {
    return NextResponse.json({ error: 'Stripe onboarding not complete' }, { status: 400 })
  }

  const loginLink = await stripe.accounts.createLoginLink(profile.stripe_account_id)
  return NextResponse.json({ url: loginLink.url })
}
