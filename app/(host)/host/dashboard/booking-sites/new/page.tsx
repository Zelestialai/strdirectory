'use client'

import { useState, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { Loader2, ArrowRight, ArrowLeft, Link as LinkIcon, Check, AlertCircle } from 'lucide-react'

// ── Step types ────────────────────────────────────────────────────────────────

type Step = 'import' | 'details' | 'pricing' | 'publish'

interface ListingDraft {
  title: string
  tagline: string
  description: string
  location: string
  photos: string[]
  amenities: string[]
  maxGuests: number
  bedrooms: number
  bathrooms: number
  nightlyRateCents: number
  cleaningFeeCents: number
  minNights: number
  houseRules: string
  airbnbSourceUrl: string
}

const EMPTY_DRAFT: ListingDraft = {
  title: '',
  tagline: '',
  description: '',
  location: '',
  photos: [],
  amenities: [],
  maxGuests: 2,
  bedrooms: 1,
  bathrooms: 1,
  nightlyRateCents: 0,
  cleaningFeeCents: 0,
  minNights: 1,
  houseRules: '',
  airbnbSourceUrl: '',
}

const STEPS: Step[] = ['import', 'details', 'pricing', 'publish']
const STEP_LABELS: Record<Step, string> = {
  import: 'Import',
  details: 'Details',
  pricing: 'Pricing',
  publish: 'Publish',
}

const COMMON_AMENITIES = [
  'WiFi', 'Free parking', 'Air conditioning', 'Heating', 'Kitchen',
  'Washer', 'Dryer', 'TV', 'Pool', 'Hot tub', 'Gym', 'Pets allowed',
  'Smoke detector', 'Carbon monoxide detector', 'First aid kit',
  'Fire extinguisher', 'Outdoor shower', 'Beach access',
]

// ── Helpers ───────────────────────────────────────────────────────────────────

function dollarsToCents(s: string) {
  return Math.round(parseFloat(s || '0') * 100)
}
function centsToStr(cents: number) {
  return cents > 0 ? (cents / 100).toFixed(2) : ''
}
function slugify(s: string) {
  return s
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 60)
}

// ── Component ─────────────────────────────────────────────────────────────────

