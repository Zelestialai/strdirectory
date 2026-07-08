"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import { MarketMultiSelect } from "@/components/MarketMultiSelect";
import { Eye, EyeOff, CheckCircle2, Home, Sprout, Wrench, Search, ChevronLeft } from "lucide-react";

type AccountType = "active_host" | "potential_host" | "vendor" | "user";

const ACCOUNT_TYPES: {
  value: AccountType;
  icon: React.ComponentType<{ className?: string }>;
  label: string;
  desc: string;
}[] = [
  {
    value: "active_host",
    icon: Home,
    label: "Active STR host",
    desc: "I manage short-term rentals on Airbnb, Vrbo, or direct booking",
  },
  {
    value: "potential_host",
    icon: Sprout,
    label: "Aspiring host",
    desc: "I'm planning to start renting — working with an agent or scoping properties",
  },
  {
    value: "vendor",
    icon: Wrench,
    label: "Service provider",
    desc: "I offer services to STR hosts — cleaning, photography, maintenance, and more",
  },
  {
    value: "user",
    icon: Search,
    label: "Just browsing",
    desc: "I want to explore the directory without signing up for a specific role",
  },
];

function StepIndicator({ step, total }: { step: number; total: number }) {
  return (
    <div className="flex items-center gap-2 mb-6">
      {Array.from({ length: total }).map((_, i) => (
        <div key={i} className="flex items-center gap-2 flex-1 last:flex-none">
          <div
            className={`h-2 rounded-full flex-1 transition-all ${
              i < step ? "bg-brand-600" : "bg-gray-200"
            }`}
          />
        </div>
      ))}
      <span className="text-xs text-gray-400 shrink-0">
        Step {step} of {total}
      </span>
    </div>
  );
}

