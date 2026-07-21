'use client'

import { useState } from 'react'
import { ExternalLink, Loader2 } from 'lucide-react'

interface Props {
  mode: 'connect' | 'dashboard'
}

export default function ConnectStripeButton({ mode }: Props) {
  const [loading, setLoading] = useState(false)

  async function handleDashboard() {
    setLoading(true)
    const res = await fetch('/api/stripe/connect/dashboard')
    const data = await res.json()
    if (data.url) {
      window.open(data.url, '_blank', 'noopener,noreferrer')
    }
    setLoading(false)
  }

  if (mode === 'dashboard') {
    return (
      <button
        onClick={handleDashboard}
        disabled={loading}
        className="inline-flex items-center gap-2 bg-green-700 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-green-800 disabled:opacity-60 transition-colors"
      >
        {loading ? (
          <Loader2 className="w-3.5 h-3.5 animate-spin" />
        ) : (
          <ExternalLink className="w-3.5 h-3.5" />
        )}
        {loading ? 'Opening…' : 'View Stripe Dashboard'}
      </button>
    )
  }

  return (
    <a
      href="/api/stripe/connect"
      className="inline-flex items-center gap-2 bg-teal-600 text-white px-5 py-2.5 rounded-xl text-sm font-semibold hover:bg-teal-700 transition-colors"
    >
      <ExternalLink className="w-3.5 h-3.5" />
      Connect Stripe
    </a>
  )
}
