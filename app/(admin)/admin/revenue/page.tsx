import { supabaseAdmin } from "@/lib/supabase/admin";
import { DollarSign, TrendingUp, Zap, Star, UserX, ExternalLink } from "lucide-react";
import Link from "next/link";

export const metadata = { title: "Revenue — Admin" };

const PLAN_PRICES: Record<string, number> = {
  pro: 29,
  featured: 79,
};

function formatMRR(cents: number) {
  return `$${cents.toLocaleString()}`;
}

function tierBadge(tier: string) {
  if (tier === "featured") {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-amber-50 border border-amber-200 px-2.5 py-0.5 text-xs font-semibold text-amber-700">
        <Star className="h-3 w-3" /> Featured
      </span>
    );
  }
  if (tier === "pro") {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-blue-50 border border-blue-200 px-2.5 py-0.5 text-xs font-semibold text-blue-700">
        <Zap className="h-3 w-3" /> Pro
      </span>
    );
  }
  return <span className="text-xs text-gray-400">Free</span>;
}

export default async function RevenuePage() {
  // ── Fetch all paid vendors ─────────────────────────────────────────────────
  const { data: paidVendors } = await supabaseAdmin
    .from("vendors")
    .select("id, business_name, slug, city, state, subscription_tier, stripe_customer_id, stripe_subscription_id, subscription_expires_at, created_at")
    .in("subscription_tier", ["pro", "featured"])
    .order("subscription_tier", { ascending: false })
    .order("created_at", { ascending: false });

  const subscribers = paidVendors ?? [];

  // ── Fetch recently churned (free tier with a stripe_customer_id = had a plan) ─
  const { data: churned } = await supabaseAdmin
    .from("vendors")
    .select("id, business_name, slug, city, state, stripe_customer_id, subscription_expires_at")
    .eq("subscription_tier", "free")
    .not("stripe_customer_id", "is", null)
    .order("subscription_expires_at", { ascending: false })
    .limit(10);

  // ── MRR calculations ────────────────────────────────────────────────────────
  const proCount = subscribers.filter((v) => v.subscription_tier === "pro").length;
  const featuredCount = subscribers.filter((v) => v.subscription_tier === "featured").length;
  const proMRR = proCount * PLAN_PRICES.pro;
  const featuredMRR = featuredCount * PLAN_PRICES.featured;
  const totalMRR = proMRR + featuredMRR;

  const stats = [
    {
      label: "Total MRR",
      value: formatMRR(totalMRR),
      sub: `${subscribers.length} paying subscriber${subscribers.length !== 1 ? "s" : ""}`,
      icon: DollarSign,
      color: "text-green-600",
      bg: "bg-green-50",
    },
    {
      label: "Pro MRR",
      value: formatMRR(proMRR),
      sub: `${proCount} Pro subscriber${proCount !== 1 ? "s" : ""} × $${PLAN_PRICES.pro}/mo`,
      icon: Zap,
      color: "text-blue-600",
      bg: "bg-blue-50",
    },
    {
      label: "Featured MRR",
      value: formatMRR(featuredMRR),
      sub: `${featuredCount} Featured subscriber${featuredCount !== 1 ? "s" : ""} × $${PLAN_PRICES.featured}/mo`,
      icon: Star,
      color: "text-amber-600",
      bg: "bg-amber-50",
    },
    {
      label: "Churned",
      value: churned?.length ?? 0,
      sub: "vendors who had a plan, now free",
      icon: UserX,
      color: "text-red-500",
      bg: "bg-red-50",
    },
    {
      label: "Annual Run Rate",
      value: `$${(totalMRR * 12).toLocaleString()}`,
      sub: "projected from current MRR",
      icon: TrendingUp,
      color: "text-brand-600",
      bg: "bg-brand-50",
    },
  ];

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Revenue</h1>
        <p className="text-sm text-gray-500 mt-0.5">Subscription revenue from paid vendor tiers</p>
      </div>

      {/* Stat cards */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-5">
        {stats.map(({ label, value, sub, icon: Icon, color, bg }) => (
          <div key={label} className="card p-4 space-y-2">
            <div className={`inline-flex h-8 w-8 items-center justify-center rounded-lg ${bg}`}>
              <Icon className={`h-4 w-4 ${color}`} />
            </div>
            <p className="text-2xl font-bold text-gray-900 leading-none">{value}</p>
            <div>
              <p className="text-xs font-medium text-gray-700">{label}</p>
              <p className="text-xs text-gray-400 mt-0.5 leading-snug">{sub}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Tier breakdown bar */}
      {totalMRR > 0 && (
        <div className="card p-5">
          <h2 className="text-sm font-semibold text-gray-800 mb-3">Revenue breakdown</h2>
          <div className="flex h-4 w-full rounded-full overflow-hidden gap-0.5">
            {featuredMRR > 0 && (
              <div
                className="bg-amber-400 h-full"
                style={{ width: `${(featuredMRR / totalMRR) * 100}%` }}
                title={`Featured: $${featuredMRR}/mo`}
              />
            )}
            {proMRR > 0 && (
              <div
                className="bg-blue-400 h-full"
                style={{ width: `${(proMRR / totalMRR) * 100}%` }}
                title={`Pro: $${proMRR}/mo`}
              />
            )}
          </div>
          <div className="flex items-center gap-5 mt-2.5">
            <div className="flex items-center gap-1.5 text-xs text-gray-500">
              <div className="h-2.5 w-2.5 rounded-sm bg-amber-400" />
              Featured — ${featuredMRR}/mo ({featuredCount})
            </div>
            <div className="flex items-center gap-1.5 text-xs text-gray-500">
              <div className="h-2.5 w-2.5 rounded-sm bg-blue-400" />
              Pro — ${proMRR}/mo ({proCount})
            </div>
          </div>
        </div>
      )}

      {/* Active subscribers table */}
      <div className="card overflow-hidden">
        <div className="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
          <h2 className="font-semibold text-gray-800">Active Subscribers</h2>
          <span className="text-xs text-gray-400">{subscribers.length} total</span>
        </div>

        {subscribers.length === 0 ? (
          <div className="px-5 py-12 text-center text-gray-400">
            <DollarSign className="mx-auto h-8 w-8 opacity-30 mb-2" />
            <p className="text-sm">No paid subscribers yet.</p>
            <p className="text-xs mt-1">Set up your Stripe price IDs in Vercel env vars to start accepting payments.</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-100">
                <tr>
                  {["Vendor", "Tier", "Location", "Next billing", "Stripe"].map((h) => (
                    <th key={h} className="px-4 py-2.5 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {subscribers.map((v) => (
                  <tr key={v.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-4 py-3">
                      <Link
                        href={`/vendors/${v.slug}`}
                        className="font-medium text-gray-900 hover:text-brand-700 transition flex items-center gap-1"
                      >
                        {v.business_name}
                        <ExternalLink className="h-3 w-3 text-gray-300" />
                      </Link>
                    </td>
                    <td className="px-4 py-3">{tierBadge(v.subscription_tier)}</td>
                    <td className="px-4 py-3 text-gray-500">
                      {[v.city, v.state].filter(Boolean).join(", ") || "—"}
                    </td>
                    <td className="px-4 py-3 text-gray-500">
                      {v.subscription_expires_at
                        ? new Date(v.subscription_expires_at).toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" })
                        : "—"}
                    </td>
                    <td className="px-4 py-3">
                      {v.stripe_customer_id ? (
                        <a
                          href={`https://dashboard.stripe.com/customers/${v.stripe_customer_id}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs text-brand-600 hover:underline flex items-center gap-1"
                        >
                          {v.stripe_customer_id.slice(0, 14)}…
                          <ExternalLink className="h-3 w-3" />
                        </a>
                      ) : (
                        <span className="text-xs text-gray-300">—</span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Churned vendors table */}
      {churned && churned.length > 0 && (
        <div className="card overflow-hidden">
          <div className="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
            <h2 className="font-semibold text-gray-800">Recently Churned</h2>
            <span className="text-xs text-gray-400">Had a paid plan, now on free</span>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-100">
                <tr>
                  {["Vendor", "Location", "Plan ended", "Stripe"].map((h) => (
                    <th key={h} className="px-4 py-2.5 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {churned.map((v) => (
                  <tr key={v.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-4 py-3">
                      <Link href={`/vendors/${v.slug}`} className="font-medium text-gray-900 hover:text-brand-700 transition">
                        {v.business_name}
                      </Link>
                    </td>
                    <td className="px-4 py-3 text-gray-500">
                      {[v.city, v.state].filter(Boolean).join(", ") || "—"}
                    </td>
                    <td className="px-4 py-3 text-gray-500">
                      {v.subscription_expires_at
                        ? new Date(v.subscription_expires_at).toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" })
                        : "—"}
                    </td>
                    <td className="px-4 py-3">
                      {v.stripe_customer_id ? (
                        <a
                          href={`https://dashboard.stripe.com/customers/${v.stripe_customer_id}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs text-brand-600 hover:underline"
                        >
                          {v.stripe_customer_id.slice(0, 14)}…
                        </a>
                      ) : "—"}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      <p className="text-xs text-gray-400 text-center">
        MRR is calculated from vendor subscription tiers in the database.
        For real-time Stripe data, visit your{" "}
        <a href="https://dashboard.stripe.com" target="_blank" rel="noopener noreferrer" className="text-brand-500 hover:underline">
          Stripe Dashboard
        </a>.
      </p>
    </div>
  );
}
