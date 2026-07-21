import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

interface Params {
  params: { siteId: string }
}

export async function GET(_req: NextRequest, { params }: Params) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { data, error } = await supabase
    .from('booking_sites')
    .select('*, booking_listings(*), booking_requests(*)')
    .eq('id', params.siteId)
    .eq('host_id', user.id)
    .single()

  if (error || !data) return NextResponse.json({ error: 'Not found' }, { status: 404 })
  return NextResponse.json(data)
}

export async function PATCH(request: NextRequest, { params }: Params) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  // Verify ownership first
  const { data: site } = await supabase
    .from('booking_sites')
    .select('id, host_id')
    .eq('id', params.siteId)
    .eq('host_id', user.id)
    .single()

  if (!site) return NextResponse.json({ error: 'Not found' }, { status: 404 })

  const body = await request.json()
  const { listing, ...siteFields } = body

  // Update site fields (slug, status, custom_domain, theme)
  if (Object.keys(siteFields).length > 0) {
    const { error } = await supabase
      .from('booking_sites')
      .update({ ...siteFields, updated_at: new Date().toISOString() })
      .eq('id', params.siteId)

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  }

  // Upsert listing
  if (listing) {
    const { error } = await supabase
      .from('booking_listings')
      .upsert(
        { site_id: params.siteId, ...listing, updated_at: new Date().toISOString() },
        { onConflict: 'site_id' }
      )

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  }

  return NextResponse.json({ ok: true })
}

export async function DELETE(_req: NextRequest, { params }: Params) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { error } = await supabase
    .from('booking_sites')
    .delete()
    .eq('id', params.siteId)
    .eq('host_id', user.id)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json({ ok: true })
}
