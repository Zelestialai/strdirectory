"use client";

import { useEffect, useState } from "react";
import { Check, Zap, Star, Loader2, Settings, ExternalLink } from "lucide-react";
import { createClient } from "@/lib/supabase/client";

type Tier = "free" | "pro" | "featured";

const PLANS = [
  {
    key: "pro" as const,
    name: "Pro",
    price: "$29",
    period: "/month",
    icon: Zap,
    iconColor: "text-blue-600",
    iconBg: "bg-blue-50",
    border: "border-blue-200",
    activeBorder: "border-blue-500 ring-2 ring-blue-200",
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
    key: "featured" as const,
    name: "Featured",
    price: "$79",
    period: "/month",
    icon: Star,
    iconColor: "text-amber-600",
    iconBg: "bg-amber-50",
    border: "border-amber-300",
    activeBorder: "border-amber-500 ring-2 ring-amber-200",
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
  const [currentTier, setCurrentTier] = useState<Tier>("free");
  const [hasStripeCustomer, setHasStripeCustomer] = useState(false);
  const [tierLoading, setTierLoading] = useState(true);

  useEffect(() => {
    async function loadVendor() {
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) return;

      const { data } = await supabase
        .from("vendors")
        .select("subscription_tier, stripe_customer_id")
        .eq("user_id", user.id)
        .single();

      if (data) {
        setCurrentTier((data.subscription_tier as Tier) ?? "free");
        setHasStripeCustomer(!!data.stripe_customer_id);
      }
      setTierLoading(false);
    }
    loadVendor();
  }, []);

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

  async function handleManageSubscription() {
    setLoading("portal");
    setError(null);
    try {
      const res = await fetch("/api/stripe/portal", { method: "POST" });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Something went wrong");
      window.location.href = data.url;
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : "Failed to open billing portal");
      setLoading(null);
    }
  }

  const isSubscribed = currentTier !== "free";

  return (
    <div className="max-w-3xl mx-auto space-y-8">
      <div className="text-center">
        <h1 className="text-3xl font-bold text-gray-900">
          {isSubscribed ? "Your Subscription" : "Upgrade your listing"}
        </h1>
        <p className="mt-2 text-gray-500">
          {isSubscribed
            ? "Manage your plan, update payment info, or cancel anytime."
            : "Stand out to STR hosts and grow your client base."}
        </p>
      </div>

      {error && (
        <div className="rounded-xl bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      )}

      {/* Current plan banner for subscribers */}
      {!tierLoading && isSubscribed && (
        <div className="rounded-2xl border-2 border-brand-300 bg-brand-50 p-5 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <span className="inline-flex items-center gap-1 text-xs font-bold px-2.5 py-0.5 rounded-full bg-brand-600 text-white uppercase tracking-wide">
                Active
              </span>
              <p className="font-bold text-gray-900 text-lg">
                {currentTier === "pro" ? "Pro Plan" : "Featured Plan"}
              </p>
            </div>
            <p className="text-sm text-gray-500">
              {currentTier === "pro" ? "$29/month" : "$79/month"} — billed monthly via Stripe
            </p>
          </div>
          <button
            onClick={handleManageSubscription}
            disabled={loading === "portal"}
            className="inline-flex items-center gap-2 px-5 py-2.5 bg-white border border-brand-300 text-brand-700 font-semibold text-sm rounded-xl hover:bg-brand-50 transition-colors disabled:opacity-60 shrink-0"
          >
            {loading === "portal" ? (
              <><Loader2 className="h-4 w-4 animate-spin" /> Opening…</>
            ) : (
              <><Settings className="h-4 w-4" /> Manage Subscription <ExternalLink className="h-3.5 w-3.5 opacity-60" /></>
            )}
          </button>
        </div>
      )}

      {/* Free tier row */}
      {!tierLoading && !isSubscribed && (
        <div className="rounded-xl border bg-white p-5 flex items-center justify-between">
          <div>
            <p className="font-semibold text-gray-800">Free</p>
            <p className="text-sm text-gray-500 mt-0.5">Your current plan — basic listing, no badge</p>
          </div>
          <span className="text-sm text-green-600 font-semibold px-3 py-1 bg-green-50 rounded-full border border-green-200">
            Current plan
          </span>
        </div>
      )}

      {tierLoading && (
        <div className="rounded-xl border bg-white p-5 flex items-center gap-3 text-gray-400">
          <Loader2 className="h-4 w-4 animate-spin" />
          <span className="text-sm">Loading plan details…</span>
        </div>
      )}

      {/* Plan cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
        {PLANS.map((plan) => {
          const Icon = plan.icon;
          const isCurrentPlan = currentTier === plan.key;
          const isLowerPlan = currentTier === "featured" && plan.key === "pro";

          return (
            <div
              key={plan.key}
              className={`relative rounded-2xl border-2 bg-white p-6 flex flex-col transition-all ${
                isCurrentPlan ? plan.activeBorder : plan.border
              }`}
            >
              {plan.popular && !isCurrentPlan && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 rounded-full bg-amber-500 px-3 py-0.5 text-xs font-bold text-white shadow">
                  Most Popular
                </span>
              )}
              {isCurrentPlan && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 rounded-full bg-brand-600 px-3 py-0.5 text-xs font-bold text-white shadow">
                  Current Plan
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

              {isCurrentPlan ? (
                <button
                  onClick={handleManageSubscription}
                  disabled={loading === "portal"}
                  className="w-full rounded-xl py-2.5 text-sm font-semibold transition-colors flex items-center justify-center gap-2 bg-gray-100 hover:bg-gray-200 text-gray-700 disabled:opacity-60"
                >
                  {loading === "portal" ? (
                    <><Loader2 className="h-4 w-4 animate-spin" /> Opening…</>
                  ) : (
                    <><Settings className="h-4 w-4" /> Manage Plan</>
                  )}
                </button>
              ) : isLowerPlan ? (
                <button
                  disabled
                  className="w-full rounded-xl py-2.5 text-sm font-semibold bg-gray-50 text-gray-400 border border-gray-200 cursor-not-allowed"
                >
                  Included in Featured
                </button>
              ) : (
                <button
                  onClick={() => handleUpgrade(plan.key)}
                  disabled={!!loading || tierLoading}
                  className={`w-full rounded-xl py-2.5 text-sm font-semibold transition-colors flex items-center justify-center gap-2 ${plan.ctaClass} disabled:opacity-60`}
                >
                  {loading === plan.key ? (
                    <><Loader2 className="h-4 w-4 animate-spin" /> Redirecting…</>
                  ) : (
                    plan.cta
                  )}
                </button>
              )}
            </div>
          );
        })}
      </div>

      {/* Manage subscription link for subscribers who want to cancel */}
      {!tierLoading && isSubscribed && hasStripeCustomer && (
        <p className="text-center text-sm text-gray-500">
          Need to update your payment method or cancel?{" "}
          <button
            onClick={handleManageSubscription}
            className="text-brand-600 hover:underline font-medium"
          >
            Open billing portal
          </button>
        </p>
      )}

      <p className="text-center text-xs text-gray-400">
        Subscriptions are billed monthly. Cancel anytime from your Stripe billing portal.
        Payments are processed securely by Stripe — we never store your card details.
      </p>
    </div>
  );
}
