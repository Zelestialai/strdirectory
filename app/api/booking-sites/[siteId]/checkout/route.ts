import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/utils/supabase/server'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

interface Params {
  params: { siteId: string }
}

export async function POST(request: NextRequest, { params }: Params) {
  const supabase = createClient()

  const body = await request.json()
  const { guest_name, guest_email, check_in, check_out, guests, message } = body

  if (!guest_name || !guest_email || !check_in || !check_out || !guests) {
    return NextResponse.json({ error: 'Missing required fields' }, { status: 400 })
  }

  // Fetch site + listing (public endpoint — no auth needed)
  const { data: site, error: siteError } = await supabase
    .from('booking_sites')
    .select('*, booking_listings(*)')
    .eq('id', params.siteId)
    .eq('status', 'published')
    .single()

  if (siteError || !site) {
    return NextResponse.json({ error: 'Booking site not found' }, { status: 404 })
  }

  const listings = site.booking_listings as Array<{
    title: string
    nightly_rate_cents: number
    cleaning_fee_cents: number
    min_nights: number
    max_guests: number
  }>
  const listing = listings?.[0]
  if (!listing) return NextResponse.json({ error: 'No listing found for this site' }, { status: 400 })

  // Validate dates
  const checkInDate = new Date(check_in)
  const checkOutDate = new Date(check_out)
  const today = new Date()
  today.setHours(0, 0, 0, 0)

  if (checkInDate < today) {
    return NextResponse.json({ error: 'Check-in date cannot be in the past' }, { status: 400 })
  }
  if (checkOutDate <= checkInDate) {
    return NextResponse.json({ error: 'Check-out must be after check-in' }, { status: 400 })
  }

  const nights = Math.round(
    (checkOutDate.getTime() - checkInDate.getTime()) / (1000 * 60 * 60 * 24)
  )

  if (nights < listing.min_nights) {
    return NextResponse.json(
      { error: `Minimum stay is ${listing.min_nights} night${listing.min_nights !== 1 ? 's' : ''}` },
      { status: 400 }
    )
  }

  if (guests > listing.max_guests) {
    return NextResponse.json(
      { error: `This property fits a maximum of ${listing.max_guests} guests` },
      { status: 400 }
    )
  }

  const subtotal = listing.nightly_rate_cents * nights
  const cleaningFee = listing.cleaning_fee_cents
  const total = subtotal + cleaningFee

  if (total < 50) {
    return NextResponse.json({ error: 'Booking total is too low to process' }, { status: 400 })
  }

  // Create booking request first (so we have an ID for Stripe metadata)
  const { data: bookingRequest, error: brError } = await supabase
    .from('booking_requests')
    .insert({
      site_id: site.id,
      guest_name,
      guest_email,
      check_in,
      check_out,
      guests,
      message: message || null,
      status: 'pending',
      nights,
      nightly_rate_cents: listing.nightly_rate_cents,
      cleaning_fee_cents: cleaningFee,
      total_cents: total,
    })
    .select()
    .single()

  if (brError || !bookingRequest) {
    return NextResponse.json({ error: brError?.message || 'Failed to create booking' }, { status: 500 })
  }

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'
  const lineItems: Stripe.Checkout.SessionCreateParams.LineItem[] = [
    {
      price_data: {
        currency: 'usd',
        product_data: {
          name: listing.title,
          description: `${check_in} → ${check_out} · ${nights} night${nights !== 1 ? 's' : ''}`,
        },
        unit_amount: subtotal,
      },
      quantity: 1,
    },
  ]

  if (cleaningFee > 0) {
    lineItems.push({
      price_data: {
        currency: 'usd',
        product_data: { name: 'Cleaning fee' },
        unit_amount: cleaningFee,
      },
      quantity: 1,
    })
  }

  // Create Stripe Checkout Session
  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    mode: 'payment',
    customer_email: guest_email,
    line_items: lineItems,
    metadata: {
      booking_request_id: bookingRequest.id,
      site_id: site.id,
      host_id: site.host_id,
    },
    success_url: `${baseUrl}/book/${site.slug}/confirmation?booking_id=${bookingRequest.id}&session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${baseUrl}/book/${site.slug}`,
  })

  // Stamp the booking with the Stripe session ID
  await supabase
    .from('booking_requests')
    .update({ stripe_session_id: session.id })
    .eq('id', bookingRequest.id)

  return NextResponse.json({ url: session.url })
}
