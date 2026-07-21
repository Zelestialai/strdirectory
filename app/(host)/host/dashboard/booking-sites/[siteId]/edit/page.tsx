'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { Loader2, Save, AlertCircle, ArrowLeft } from 'lucide-react'
import Link from 'next/link'

const COMMON_AMENITIES = [
  'WiFi', 'Free parking', 'Air conditioning', 'Heating', 'Kitchen',
  'Washer', 'Dryer', 'TV', 'Pool', 'Hot tub', 'Gym', 'Pets allowed',
  'Smoke detector', 'Carbon monoxide detector', 'First aid kit',
  'Fire extinguisher', 'Outdoor shower', 'Beach access',
]

interface Props {
  params: { siteId: string }
}

export default function EditBookingSitePage({ params }: Props) {
  const router = useRouter()
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState(false)
  const [newAmenity, setNewAmenity] = useState('')
  const [newPhotoUrl, setNewPhotoUrl] = useState('')

  // Site fields
  const [slug, setSlug] = useState('')
  const [status, setStatus] = useState<'draft' | 'published'>('draft')

  // Listing fields
  const [title, setTitle] = useState('')
  const [tagline, setTagline] = useState('')
  const [description, setDescription] = useState('')
  const [location, setLocation] = useState('')
  const [photos, setPhotos] = useState<string[]>([])
  const [amenities, setAmenities] = useState<string[]>([])
  const [maxGuests, setMaxGuests] = useState(2)
  const [bedrooms, setBedrooms] = useState(1)
  const [bathrooms, setBathrooms] = useState(1)
  const [nightlyRate, setNightlyRate] = useState('')
  const [cleaningFee, setCleaningFee] = useState('')
  const [minNights, setMinNights] = useState(1)
  const [houseRules, setHouseRules] = useState('')

  useEffect(() => {
    async function fetchSite() {
      const res = await fetch(`/api/booking-sites/${params.siteId}`)
      if (!res.ok) { router.push('/host/dashboard/booking-sites'); return }
      const data = await res.json()
      setSlug(data.slug || '')
      setStatus(data.status || 'draft')
      const l = data.booking_listings?.[0]
      if (l) {
        setTitle(l.title || '')
        setTagline(l.tagline || '')
        setDescription(l.description || '')
        setLocation(l.location || '')
        setPhotos((l.photos as string[]) || [])
        setAmenities((l.amenities as string[]) || [])
        setMaxGuests(l.max_guests || 2)
        setBedrooms(l.bedrooms || 1)
        setBathrooms(l.bathrooms || 1)
        setNightlyRate(l.nightly_rate_cents ? (l.nightly_rate_cents / 100).toFixed(2) : '')
        setCleaningFee(l.cleaning_fee_cents ? (l.cleaning_fee_cents / 100).toFixed(2) : '')
        setMinNights(l.min_nights || 1)
        setHouseRules(l.house_rules || '')
      }
      setLoading(false)
    }
    fetchSite()
  }, [params.siteId, router])

  function toggleAmenity(a: string) {
    setAmenities((prev) =>
      prev.includes(a) ? prev.filter((x) => x !== a) : [...prev, a]
    )
  }

  function addCustomAmenity() {
    const t = newAmenity.trim()
    if (!t || amenities.includes(t)) return
    setAmenities((prev) => [...prev, t])
    setNewAmenity('')
  }

  function addPhoto() {
    const t = newPhotoUrl.trim()
    if (!t || photos.includes(t)) return
    setPhotos((prev) => [...prev, t])
    setNewPhotoUrl('')
  }

  async function handleSave() {
    setError('')
    setSuccess(false)
    setSaving(true)
    const res = await fetch(`/api/booking-sites/${params.siteId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        slug,
        status,
        listing: {
          title,
          tagline: tagline || null,
          description,
          location,
          photos,
          amenities,
          max_guests: maxGuests,
          bedrooms,
          bathrooms,
          nightly_rate_cents: Math.round(parseFloat(nightlyRate || '0') * 100),
          cleaning_fee_cents: Math.round(parseFloat(cleaningFee || '0') * 100),
          min_nights: minNights,
          house_rules: houseRules || null,
        },
      }),
    })
    const data = await res.json()
    if (!res.ok) {
      setError(data.error || 'Failed to save')
    } else {
      setSuccess(true)
      setTimeout(() => setSuccess(false), 3000)
    }
    setSaving(false)
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <Loader2 className="w-8 h-8 animate-spin text-teal-500" />
      </div>
    )
  }

  const inputCls =
    'w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition'

  return (
    <div className="max-w-2xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-8">
        <Link href="/host/dashboard/booking-sites" className="text-gray-400 hover:text-gray-700">
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <h1 className="text-2xl font-bold text-gray-900">Edit Booking Site</h1>
        <div className="ml-auto flex items-center gap-3">
          <select
            value={status}
            onChange={(e) => setStatus(e.target.value as 'draft' | 'published')}
            className="border border-gray-300 rounded-xl px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-teal-500"
          >
            <option value="draft">Draft</option>
            <option value="published">Published</option>
          </select>
          <button
            onClick={handleSave}
            disabled={saving}
            className="flex items-center gap-2 bg-teal-600 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-700 disabled:opacity-50 transition-colors"
          >
            {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
            {saving ? 'Saving…' : success ? 'Saved ✓' : 'Save'}
          </button>
        </div>
      </div>

      {error && (
        <div className="flex gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700 mb-6">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
          {error}
        </div>
      )}

      <div className="space-y-6">
        {/* URL slug */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">Booking URL</label>
          <div className="flex items-center border border-gray-300 rounded-xl overflow-hidden focus-within:ring-2 focus-within:ring-teal-500">
            <span className="px-3 text-sm text-gray-400 bg-gray-50 border-r border-gray-300 py-3">
              strvend.com/book/
            </span>
            <input
              type="text"
              value={slug}
              onChange={(e) => setSlug(e.target.value.toLowerCase().replace(/[^a-z0-9-]/g, ''))}
              className="flex-1 px-3 py-3 text-sm outline-none"
            />
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">Title *</label>
          <input type="text" value={title} onChange={(e) => setTitle(e.target.value)} className={inputCls} />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">Tagline</label>
          <input type="text" value={tagline} onChange={(e) => setTagline(e.target.value)} className={inputCls} />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">Description</label>
          <textarea value={description} onChange={(e) => setDescription(e.target.value)} rows={6} className={`${inputCls} resize-none`} />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">Location</label>
          <input type="text" value={location} onChange={(e) => setLocation(e.target.value)} className={inputCls} />
        </div>

        <div className="grid grid-cols-3 gap-3">
          {[
            { label: 'Max guests', val: maxGuests, set: setMaxGuests },
            { label: 'Bedrooms', val: bedrooms, set: setBedrooms },
            { label: 'Bathrooms', val: bathrooms, set: setBathrooms },
          ].map(({ label, val, set }) => (
            <div key={label}>
              <label className="block text-xs font-medium text-gray-600 mb-1">{label}</label>
              <input
                type="number"
                min="0"
                step="0.5"
                value={val}
                onChange={(e) => set(Number(e.target.value))}
                className={inputCls}
              />
            </div>
          ))}
        </div>

        <div className="grid grid-cols-3 gap-3">
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Nightly rate ($)</label>
            <input type="number" min="0" step="0.01" value={nightlyRate} onChange={(e) => setNightlyRate(e.target.value)} className={inputCls} />
          </div>
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Cleaning fee ($)</label>
            <input type="number" min="0" step="0.01" value={cleaningFee} onChange={(e) => setCleaningFee(e.target.value)} className={inputCls} />
          </div>
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Min nights</label>
            <input type="number" min="1" value={minNights} onChange={(e) => setMinNights(Number(e.target.value))} className={inputCls} />
          </div>
        </div>

        {/* Amenities */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Amenities</label>
          <div className="flex flex-wrap gap-2 mb-3">
            {COMMON_AMENITIES.map((a) => (
              <button
                key={a}
                type="button"
                onClick={() => toggleAmenity(a)}
                className={`px-3 py-1.5 rounded-full text-xs font-medium border transition-colors ${
                  amenities.includes(a)
                    ? 'bg-teal-600 text-white border-teal-600'
                    : 'bg-white text-gray-600 border-gray-300 hover:border-teal-400'
                }`}
              >
                {a}
              </button>
            ))}
            {amenities.filter((a) => !COMMON_AMENITIES.includes(a)).map((a) => (
              <button
                key={a}
                type="button"
                onClick={() => toggleAmenity(a)}
                className="px-3 py-1.5 rounded-full text-xs font-medium border bg-teal-600 text-white border-teal-600"
              >
                {a} ×
              </button>
            ))}
          </div>
          <div className="flex gap-2">
            <input
              type="text"
              value={newAmenity}
              onChange={(e) => setNewAmenity(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && (e.preventDefault(), addCustomAmenity())}
              placeholder="Add custom amenity…"
              className="flex-1 border border-gray-300 rounded-xl px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
            <button type="button" onClick={addCustomAmenity} className="px-3 py-2 border border-gray-300 rounded-xl text-sm hover:bg-gray-50">
              Add
            </button>
          </div>
        </div>

        {/* Photos */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Photos ({photos.length})
          </label>
          <div className="flex flex-wrap gap-2 mb-3">
            {photos.map((url, i) => (
              <div key={i} className="relative group">
                <img
                  src={url}
                  alt=""
                  className="w-20 h-14 object-cover rounded-lg"
                  referrerPolicy="no-referrer"
                />
                <button
                  type="button"
                  onClick={() => setPhotos((prev) => prev.filter((_, j) => j !== i))}
                  className="absolute -top-1 -right-1 bg-red-500 text-white rounded-full w-5 h-5 text-xs flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
                >
                  ×
                </button>
              </div>
            ))}
          </div>
          <div className="flex gap-2">
            <input
              type="url"
              value={newPhotoUrl}
              onChange={(e) => setNewPhotoUrl(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && (e.preventDefault(), addPhoto())}
              placeholder="https://… (image URL)"
              className="flex-1 border border-gray-300 rounded-xl px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
            <button type="button" onClick={addPhoto} className="px-3 py-2 border border-gray-300 rounded-xl text-sm hover:bg-gray-50">
              Add
            </button>
          </div>
        </div>

        {/* House rules */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">House rules</label>
          <textarea
            value={houseRules}
            onChange={(e) => setHouseRules(e.target.value)}
            rows={4}
            className={`${inputCls} resize-none`}
          />
        </div>

        <div className="flex justify-end pt-2">
          <button
            onClick={handleSave}
            disabled={saving}
            className="flex items-center gap-2 bg-teal-600 text-white px-6 py-3 rounded-xl font-semibold hover:bg-teal-700 disabled:opacity-50 transition-colors"
          >
            {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
            {saving ? 'Saving…' : success ? 'Saved ✓' : 'Save changes'}
          </button>
        </div>
      </div>
    </div>
  )
}
