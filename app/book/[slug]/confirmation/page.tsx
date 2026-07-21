import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import { CheckCircle } from 'lucide-react'

interface Props {
  params: { slug: string }
  searchParams: { booking_id?: string; session_id?: string }
}

export default async function BookingConfirmationPage({ params, searchParams }: Props) {
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

  if (searchParams.booking_id) {
    const { data } = await supabase
      .from('booking_requests')
      .select('guest_name, guest_email, check_in, check_out, nights, guests, total_cents, status')
      .eq('id', searchParams.booking_id)
      .single()
    booking = data
  }

  const fmt = (cents: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)

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
