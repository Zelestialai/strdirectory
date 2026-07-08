"use client";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import { createClient } from "@/lib/supabase/client";
import {
  CheckCircle2, Bookmark, MessageSquare, ArrowRight,
  Home, Sprout, Search, MapPin, Star, ChevronRight
} from "lucide-react";
import type { Vendor } from "@/types";

type Step = 1 | 2 | 3;

// ── Inline mini VendorCard for step 2 ────────────────────────────────────────
function OnboardingVendorCard({
  vendor,
  onSaved,
}: {
  vendor: Vendor;
  onSaved: () => void;
}) {
  const supabase = createClient();
  const [saved, setSaved] = useState(false);
  const [loading, setLoading] = useState(false);

  const save = async () => {
    setLoading(true);
    const res = await fetch("/api/saved-vendors", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ vendor_id: vendor.id }),
    });
    if (res.ok) {
      setSaved(true);
      onSaved();
    }
    setLoading(false);
  };

  return (
    <div className={`card p-4 flex gap-3 items-start transition-all ${saved ? "ring-2 ring-brand-500" : ""}`}>
      {/* Logo / initial */}
      <div className="h-10 w-10 shrink-0 rounded-lg bg-brand-50 flex items-center justify-center overflow-hidden border border-brand-100">
        {vendor.logo_url ? (
          <Image src={vendor.logo_url} alt={vendor.business_name} width={40} height={40} className="object-contain" />
        ) : (
          <span className="text-brand-600 font-bold text-lg">{vendor.business_name[0]}</span>
        )}
      </div>

      <div className="flex-1 min-w-0">
        <p className="font-semibold text-gray-900 text-sm truncate">{vendor.business_name}</p>
        <p className="text-xs text-gray-400 truncate">{vendor.category?.name}</p>
        {(vendor.city || vendor.avg_rating > 0) && (
          <div className="flex items-center gap-2 mt-0.5">
            {vendor.city && (
              <span className="flex items-center gap-0.5 text-xs text-gray-400">
                <MapPin className="h-3 w-3" />{vendor.city}{vendor.state ? `, ${vendor.state}` : ""}
              </span>
            )}
            {vendor.avg_rating > 0 && (
              <span className="flex items-center gap-0.5 text-xs text-amber-500">
                <Star className="h-3 w-3 fill-amber-400" />{vendor.avg_rating.toFixed(1)}
              </span>
            )}
          </div>
        )}
      </div>

      <div className="flex items-center gap-2 shrink-0">
        <Link href={`/vendors/${vendor.slug}`} target="_blank" className="text-xs text-brand-600 hover:underline">
          View
        </Link>
        <button
          type="button"
          onClick={save}
          disabled={saved || loading}
          className={`flex items-center gap-1 rounded-lg px-2.5 py-1.5 text-xs font-medium transition-all ${
            saved
              ? "bg-brand-100 text-brand-700 cursor-default"
              : "bg-brand-600 text-white hover:bg-brand-700"
          }`}
        >
          <Bookmark className="h-3.5 w-3.5" />
          {saved ? "Saved!" : loading ? "…" : "Save"}
        </button>
      </div>
    </div>
  );
}

