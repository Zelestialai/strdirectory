import { NextRequest, NextResponse } from 'next/server'
import Stripe from 'stripe'
import { createClient } from '@supabase/supabase-js'
import { Resend } from 'resend'

export const runtime = 'nodejs'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)
const resend = new Resend(process.env.RESEND_API_KEY)

// Service-role Supabase client for webhook (bypasses RLS)
function adminClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  )
}

function fmt(cents: number) {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)
}

const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'

// Map Stripe plan metadata value → subscription_tier DB value
function planToTier(plan: string): 'free' | 'pro' | 'featured' {
  if (plan === 'pro') return 'pro'
  if (plan === 'featured') return 'featured'
  return 'free'
}

export async function POST(request: NextRequest) {
  const sig = request.headers.get('stripe-signature')
  const body = await request.text()

  if (!sig || !process.env.STRIPE_WEBHOOK_SECRET) {
    return NextResponse.json({ error: 'Missing signature or webhook secret' }, { status: 400 })
  }

  let event: Stripe.Event
  try {
    event = stripe.webhooks.constructEvent(body, sig, process.env.STRIPE_WEBHOOK_SECRET)
  } catch (err) {
    console.error('Stripe webhook signature verification failed:', err)
    return NextResponse.json({ error: 'Invalid signature' }, { status: 400 })
  }

  // ── BOOKING PAYMENT ────────────────────────────────────────────────────────
  if (event.type === 'checkout.session.completed') {
    const session = event.data.object as Stripe.Checkout.Session

    // Subscription checkout — handled by subscription events below
    if (session.mode === 'subscription') {
      const { vendor_id, plan } = session.metadata || {}
      if (vendor_id && plan && session.subscription) {
        const supabase = adminClient()
        await supabase
          .from('vendors')
          .update({
            subscription_tier: planToTier(plan),
            stripe_subscription_id: session.subscription as string,
          })
          .eq('id', vendor_id)
      }
      return NextResponse.json({ received: true })
    }

    // Direct booking checkout
    const { booking_request_id, host_id } = session.metadata || {}
    if (!booking_request_id || !host_id) {
      return NextResponse.json({ received: true })
    }

    const supabase = adminClient()

    const { data: booking, error: bookingError } = await supabase
      .from('booking_requests')
      .update({
        status: 'paid',
        stripe_payment_intent_id: session.payment_intent as string,
        updated_at: new Date().toISOString(),
      })
      .eq('id', booking_request_id)
      .select(`
        id, guest_name, guest_email, check_in, check_out, nights, guests, message, total_cents,
        booking_sites ( slug, booking_listings ( title ) )
      `)
      .single()

    if (bookingError || !booking) {
      console.error('Failed to update booking:', bookingError)
      return NextResponse.json({ received: true })
    }

    const { data: hostProfile } = await supabase
      .from('profiles')
      .select('email, full_name')
      .eq('id', host_id)
      .single()

    const sites = booking.booking_sites as unknown as {
      slug: string
      booking_listings: Array<{ title: string }>
    }
    const listingTitle = sites?.booking_listings?.[0]?.title || 'Your property'
    const totalFormatted = fmt(session.amount_total || 0)

    // Email host
    if (hostProfile?.email) {
      await resend.emails.send({
        from: 'STRVend Bookings <bookings@strvend.com>',
        to: hostProfile.email,
        subject: `New booking confirmed — ${listingTitle}`,
        html: bookingEmailForHost({ booking, listingTitle, totalFormatted }),
      }).catch(console.error)
    }

    // Email guest
    await resend.emails.send({
      from: 'STRVend Bookings <bookings@strvend.com>',
      to: booking.guest_email,
      subject: `Booking confirmed — ${listingTitle}`,
      html: bookingEmailForGuest({ booking, listingTitle, totalFormatted }),
    }).catch(console.error)
  }

  // ── SUBSCRIPTION UPDATED (plan change, renewal, etc.) ─────────────────────
  if (event.type === 'customer.subscription.updated') {
    const subscription = event.data.object as Stripe.Subscription
    const vendorId = subscription.metadata?.vendor_id
    const plan = subscription.metadata?.plan

    if (!vendorId || !plan) return NextResponse.json({ received: true })

    const supabase = adminClient()

    // Only update if subscription is active
    const isActive = ['active', 'trialing'].includes(subscription.status)
    await supabase
      .from('vendors')
      .update({
        subscription_tier: isActive ? planToTier(plan) : 'free',
        stripe_subscription_id: subscription.id,
      })
      .eq('id', vendorId)
  }

  // ── SUBSCRIPTION CANCELLED ─────────────────────────────────────────────────
  if (event.type === 'customer.subscription.deleted') {
    const subscription = event.data.object as Stripe.Subscription
    const vendorId = subscription.metadata?.vendor_id

    if (!vendorId) return NextResponse.json({ received: true })

    const supabase = adminClient()
    await supabase
      .from('vendors')
      .update({ subscription_tier: 'free', stripe_subscription_id: null })
      .eq('id', vendorId)

    // Get vendor email to notify them
    const { data: vendor } = await supabase
      .from('vendors')
      .select('business_name, profiles!vendors_user_id_fkey(email)')
      .eq('id', vendorId)
      .single()

    const email = (vendor?.profiles as unknown as { email: string } | null)?.email
    if (email) {
      await resend.emails.send({
        from: 'STRVend <noreply@strvend.com>',
        to: email,
        subject: 'Your STRVend subscription has been cancelled',
        html: subscriptionCancelledEmail(vendor?.business_name || 'there'),
      }).catch(console.error)
    }
  }

  // ── PAYMENT FAILED ─────────────────────────────────────────────────────────
  if (event.type === 'invoice.payment_failed') {
    const invoice = event.data.object as Stripe.Invoice
    const customerId = invoice.customer as string

    if (!customerId) return NextResponse.json({ received: true })

    const supabase = adminClient()
    const { data: vendor } = await supabase
      .from('vendors')
      .select('business_name, profiles!vendors_user_id_fkey(email)')
      .eq('stripe_customer_id', customerId)
      .single()

    const email = (vendor?.profiles as unknown as { email: string } | null)?.email
    if (email) {
      await resend.emails.send({
        from: 'STRVend <noreply@strvend.com>',
        to: email,
        subject: 'Action required: your STRVend payment failed',
        html: paymentFailedEmail(vendor?.business_name || 'there'),
      }).catch(console.error)
    }
  }

  return NextResponse.json({ received: true })
}

