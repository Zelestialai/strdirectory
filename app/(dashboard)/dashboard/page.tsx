import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { Star, MessageSquare, Eye, ArrowRight, PartyPopper, Zap } from "lucide-react";
import type { Vendor } from "@/types";
import { OnboardingChecklist } from "@/components/OnboardingChecklist";
import { getChecklistSteps, getCompletionScore } from "@/lib/profile-completeness";

export const metadata = { title: "Dashboard" };

export default async function DashboardPage({
  searchParams,
}: {
  searchParams?: { claimed?: string };
}) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: vendor } = await supabase
    .from("vendors")
    .select("*, services:vendor_services(*)")
    .eq("user_id", user!.id)
    .single();

  const v = vendor as Vendor | null;

  if (!v) {
    return (
      <div className="card p-10 text-center">
        <h2 className="text-xl font-bold mb-2">Create Your Listing</h2>
        <p className="text-gray-500 mb-6">You haven't created a vendor profile yet. Get started and start receiving inquiries from STR hosts in your area.</p>
        <Link href="/dashboard/profile" className="btn-primary">Create My Listing</Link>
      </div>
    );
  }

  const { count: inquiryCount } = await supabase
    .from("inquiries").select("*", { count: "exact", head: true }).eq("vendor_id", v.id).eq("status", "new");

  const steps = getChecklistSteps(v);
  const score = getCompletionScore(steps);

  return (
    <div className="space-y-6">
      {/* Claimed success banner */}
      {searchParams?.claimed === "1" && (
        <div className="rounded-xl border border-green-200 bg-green-50 px-5 py-4 flex items-start gap-3">
          <PartyPopper className="h-5 w-5 text-green-600 mt-0.5 shrink-0" />
          <div>
            <p className="font-semibold text-green-800">You've claimed your listing!</p>
            <p className="text-sm text-green-700 mt-0.5">
              Welcome to your vendor dashboard. Complete your profile below to start attracting hosts.
            </p>
          </div>
        </div>
      )}

      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Welcome back 👋</h1>
        <Link href={`/vendors/${v.slug}`} className="btn-secondary text-xs">
          <Eye className="h-3.5 w-3.5" /> View Public Profile
        </Link>
      </div>

      {/* Onboarding checklist — shown prominently until 100% */}
      {score < 100 && (
        <div>
          <OnboardingChecklist steps={steps} score={score} />
          {score < 50 && (
            <p className="text-xs text-center text-gray-400 mt-2">
              Vendors with complete profiles receive <span className="font-semibold text-gray-600">3× more inquiries</span> on average.
            </p>
          )}
        </div>
      )}

      {/* Complete badge */}
      {score === 100 && (
        <OnboardingChecklist steps={steps} score={score} />
      )}

      {/* Stats */}
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
        {[
          { label: "Avg Rating", value: v.avg_rating > 0 ? v.avg_rating.toFixed(1) : "—", icon: Star, color: "text-amber-500" },
          { label: "Total Reviews", value: v.review_count, icon: Star, color: "text-brand-500" },
          { label: "New Inquiries", value: inquiryCount ?? 0, icon: MessageSquare, color: "text-green-500" },
        ].map(({ label, value, icon: Icon, color }) => (
          <div key={label} className="card p-5 flex items-center gap-4">
            <span className={`flex h-10 w-10 items-center justify-center rounded-full bg-gray-50 ${color}`}>
              <Icon className="h-5 w-5" />
            </span>
            <div>
              <p className="text-2xl font-bold text-gray-900">{value}</p>
              <p className="text-xs text-gray-500">{label}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Status */}
      <div className="card p-5">
        <h3 className="font-semibold text-gray-800 mb-3">Listing Status</h3>
        <div className="flex flex-wrap gap-2 text-sm">
          <span className={`rounded-full px-3 py-1 font-medium ${v.is_active ? "bg-green-50 text-green-700" : "bg-gray-100 text-gray-500"}`}>
            {v.is_active ? "● Active" : "○ Inactive"}
          </span>
          {v.is_verified && <span className="rounded-full px-3 py-1 bg-brand-50 text-brand-700 font-medium">✓ Verified</span>}
          {v.subscription_tier === "featured" && <span className="rounded-full px-3 py-1 bg-amber-50 text-amber-700 font-medium">★ Featured</span>}
          {v.subscription_tier === "pro" && <span className="rounded-full px-3 py-1 bg-blue-50 text-blue-700 font-medium">⚡ Pro</span>}
        </div>
      </div>

      {/* Upgrade CTA — only shown on free tier */}
      {(!v.subscription_tier || v.subscription_tier === "free") && (
        <div className="card p-5 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 border-brand-100 bg-gradient-to-r from-brand-50 to-white">
          <div className="flex items-center gap-3">
            <div className="h-9 w-9 rounded-lg bg-brand-100 flex items-center justify-center shrink-0">
              <Zap className="h-5 w-5 text-brand-600" />
            </div>
            <div>
              <p className="font-semibold text-gray-900 text-sm">Upgrade to get more clients</p>
              <p className="text-xs text-gray-500 mt-0.5">Get a Featured badge, top search placement, and priority support.</p>
            </div>
          </div>
          <Link href="/dashboard/upgrade" className="shrink-0 btn-primary text-xs px-4 py-2">
            See Plans →
          </Link>
        </div>
      )}

      {/* Quick links */}
      <div className="card p-5 space-y-2">
        <h3 className="font-semibold text-gray-800 mb-3">Quick Actions</h3>
        {[
          { href: "/dashboard/profile", label: "Edit your listing" },
          { href: "/dashboard/inquiries", label: `View inquiries (${inquiryCount ?? 0} new)` },
          { href: "/dashboard/reviews", label: "See your reviews" },
          { href: `/vendors/${v.slug}`, label: "Preview public profile" },
        ].map(({ href, label }) => (
          <Link key={href} href={href} className="flex items-center justify-between rounded-lg p-3 text-sm text-gray-700 hover:bg-gray-50 transition">
            {label} <ArrowRight className="h-4 w-4 text-gray-400" />
          </Link>
        ))}
      </div>
    </div>
  );
}
