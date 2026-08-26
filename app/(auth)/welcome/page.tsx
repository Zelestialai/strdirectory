"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { MarketMultiSelect } from "@/components/MarketMultiSelect";
import { Home, Sprout, Wrench, Search, ChevronLeft } from "lucide-react";

type AccountType = "active_host" | "potential_host" | "vendor" | "user";

const ACCOUNT_TYPES: {
  value: AccountType;
  icon: React.ComponentType<{ className?: string }>;
  label: string;
  desc: string;
}[] = [
  { value: "active_host", icon: Home, label: "Active STR host", desc: "I manage short-term rentals on Airbnb, Vrbo, or direct booking" },
  { value: "potential_host", icon: Sprout, label: "Aspiring host", desc: "I'm planning to start renting — working with an agent or scoping properties" },
  { value: "vendor", icon: Wrench, label: "Service provider", desc: "I offer services to STR hosts — cleaning, photography, maintenance, and more" },
  { value: "user", icon: Search, label: "Just browsing", desc: "I want to explore the directory without a specific role" },
];

export default function WelcomePage() {
  const router = useRouter();
  const supabase = createClient();

  const [step, setStep] = useState<1 | 2>(1);
  const [accountType, setAccountType] = useState<AccountType>("active_host");

  const [hostMarkets, setHostMarkets] = useState<string[]>([]);
  const [airbnbUrl, setAirbnbUrl] = useState("");
  const [bookingUrl, setBookingUrl] = useState("");

  const [contactType, setContactType] = useState<"agent" | "property">("agent");
  const [agentName, setAgentName] = useState("");
  const [propertyAddress, setPropertyAddress] = useState("");
  const [propertyLocation, setPropertyLocation] = useState("");

  const [businessName, setBusinessName] = useState("");
  const [categoryId, setCategoryId] = useState("");
  const [vendorWebsite, setVendorWebsite] = useState("");
  const [vendorPhone, setVendorPhone] = useState("");
  const [vendorMarkets, setVendorMarkets] = useState<string[]>([]);
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([]);

  const [error, setError] = useState("");
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    // Guard: only unonboarded, logged-in users belong here.
    (async () => {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) { router.replace("/login"); return; }
      const { data: profile } = await supabase
        .from("profiles").select("onboarded, role").eq("id", user.id).maybeSingle();
      if (profile?.onboarded) {
        router.replace(profile.role === "host" ? "/host/dashboard" : "/");
      }
    })();
    supabase.from("categories").select("id, name").order("name").then(({ data }) => {
      if (data) setCategories(data);
    });
  }, []);

  const next = () => {
    setError("");
    if (accountType === "user") { submit("user"); return; }
    setStep(2);
  };

  const submit = async (roleOverride?: AccountType) => {
    const role = roleOverride ?? accountType;
    setError("");

    if (role === "active_host" && hostMarkets.length === 0) {
      setError("Select at least one market where you operate."); return;
    }
    if (role === "potential_host") {
      if (contactType === "agent" && !agentName.trim()) { setError("Enter your agent's name."); return; }
      if (contactType === "property" && !propertyAddress.trim()) { setError("Enter your property address."); return; }
      if (!propertyLocation.trim()) { setError("Enter the city or market for your property."); return; }
    }
    if (role === "vendor") {
      if (!businessName.trim()) { setError("Enter your business name."); return; }
      if (!categoryId) { setError("Select your service type."); return; }
    }

    setSubmitting(true);
    const payload: Record<string, unknown> = { role };
    if (role === "active_host") {
      payload.markets = hostMarkets;
      payload.airbnbUrl = airbnbUrl;
      payload.bookingUrl = bookingUrl;
    } else if (role === "potential_host") {
      if (contactType === "agent") payload.agentName = agentName;
      else payload.propertyAddress = propertyAddress;
      payload.propertyLocation = propertyLocation;
    } else if (role === "vendor") {
      payload.businessName = businessName;
      payload.categoryId = categoryId;
      payload.website = vendorWebsite;
      payload.phone = vendorPhone;
      payload.markets = vendorMarkets;
    }

    const res = await fetch("/api/onboarding/complete", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });
    const json = await res.json();
    setSubmitting(false);
    if (!res.ok) { setError(json.error || "Something went wrong."); return; }
    router.push(json.redirect || "/");
    router.refresh();
  };

  return (
    <div className="w-full max-w-md">
      <div className="card p-8">
        {step === 1 && (
          <div>
            <h1 className="text-2xl font-bold text-gray-900 mb-1">Welcome to STRVend</h1>
            <p className="text-sm text-gray-500 mb-6">One quick step — what best describes you?</p>
            <div className="space-y-2.5 mb-6">
              {ACCOUNT_TYPES.map(({ value, icon: Icon, label, desc }) => {
                const active = accountType === value;
                const isVendor = value === "vendor";
                return (
                  <button key={value} type="button" onClick={() => setAccountType(value)}
                    className={`w-full flex items-center gap-3 rounded-xl border-2 px-4 py-3.5 text-left transition-all ${
                      active ? isVendor ? "border-coral-500 bg-coral-50" : "border-brand-600 bg-brand-50"
                        : "border-gray-200 hover:border-gray-300 bg-white"}`}>
                    <span className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-lg ${
                      active ? isVendor ? "bg-coral-500 text-white" : "bg-brand-600 text-white" : "bg-gray-100 text-gray-400"}`}>
                      <Icon className="h-5 w-5" />
                    </span>
                    <div className="min-w-0">
                      <p className={`text-sm font-semibold ${active ? isVendor ? "text-coral-700" : "text-brand-700" : "text-gray-700"}`}>{label}</p>
                      <p className="text-xs text-gray-400 leading-snug mt-0.5">{desc}</p>
                    </div>
                  </button>
                );
              })}
            </div>
            {error && <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">{error}</div>}
            <button type="button" onClick={next} disabled={submitting} className="btn-primary w-full justify-center">
              {submitting ? "Setting up…" : "Continue"}
            </button>
          </div>
        )}

        {step === 2 && (
          <div>
            <button type="button" onClick={() => { setStep(1); setError(""); }}
              className="flex items-center gap-1 text-sm text-gray-400 hover:text-gray-600 mb-4 transition">
              <ChevronLeft className="h-4 w-4" /> Back
            </button>

            {accountType === "active_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your STR listings</h2>
                <p className="text-sm text-gray-500 mb-5">Tell us where you host so we can show relevant vendors.</p>
                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Airbnb listing URL <span className="text-gray-400 font-normal">(optional)</span></label>
                    <input type="url" value={airbnbUrl} onChange={(e) => setAirbnbUrl(e.target.value)} className="input" placeholder="https://www.airbnb.com/rooms/…" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Direct booking website <span className="text-gray-400 font-normal">(optional)</span></label>
                    <input type="url" value={bookingUrl} onChange={(e) => setBookingUrl(e.target.value)} className="input" placeholder="https://yourbooking.com" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">Markets you operate in <span className="text-red-500">*</span></label>
                    <MarketMultiSelect selected={hostMarkets} onChange={setHostMarkets} placeholder="Search markets…" />
                  </div>
                </div>
              </>
            )}

            {accountType === "potential_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your property plans</h2>
                <p className="text-sm text-gray-500 mb-5">Help us personalise your experience.</p>
                <div className="space-y-4 mb-5">
                  <div className="space-y-2">
                    {([{ value: "agent" as const, label: "Working with a real estate agent" },
                       { value: "property" as const, label: "I have a specific property in mind" }]).map(({ value, label }) => (
                      <label key={value} className={`flex items-center gap-2.5 rounded-lg border-2 px-3.5 py-2.5 cursor-pointer transition-all ${
                        contactType === value ? "border-brand-600 bg-brand-50" : "border-gray-200 hover:border-gray-300"}`}>
                        <input type="radio" name="contact_type" value={value} checked={contactType === value}
                          onChange={() => setContactType(value)} className="text-brand-600 focus:ring-brand-500" />
                        <span className="text-sm text-gray-700">{label}</span>
                      </label>
                    ))}
                  </div>
                  {contactType === "agent" ? (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Agent name <span className="text-red-500">*</span></label>
                      <input type="text" value={agentName} onChange={(e) => setAgentName(e.target.value)} className="input" placeholder="Sarah Johnson" />
                    </div>
                  ) : (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Property address <span className="text-red-500">*</span></label>
                      <input type="text" value={propertyAddress} onChange={(e) => setPropertyAddress(e.target.value)} className="input" placeholder="123 Beach Blvd, Miami, FL" />
                    </div>
                  )}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Location / market <span className="text-red-500">*</span></label>
                    <input type="text" value={propertyLocation} onChange={(e) => setPropertyLocation(e.target.value)} className="input" placeholder="Miami, FL" />
                  </div>
                </div>
              </>
            )}

            {accountType === "vendor" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">About your business</h2>
                <p className="text-sm text-gray-500 mb-5">You can add photos and a full description after this.</p>
                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Business name <span className="text-red-500">*</span></label>
                    <input type="text" value={businessName} onChange={(e) => setBusinessName(e.target.value)} className="input" placeholder="Sunshine STR Cleaning Co." />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Service type <span className="text-red-500">*</span></label>
                    <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className="input">
                      <option value="">Select a category…</option>
                      {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
                    </select>
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Website <span className="text-gray-400 font-normal">(optional)</span></label>
                      <input type="url" value={vendorWebsite} onChange={(e) => setVendorWebsite(e.target.value)} className="input" placeholder="https://…" />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Phone <span className="text-gray-400 font-normal">(optional)</span></label>
                      <input type="tel" value={vendorPhone} onChange={(e) => setVendorPhone(e.target.value)} className="input" placeholder="+1 (555) 000-0000" />
                    </div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">Markets you serve <span className="text-gray-400 font-normal">(optional)</span></label>
                    <MarketMultiSelect selected={vendorMarkets} onChange={setVendorMarkets} placeholder="Search markets…" />
                  </div>
                </div>
              </>
            )}

            {error && <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">{error}</div>}
            <button type="button" onClick={() => submit()} disabled={submitting} className="btn-primary w-full justify-center">
              {submitting ? "Finishing…" : "Finish setup"}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