export default function NewBookingSitePage() {
  const router = useRouter()
  const [step, setStep] = useState<Step>('import')
  const [draft, setDraft] = useState<ListingDraft>(EMPTY_DRAFT)
  const [airbnbUrl, setAirbnbUrl] = useState('')
  const [importing, setImporting] = useState(false)
  const [importWarning, setImportWarning] = useState('')
  const [slug, setSlug] = useState('')
  const [saving, setSaving] = useState(false)
  const [saveError, setSaveError] = useState('')
  const [newAmenity, setNewAmenity] = useState('')

  const stepIndex = STEPS.indexOf(step)

  // ── Import ────────────────────────────────────────────────────────────────

  async function handleImport() {
    setImporting(true)
    setImportWarning('')
    try {
      const res = await fetch('/api/booking-sites/import-airbnb', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url: airbnbUrl }),
      })
      const json = await res.json()
      if (json.data) {
        const d = json.data
        setDraft({
          ...EMPTY_DRAFT,
          airbnbSourceUrl: airbnbUrl,
          title: d.title || '',
          tagline: d.tagline || '',
          description: d.description || '',
          location: d.location || '',
          photos: d.photos || [],
          amenities: d.amenities || [],
          maxGuests: d.maxGuests || 2,
          bedrooms: d.bedrooms || 1,
          bathrooms: d.bathrooms || 1,
        })
        if (d.title) setSlug(slugify(d.title))
      }
      if (json.warning) setImportWarning(json.warning)
      setStep('details')
    } catch {
      setImportWarning('Import failed — please fill in your listing details manually.')
      setStep('details')
    }
    setImporting(false)
  }

  function skipImport() {
    setStep('details')
  }

  // ── Amenities ─────────────────────────────────────────────────────────────

  function toggleAmenity(a: string) {
    setDraft((d) => ({
      ...d,
      amenities: d.amenities.includes(a)
        ? d.amenities.filter((x) => x !== a)
        : [...d.amenities, a],
    }))
  }

  function addCustomAmenity() {
    const trimmed = newAmenity.trim()
    if (!trimmed || draft.amenities.includes(trimmed)) return
    setDraft((d) => ({ ...d, amenities: [...d.amenities, trimmed] }))
    setNewAmenity('')
  }

  // ── Save ──────────────────────────────────────────────────────────────────

  async function handlePublish(status: 'draft' | 'published') {
    if (!slug) { setSaveError('Please enter a URL slug'); return }
    setSaving(true)
    setSaveError('')
    try {
      const res = await fetch('/api/booking-sites', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          slug,
          status,
          listing: {
            title: draft.title,
            tagline: draft.tagline || null,
            description: draft.description,
            location: draft.location,
            photos: draft.photos,
            amenities: draft.amenities,
            max_guests: draft.maxGuests,
            bedrooms: draft.bedrooms,
            bathrooms: draft.bathrooms,
            nightly_rate_cents: draft.nightlyRateCents,
            cleaning_fee_cents: draft.cleaningFeeCents,
            min_nights: draft.minNights,
            house_rules: draft.houseRules || null,
            airbnb_source_url: draft.airbnbSourceUrl || null,
          },
        }),
      })
      const data = await res.json()
      if (!res.ok) {
        setSaveError(data.error || 'Failed to create site')
        setSaving(false)
        return
      }
      router.push('/host/dashboard/booking-sites')
    } catch {
      setSaveError('Network error — please try again')
      setSaving(false)
    }
  }

  // ── Render ────────────────────────────────────────────────────────────────

  return (
    <div className="max-w-2xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Create Booking Site</h1>
      <p className="text-gray-500 text-sm mb-8">
        Build a direct booking page for your property in minutes
      </p>

      {/* Step indicator */}
      <div className="flex items-center gap-1 mb-10">
        {STEPS.map((s, i) => (
          <div key={s} className="flex items-center gap-1">
            <div
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                s === step
                  ? 'bg-teal-600 text-white'
                  : i < stepIndex
                  ? 'bg-teal-100 text-teal-700'
                  : 'bg-gray-100 text-gray-400'
              }`}
            >
              {i < stepIndex && <Check className="w-3 h-3" />}
              {STEP_LABELS[s]}
            </div>
            {i < STEPS.length - 1 && <div className="w-4 h-px bg-gray-200" />}
          </div>
        ))}
      </div>

      {/* ── STEP 1: Import ── */}
      {step === 'import' && (
        <div className="space-y-6">
          <div className="bg-teal-50 border border-teal-100 rounded-2xl p-5">
            <h2 className="font-semibold text-teal-900 mb-1">Import from Airbnb</h2>
            <p className="text-sm text-teal-700">
              Paste your Airbnb listing URL and we'll pre-fill your title, description, photos, and
              amenities. You can edit everything before publishing.
            </p>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              Airbnb listing URL
            </label>
            <div className="flex gap-2">
              <div className="flex-1 relative">
                <LinkIcon className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                <input
                  type="url"
                  placeholder="https://www.airbnb.com/rooms/12345678"
                  value={airbnbUrl}
                  onChange={(e) => setAirbnbUrl(e.target.value)}
                  className="w-full pl-9 pr-4 py-3 border border-gray-300 rounded-xl text-sm outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent"
                />
              </div>
              <button
                onClick={handleImport}
                disabled={importing || !airbnbUrl.includes('airbnb.com/rooms/')}
                className="px-4 py-3 bg-teal-600 text-white rounded-xl font-medium text-sm hover:bg-teal-700 disabled:opacity-50 transition-colors flex items-center gap-2"
              >
                {importing ? (
                  <Loader2 className="w-4 h-4 animate-spin" />
                ) : (
                  <ArrowRight className="w-4 h-4" />
                )}
                {importing ? 'Importing…' : 'Import'}
              </button>
            </div>
            <p className="text-xs text-gray-400 mt-1.5">
              e.g. https://www.airbnb.com/rooms/12345678
            </p>
          </div>

          <div className="relative flex items-center">
            <div className="flex-1 border-t border-gray-200" />
            <span className="px-3 text-sm text-gray-400">or</span>
            <div className="flex-1 border-t border-gray-200" />
          </div>

          <button
            onClick={skipImport}
            className="w-full border border-gray-300 text-gray-700 py-3 rounded-xl font-medium text-sm hover:bg-gray-50 transition-colors"
          >
            Fill in details manually
          </button>
        </div>
      )}

      {/* ── STEP 2: Details ── */}
      {step === 'details' && (
        <div className="space-y-6">
          {importWarning && (
            <div className="flex gap-2 bg-amber-50 border border-amber-200 rounded-xl p-4 text-sm text-amber-800">
              <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
              <span>{importWarning}</span>
            </div>
          )}

          {/* Photos preview */}
          {draft.photos.length > 0 && (
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Photos imported ({draft.photos.length})
              </label>
              <div className="flex gap-2 overflow-x-auto pb-2">
                {draft.photos.slice(0, 6).map((url, i) => (
                  <img
                    key={i}
                    src={url}
                    alt=""
                    className="w-24 h-16 object-cover rounded-lg flex-shrink-0"
                    referrerPolicy="no-referrer"
                  />
                ))}
              </div>
              <p className="text-xs text-gray-400 mt-1">
                Photos are linked from Airbnb. To replace them, edit your site after creation.
              </p>
            </div>
          )}

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              Listing title <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              value={draft.title}
              onChange={(e) => {
                setDraft((d) => ({ ...d, title: e.target.value }))
                if (!slug) setSlug(slugify(e.target.value))
              }}
              placeholder="Cozy beach house with ocean views"
              required
              className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              Tagline <span className="text-gray-400 font-normal">(optional)</span>
            </label>
            <input
              type="text"
              value={draft.tagline}
              onChange={(e) => setDraft((d) => ({ ...d, tagline: e.target.value }))}
              placeholder="Your perfect waterfront getaway"
              className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">Description</label>
            <textarea
              value={draft.description}
              onChange={(e) => setDraft((d) => ({ ...d, description: e.target.value }))}
              rows={6}
              placeholder="Tell guests what makes your place special…"
              className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 resize-none"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">Location</label>
            <input
              type="text"
              value={draft.location}
              onChange={(e) => setDraft((d) => ({ ...d, location: e.target.value }))}
              placeholder="Santa Monica, CA"
              className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
          </div>

          {/* Property specs */}
          <div className="grid grid-cols-3 gap-3">
            {[
              { label: 'Max guests', key: 'maxGuests', min: 1, max: 30 },
              { label: 'Bedrooms', key: 'bedrooms', min: 0, max: 20 },
              { label: 'Bathrooms', key: 'bathrooms', min: 0.5, max: 20, step: 0.5 },
            ].map(({ label, key, min, max, step: s }) => (
              <div key={key}>
                <label className="block text-xs font-medium text-gray-600 mb-1">{label}</label>
                <input
                  type="number"
                  value={(draft as any)[key]}
                  min={min}
                  max={max}
                  step={s || 1}
                  onChange={(e) =>
                    setDraft((d) => ({ ...d, [key]: Number(e.target.value) }))
                  }
                  className="w-full border border-gray-300 rounded-xl px-3 py-2.5 text-sm outline-none focus:ring-2 focus:ring-teal-500"
                />
              </div>
            ))}
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
                    draft.amenities.includes(a)
                      ? 'bg-teal-600 text-white border-teal-600'
                      : 'bg-white text-gray-600 border-gray-300 hover:border-teal-400'
                  }`}
                >
                  {a}
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
              <button
                type="button"
                onClick={addCustomAmenity}
                className="px-3 py-2 border border-gray-300 rounded-xl text-sm hover:bg-gray-50"
              >
                Add
              </button>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              House rules <span className="text-gray-400 font-normal">(optional)</span>
            </label>
            <textarea
              value={draft.houseRules}
              onChange={(e) => setDraft((d) => ({ ...d, houseRules: e.target.value }))}
              rows={4}
              placeholder="No smoking · No parties · Check-in after 3pm…"
              className="w-full border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500 resize-none"
            />
          </div>

          <div className="flex gap-3 pt-2">
            <button
              onClick={() => setStep('import')}
              className="flex items-center gap-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm font-medium hover:bg-gray-50"
            >
              <ArrowLeft className="w-4 h-4" /> Back
            </button>
            <button
              onClick={() => setStep('pricing')}
              disabled={!draft.title}
              className="flex-1 flex items-center justify-center gap-1 bg-teal-600 text-white py-2.5 rounded-xl text-sm font-medium hover:bg-teal-700 disabled:opacity-50 transition-colors"
            >
              Continue <ArrowRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      )}

      {/* ── STEP 3: Pricing ── */}
      {step === 'pricing' && (
        <div className="space-y-6">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Nightly rate ($) <span className="text-red-500">*</span>
              </label>
              <div className="relative">
                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-500 text-sm">$</span>
                <input
                  type="number"
                  min="1"
                  step="0.01"
                  placeholder="150.00"
                  value={centsToStr(draft.nightlyRateCents)}
                  onChange={(e) =>
                    setDraft((d) => ({ ...d, nightlyRateCents: dollarsToCents(e.target.value) }))
                  }
                  className="w-full pl-6 pr-4 py-3 border border-gray-300 rounded-xl text-sm outline-none focus:ring-2 focus:ring-teal-500"
                />
              </div>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Cleaning fee ($)
              </label>
              <div className="relative">
                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-500 text-sm">$</span>
                <input
                  type="number"
                  min="0"
                  step="0.01"
                  placeholder="75.00"
                  value={centsToStr(draft.cleaningFeeCents)}
                  onChange={(e) =>
                    setDraft((d) => ({ ...d, cleaningFeeCents: dollarsToCents(e.target.value) }))
                  }
                  className="w-full pl-6 pr-4 py-3 border border-gray-300 rounded-xl text-sm outline-none focus:ring-2 focus:ring-teal-500"
                />
              </div>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              Minimum nights
            </label>
            <input
              type="number"
              min="1"
              value={draft.minNights}
              onChange={(e) => setDraft((d) => ({ ...d, minNights: Number(e.target.value) }))}
              className="w-32 border border-gray-300 rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-teal-500"
            />
          </div>

          {/* Preview */}
          {draft.nightlyRateCents > 0 && (
            <div className="bg-gray-50 rounded-xl p-4 text-sm">
              <p className="font-medium text-gray-700 mb-2">Sample pricing (3-night stay)</p>
              <div className="space-y-1 text-gray-600">
                <div className="flex justify-between">
                  <span>${(draft.nightlyRateCents / 100).toFixed(2)} × 3 nights</span>
                  <span>${((draft.nightlyRateCents * 3) / 100).toFixed(2)}</span>
                </div>
                {draft.cleaningFeeCents > 0 && (
                  <div className="flex justify-between">
                    <span>Cleaning fee</span>
                    <span>${(draft.cleaningFeeCents / 100).toFixed(2)}</span>
                  </div>
                )}
                <div className="flex justify-between font-semibold pt-1 border-t">
                  <span>Guest total</span>
                  <span>
                    ${((draft.nightlyRateCents * 3 + draft.cleaningFeeCents) / 100).toFixed(2)}
                  </span>
                </div>
                <p className="text-xs text-teal-600 pt-1">No service fees for your guests ✓</p>
              </div>
            </div>
          )}

          <div className="flex gap-3 pt-2">
            <button
              onClick={() => setStep('details')}
              className="flex items-center gap-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm font-medium hover:bg-gray-50"
            >
              <ArrowLeft className="w-4 h-4" /> Back
            </button>
            <button
              onClick={() => setStep('publish')}
              disabled={draft.nightlyRateCents < 1}
              className="flex-1 flex items-center justify-center gap-1 bg-teal-600 text-white py-2.5 rounded-xl text-sm font-medium hover:bg-teal-700 disabled:opacity-50 transition-colors"
            >
              Continue <ArrowRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      )}

      {/* ── STEP 4: Publish ── */}
      {step === 'publish' && (
        <div className="space-y-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              Your booking URL <span className="text-red-500">*</span>
            </label>
            <div className="flex items-center border border-gray-300 rounded-xl overflow-hidden focus-within:ring-2 focus-within:ring-teal-500">
              <span className="px-3 text-sm text-gray-400 bg-gray-50 border-r border-gray-300 py-3 whitespace-nowrap">
                strvend.com/book/
              </span>
              <input
                type="text"
                value={slug}
                onChange={(e) => setSlug(e.target.value.toLowerCase().replace(/[^a-z0-9-]/g, ''))}
                placeholder="my-beach-house"
                className="flex-1 px-3 py-3 text-sm outline-none"
              />
            </div>
            <p className="text-xs text-gray-400 mt-1">Lowercase letters, numbers, and hyphens only</p>
          </div>

          {/* Summary */}
          <div className="bg-gray-50 rounded-2xl p-5 space-y-2 text-sm">
            <h3 className="font-semibold text-gray-900 mb-3">Summary</h3>
            <div className="flex justify-between">
              <span className="text-gray-500">Title</span>
              <span className="font-medium text-gray-900">{draft.title}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Nightly rate</span>
              <span className="font-medium">${(draft.nightlyRateCents / 100).toFixed(2)}</span>
            </div>
            {draft.cleaningFeeCents > 0 && (
              <div className="flex justify-between">
                <span className="text-gray-500">Cleaning fee</span>
                <span className="font-medium">${(draft.cleaningFeeCents / 100).toFixed(2)}</span>
              </div>
            )}
            <div className="flex justify-between">
              <span className="text-gray-500">Min nights</span>
              <span className="font-medium">{draft.minNights}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Amenities</span>
              <span className="font-medium">{draft.amenities.length} listed</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Photos</span>
              <span className="font-medium">{draft.photos.length} imported</span>
            </div>
          </div>

          {saveError && (
            <div className="flex gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700">
              <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
              {saveError}
            </div>
          )}

          <div className="flex gap-3 pt-2">
            <button
              onClick={() => setStep('pricing')}
              className="flex items-center gap-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm font-medium hover:bg-gray-50"
            >
              <ArrowLeft className="w-4 h-4" /> Back
            </button>
            <button
              onClick={() => handlePublish('draft')}
              disabled={saving || !slug}
              className="px-4 py-2.5 border border-gray-300 rounded-xl text-sm font-medium hover:bg-gray-50 disabled:opacity-50"
            >
              Save draft
            </button>
            <button
              onClick={() => handlePublish('published')}
              disabled={saving || !slug}
              className="flex-1 flex items-center justify-center gap-1 bg-teal-600 text-white py-2.5 rounded-xl text-sm font-semibold hover:bg-teal-700 disabled:opacity-50 transition-colors"
            >
              {saving ? (
                <Loader2 className="w-4 h-4 animate-spin" />
              ) : (
                <Check className="w-4 h-4" />
              )}
              {saving ? 'Saving…' : 'Publish Site'}
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
