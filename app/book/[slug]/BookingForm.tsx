'use client'

import { useState, useMemo } from 'react'
import { useRouter } from 'next/navigation'

interface BlockedRange {
  start: string
  end: string
}

interface Props {
  siteId: string
  slug: string
  nightlyRateCents: number
  cleaningFeeCents: number
  minNights: number
  maxGuests: number
  blockedRanges: BlockedRange[]
}

function formatCents(cents: number) {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)
}

function toDateObj(str: string) {
  const [y, m, d] = str.split('-').map(Number)
  return new Date(y, m - 1, d)
}

export default function BookingForm({
  siteId,
  slug,
  nightlyRateCents,
  cleaningFeeCents,
  minNights,
  maxGuests,
  blockedRanges,
}: Props) {
  const router = useRouter()
  const [checkIn, setCheckIn] = useState('')
  const [checkOut, setCheckOut] = useState('')
  const [guests, setGuests] = useState(1)
  const [guestName, setGuestName] = useState('')
  const [guestEmail, setGuestEmail] = useState('')
  const [message, setMessage] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const today = new Date().toISOString().split('T')[0]

  const nights = useMemo(() => {
    if (!checkIn || !checkOut) return 0
    const diff =
      (toDateObj(checkOut).getTime() - toDateObj(checkIn).getTime()) / (1000 * 60 * 60 * 24)
    return Math.max(0, Math.round(diff))
  }, [checkIn, checkOut])

  const subtotal = nights * nightlyRateCents
  const total = subtotal + (nights > 0 ? cleaningFeeCents : 0)

  function isDateBlocked(dateStr: string): boolean {
    if (!dateStr) return false
    const d = toDateObj(dateStr)
    return blockedRanges.some(({ start, end }) => {
      return d >= toDateObj(start) && d < toDateObj(end)
    })
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError('')

    if (nights < 1) {
      setError('Check-out must be after check-in')
      return
    }
    if (nights < minNights) {
      setError(`Minimum stay is ${minNights} night${minNights !== 1 ? 's' : ''}`)
      return
    }
    if (isDateBlocked(checkIn) || isDateBlocked(checkOut)) {
      setError('Your selected dates overlap with an existing booking. Please choose different dates.')
      return
    }

    setLoading(true)
    try {
      const res = await fetch(`/api/booking-sites/${siteId}/checkout`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          guest_name: guestName,
          guest_email: guestEmail,
          check_in: checkIn,
          check_out: checkOut,
          guests,
          message: message || undefined,
        }),
      })
      const data = await res.json()
      if (data.url) {
        window.location.href = data.url
      } else {
        setError(data.error || 'Something went wrong. Please try again.')
        setLoading(false)
      }
    } catch {
      setError('Network error — please check your connection and try again.')
      setLoading(false)
    }
  }

  return (
    <div className="border border-gray-200 rounded-2xl p-6 shadow-lg bg-white">
      <div className="mb-4">
        <span className="text-2xl font-bold">{formatCents(nightlyRateCents)}</span>
        <span className="text-gray-500 text-sm ml-1">/ night</span>
      </div>

      <form onSubmit={handleSubmit} className="space-y-4">
        {/* Dates + guests */}
        <div className="border border-gray-300 rounded-xl overflow-hidden text-sm">
          <div className="grid grid-cols-2 divide-x divide-gray-300">
            <div className="p-3">
              <label className="block text-xs font-bold uppercase tracking-wide text-gray-500 mb-1">
                Check-in
              </label>
              <input
                type="date"
                value={checkIn}
                min={today}
                onChange={(e) => {
                  setCheckIn(e.target.value)
                  if (checkOut && e.target.value >= checkOut) setCheckOut('')
                }}
                required
                className="w-full outline-none cursor-pointer"
              />
            </div>
            <div className="p-3">
              <label className="block text-xs font-bold uppercase tracking-wide text-gray-500 mb-1">
                Check-out
              </label>
              <input
                type="date"
                value={checkOut}
                min={checkIn || today}
                onChange={(e) => setCheckOut(e.target.value)}
                required
                className="w-full outline-none cursor-pointer"
              />
            </div>
          </div>
          <div className="border-t border-gray-300 p-3">
            <label className="block text-xs font-bold uppercase tracking-wide text-gray-500 mb-1">
              Guests
            </label>
            <select
              value={guests}
              onChange={(e) => setGuests(Number(e.target.value))}
              className="w-full outline-none bg-transparent"
            >
              {Array.from({ length: maxGuests }, (_, i) => i + 1).map((n) => (
                <option key={n} value={n}>
                  {n} guest{n !== 1 ? 's' : ''}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Guest info */}
        <div className="space-y-3">
          <input
            type="text"
            placeholder="Your full name"
            value={guestName}
            onChange={(e) => setGuestName(e.target.value)}
            required
            className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition"
          />
          <input
            type="email"
            placeholder="Your email address"
            value={guestEmail}
            onChange={(e) => setGuestEmail(e.target.value)}
            required
            className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition"
          />
          <textarea
            placeholder="Questions or special requests? (optional)"
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            rows={3}
            className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition resize-none"
          />
        </div>

        {/* Error */}
        {error && (
          <div className="bg-red-50 border border-red-200 rounded-xl px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        )}

        {/* Price breakdown */}
        {nights > 0 && (
          <div className="space-y-2 text-sm border-t pt-4">
            <div className="flex justify-between text-gray-600">
              <span>
                {formatCents(nightlyRateCents)} × {nights} night{nights !== 1 ? 's' : ''}
              </span>
              <span>{formatCents(subtotal)}</span>
            </div>
            {cleaningFeeCents > 0 && (
              <div className="flex justify-between text-gray-600">
                <span>Cleaning fee</span>
                <span>{formatCents(cleaningFeeCents)}</span>
              </div>
            )}
            <div className="flex justify-between font-bold pt-2 border-t text-gray-900">
              <span>Total</span>
              <span>{formatCents(total)}</span>
            </div>
          </div>
        )}

        {/* CTA */}
        <button
          type="submit"
          disabled={loading}
          className="w-full bg-teal-600 hover:bg-teal-700 disabled:opacity-60 text-white py-3 rounded-xl font-semibold transition-colors"
        >
          {loading
            ? 'Redirecting to checkout…'
            : nights > 0
            ? `Book for ${formatCents(total)}`
            : 'Reserve'}
        </button>

        <p className="text-xs text-center text-gray-400">
          No booking fees · Secure payment via Stripe
        </p>
      </form>
    </div>
  )
}
