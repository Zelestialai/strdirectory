"use client";

import { useState } from "react";
import { Check, Zap, Star, Loader2 } from "lucide-react";

const PLANS = [
  {
    key: "pro",
    name: "Pro",
    price: "$29",
    period: "/month",
    icon: Zap,
    iconColor: "text-blue-600",
    iconBg: "bg-blue-50",
    border: "border-blue-200",
    badge: "text-blue-700 bg-blue-50 border-blue-200",
    cta: "Upgrade to Pro",
    ctaClass: "bg-blue-600 hover:bg-blue-700 text-white",
    features: [
      "Verified badge on your listing",
      "Priority placement in search results",
      "Full analytics dashboard",
      "Up to 10 service tags",
      "Email support",
    ],
  },
  {
    key: "featured",
    name: "Featured",
    price: "$79",
    period: "/month",
    icon: Star,
    iconColor: "text-amber-600",
    iconBg: "bg-amber-50",
    border: "border-amber-300",
    badge: "text-amber-700 bg-amber-50 border-amber-200",
    cta: "Get Featured",
    ctaClass: "bg-amber-500 hover:bg-amber-600 text-white",
    popular: true,
    features: [
      "Everything in Pro",
      "Featured badge on listing + search cards",
      "Top placement in all search results",
      "Highlighted card with gold border",
      "Homepage featured section",
      "Priority email + phone support",
    ],
  },
];

export default function UpgradePage() {
  const [loading, setLoading] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  async function handleUpgrade(plan: string) {
    setLoading(plan);
    setError(null);
    try {
      const res = await fetch("/api/stripe/checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ plan }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Something went wrong");
      window.location.href = data.url;
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : "Failed to start checkout");
      setLoading(null);
    }
  }

  return (
    <div className="max-w-3xl mx-auto space-y-8">
      <div className="text-center">
        <h1 className="text-3xl font-bold text-gray-900">Upgrade your listing</h1>
        <p className="mt-2 text-gray-500">
          Stand out to STR hosts and grow your client base.
        </p>
      </div>

      {error && (
        <div className="rounded-xl bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      )}

      {/* Free tier summary */}
      <div className="rounded-xl border bg-white p-5 flex items-center justify-between">
        <div>
          <p className="font-semibold text-gray-800">Free</p>
          <p className="text-sm text-gray-500 mt-0.5">Your current plan — basic listing, no badge</p>
        </div>
        <span className="text-sm text-gray-400 font-medium">$0 / month</span>
      </div>

      {/* Paid plans */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
        {PLANS.map((plan) => {
          const Icon = plan.icon;
          return (
            <div
              key={plan.key}
              className={`relative rounded-2xl border-2 bg-white p-6 flex flex-col ${plan.border}`}
            >
              {plan.popular && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 rounded-full bg-amber-500 px-3 py-0.5 text-xs font-bold text-white shadow">
                  Most Popular
                </span>
              )}

              <div className="flex items-center gap-3 mb-4">
                <div className={`h-9 w-9 rounded-lg flex items-center justify-center ${plan.iconBg}`}>
                  <Icon className={`h-5 w-5 ${plan.iconColor}`} />
                </div>
                <div>
                  <p className="font-bold text-gray-900">{plan.name}</p>
                  <p className="text-xs text-gray-400">
                    <span className="text-xl font-bold text-gray-900">{plan.price}</span>
                    {plan.period}
                  </p>
                </div>
              </div>

              <ul className="space-y-2 mb-6 flex-1">
                {plan.features.map((f) => (
                  <li key={f} className="flex items-start gap-2 text-sm text-gray-700">
                    <Check className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
                    {f}
                  </li>
                ))}
              </ul>

              <button
                onClick={() => handleUpgrade(plan.key)}
                disabled={!!loading}
                className={`w-full rounded-xl py-2.5 text-sm font-semibold transition-colors flex items-center justify-center gap-2 ${plan.ctaClass} disabled:opacity-60`}
              >
                {loading === plan.key ? (
                  <><Loader2 className="h-4 w-4 animate-spin" /> Redirecting…</>
                ) : (
                  plan.cta
                )}
              </button>
            </div>
          );
        })}
      </div>

      <p className="text-center text-xs text-gray-400">
        Subscriptions are billed monthly. Cancel anytime from your Stripe billing portal.
        Payments are processed securely by Stripe — we never store your card details.
      </p>
    </div>
  );
}