export default function RegisterPage() {
  const router = useRouter();
  const supabase = createClient();

  const [step, setStep] = useState<1 | 2 | 3>(1);
  const [accountType, setAccountType] = useState<AccountType>("active_host");

  // Active host
  const [airbnbUrl, setAirbnbUrl] = useState("");
  const [bookingUrl, setBookingUrl] = useState("");
  const [hostMarkets, setHostMarkets] = useState<string[]>([]);

  // Potential host
  const [contactType, setContactType] = useState<"agent" | "property">("agent");
  const [agentName, setAgentName] = useState("");
  const [propertyAddress, setPropertyAddress] = useState("");
  const [propertyLocation, setPropertyLocation] = useState("");

  // Vendor
  const [businessName, setBusinessName] = useState("");
  const [categoryId, setCategoryId] = useState("");
  const [vendorWebsite, setVendorWebsite] = useState("");
  const [vendorPhone, setVendorPhone] = useState("");
  const [vendorMarkets, setVendorMarkets] = useState<string[]>([]);
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([]);

  // Credentials
  const [fullName, setFullName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const [stepError, setStepError] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [emailSent, setEmailSent] = useState(false);

  const totalSteps = accountType === "user" ? 2 : 3;

  useEffect(() => {
    supabase.from("categories").select("id, name").order("name").then(({ data }) => {
      if (data) setCategories(data);
    });
  }, []);

  const goToStep2 = () => {
    setStepError("");
    if (accountType === "user") { setStep(3); return; }
    setStep(2);
  };

  const goToStep3 = () => {
    setStepError("");
    if (accountType === "active_host" && hostMarkets.length === 0) {
      setStepError("Select at least one market where you operate."); return;
    }
    if (accountType === "potential_host") {
      if (contactType === "agent" && !agentName.trim()) { setStepError("Enter your real estate agent's name."); return; }
      if (contactType === "property" && !propertyAddress.trim()) { setStepError("Enter your property address."); return; }
      if (!propertyLocation.trim()) { setStepError("Enter the city or market where your property is located."); return; }
    }
    if (accountType === "vendor") {
      if (!businessName.trim()) { setStepError("Enter your business name."); return; }
      if (!categoryId) { setStepError("Select your service type."); return; }
    }
    setStep(3);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setStepError("");
    if (!fullName.trim()) { setStepError("Enter your full name."); return; }
    if (!email.trim()) { setStepError("Enter your email address."); return; }
    if (password.length < 8) { setStepError("Password must be at least 8 characters."); return; }

    setIsSubmitting(true);

    const next =
      accountType === "vendor" ? "/dashboard/onboarding" :
      accountType === "active_host" || accountType === "potential_host" ? "/host/dashboard" :
      "/";

    const metadata: Record<string, unknown> = { full_name: fullName.trim(), role: accountType };

    if (accountType === "active_host") {
      if (airbnbUrl.trim()) metadata.airbnb_url = airbnbUrl.trim();
      if (bookingUrl.trim()) metadata.direct_booking_url = bookingUrl.trim();
      metadata.markets = hostMarkets;
    } else if (accountType === "potential_host") {
      if (contactType === "agent") metadata.agent_name = agentName.trim();
      else metadata.property_address = propertyAddress.trim();
      metadata.property_location = propertyLocation.trim();
    } else if (accountType === "vendor") {
      metadata.business_name = businessName.trim();
      metadata.category_id = categoryId;
      if (vendorWebsite.trim()) metadata.website = vendorWebsite.trim();
      if (vendorPhone.trim()) metadata.phone = vendorPhone.trim();
      metadata.markets = vendorMarkets;
    }

    const { data, error } = await supabase.auth.signUp({
      email: email.trim(),
      password,
      options: {
        data: metadata,
        emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL}/auth/callback?next=${encodeURIComponent(next)}`,
      },
    });

    setIsSubmitting(false);

    if (error) { setStepError(error.message); }
    else if (data.session) { router.push(next); router.refresh(); }
    else { setEmailSent(true); }
  };

  if (emailSent) {
    return (
      <div className="w-full max-w-md">
        <div className="card p-8 text-center">
          <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-brand-50 mx-auto mb-4">
            <CheckCircle2 className="h-7 w-7 text-brand-600" />
          </div>
          <h2 className="text-xl font-bold mb-2">Check your inbox</h2>
          <p className="text-sm text-gray-500 mb-1">We sent a confirmation link to</p>
          <p className="text-sm font-medium text-gray-800 mb-4">{email}</p>
          <p className="text-xs text-gray-400">
            Click the link to activate your account.{" "}
            <button className="text-brand-600 hover:underline" onClick={() => setEmailSent(false)}>
              Try again
            </button>
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full max-w-md">
      <div className="card p-8">
        <StepIndicator step={step === 3 && accountType === "user" ? 2 : step} total={totalSteps} />

        {/* Step 1: Account type */}
        {step === 1 && (
          <div>
            <h1 className="text-2xl font-bold text-gray-900 mb-1">Join STRVend</h1>
            <p className="text-sm text-gray-500 mb-6">What best describes you?</p>
            <div className="space-y-2.5 mb-6">
              {ACCOUNT_TYPES.map(({ value, icon: Icon, label, desc }) => {
                const active = accountType === value;
                const isVendor = value === "vendor";
                return (
                  <button
                    key={value}
                    type="button"
                    onClick={() => setAccountType(value)}
                    className={`w-full flex items-center gap-3 rounded-xl border-2 px-4 py-3.5 text-left transition-all ${
                      active
                        ? isVendor ? "border-coral-500 bg-coral-50" : "border-brand-600 bg-brand-50"
                        : "border-gray-200 hover:border-gray-300 bg-white"
                    }`}
                  >
                    <span className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-lg ${
                      active
                        ? isVendor ? "bg-coral-500 text-white" : "bg-brand-600 text-white"
                        : "bg-gray-100 text-gray-400"
                    }`}>
                      <Icon className="h-4.5 w-4.5" />
                    </span>
                    <div className="min-w-0">
                      <p className={`text-sm font-semibold ${active ? isVendor ? "text-coral-700" : "text-brand-700" : "text-gray-700"}`}>
                        {label}
                      </p>
                      <p className="text-xs text-gray-400 leading-snug mt-0.5">{desc}</p>
                    </div>
                    {active && (
                      <div className={`ml-auto h-4 w-4 rounded-full flex items-center justify-center shrink-0 ${isVendor ? "bg-coral-500" : "bg-brand-600"}`}>
                        <div className="h-1.5 w-1.5 rounded-full bg-white" />
                      </div>
                    )}
                  </button>
                );
              })}
            </div>
            <button type="button" onClick={goToStep2} className="btn-primary w-full justify-center">
              Continue
            </button>
          </div>
        )}

        {/* Step 2: Role-specific details */}
        {step === 2 && (
          <div>
            <button type="button" onClick={() => { setStep(1); setStepError(""); }}
              className="flex items-center gap-1 text-sm text-gray-400 hover:text-gray-600 mb-4 transition">
              <ChevronLeft className="h-4 w-4" /> Back
            </button>

            {accountType === "active_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your STR listings</h2>
                <p className="text-sm text-gray-500 mb-5">Tell us where you host so we can show relevant vendors.</p>
                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Airbnb listing URL <span className="text-gray-400 font-normal">(optional)</span>
                    </label>
                    <input type="url" value={airbnbUrl} onChange={(e) => setAirbnbUrl(e.target.value)}
                      className="input" placeholder="https://www.airbnb.com/rooms/…" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Direct booking website <span className="text-gray-400 font-normal">(optional)</span>
                    </label>
                    <input type="url" value={bookingUrl} onChange={(e) => setBookingUrl(e.target.value)}
                      className="input" placeholder="https://yourbooking.com" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">
                      Markets you operate in <span className="text-red-500">*</span>
                    </label>
                    <MarketMultiSelect selected={hostMarkets} onChange={setHostMarkets} placeholder="Search markets…" />
                    <p className="mt-1.5 text-xs text-gray-400">Select all markets where you have STR properties.</p>
                  </div>
                </div>
              </>
            )}

            {accountType === "potential_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your property plans</h2>
                <p className="text-sm text-gray-500 mb-5">Help us personalise your experience.</p>
                <div className="space-y-4 mb-5">
                  <div>
                    <p className="text-sm font-medium text-gray-700 mb-2">How would you describe your situation?</p>
                    <div className="space-y-2">
                      {([
                        { value: "agent" as const, label: "Working with a real estate agent" },
                        { value: "property" as const, label: "I have a specific property in mind" },
                      ]).map(({ value, label }) => (
                        <label key={value} className={`flex items-center gap-2.5 rounded-lg border-2 px-3.5 py-2.5 cursor-pointer transition-all ${
                          contactType === value ? "border-brand-600 bg-brand-50" : "border-gray-200 hover:border-gray-300"
                        }`}>
                          <input type="radio" name="contact_type" value={value} checked={contactType === value}
                            onChange={() => setContactType(value)} className="text-brand-600 focus:ring-brand-500" />
                          <span className="text-sm text-gray-700">{label}</span>
                        </label>
                      ))}
                    </div>
                  </div>
                  {contactType === "agent" ? (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Agent name <span className="text-red-500">*</span>
                      </label>
                      <input type="text" value={agentName} onChange={(e) => setAgentName(e.target.value)}
                        className="input" placeholder="Sarah Johnson" />
                    </div>
                  ) : (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Property address <span className="text-red-500">*</span>
                      </label>
                      <input type="text" value={propertyAddress} onChange={(e) => setPropertyAddress(e.target.value)}
                        className="input" placeholder="123 Beach Blvd, Miami, FL 33101" />
                    </div>
                  )}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Location / market <span className="text-red-500">*</span>
                    </label>
                    <input type="text" value={propertyLocation} onChange={(e) => setPropertyLocation(e.target.value)}
                      className="input" placeholder="Miami, FL" />
                    <p className="mt-1 text-xs text-gray-400">City and state where your property is (or will be).</p>
                  </div>
                </div>
              </>
            )}

            {accountType === "vendor" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">About your business</h2>
                <p className="text-sm text-gray-500 mb-5">You can add photos and a full description after signing up.</p>
                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Business name <span className="text-red-500">*</span>
                    </label>
                    <input type="text" value={businessName} onChange={(e) => setBusinessName(e.target.value)}
                      className="input" placeholder="Sunshine STR Cleaning Co." />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Service type <span className="text-red-500">*</span>
                    </label>
                    <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className="input">
                      <option value="">Select a category…</option>
                      {categories.map((c) => (
                        <option key={c.id} value={c.id}>{c.name}</option>
                      ))}
                    </select>
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Website <span className="text-gray-400 font-normal">(optional)</span>
                      </label>
                      <input type="url" value={vendorWebsite} onChange={(e) => setVendorWebsite(e.target.value)}
                        className="input" placeholder="https://…" />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Phone <span className="text-gray-400 font-normal">(optional)</span>
                      </label>
                      <input type="tel" value={vendorPhone} onChange={(e) => setVendorPhone(e.target.value)}
                        className="input" placeholder="+1 (555) 000-0000" />
                    </div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">
                      Markets you serve <span className="text-gray-400 font-normal">(optional — add more later)</span>
                    </label>
                    <MarketMultiSelect selected={vendorMarkets} onChange={setVendorMarkets} placeholder="Search markets…" />
                  </div>
                </div>
              </>
            )}

            {stepError && (
              <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">{stepError}</div>
            )}
            <button type="button" onClick={goToStep3} className="btn-primary w-full justify-center">Continue</button>
          </div>
        )}

        {/* Step 3: Credentials */}
        {step === 3 && (
          <form onSubmit={handleSubmit}>
            <button type="button" onClick={() => { setStep(accountType === "user" ? 1 : 2); setStepError(""); }}
              className="flex items-center gap-1 text-sm text-gray-400 hover:text-gray-600 mb-4 transition">
              <ChevronLeft className="h-4 w-4" /> Back
            </button>
            <h2 className="text-xl font-bold text-gray-900 mb-1">Create your account</h2>
            <p className="text-sm text-gray-500 mb-5">Almost there.</p>
            <div className="space-y-4 mb-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Full name</label>
                <input type="text" value={fullName} onChange={(e) => setFullName(e.target.value)}
                  className="input" placeholder="Jane Smith" autoComplete="name" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Email address</label>
                <input type="email" value={email} onChange={(e) => setEmail(e.target.value)}
                  className="input" placeholder="you@example.com" autoComplete="email" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <div className="relative">
                  <input type={showPassword ? "text" : "password"} value={password}
                    onChange={(e) => setPassword(e.target.value)} className="input pr-10"
                    placeholder="At least 8 characters" autoComplete="new-password" />
                  <button type="button" onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                    {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </button>
                </div>
              </div>
            </div>
            {stepError && (
              <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">{stepError}</div>
            )}
            <button type="submit" disabled={isSubmitting} className="btn-primary w-full justify-center">
              {isSubmitting ? "Creating account…" : "Create account"}
            </button>
            <p className="mt-3 text-center text-xs text-gray-400">
              By signing up you agree to our{" "}
              <Link href="/about" className="text-brand-600 hover:underline">terms</Link>.
            </p>
          </form>
        )}
      </div>

      <p className="mt-4 text-center text-sm text-gray-500">
        Already have an account?{" "}
        <Link href="/login" className="text-brand-600 font-medium hover:underline">Sign in</Link>
      </p>
    </div>
  );
}
