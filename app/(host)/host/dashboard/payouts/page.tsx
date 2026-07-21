import { createClient } from '@/lib/supabase/server'
import { CheckCircle, AlertCircle, ExternalLink, CreditCard } from 'lucide-react'
import ConnectStripeButton from './ConnectStripeButton'

export default async function PayoutsPage() {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { data: profile } = await supabase
    .from('profiles')
    .select('stripe_account_id, stripe_onboarding_complete')
    .eq('id', user!.id)
    .single()

  const isConnected = !!(
    profile?.stripe_account_id && profile?.stripe_onboarding_complete
  )
  const isPending = !!(
    profile?.stripe_account_id && !profile?.stripe_onboarding_complete
  )

  // Fetch paid bookings for this host's sites
  const { data: bookings } = await supabase
    .from('booking_requests')
    .select(`
      id, guest_name, check_in, check_out, nights, total_cents, status, created_at,
      booking_sites ( slug, booking_listings ( title ) )
    `)
    .eq('status', 'paid')
    .in(
      'site_id',
      (
        await supabase
          .from('booking_sites')
          .select('id')
          .eq('host_id', user!.id)
      ).data?.map((s) => s.id) ?? []
    )
    .order('created_at', { ascending: false })
    .limit(20)

  const fmt = (cents: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)

  const totalEarned = (bookings || []).reduce((sum, b) => sum + (b.total_cents || 0), 0)
  const platformFeePercent = Number(process.env.NEXT_PUBLIC_PLATFORM_FEE_PERCENT || '0')

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Payouts</h1>
      <p className="text-gray-500 text-sm mb-8">
        Connect your Stripe account to receive direct booking payments automatically
      </p>

      {/* Connect status card */}
      <div
        className={`rounded-2xl border p-6 mb-8 ${
          isConnected
            ? 'border-green-200 bg-green-50'
            : isPending
            ? 'border-amber-200 bg-amber-50'
            : 'border-gray-200 bg-white'
        }`}
      >
        <div className="flex items-start gap-4">
          <div className="flex-shrink-0 mt-0.5">
            {isConnected ? (
              <CheckCircle className="w-6 h-6 text-green-600" />
            ) : isPending ? (
              <AlertCircle className="w-6 h-6 text-amber-500" />
            ) : (
              <CreditCard className="w-6 h-6 text-gray-400" />
            )}
          </div>
          <div className="flex-1">
            {isConnected ? (
              <>
                <h2 className="font-semibold text-green-800">Stripe connected</h2>
                <p className="text-sm text-green-700 mt-1">
                  Booking payments are automatically transferred to your bank account.
                  {platformFeePercent > 0
                    ? ` STRVend keeps a ${platformFeePercent}% platform fee.`
                    : ' STRVend takes no cut — you keep 100%.'}
                </p>
                <div className="mt-4 flex gap-3">
                  <ConnectStripeButton mode="dashboard" />
                  <a
                    href="/api/stripe/connect"
                    className="text-sm text-green-700 underline underline-offset-2"
                  >
                    Update Stripe account
                  </a>
                </div>
              </>
            ) : isPending ? (
              <>
                <h2 className="font-semibold text-amber-800">Stripe onboarding incomplete</h2>
                <p className="text-sm text-amber-700 mt-1">
                  You started connecting your Stripe account but didn't finish. Complete setup to
                  start receiving payments.
                </p>
                <div className="mt-4">
                  <a
                    href="/api/stripe/connect"
                    className="inline-flex items-center gap-2 bg-amber-600 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-amber-700 transition-colors"
                  >
                    Complete setup
                    <ExternalLink className="w-3.5 h-3.5" />
                  </a>
                </div>
              </>
            ) : (
              <>
                <h2 className="font-semibold text-gray-900">Connect your Stripe account</h2>
                <p className="text-sm text-gray-600 mt-1">
                  Set up Stripe to receive booking payments directly into your bank account.
                  Takes about 5 minutes — you'll need your SSN (last 4) and bank details.
                </p>
                <div className="mt-4">
                  <a
                    href="/api/stripe/connect"
                    className="inline-flex items-center gap-2 bg-teal-600 text-white px-5 py-2.5 rounded-xl text-sm font-semibold hover:bg-teal-700 transition-colors"
                  >
                    <CreditCard className="w-4 h-4" />
                    Connect Stripe
                    <ExternalLink className="w-3.5 h-3.5" />
                  </a>
                </div>
                <p className="text-xs text-gray-400 mt-3">
                  Until connected, bookings are still accepted but payments are held by STRVend.
                </p>
              </>
            )}
          </div>
        </div>
      </div>

      {/* Earnings summary */}
      {(bookings?.length ?? 0) > 0 && (
        <div className="grid grid-cols-2 gap-4 mb-8">
          <div className="bg-white border border-gray-200 rounded-2xl p-5">
            <p className="text-sm text-gray-500">Total earned</p>
            <p className="text-2xl font-bold text-gray-900 mt-1">{fmt(totalEarned)}</p>
            <p className="text-xs text-gray-400 mt-1">from {bookings?.length} booking{bookings?.length !== 1 ? 's' : ''}</p>
          </div>
          <div className="bg-white border border-gray-200 rounded-2xl p-5">
            <p className="text-sm text-gray-500">Platform fee</p>
            <p className="text-2xl font-bold text-gray-900 mt-1">
              {platformFeePercent > 0 ? `${platformFeePercent}%` : '0%'}
            </p>
            <p className="text-xs text-teal-600 mt-1">You keep {100 - platformFeePercent}%</p>
          </div>
        </div>
      )}

      {/* Bookings table */}
      <div>
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Booking history</h2>
        {(bookings?.length ?? 0) === 0 ? (
          <div className="text-center py-12 border-2 border-dashed border-gray-200 rounded-2xl text-gray-400 text-sm">
            No paid bookings yet. Share your direct booking link to get started.
          </div>
        ) : (
          <div className="border border-gray-200 rounded-2xl overflow-hidden">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">
                    Guest
                  </th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">
                    Property
                  </th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">
                    Dates
                  </th>
                  <th className="text-right px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">
                    Amount
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {bookings!.map((b) => {
                  const sites = b.booking_sites as unknown as {
                    slug: string
                    booking_listings: Array<{ title: string }>
                  }
                  const title = sites?.booking_listings?.[0]?.title || sites?.slug || '—'
                  return (
                    <tr key={b.id} className="hover:bg-gray-50">
                      <td className="px-4 py-3 font-medium text-gray-900">{b.guest_name}</td>
                      <td className="px-4 py-3 text-gray-600 truncate max-w-[140px]">{title}</td>
                      <td className="px-4 py-3 text-gray-600 whitespace-nowrap">
                        {b.check_in} → {b.check_out}
                      </td>
                      <td className="px-4 py-3 text-right font-semibold text-gray-900">
                        {b.total_cents ? fmt(b.total_cents) : '—'}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}
