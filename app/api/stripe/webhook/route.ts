import { NextRequest, NextResponse } from 'next/server'
import Stripe from 'stripe'
import { createClient } from '@supabase/supabase-js'
import { Resend } from 'resend'

export const runtime = 'nodejs'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)
const resend = new Resend(process.env.RESEND_API_KEY)

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

  if (event.type === 'checkout.session.completed') {
    const session = event.data.object as Stripe.Checkout.Session

    const { booking_request_id, host_id } = session.metadata || {}
    if (!booking_request_id || !host_id) {
      return NextResponse.json({ received: true })
    }

    // Use service role key to bypass RLS for the webhook
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.SUPABASE_SERVICE_ROLE_KEY!
    )

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
        booking_sites (
          slug,
          booking_listings ( title )
        )
      `)
      .single()

    if (bookingError || !booking) {
      console.error('Failed to update booking:', bookingError)
      return NextResponse.json({ received: true })
    }

    // Get host profile for email
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
    const totalFormatted = `$${((session.amount_total || 0) / 100).toFixed(2)}`
    const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'

    // Email host
    if (hostProfile?.email) {
      await resend.emails.send({
        from: 'STRVend Bookings <bookings@strvend.com>',
        to: hostProfile.email,
        subject: `New booking confirmed — ${listingTitle}`,
        html: `
          <div style="font-family: sans-serif; max-width: 600px; margin: 0 auto;">
            <h2 style="color: #0d9488;">New Booking Confirmed 🎉</h2>
            <p>You have a new direct booking for <strong>${listingTitle}</strong>.</p>
            <table style="width: 100%; border-collapse: collapse; margin: 16px 0;">
              <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Guest</td>
                  <td style="padding: 8px; border-bottom: 1px solid #e5e7eb; font-weight: 600;">${booking.guest_name} (${booking.guest_email})</td></tr>
              <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Check-in</td>
                  <td style="padding: 8px; border-bottom: 1px solid #e5e7eb;">${booking.check_in}</td></tr>
              <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Check-out</td>
                  <td style="padding: 8px; border-bottom: 1px solid #e5e7eb;">${booking.check_out}</td></tr>
              <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Nights</td>
                  <td style="padding: 8px; border-bottom: 1px solid #e5e7eb;">${booking.nights}</td></tr>
              <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Guests</td>
                  <td style="padding: 8px; border-bottom: 1px solid #e5e7eb;">${booking.guests}</td></tr>
              <tr><td style="padding: 8px; color: #6b7280;">Total received</td>
                  <td style="padding: 8px; font-weight: 700; color: #0d9488;">${totalFormatted}</td></tr>
            </table>
            ${booking.message ? `<p><strong>Guest message:</strong> "${booking.message}"</p>` : ''}
            <a href="${baseUrl}/host/dashboard/booking-sites"
               style="display: inline-block; background: #0d9488; color: white; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600;">
              View in Dashboard
            </a>
          </div>
        `,
      }).catch(console.error)
    }

    // Email guest
    await resend.emails.send({
      from: 'STRVend Bookings <bookings@strvend.com>',
      to: booking.guest_email,
      subject: `Booking confirmed — ${listingTitle}`,
      html: `
        <div style="font-family: sans-serif; max-width: 600px; margin: 0 auto;">
          <h2 style="color: #0d9488;">You're booked! 🏠</h2>
          <p>Your booking for <strong>${listingTitle}</strong> has been confirmed and payment received.</p>
          <table style="width: 100%; border-collapse: collapse; margin: 16px 0;">
            <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Check-in</td>
                <td style="padding: 8px; border-bottom: 1px solid #e5e7eb; font-weight: 600;">${booking.check_in}</td></tr>
            <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Check-out</td>
                <td style="padding: 8px; border-bottom: 1px solid #e5e7eb; font-weight: 600;">${booking.check_out}</td></tr>
            <tr><td style="padding: 8px; border-bottom: 1px solid #e5e7eb; color: #6b7280;">Duration</td>
                <td style="padding: 8px; border-bottom: 1px solid #e5e7eb;">${booking.nights} night${booking.nights !== 1 ? 's' : ''}</td></tr>
            <tr><td style="padding: 8px; color: #6b7280;">Total paid</td>
                <td style="padding: 8px; font-weight: 700;">${totalFormatted}</td></tr>
          </table>
          <p style="color: #6b7280; font-size: 14px;">The host will be in touch shortly with check-in details. Have a great stay!</p>
        </div>
      `,
    }).catch(console.error)
  }

  return NextResponse.json({ received: true })
}
