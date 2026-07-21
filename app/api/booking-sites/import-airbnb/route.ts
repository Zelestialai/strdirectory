import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

interface AirbnbData {
  title: string
  tagline: string
  description: string
  location: string
  photos: string[]
  amenities: string[]
  maxGuests: number
  bedrooms: number
  bathrooms: number
}

// Walk an arbitrary object tree (up to maxDepth) looking for a node that looks
// like an Airbnb listing (has name + photos OR roomType).
function findListingNode(obj: unknown, depth = 0): Record<string, unknown> | null {
  if (depth > 10 || !obj || typeof obj !== 'object') return null
  const node = obj as Record<string, unknown>
  if (
    (typeof node.name === 'string' && Array.isArray(node.photos)) ||
    typeof node.roomType === 'string'
  ) {
    return node
  }
  for (const val of Object.values(node)) {
    const found = findListingNode(val, depth + 1)
    if (found) return found
  }
  return null
}

function parseListingNode(node: Record<string, unknown>): AirbnbData {
  // Photos: try several known shapes
  const rawPhotos: unknown[] =
    (node.photos as unknown[]) ||
    (node.listingImages as unknown[]) ||
    (node.pictureUrls as unknown[]) ||
    []

  const photos = rawPhotos
    .slice(0, 20)
    .map((p: unknown) => {
      if (typeof p === 'string') return p
      if (p && typeof p === 'object') {
        const pic = p as Record<string, string>
        return pic.large || pic.url || pic.baseUrl || pic.pictureUrl || pic.x1500 || ''
      }
      return ''
    })
    .filter(Boolean) as string[]

  // Amenities: flatten various shapes
  const rawAmenities: unknown[] =
    (node.listingAmenities as unknown[]) ||
    (node.previewAmenities as unknown[]) ||
    (node.amenities as unknown[]) ||
    []

  const amenities = rawAmenities
    .map((a: unknown) => {
      if (typeof a === 'string') return a
      if (a && typeof a === 'object') {
        const am = a as Record<string, string>
        return am.name || am.title || ''
      }
      return ''
    })
    .filter(Boolean) as string[]

  // Description: may be nested or plain
  let description = ''
  if (typeof node.description === 'string') {
    description = node.description
  } else if (node.sectionedDescription && typeof node.sectionedDescription === 'object') {
    const sd = node.sectionedDescription as Record<string, string>
    description = sd.summary || sd.access || sd.space || ''
  }

  return {
    title: (node.name as string) || '',
    tagline: (node.summary as string) || '',
    description,
    location: (node.publicAddress as string) || (node.city as string) || '',
    photos,
    amenities,
    maxGuests: (node.personCapacity as number) || 2,
    bedrooms: (node.bedrooms as number) || 1,
    bathrooms: (node.bathrooms as number) || 1,
  }
}

function extractFromMeta(html: string): Partial<AirbnbData> {
  const og = (prop: string) => {
    const m = html.match(new RegExp(`<meta[^>]+property="${prop}"[^>]+content="([^"]+)"`, 'i'))
    return m?.[1] || ''
  }
  return {
    title: og('og:title').replace(' - Airbnb', '').trim(),
    description: og('og:description'),
    photos: [og('og:image')].filter(Boolean),
  }
}

export async function POST(request: NextRequest) {
  const supabase = createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { url } = await request.json()
  if (!url || typeof url !== 'string' || !url.includes('airbnb.com/rooms/')) {
    return NextResponse.json({ error: 'Please provide a valid Airbnb listing URL' }, { status: 400 })
  }

  try {
    const response = await fetch(url, {
      headers: {
        'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
        Accept:
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9',
        'Cache-Control': 'no-cache',
      },
      signal: AbortSignal.timeout(15000),
    })

    if (!response.ok) {
      // Return partial success — let user fill in manually
      return NextResponse.json({
        partial: true,
        data: {},
        warning: 'Could not fetch listing — please fill in your details manually.',
      })
    }

    const html = await response.text()

    // Try __NEXT_DATA__ first (Airbnb is a Next.js app)
    const nextDataMatch = html.match(
      /<script[^>]+id="__NEXT_DATA__"[^>]*>([\s\S]*?)<\/script>/
    )

    if (nextDataMatch) {
      try {
        const nextData = JSON.parse(nextDataMatch[1])
        const node = findListingNode(nextData)
        if (node) {
          return NextResponse.json({ partial: false, data: parseListingNode(node) })
        }
      } catch {
        // JSON parse failed, fall through
      }
    }

    // Fallback: og: meta tags (always present)
    const meta = extractFromMeta(html)
    return NextResponse.json({
      partial: true,
      data: meta,
      warning: 'Imported basic info — please review and complete your listing details.',
    })
  } catch (err) {
    return NextResponse.json({
      partial: true,
      data: {},
      warning: 'Could not reach Airbnb right now. Please fill in your details manually.',
    })
  }
}