// ── EMAIL TEMPLATES ───────────────────────────────────────────────────────────

function emailWrapper(content: string) {
  return `
    <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: #f9fafb; padding: 40px 16px;">
      <div style="max-width: 560px; margin: 0 auto; background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.08);">
        <div style="background: #0d9488; padding: 24px 32px;">
          <span style="font-size: 20px; font-weight: 700; color: white; letter-spacing: -0.5px;">
            <span style="color: #99f6e4;">STR</span>Vend
          </span>
        </div>
        <div style="padding: 32px;">
          ${content}
        </div>
        <div style="padding: 20px 32px; background: #f9fafb; border-top: 1px solid #f3f4f6; font-size: 12px; color: #9ca3af;">
          © ${new Date().getFullYear()} STRVend · <a href="${baseUrl}/privacy" style="color: #9ca3af;">Privacy Policy</a> · <a href="${baseUrl}/terms" style="color: #9ca3af;">Terms</a>
        </div>
      </div>
    </div>
  `
}

function detailRow(label: string, value: string) {
  return `
    <tr>
      <td style="padding: 10px 0; border-bottom: 1px solid #f3f4f6; color: #6b7280; font-size: 14px; width: 40%;">${label}</td>
      <td style="padding: 10px 0; border-bottom: 1px solid #f3f4f6; font-size: 14px; font-weight: 500; color: #111827;">${value}</td>
    </tr>
  `
}

