import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/utils/supabase/server'

export async function GET() {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { data, error } = await supabase
    .from('booking_sites')
    .select('*, booking_listings(*)')
    .eq('host_id', user.id)
    .order('created_at', { ascending: false })

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json(data)
}

export async function POST(request: NextRequest) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const body = await request.json()
  const { slug, property_id, listing } = body

  if (!slug || typeof slug !== 'string' || !/^[a-z0-9-]+$/.test(slug)) {
    return NextResponse.json(
      { error: 'Slug must be lowercase letters, numbers, and hyphens only' },
      { status: 400 }
    )
  }

  const { data: site, error: siteError } = await supabase
    .from('booking_sites')
    .insert({ host_id: user.id, slug, property_id: property_id || null, status: 'draft' })
    .select()
    .single()

  if (siteError) {
    if (siteError.code === '23505') {
      return NextResponse.json({ error: 'That URL slug is already taken' }, { status: 409 })
    }
    return NextResponse.json({ error: siteError.message }, { status: 500 })
  }

  if (listing) {
    const { error: listingError } = await supabase
      .from('booking_listings')
      .insert({ site_id: site.id, ...listing })

    if (listingError) {
      // Roll back the site
      await supabase.from('booking_sites').delete().eq('id', site.id)
      return NextResponse.json({ error: listingError.message }, { status: 500 })
    }
  }

  return NextResponse.json(site, { status: 201 })
}
