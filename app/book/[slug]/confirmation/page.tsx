import { createClient } from '@/lib/supabase/server'
import Stripe from 'stripe'
import Link from 'next/link'
import { CheckCircle, Clock } from 'lucide-react'

interface Props {
  params: { slug: string }
  searchParams: { booking_id?: string; session_id?: string }
}

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

export default async function BookingConfirmationPage({ params, searchParams }: Props) {
  const { booking_id, session_id } = searchParams

  // 1. Verify payment status directly with Stripe (source of truth)
  //    Avoids race condition where webhook hasn't updated DB yet.
  let stripePaymentConfirmed = false
  if (session_id) {
    try {
      const session = await stripe.checkout.sessions.retrieve(session_id)
      stripePaymentConfirmed = session.payment_status === 'paid'
    } catch {
      // Invalid session_id — fall through to DB-only path
    }
  }

  // 2. Fetch booking details from DB (may still be 'pending' if webhook is delayed)
  const supabase = createClient()
  let booking: {
    guest_name: string
    guest_email: string
    check_in: string
    check_out: string
    nights: number | null
    guests: number
    total_cents: number | null
    status: string
  } | null = null

  if (booking_id) {
    const { data } = await supabase
      .from('booking_requests')
      .select('guest_name, guest_email, check_in, check_out, nights, guests, total_cents, status')
      .eq('id', booking_id)
      .single()
    booking = data
  }

  // Consider payment confirmed if Stripe says so, OR if DB already shows 'paid'
  const isConfirmed = stripePaymentConfirmed || booking?.status === 'paid'

  const fmt = (cents: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)

  // Processing state — payment is in Stripe but webhook hasn't fired yet
  // (shouldn't happen often, but can occur on slow webhook delivery)
  if (!isConfirmed && !booking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="max-w-md w-full bg-white rounded-2xl shadow-sm border border-gray-100 p-8 text-center">
          <div className="flex justify-center mb-4">
            <Clock className="w-16 h-16 text-amber-400 animate-pulse" />
          </div>
          <h1 className="text-2xl font-bold text-gray-900 mb-2">Processing your booking…</h1>
          <p className="text-gray-500 mb-6">
            Payment received. We're confirming your booking — this only takes a moment.
          </p>
          {/* Auto-refresh after 4 seconds */}
          <meta httpEquiv="refresh" content="4" />
          <p className="text-xs text-gray-400">This page will refresh automatically.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="max-w-md w-full bg-white rounded-2xl shadow-sm border border-gray-100 p-8 text-center">
        <div className="flex justify-center mb-4">
          <CheckCircle className="w-16 h-16 text-teal-500" />
        </div>
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Booking Confirmed!</h1>
        <p className="text-gray-500 mb-6">
          {booking
            ? `Thank you, ${booking.guest_name}! A confirmation has been sent to ${booking.guest_email}.`
            : 'Your booking has been confirmed and payment received.'}
        </p>

        {booking && (
          <div className="bg-gray-50 rounded-xl p-4 text-left space-y-2 text-sm mb-6">
            <div className="flex justify-between">
              <span className="text-gray-500">Check-in</span>
              <span className="font-medium">{booking.check_in}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Check-out</span>
              <span className="font-medium">{booking.check_out}</span>
            </div>
            {booking.nights && (
              <div className="flex justify-between">
                <span className="text-gray-500">Duration</span>
                <span className="font-medium">
                  {booking.nights} night{booking.nights !== 1 ? 's' : ''}
                </span>
              </div>
            )}
            <div className="flex justify-between">
              <span className="text-gray-500">Guests</span>
              <span className="font-medium">{booking.guests}</span>
            </div>
            {booking.total_cents && (
              <div className="flex justify-between border-t pt-2 mt-2 font-semibold">
                <span>Total paid</span>
                <span>{fmt(booking.total_cents)}</span>
              </div>
            )}
          </div>
        )}

        <p className="text-sm text-gray-500 mb-6">
          The host will be in touch with check-in instructions.
        </p>

        <Link
          href={`/book/${params.slug}`}
          className="text-teal-600 hover:underline text-sm"
        >
          ← Back to listing
        </Link>
      </div>
    </div>
  )
}