function bookingEmailForHost({ booking, listingTitle, totalFormatted }: {
  booking: { guest_name: string; guest_email: string; check_in: string; check_out: string; nights: number | null; guests: number; message?: string | null }
  listingTitle: string
  totalFormatted: string
}) {
  return emailWrapper(`
    <h2 style="margin: 0 0 8px; font-size: 22px; color: #111827;">New booking confirmed 🎉</h2>
    <p style="color: #6b7280; margin: 0 0 24px; font-size: 15px;">
      You have a new direct booking for <strong style="color: #111827;">${listingTitle}</strong>.
    </p>
    <table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
      ${detailRow('Guest', `${booking.guest_name} &lt;${booking.guest_email}&gt;`)}
      ${detailRow('Check-in', booking.check_in)}
      ${detailRow('Check-out', booking.check_out)}
      ${detailRow('Duration', `${booking.nights ?? '—'} night${booking.nights !== 1 ? 's' : ''}`)}
      ${detailRow('Guests', String(booking.guests))}
      <tr>
        <td style="padding: 12px 0 0; color: #6b7280; font-size: 14px;">Total received</td>
        <td style="padding: 12px 0 0; font-size: 18px; font-weight: 700; color: #0d9488;">${totalFormatted}</td>
      </tr>
    </table>
    ${booking.message ? `<p style="background: #f0fdfa; border-left: 3px solid #0d9488; padding: 12px 16px; margin: 0 0 24px; font-size: 14px; color: #374151; border-radius: 0 6px 6px 0;"><strong>Guest note:</strong> "${booking.message}"</p>` : ''}
    <a href="${baseUrl}/host/dashboard/payouts"
       style="display: inline-block; background: #0d9488; color: white; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
      View in Dashboard →
    </a>
  `)
}

function bookingEmailForGuest({ booking, listingTitle, totalFormatted }: {
  booking: { guest_name: string; check_in: string; check_out: string; nights: number | null; guests: number }
  listingTitle: string
  totalFormatted: string
}) {
  return emailWrapper(`
    <h2 style="margin: 0 0 8px; font-size: 22px; color: #111827;">You're booked! 🏠</h2>
    <p style="color: #6b7280; margin: 0 0 24px; font-size: 15px;">
      Hi ${booking.guest_name}, your booking for <strong style="color: #111827;">${listingTitle}</strong> is confirmed and payment received.
    </p>
    <table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
      ${detailRow('Check-in', booking.check_in)}
      ${detailRow('Check-out', booking.check_out)}
      ${detailRow('Duration', `${booking.nights ?? '—'} night${booking.nights !== 1 ? 's' : ''}`)}
      ${detailRow('Guests', String(booking.guests))}
      <tr>
        <td style="padding: 12px 0 0; color: #6b7280; font-size: 14px;">Total paid</td>
        <td style="padding: 12px 0 0; font-size: 18px; font-weight: 700; color: #111827;">${totalFormatted}</td>
      </tr>
    </table>
    <div style="background: #f0fdfa; border-radius: 8px; padding: 16px; margin-bottom: 24px;">
      <p style="margin: 0; font-size: 14px; color: #0f766e;">
        📋 The host will be in touch with check-in instructions. Keep this email as your booking reference.
      </p>
    </div>
  `)
}

function subscriptionCancelledEmail(businessName: string) {
  return emailWrapper(`
    <h2 style="margin: 0 0 8px; font-size: 22px; color: #111827;">Your subscription has been cancelled</h2>
    <p style="color: #6b7280; margin: 0 0 16px; font-size: 15px;">
      Hi ${businessName}, your STRVend subscription has been cancelled and your listing has been moved to the Free plan.
    </p>
    <p style="color: #6b7280; font-size: 14px; margin: 0 0 24px;">
      Your listing will remain visible but without Pro/Elite features. You can resubscribe at any time from your dashboard.
    </p>
    <a href="${baseUrl}/dashboard/upgrade"
       style="display: inline-block; background: #0d9488; color: white; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
      Resubscribe →
    </a>
  `)
}

function paymentFailedEmail(businessName: string) {
  return emailWrapper(`
    <h2 style="margin: 0 0 8px; font-size: 22px; color: #dc2626;">Payment failed</h2>
    <p style="color: #6b7280; margin: 0 0 16px; font-size: 15px;">
      Hi ${businessName}, we were unable to process your STRVend subscription payment.
    </p>
    <p style="color: #6b7280; font-size: 14px; margin: 0 0 24px;">
      Please update your payment method to keep your listing active. If payment isn't resolved within a few days, your listing may be downgraded to the Free plan.
    </p>
    <a href="${baseUrl}/dashboard/upgrade"
       style="display: inline-block; background: #dc2626; color: white; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
      Update payment method →
    </a>
  `)
}
