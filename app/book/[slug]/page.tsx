import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import { Wifi, Car, Waves, Dumbbell, Wind, Utensils, Tv, Dog } from 'lucide-react'
import BookingForm from './BookingForm'

interface Props {
  params: { slug: string }
}

const AMENITY_ICONS: Record<string, React.ReactNode> = {
  WiFi: <Wifi className="w-4 h-4" />,
  'Free parking': <Car className="w-4 h-4" />,
  Pool: <Waves className="w-4 h-4" />,
  Gym: <Dumbbell className="w-4 h-4" />,
  'Air conditioning': <Wind className="w-4 h-4" />,
  Kitchen: <Utensils className="w-4 h-4" />,
  TV: <Tv className="w-4 h-4" />,
  'Pets allowed': <Dog className="w-4 h-4" />,
}

export default async function BookPage({ params }: Props) {
  const supabase = createClient()

  const { data: site } = await supabase
    .from('booking_sites')
    .select(`
      id, slug, host_id, property_id,
      booking_listings (
        title, tagline, description, location, photos, amenities,
        max_guests, bedrooms, bathrooms,
        nightly_rate_cents, cleaning_fee_cents, min_nights, house_rules
      )
    `)
    .eq('slug', params.slug)
    .eq('status', 'published')
    .single()

  if (!site) notFound()

  const listings = site.booking_listings as Array<{
    title: string
    tagline: string | null
    description: string
    location: string
    photos: string[]
    amenities: string[]
    max_guests: number
    bedrooms: number
    bathrooms: number
    nightly_rate_cents: number
    cleaning_fee_cents: number
    min_nights: number
    house_rules: string | null
  }>
  const listing = listings?.[0]
  if (!listing) notFound()

  // Blocked dates from calendar events linked to this property
  let blockedRanges: { start: string; end: string }[] = []
  if (site.property_id) {
    const { data: events } = await supabase
      .from('calendar_events')
      .select('start_date, end_date')
      .eq('property_id', site.property_id)
      .gte('end_date', new Date().toISOString().split('T')[0])
      .order('start_date')

    if (events) {
      blockedRanges = events.map((e) => ({ start: e.start_date, end: e.end_date }))
    }
  }

  const photos = listing.photos as string[]
  const amenities = listing.amenities as string[]

  const fmt = (cents: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)

  return (
    <div className="min-h-screen bg-white">
      {/* Photo hero */}
      <div className="relative h-[420px] bg-gray-200 overflow-hidden">
        {photos[0] ? (
          <>
            <img
              src={photos[0]}
              alt={listing.title}
              className="w-full h-full object-cover"
              referrerPolicy="no-referrer"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/10 to-transparent" />
          </>
        ) : (
          <div className="w-full h-full flex items-center justify-center bg-teal-50">
            <span className="text-6xl">🏠</span>
          </div>
        )}
        <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
          <h1 className="text-3xl font-bold drop-shadow-md">{listing.title}</h1>
          {listing.location && (
            <p className="mt-1 text-lg opacity-90 drop-shadow">{listing.location}</p>
          )}
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 sm:px-6 py-10 grid grid-cols-1 lg:grid-cols-3 gap-10">
        {/* ── LEFT: listing details ── */}
        <div className="lg:col-span-2 space-y-10">
          {/* Quick facts */}
          <div className="flex flex-wrap gap-x-6 gap-y-2 text-gray-600 text-sm border-b pb-6">
            <span className="font-medium text-gray-900">
              {fmt(listing.nightly_rate_cents)}{' '}
              <span className="font-normal text-gray-500">/ night</span>
            </span>
            <span>·</span>
            <span>{listing.max_guests} guests</span>
            <span>·</span>
            <span>
              {listing.bedrooms} bed{listing.bedrooms !== 1 ? 's' : ''}
            </span>
            <span>·</span>
            <span>
              {listing.bathrooms} bath{listing.bathrooms !== 1 ? 's' : ''}
            </span>
            {listing.min_nights > 1 && (
              <>
                <span>·</span>
                <span>{listing.min_nights}-night minimum</span>
              </>
            )}
          </div>

          {/* Tagline */}
          {listing.tagline && (
            <p className="text-xl text-gray-800 font-medium">{listing.tagline}</p>
          )}

          {/* Description */}
          {listing.description && (
            <div>
              <h2 className="text-xl font-semibold mb-3">About this place</h2>
              <p className="text-gray-600 whitespace-pre-line leading-relaxed">
                {listing.description}
              </p>
            </div>
          )}

          {/* Photo grid */}
          {photos.length > 1 && (
            <div>
              <h2 className="text-xl font-semibold mb-3">Photos</h2>
              <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
                {photos.slice(1, 7).map((url, i) => (
                  <img
                    key={i}
                    src={url}
                    alt={`Photo ${i + 2}`}
                    className="w-full h-44 object-cover rounded-xl"
                    referrerPolicy="no-referrer"
                  />
                ))}
              </div>
            </div>
          )}

          {/* Amenities */}
          {amenities.length > 0 && (
            <div>
              <h2 className="text-xl font-semibold mb-3">What this place offers</h2>
              <div className="grid grid-cols-2 gap-3">
                {amenities.map((a, i) => (
                  <div key={i} className="flex items-center gap-2 text-gray-700 text-sm">
                    <span className="text-teal-600">
                      {AMENITY_ICONS[a] ?? (
                        <span className="w-4 h-4 inline-block text-center">✓</span>
                      )}
                    </span>
                    {a}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* House rules */}
          {listing.house_rules && (
            <div>
              <h2 className="text-xl font-semibold mb-3">House rules</h2>
              <p className="text-gray-600 whitespace-pre-line text-sm leading-relaxed">
                {listing.house_rules}
              </p>
            </div>
          )}
        </div>

        {/* ── RIGHT: booking form ── */}
        <div className="lg:col-span-1">
          <div className="sticky top-6">
            <BookingForm
              siteId={site.id}
              slug={params.slug}
              nightlyRateCents={listing.nightly_rate_cents}
              cleaningFeeCents={listing.cleaning_fee_cents}
              minNights={listing.min_nights}
              maxGuests={listing.max_guests}
              blockedRanges={blockedRanges}
            />
          </div>
        </div>
      </div>

      {/* Footer */}
      <footer className="border-t mt-16 py-8 text-center text-sm text-gray-400">
        Direct booking powered by{' '}
        <a href="https://strvend.com" className="text-teal-600 hover:underline">
          STRVend
        </a>{' '}
        — no guest fees
      </footer>
    </div>
  )
}
