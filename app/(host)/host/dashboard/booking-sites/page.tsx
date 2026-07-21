'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { Globe, Plus, ExternalLink, Pencil, Trash2, Eye, EyeOff, Copy, Check } from 'lucide-react'

interface BookingListing {
  title: string
  nightly_rate_cents: number
}

interface BookingSite {
  id: string
  slug: string
  status: 'draft' | 'published'
  created_at: string
  booking_listings: BookingListing[]
}

export default function BookingSitesPage() {
  const [sites, setSites] = useState<BookingSite[]>([])
  const [loading, setLoading] = useState(true)
  const [copiedId, setCopiedId] = useState<string | null>(null)
  const [deletingId, setDeletingId] = useState<string | null>(null)
  const [togglingId, setTogglingId] = useState<string | null>(null)

  async function fetchSites() {
    const res = await fetch('/api/booking-sites')
    if (res.ok) {
      const data = await res.json()
      setSites(data)
    }
    setLoading(false)
  }

  useEffect(() => { fetchSites() }, [])

  async function toggleStatus(site: BookingSite) {
    setTogglingId(site.id)
    const newStatus = site.status === 'published' ? 'draft' : 'published'
    await fetch(`/api/booking-sites/${site.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ status: newStatus }),
    })
    await fetchSites()
    setTogglingId(null)
  }

  async function deleteSite(siteId: string) {
    if (!confirm('Delete this booking site? This cannot be undone.')) return
    setDeletingId(siteId)
    await fetch(`/api/booking-sites/${siteId}`, { method: 'DELETE' })
    setSites((prev) => prev.filter((s) => s.id !== siteId))
    setDeletingId(null)
  }

  function copyLink(slug: string) {
    const url = `${window.location.origin}/book/${slug}`
    navigator.clipboard.writeText(url)
    setCopiedId(slug)
    setTimeout(() => setCopiedId(null), 2000)
  }

  const fmt = (cents: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Direct Booking Sites</h1>
          <p className="text-gray-500 text-sm mt-1">
            Shareable booking pages — no Airbnb fees for you or your guests
          </p>
        </div>
        <Link
          href="/host/dashboard/booking-sites/new"
          className="flex items-center gap-2 bg-teal-600 text-white px-4 py-2.5 rounded-xl hover:bg-teal-700 transition-colors font-medium text-sm"
        >
          <Plus className="w-4 h-4" />
          New Site
        </Link>
      </div>

      {loading ? (
        <div className="space-y-3">
          {[1, 2].map((i) => (
            <div key={i} className="h-28 bg-gray-100 rounded-2xl animate-pulse" />
          ))}
        </div>
      ) : sites.length === 0 ? (
        <div className="text-center py-20 border-2 border-dashed border-gray-200 rounded-2xl">
          <Globe className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-700 mb-1">No booking sites yet</h3>
          <p className="text-gray-400 text-sm mb-6">
            Create a direct booking page for your property and stop paying Airbnb fees
          </p>
          <Link
            href="/host/dashboard/booking-sites/new"
            className="inline-flex items-center gap-2 bg-teal-600 text-white px-5 py-2.5 rounded-xl hover:bg-teal-700 transition-colors font-medium text-sm"
          >
            <Plus className="w-4 h-4" />
            Create your first site
          </Link>
        </div>
      ) : (
        <div className="space-y-4">
          {sites.map((site) => {
            const listing = site.booking_listings?.[0]
            const url = `/book/${site.slug}`
            return (
              <div
                key={site.id}
                className="border border-gray-200 rounded-2xl p-5 bg-white shadow-sm hover:shadow-md transition-shadow"
              >
                <div className="flex items-start justify-between gap-4">
                  <div className="min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <h3 className="font-semibold text-gray-900 truncate">
                        {listing?.title || 'Untitled listing'}
                      </h3>
                      <span
                        className={`text-xs px-2 py-0.5 rounded-full font-medium ${
                          site.status === 'published'
                            ? 'bg-green-100 text-green-700'
                            : 'bg-gray-100 text-gray-500'
                        }`}
                      >
                        {site.status}
                      </span>
                    </div>
                    <a
                      href={url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sm text-teal-600 hover:underline flex items-center gap-1 mt-0.5"
                    >
                      strvend.com/book/{site.slug}
                      <ExternalLink className="w-3 h-3" />
                    </a>
                    {listing?.nightly_rate_cents && (
                      <p className="text-sm text-gray-500 mt-1">
                        {fmt(listing.nightly_rate_cents)} / night
                      </p>
                    )}
                  </div>

                  {/* Actions */}
                  <div className="flex items-center gap-1 flex-shrink-0">
                    <button
                      onClick={() => copyLink(site.slug)}
                      title="Copy booking link"
                      className="p-2 rounded-lg text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors"
                    >
                      {copiedId === site.slug ? (
                        <Check className="w-4 h-4 text-green-500" />
                      ) : (
                        <Copy className="w-4 h-4" />
                      )}
                    </button>

                    <Link
                      href={`/host/dashboard/booking-sites/${site.id}/edit`}
                      title="Edit"
                      className="p-2 rounded-lg text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors"
                    >
                      <Pencil className="w-4 h-4" />
                    </Link>

                    <button
                      onClick={() => toggleStatus(site)}
                      disabled={!!togglingId}
                      title={site.status === 'published' ? 'Unpublish' : 'Publish'}
                      className="p-2 rounded-lg text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors"
                    >
                      {site.status === 'published' ? (
                        <EyeOff className="w-4 h-4" />
                      ) : (
                        <Eye className="w-4 h-4" />
                      )}
                    </button>

                    <button
                      onClick={() => deleteSite(site.id)}
                      disabled={deletingId === site.id}
                      title="Delete"
                      className="p-2 rounded-lg text-gray-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                    >
                      <Trash2 className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      )}

      {/* Info box */}
      <div className="mt-8 bg-teal-50 border border-teal-100 rounded-2xl p-5">
        <h4 className="font-semibold text-teal-800 mb-1">Save on every booking</h4>
        <p className="text-sm text-teal-700">
          Airbnb charges hosts ~3% per booking and guests 14%+ in service fees. Your direct booking
          site eliminates both — guests save money and you keep more of every reservation.
        </p>
      </div>
    </div>
  )
}
