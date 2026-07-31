import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";
import Stripe from "stripe";
import { stripe } from "@/lib/stripe";
import { CreditCard, Zap, Star, CheckCircle2, AlertTriangle, Calendar } from "lucide-react";
import { ManageBillingButton } from "@/components/billing/ManageBillingButton";

export const metadata = { title: "Billing" };

type Tier = "free" | "pro" | "featured";

const TIER_META: Record<Tier, { name: string; icon: typeof Zap; color: string; bg: string }> = {
  free:     { name: "Free",     icon: CreditCard, color: "text-gray-600",  bg: "bg-gray-100" },
  pro:      { name: "Pro",      icon: Zap,        color: "text-blue-600",  bg: "bg-blue-50" },
  featured: { name: "Featured", icon: Star,       color: "text-amber-600", bg: "bg-amber-50" },
};

function fmtDate(d: Date) {
  return d.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
}

function fmtMoney(cents: number, currency = "usd") {
  return new Intl.NumberFormat("en-US", { style: "currency", currency }).format(cents / 100);
}

export default async function BillingPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/dashboard/billing");

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, subscription_tier, stripe_customer_id, stripe_subscription_id, subscription_expires_at")
    .eq("user_id", user.id)
    .single();

  const tier = (vendor?.subscription_tier ?? "free") as Tier;
  const meta = TIER_META[tier];
  const Icon = meta.icon;

  // Pull live subscription + payment method details from Stripe (best-effort)
  let sub: Stripe.Subscription | null = null;
  let card: { brand: string; last4: string; expMonth: number; expYear: number } | null = null;

  if (vendor?.stripe_subscription_id) {
    try {
      sub = await stripe.subscriptions.retrieve(vendor.stripe_subscription_id, {
        expand: ["default_payment_method"],
      });
      const pm = sub.default_payment_method as Stripe.PaymentMethod | null;
      if (pm && typeof pm !== "string" && pm.card) {
        card = {
          brand: pm.card.brand,
          last4: pm.card.last4,
          expMonth: pm.card.exp_month,
          expYear: pm.card.exp_year,
        };
      }
    } catch {
      // Subscription may have been deleted upstream — fall back to DB values
    }
  }

  // Some fields (current_period_end, cancel_at_period_end) shifted location
  // across Stripe API versions, so read them defensively to stay type-safe.
  /* eslint-disable @typescript-eslint/no-explicit-any */
  const subAny: any = sub;
  const item0 = subAny?.items?.data?.[0];
  const periodEndUnix: number | undefined =
    subAny?.current_period_end ?? item0?.current_period_end;
  const periodEnd = typeof periodEndUnix === "number" ? new Date(periodEndUnix * 1000) : null;
  const cancelsAtPeriodEnd: boolean = subAny?.cancel_at_period_end ?? false;
  const status: string = subAny?.status ?? (tier === "free" ? "free" : "unknown");
  const amount: number | null = item0?.price?.unit_amount ?? null;
  const interval: string | null = item0?.price?.recurring?.interval ?? null;
  /* eslint-enable @typescript-eslint/no-explicit-any */

  return (
    <div className="space-y-6 max-w-2xl">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Billing</h1>
        <p className="text-sm text-gray-500 mt-0.5">Manage your subscription and payment method.</p>
      </div>

      {/* Current plan */}
      <section className="rounded-xl border border-gray-200 bg-white overflow-hidden">
        <div className="p-5 flex items-start justify-between gap-4 flex-wrap">
          <div className="flex items-center gap-3">
            <span className={`flex h-11 w-11 items-center justify-center rounded-xl ${meta.bg}`}>
              <Icon className={`h-5 w-5 ${meta.color}`} />
            </span>
            <div>
              <div className="flex items-center gap-2">
                <h2 className="font-bold text-gray-900">{meta.name} plan</h2>
                {tier !== "free" && !cancelsAtPeriodEnd && status === "active" && (
                  <span className="inline-flex items-center gap-1 rounded-full bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700">
                    <CheckCircle2 className="h-3 w-3" /> Active
                  </span>
                )}
                {cancelsAtPeriodEnd && (
                  <span className="rounded-full bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700">
                    Cancels soon
                  </span>
                )}
                {status === "past_due" && (
                  <span className="rounded-full bg-red-50 px-2 py-0.5 text-xs font-medium text-red-700">
                    Past due
                  </span>
                )}
              </div>
              {amount && interval ? (
                <p className="text-sm text-gray-500 mt-0.5">
                  {fmtMoney(amount)} / {interval}
                </p>
              ) : (
                <p className="text-sm text-gray-500 mt-0.5">No paid subscription</p>
              )}
            </div>
          </div>

          {tier === "free" ? (
            <Link
              href="/dashboard/upgrade"
              className="inline-flex items-center gap-2 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 transition"
            >
              <Zap className="h-4 w-4" /> Upgrade
            </Link>
          ) : (
            <ManageBillingButton />
          )}
        </div>

        {/* Renewal / cancellation notice */}
        {tier !== "free" && periodEnd && (
          <div className="border-t border-gray-100 px-5 py-3 flex items-center gap-2 text-sm">
            <Calendar className="h-4 w-4 text-gray-400 shrink-0" />
            {cancelsAtPeriodEnd ? (
              <span className="text-amber-700">
                Your plan ends on <strong>{fmtDate(periodEnd)}</strong>. You&apos;ll keep {meta.name}{" "}
                features until then.
              </span>
            ) : (
              <span className="text-gray-600">
                Renews automatically on <strong>{fmtDate(periodEnd)}</strong>.
              </span>
            )}
          </div>
        )}
      </section>

      {/* Past-due warning */}
      {status === "past_due" && (
        <div className="rounded-xl border border-red-200 bg-red-50 p-4 flex items-start gap-3">
          <AlertTriangle className="h-5 w-5 text-red-500 shrink-0 mt-0.5" />
          <div className="text-sm text-red-800">
            <p className="font-semibold">Payment failed</p>
            <p className="mt-0.5">
              We couldn&apos;t process your last payment. Update your card to keep your listing active.
            </p>
          </div>
        </div>
      )}

      {/* Payment method */}
      {tier !== "free" && (
        <section className="rounded-xl border border-gray-200 bg-white overflow-hidden">
          <div className="px-5 py-4 border-b border-gray-100">
            <h2 className="font-semibold text-gray-900">Payment method</h2>
          </div>
          <div className="p-5 flex items-center justify-between gap-4 flex-wrap">
            {card ? (
              <div className="flex items-center gap-3">
                <span className="flex h-9 w-12 items-center justify-center rounded-md border border-gray-200 bg-gray-50 text-xs font-semibold uppercase text-gray-600">
                  {card.brand}
                </span>
                <div>
                  <p className="text-sm font-medium text-gray-800">•••• •••• •••• {card.last4}</p>
                  <p className="text-xs text-gray-400">
                    Expires {String(card.expMonth).padStart(2, "0")}/{card.expYear}
                  </p>
                </div>
              </div>
            ) : (
              <p className="text-sm text-gray-500">No card on file.</p>
            )}
            <ManageBillingButton label="Update" variant="secondary" />
          </div>
        </section>
      )}

      {/* Invoices / history — handled in Stripe portal */}
      {tier !== "free" && (
        <section className="rounded-xl border border-gray-200 bg-white p-5 flex items-center justify-between gap-4 flex-wrap">
          <div>
            <h2 className="font-semibold text-gray-900">Invoices &amp; receipts</h2>
            <p className="text-sm text-gray-500 mt-0.5">
              View and download past invoices in the billing portal.
            </p>
          </div>
          <ManageBillingButton label="View invoices" variant="secondary" />
        </section>
      )}

      {/* Free-tier upsell */}
      {tier === "free" && (
        <section className="rounded-xl border border-brand-100 bg-gradient-to-r from-brand-50 to-white p-5">
          <h2 className="font-semibold text-gray-900">Get more clients with a paid plan</h2>
          <p className="text-sm text-gray-600 mt-1 mb-4">
            Verified badge, priority search placement, full analytics and more. Plans start at $29/mo.
          </p>
          <Link
            href="/dashboard/upgrade"
            className="inline-flex items-center gap-2 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 transition"
          >
            <Zap className="h-4 w-4" /> See plans
          </Link>
        </section>
      )}
    </div>
  );
}