// ── Main page ─────────────────────────────────────────────────────────────────
export default function HostOnboardingPage() {
  const router = useRouter();
  const supabase = createClient();

  const [step, setStep] = useState<Step>(1);
  const [firstName, setFirstName] = useState("there");
  const [hostType, setHostType] = useState<"active_host" | "potential_host">("active_host");
  const [markets, setMarkets] = useState<string[]>([]);
  const [vendors, setVendors] = useState<Vendor[]>([]);
  const [savedCount, setSavedCount] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const init = async () => {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) { router.push("/login"); return; }

      const meta = user.user_metadata ?? {};
      const name = meta.full_name ?? "";
      setFirstName(name.split(" ")[0] || "there");
      setHostType(meta.role === "potential_host" ? "potential_host" : "active_host");

      // Get markets from host_profiles (set by trigger) or metadata fallback
      const { data: hp } = await supabase
        .from("host_profiles")
        .select("markets")
        .eq("id", user.id)
        .single();

      const hostMarkets: string[] = hp?.markets?.length ? hp.markets : (meta.markets ?? []);
      setMarkets(hostMarkets);

      // Load vendors — filter to host's markets if any, else show featured/verified
      let query = supabase
        .from("vendors")
        .select("*, category:categories(name, slug)")
        .eq("is_active", true)
        .limit(8);

      if (hostMarkets.length > 0) {
        // vendors whose markets array overlaps with host's markets
        query = query.overlaps("markets", hostMarkets);
      } else {
        query = query.order("avg_rating", { ascending: false });
      }

      const { data: v } = await query;
      setVendors((v ?? []) as Vendor[]);

      // Check existing saved count
      const { count } = await supabase
        .from("saved_vendors")
        .select("*", { count: "exact", head: true })
        .eq("host_id", user.id);
      setSavedCount(count ?? 0);

      setLoading(false);
    };
    init();
  }, []);

  const onVendorSaved = () => setSavedCount((n) => n + 1);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-24">
        <div className="h-8 w-8 animate-spin rounded-full border-4 border-brand-200 border-t-brand-600" />
      </div>
    );
  }

  // ── Step progress bar ───────────────────────────────────────────────────────
  const steps = [
    { n: 1, label: "Welcome" },
    { n: 2, label: "Find vendors" },
    { n: 3, label: "Your checklist" },
  ];

  return (
    <div className="max-w-2xl mx-auto py-4 space-y-6">
      {/* Progress */}
      <div className="flex items-center gap-2">
        {steps.map(({ n, label }, i) => (
          <div key={n} className="flex items-center gap-2 flex-1 last:flex-none">
            <div className={`flex items-center gap-1.5 text-xs font-medium ${step >= n ? "text-brand-600" : "text-gray-400"}`}>
              <div className={`h-6 w-6 rounded-full flex items-center justify-center text-xs font-bold transition-all ${
                step > n ? "bg-brand-600 text-white" : step === n ? "bg-brand-600 text-white" : "bg-gray-100 text-gray-400"
              }`}>
                {step > n ? <CheckCircle2 className="h-3.5 w-3.5" /> : n}
              </div>
              <span className="hidden sm:block">{label}</span>
            </div>
            {i < steps.length - 1 && (
              <div className={`flex-1 h-px transition-all ${step > n ? "bg-brand-400" : "bg-gray-200"}`} />
            )}
          </div>
        ))}
      </div>

      {/* ── Step 1: Welcome ── */}
      {step === 1 && (
        <div className="card p-8 text-center space-y-6">
          <div className="inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-brand-50 mx-auto">
            {hostType === "active_host"
              ? <Home className="h-8 w-8 text-brand-600" />
              : <Sprout className="h-8 w-8 text-brand-600" />}
          </div>

          <div className="space-y-2">
            <h1 className="text-2xl font-bold text-gray-900">Welcome to STRVend, {firstName}!</h1>
            <p className="text-gray-500 max-w-sm mx-auto">
              {hostType === "active_host"
                ? "You're set up as an active STR host. We'll help you find trusted vendors for your properties."
                : "You're set up as an aspiring host. We'll help you find the right service providers as you get started."}
            </p>
          </div>

          {markets.length > 0 && (
            <div className="rounded-xl bg-brand-50 border border-brand-100 p-4 text-left">
              <p className="text-xs font-semibold text-brand-600 mb-2 uppercase tracking-wide">Your markets</p>
              <div className="flex flex-wrap gap-1.5">
                {markets.map((m) => (
                  <span key={m} className="text-xs bg-brand-100 text-brand-700 rounded-full px-2.5 py-1 font-medium capitalize">
                    {m.replace(/-/g, " ")}
                  </span>
                ))}
              </div>
              <p className="text-xs text-brand-500 mt-2">We'll show vendors who serve these markets.</p>
            </div>
          )}

          <div className="space-y-3">
            <p className="text-sm font-medium text-gray-700">Here's what we'll do next:</p>
            <div className="space-y-2 text-left">
              {[
                { icon: Search, label: "Browse vendors in your market" },
                { icon: Bookmark, label: "Save your favourites for later" },
                { icon: MessageSquare, label: "Contact vendors when you're ready" },
              ].map(({ icon: Icon, label }) => (
                <div key={label} className="flex items-center gap-2.5 text-sm text-gray-600">
                  <div className="h-7 w-7 rounded-full bg-brand-50 flex items-center justify-center shrink-0">
                    <Icon className="h-3.5 w-3.5 text-brand-600" />
                  </div>
                  {label}
                </div>
              ))}
            </div>
          </div>

          <button
            onClick={() => setStep(2)}
            className="btn-primary justify-center w-full sm:w-auto px-10"
          >
            Let's find vendors <ArrowRight className="h-4 w-4" />
          </button>
        </div>
      )}

      {/* ── Step 2: Find & save a vendor ── */}
      {step === 2 && (
        <div className="space-y-5">
          <div className="card p-6 text-center space-y-2">
            <div className="inline-flex h-12 w-12 items-center justify-center rounded-xl bg-brand-50 mx-auto">
              <Search className="h-6 w-6 text-brand-600" />
            </div>
            <h2 className="text-xl font-bold text-gray-900">Find your first vendor</h2>
            <p className="text-sm text-gray-500">
              {markets.length > 0
                ? `Showing vendors who serve your markets. Save any that look interesting.`
                : "Browse top-rated vendors and save any that look useful."}
            </p>
            {savedCount > 0 && (
              <div className="inline-flex items-center gap-1.5 text-xs text-brand-700 bg-brand-50 rounded-full px-3 py-1.5 border border-brand-100 font-medium">
                <CheckCircle2 className="h-3.5 w-3.5" /> {savedCount} vendor{savedCount !== 1 ? "s" : ""} saved
              </div>
            )}
          </div>

          {vendors.length > 0 ? (
            <div className="space-y-2">
              {vendors.map((v) => (
                <OnboardingVendorCard key={v.id} vendor={v} onSaved={onVendorSaved} />
              ))}
            </div>
          ) : (
            <div className="card p-8 text-center text-gray-400">
              <Search className="h-8 w-8 mx-auto mb-3 opacity-40" />
              <p className="text-sm">No vendors found for your markets yet.</p>
              <Link href="/vendors" className="text-brand-600 text-sm hover:underline mt-1 inline-block">
                Browse all vendors →
              </Link>
            </div>
          )}

          <div className="flex items-center justify-between pt-2">
            <button onClick={() => setStep(1)} className="text-sm text-gray-400 hover:text-gray-600">
              ← Back
            </button>
            <div className="flex items-center gap-3">
              <button onClick={() => setStep(3)} className="text-sm text-gray-500 hover:text-gray-700">
                Skip for now
              </button>
              <button onClick={() => setStep(3)} className="btn-primary px-6">
                Continue <ChevronRight className="h-4 w-4" />
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ── Step 3: Checklist ── */}
      {step === 3 && (
        <div className="card p-8 space-y-6">
          <div className="text-center space-y-2">
            <div className="inline-flex h-14 w-14 items-center justify-center rounded-2xl bg-brand-50 mx-auto">
              <CheckCircle2 className="h-7 w-7 text-brand-600" />
            </div>
            <h2 className="text-2xl font-bold text-gray-900">You're all set!</h2>
            <p className="text-sm text-gray-500">Here's your STRVend checklist. Come back to your dashboard any time.</p>
          </div>

          <div className="space-y-3">
            {[
              {
                done: true,
                icon: Home,
                label: "Create your host account",
                desc: "Done! You're signed up as a " + (hostType === "active_host" ? "active STR host" : "aspiring host"),
              },
              {
                done: savedCount > 0,
                icon: Bookmark,
                label: "Save your first vendor",
                desc: savedCount > 0
                  ? `You've saved ${savedCount} vendor${savedCount !== 1 ? "s" : ""}`
                  : "Browse vendors and click Save on any that interest you",
                href: savedCount === 0 ? "/vendors" : undefined,
              },
              {
                done: false,
                icon: MessageSquare,
                label: "Send your first inquiry",
                desc: "Contact a vendor to ask about availability or pricing",
                href: "/vendors",
              },
            ].map(({ done, icon: Icon, label, desc, href }) => (
              <div
                key={label}
                className={`flex items-start gap-3 rounded-xl p-4 border transition-all ${
                  done ? "bg-brand-50 border-brand-200" : "bg-white border-gray-200"
                }`}
              >
                <div className={`h-8 w-8 rounded-full flex items-center justify-center shrink-0 ${
                  done ? "bg-brand-600" : "bg-gray-100"
                }`}>
                  {done
                    ? <CheckCircle2 className="h-4 w-4 text-white" />
                    : <Icon className="h-4 w-4 text-gray-400" />}
                </div>
                <div className="flex-1 min-w-0">
                  <p className={`text-sm font-semibold ${done ? "text-brand-700" : "text-gray-700"}`}>{label}</p>
                  <p className="text-xs text-gray-500 mt-0.5">{desc}</p>
                </div>
                {!done && href && (
                  <Link href={href} className="shrink-0 text-xs text-brand-600 hover:underline font-medium">
                    Go →
                  </Link>
                )}
              </div>
            ))}
          </div>

          <div className="flex flex-col sm:flex-row gap-3 pt-2">
            <Link href="/host/dashboard" className="btn-primary justify-center flex-1">
              Go to my dashboard <ArrowRight className="h-4 w-4" />
            </Link>
            <Link href="/vendors" className="btn-secondary justify-center flex-1">
              <Search className="h-4 w-4" /> Browse vendors
            </Link>
          </div>
        </div>
      )}
    </div>
  );
}
