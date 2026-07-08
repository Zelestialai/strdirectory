"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState, useEffect, useRef } from "react";
import { createClient } from "@/lib/supabase/client";
import { Eye, EyeOff, CheckCircle2, Home, Sprout, Wrench, Search, ChevronLeft, X } from "lucide-react";

// ── Markets list ──────────────────────────────────────────────────────────────
const MARKETS = [
  { name: "Nashville", slug: "nashville", state: "TN" },
  { name: "Miami", slug: "miami", state: "FL" },
  { name: "Orlando", slug: "orlando", state: "FL" },
  { name: "Los Angeles", slug: "los-angeles", state: "CA" },
  { name: "Austin", slug: "austin", state: "TX" },
  { name: "Las Vegas", slug: "las-vegas", state: "NV" },
  { name: "Scottsdale", slug: "scottsdale", state: "AZ" },
  { name: "New York City", slug: "new-york-city", state: "NY" },
  { name: "Denver", slug: "denver", state: "CO" },
  { name: "New Orleans", slug: "new-orleans", state: "LA" },
  { name: "San Diego", slug: "san-diego", state: "CA" },
  { name: "Charleston", slug: "charleston", state: "SC" },
  { name: "Myrtle Beach", slug: "myrtle-beach", state: "SC" },
  { name: "Destin", slug: "destin", state: "FL" },
  { name: "Smoky Mountains", slug: "smoky-mountains", state: "TN" },
  { name: "Chicago", slug: "chicago", state: "IL" },
  { name: "Asheville", slug: "asheville", state: "NC" },
  { name: "Outer Banks", slug: "outer-banks", state: "NC" },
  { name: "Hilton Head", slug: "hilton-head", state: "SC" },
  { name: "Key West", slug: "key-west", state: "FL" },
  { name: "Lake Tahoe", slug: "lake-tahoe", state: "CA" },
  { name: "Park City", slug: "park-city", state: "UT" },
  { name: "Sedona", slug: "sedona", state: "AZ" },
  { name: "Savannah", slug: "savannah", state: "GA" },
  { name: "Virginia Beach", slug: "virginia-beach", state: "VA" },
  { name: "San Antonio", slug: "san-antonio", state: "TX" },
  { name: "Gulf Shores", slug: "gulf-shores", state: "AL" },
  { name: "Panama City Beach", slug: "panama-city-beach", state: "FL" },
  { name: "Naples", slug: "naples", state: "FL" },
  { name: "Anna Maria Island", slug: "anna-maria-island", state: "FL" },
  { name: "Cape Cod", slug: "cape-cod", state: "MA" },
  { name: "Hamptons", slug: "hamptons", state: "NY" },
  { name: "Jersey Shore", slug: "jersey-shore", state: "NJ" },
  { name: "Ocean City", slug: "ocean-city", state: "MD" },
  { name: "Galveston", slug: "galveston", state: "TX" },
  { name: "Rehoboth Beach", slug: "rehoboth-beach", state: "DE" },
  { name: "South Padre Island", slug: "south-padre-island", state: "TX" },
  { name: "30A", slug: "thirty-a", state: "FL" },
  { name: "Breckenridge", slug: "breckenridge", state: "CO" },
  { name: "Vail", slug: "vail", state: "CO" },
  { name: "Aspen", slug: "aspen", state: "CO" },
  { name: "Steamboat Springs", slug: "steamboat-springs", state: "CO" },
  { name: "Telluride", slug: "telluride", state: "CO" },
  { name: "Jackson Hole", slug: "jackson-hole", state: "WY" },
  { name: "Big Sky", slug: "big-sky", state: "MT" },
  { name: "Sun Valley", slug: "sun-valley", state: "ID" },
  { name: "Mammoth Lakes", slug: "mammoth-lakes", state: "CA" },
  { name: "Big Bear", slug: "big-bear", state: "CA" },
  { name: "Bend", slug: "bend", state: "OR" },
  { name: "Whitefish", slug: "whitefish", state: "MT" },
  { name: "Clearwater", slug: "clearwater", state: "FL" },
  { name: "Fort Lauderdale", slug: "fort-lauderdale", state: "FL" },
  { name: "Nantucket", slug: "nantucket", state: "MA" },
  { name: "Martha's Vineyard", slug: "marthas-vineyard", state: "MA" },
  { name: "Bar Harbor", slug: "bar-harbor", state: "ME" },
  { name: "MS Gulf Coast", slug: "mississippi-gulf-coast", state: "MS" },
  { name: "Crystal Coast", slug: "crystal-coast", state: "NC" },
  { name: "Newport", slug: "newport", state: "RI" },
  { name: "Port Aransas", slug: "port-aransas", state: "TX" },
  { name: "Amelia Island", slug: "amelia-island", state: "FL" },
  { name: "Blue Ridge", slug: "blue-ridge", state: "GA" },
  { name: "Poconos", slug: "poconos", state: "PA" },
  { name: "Flagstaff", slug: "flagstaff", state: "AZ" },
  { name: "Durango", slug: "durango", state: "CO" },
  { name: "Boone", slug: "boone", state: "NC" },
  { name: "Door County", slug: "door-county", state: "WI" },
  { name: "Traverse City", slug: "traverse-city", state: "MI" },
  { name: "Joshua Tree", slug: "joshua-tree", state: "CA" },
  { name: "Palm Springs", slug: "palm-springs", state: "CA" },
  { name: "Napa Valley", slug: "napa-valley", state: "CA" },
  { name: "San Francisco", slug: "san-francisco", state: "CA" },
  { name: "Seattle", slug: "seattle", state: "WA" },
  { name: "Dallas", slug: "dallas", state: "TX" },
  { name: "Houston", slug: "houston", state: "TX" },
  { name: "Atlanta", slug: "atlanta", state: "GA" },
  { name: "Boston", slug: "boston", state: "MA" },
  { name: "Washington DC", slug: "washington-dc", state: "DC" },
  { name: "Philadelphia", slug: "philadelphia", state: "PA" },
  { name: "Tampa", slug: "tampa", state: "FL" },
  { name: "Portland", slug: "portland", state: "OR" },
  { name: "Maui", slug: "maui", state: "HI" },
  { name: "Oahu", slug: "oahu", state: "HI" },
  { name: "Kauai", slug: "kauai", state: "HI" },
  { name: "Big Island", slug: "big-island", state: "HI" },
  { name: "Moab", slug: "moab", state: "UT" },
  { name: "Santa Fe", slug: "santa-fe", state: "NM" },
  { name: "Taos", slug: "taos", state: "NM" },
  { name: "Stowe", slug: "stowe", state: "VT" },
  { name: "Catskills", slug: "catskills", state: "NY" },
  { name: "Finger Lakes", slug: "finger-lakes", state: "NY" },
  { name: "Hudson Valley", slug: "hudson-valley", state: "NY" },
  { name: "Broken Bow", slug: "broken-bow", state: "OK" },
  { name: "Lake of the Ozarks", slug: "lake-of-the-ozarks", state: "MO" },
  { name: "Pigeon Forge", slug: "pigeon-forge", state: "TN" },
  { name: "Sarasota", slug: "sarasota", state: "FL" },
  { name: "St. Augustine", slug: "st-augustine", state: "FL" },
  { name: "Pensacola", slug: "pensacola", state: "FL" },
  { name: "Cannon Beach", slug: "cannon-beach", state: "OR" },
  { name: "Tybee Island", slug: "tybee-island", state: "GA" },
  { name: "Kiawah Island", slug: "kiawah-island", state: "SC" },
  { name: "St. Simons Island", slug: "st-simons-island", state: "GA" },
  { name: "Chattanooga", slug: "chattanooga", state: "TN" },
  { name: "Fredericksburg TX", slug: "fredericksburg-tx", state: "TX" },
  { name: "New Braunfels", slug: "new-braunfels", state: "TX" },
  { name: "Coeur d'Alene", slug: "coeur-dalene", state: "ID" },
  { name: "Lake Geneva", slug: "lake-geneva", state: "WI" },
];

// ── Market multi-select ───────────────────────────────────────────────────────
function MarketMultiSelect({
  selected,
  onChange,
  placeholder = "Search 106 markets…",
}: {
  selected: string[];
  onChange: (v: string[]) => void;
  placeholder?: string;
}) {
  const [search, setSearch] = useState("");
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  const filtered = MARKETS.filter(
    (m) =>
      m.name.toLowerCase().includes(search.toLowerCase()) ||
      m.state.toLowerCase().includes(search.toLowerCase())
  );

  const toggle = (slug: string) =>
    onChange(
      selected.includes(slug)
        ? selected.filter((s) => s !== slug)
        : [...selected, slug]
    );

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  return (
    <div ref={ref} className="space-y-2">
      {/* Selected pills */}
      {selected.length > 0 && (
        <div className="flex flex-wrap gap-1.5">
          {selected.map((slug) => {
            const m = MARKETS.find((m) => m.slug === slug);
            return m ? (
              <span
                key={slug}
                className="inline-flex items-center gap-1 text-xs bg-brand-100 text-brand-700 rounded-full px-2.5 py-1 font-medium"
              >
                {m.name}, {m.state}
                <button
                  type="button"
                  onClick={() => toggle(slug)}
                  className="hover:text-brand-900 ml-0.5"
                >
                  <X className="h-3 w-3" />
                </button>
              </span>
            ) : null;
          })}
        </div>
      )}

      {/* Search input */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400 pointer-events-none" />
        <input
          type="text"
          value={search}
          onChange={(e) => { setSearch(e.target.value); setOpen(true); }}
          onFocus={() => setOpen(true)}
          className="input pl-9"
          placeholder={placeholder}
        />
      </div>

      {/* Dropdown */}
      {open && (
        <div className="max-h-52 overflow-y-auto rounded-xl border border-gray-200 bg-white shadow-lg divide-y divide-gray-50">
          {filtered.slice(0, 40).map((m) => (
            <label
              key={m.slug}
              className="flex items-center gap-2.5 px-3 py-2.5 hover:bg-gray-50 cursor-pointer"
            >
              <input
                type="checkbox"
                checked={selected.includes(m.slug)}
                onChange={() => toggle(m.slug)}
                className="h-4 w-4 rounded border-gray-300 text-brand-600 focus:ring-brand-500"
              />
              <span className="text-sm text-gray-700 flex-1">{m.name}</span>
              <span className="text-xs text-gray-400">{m.state}</span>
            </label>
          ))}
          {filtered.length === 0 && (
            <p className="text-sm text-gray-400 text-center py-4">No markets match</p>
          )}
        </div>
      )}
    </div>
  );
}

// ── Account type definitions ──────────────────────────────────────────────────
type AccountType = "active_host" | "potential_host" | "vendor" | "user";

const ACCOUNT_TYPES: {
  value: AccountType;
  icon: React.ComponentType<{ className?: string }>;
  label: string;
  desc: string;
  color: string;
}[] = [
  {
    value: "active_host",
    icon: Home,
    label: "Active STR host",
    desc: "I manage short-term rentals on Airbnb, Vrbo, or direct booking",
    color: "brand",
  },
  {
    value: "potential_host",
    icon: Sprout,
    label: "Aspiring host",
    desc: "I'm planning to start renting — working with an agent or scoping properties",
    color: "brand",
  },
  {
    value: "vendor",
    icon: Wrench,
    label: "Service provider",
    desc: "I offer services to STR hosts — cleaning, photography, maintenance, and more",
    color: "coral",
  },
  {
    value: "user",
    icon: Search,
    label: "Just browsing",
    desc: "I want to explore the directory without signing up for a specific role",
    color: "gray",
  },
];

// ── Step indicator ────────────────────────────────────────────────────────────
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

// ── Main component ────────────────────────────────────────────────────────────
export default function RegisterPage() {
  const router = useRouter();
  const supabase = createClient();

  // Navigation
  const [step, setStep] = useState<1 | 2 | 3>(1);
  const [accountType, setAccountType] = useState<AccountType>("active_host");

  // Active host fields
  const [airbnbUrl, setAirbnbUrl] = useState("");
  const [bookingUrl, setBookingUrl] = useState("");
  const [hostMarkets, setHostMarkets] = useState<string[]>([]);

  // Potential host fields
  const [contactType, setContactType] = useState<"agent" | "property">("agent");
  const [agentName, setAgentName] = useState("");
  const [propertyAddress, setPropertyAddress] = useState("");
  const [propertyLocation, setPropertyLocation] = useState("");

  // Vendor fields
  const [businessName, setBusinessName] = useState("");
  const [categoryId, setCategoryId] = useState("");
  const [vendorWebsite, setVendorWebsite] = useState("");
  const [vendorPhone, setVendorPhone] = useState("");
  const [vendorMarkets, setVendorMarkets] = useState<string[]>([]);
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([]);

  // Account credentials
  const [fullName, setFullName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  // UI
  const [stepError, setStepError] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [emailSent, setEmailSent] = useState(false);

  const totalSteps = accountType === "user" ? 2 : 3;

  // Fetch categories for vendor step
  useEffect(() => {
    supabase.from("categories").select("id, name").order("name").then(({ data }) => {
      if (data) setCategories(data);
    });
  }, []);

  // ── Step navigation ─────────────────────────────────────────────────────────
  const goToStep2 = () => {
    setStepError("");
    if (accountType === "user") { setStep(3); return; }
    setStep(2);
  };

  const goToStep3 = () => {
    setStepError("");
    // Validate step 2
    if (accountType === "active_host") {
      if (hostMarkets.length === 0) {
        setStepError("Select at least one market where you operate.");
        return;
      }
    }
    if (accountType === "potential_host") {
      if (contactType === "agent" && !agentName.trim()) {
        setStepError("Enter your real estate agent's name.");
        return;
      }
      if (contactType === "property" && !propertyAddress.trim()) {
        setStepError("Enter your property address.");
        return;
      }
      if (!propertyLocation.trim()) {
        setStepError("Enter the city or market where your property is located.");
        return;
      }
    }
    if (accountType === "vendor") {
      if (!businessName.trim()) { setStepError("Enter your business name."); return; }
      if (!categoryId) { setStepError("Select your service type."); return; }
    }
    setStep(3);
  };

  // ── Final submit ────────────────────────────────────────────────────────────
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setStepError("");
    if (!fullName.trim()) { setStepError("Enter your full name."); return; }
    if (!email.trim()) { setStepError("Enter your email address."); return; }
    if (password.length < 8) { setStepError("Password must be at least 8 characters."); return; }

    setIsSubmitting(true);

    const next =
      accountType === "vendor"
        ? "/dashboard/onboarding"
        : accountType === "active_host" || accountType === "potential_host"
        ? "/host/dashboard"
        : "/";

    // Build user metadata stored server-side for trigger
    const metadata: Record<string, unknown> = {
      full_name: fullName.trim(),
      role: accountType,
    };

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

    if (error) {
      setStepError(error.message);
    } else if (data.session) {
      router.push(next);
      router.refresh();
    } else {
      setEmailSent(true);
    }
  };

  // ── Email sent screen ───────────────────────────────────────────────────────
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
            Click the link to activate your account. Didn&apos;t get it?{" "}
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

        {/* ── Step 1: Account type ── */}
        {step === 1 && (
          <div>
            <h1 className="text-2xl font-bold text-gray-900 mb-1">Join STRVend</h1>
            <p className="text-sm text-gray-500 mb-6">What best describes you?</p>

            <div className="space-y-2.5 mb-6">
              {ACCOUNT_TYPES.map(({ value, icon: Icon, label, desc }) => {
                const active = accountType === value;
                return (
                  <button
                    key={value}
                    type="button"
                    onClick={() => setAccountType(value)}
                    className={`w-full flex items-center gap-3 rounded-xl border-2 px-4 py-3.5 text-left transition-all ${
                      active
                        ? value === "vendor"
                          ? "border-coral-500 bg-coral-50"
                          : "border-brand-600 bg-brand-50"
                        : "border-gray-200 hover:border-gray-300 bg-white"
                    }`}
                  >
                    <span
                      className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-lg ${
                        active
                          ? value === "vendor"
                            ? "bg-coral-500 text-white"
                            : "bg-brand-600 text-white"
                          : "bg-gray-100 text-gray-400"
                      }`}
                    >
                      <Icon className="h-4.5 w-4.5" />
                    </span>
                    <div className="min-w-0">
                      <p className={`text-sm font-semibold ${active ? value === "vendor" ? "text-coral-700" : "text-brand-700" : "text-gray-700"}`}>
                        {label}
                      </p>
                      <p className="text-xs text-gray-400 leading-snug mt-0.5">{desc}</p>
                    </div>
                    {active && (
                      <div
                        className={`ml-auto h-4 w-4 rounded-full flex items-center justify-center shrink-0 ${
                          value === "vendor" ? "bg-coral-500" : "bg-brand-600"
                        }`}
                      >
                        <div className="h-1.5 w-1.5 rounded-full bg-white" />
                      </div>
                    )}
                  </button>
                );
              })}
            </div>

            <button
              type="button"
              onClick={goToStep2}
              className="btn-primary w-full justify-center"
            >
              Continue
            </button>
          </div>
        )}

        {/* ── Step 2: Role-specific details ── */}
        {step === 2 && (
          <div>
            <button
              type="button"
              onClick={() => { setStep(1); setStepError(""); }}
              className="flex items-center gap-1 text-sm text-gray-400 hover:text-gray-600 mb-4 transition"
            >
              <ChevronLeft className="h-4 w-4" /> Back
            </button>

            {/* Active host */}
            {accountType === "active_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your STR listings</h2>
                <p className="text-sm text-gray-500 mb-5">
                  Tell us where you host so we can show you relevant vendors.
                </p>

                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Airbnb listing URL
                      <span className="ml-1 text-gray-400 font-normal">(optional)</span>
                    </label>
                    <input
                      type="url"
                      value={airbnbUrl}
                      onChange={(e) => setAirbnbUrl(e.target.value)}
                      className="input"
                      placeholder="https://www.airbnb.com/rooms/…"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Direct booking website
                      <span className="ml-1 text-gray-400 font-normal">(optional)</span>
                    </label>
                    <input
                      type="url"
                      value={bookingUrl}
                      onChange={(e) => setBookingUrl(e.target.value)}
                      className="input"
                      placeholder="https://yourbooking.com"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">
                      Markets you operate in <span className="text-red-500">*</span>
                    </label>
                    <MarketMultiSelect
                      selected={hostMarkets}
                      onChange={setHostMarkets}
                      placeholder="Search markets…"
                    />
                    <p className="mt-1.5 text-xs text-gray-400">
                      Select all markets where you have STR properties.
                    </p>
                  </div>
                </div>
              </>
            )}

            {/* Potential / aspiring host */}
            {accountType === "potential_host" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">Your property plans</h2>
                <p className="text-sm text-gray-500 mb-5">
                  Help us personalise your experience.
                </p>

                <div className="space-y-4 mb-5">
                  <div>
                    <p className="text-sm font-medium text-gray-700 mb-2">How would you describe your situation?</p>
                    <div className="space-y-2">
                      {[
                        { value: "agent" as const, label: "Working with a real estate agent" },
                        { value: "property" as const, label: "I have a specific property in mind" },
                      ].map(({ value, label }) => (
                        <label key={value} className={`flex items-center gap-2.5 rounded-lg border-2 px-3.5 py-2.5 cursor-pointer transition-all ${contactType === value ? "border-brand-600 bg-brand-50" : "border-gray-200 hover:border-gray-300"}`}>
                          <input
                            type="radio"
                            name="contact_type"
                            value={value}
                            checked={contactType === value}
                            onChange={() => setContactType(value)}
                            className="text-brand-600 focus:ring-brand-500"
                          />
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
                      <input
                        type="text"
                        value={agentName}
                        onChange={(e) => setAgentName(e.target.value)}
                        className="input"
                        placeholder="Sarah Johnson"
                      />
                    </div>
                  ) : (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Property address <span className="text-red-500">*</span>
                      </label>
                      <input
                        type="text"
                        value={propertyAddress}
                        onChange={(e) => setPropertyAddress(e.target.value)}
                        className="input"
                        placeholder="123 Beach Blvd, Miami, FL 33101"
                      />
                    </div>
                  )}

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Location / market <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      value={propertyLocation}
                      onChange={(e) => setPropertyLocation(e.target.value)}
                      className="input"
                      placeholder="Miami, FL"
                    />
                    <p className="mt-1 text-xs text-gray-400">City and state where your property is (or will be).</p>
                  </div>
                </div>
              </>
            )}

            {/* Vendor */}
            {accountType === "vendor" && (
              <>
                <h2 className="text-xl font-bold text-gray-900 mb-1">About your business</h2>
                <p className="text-sm text-gray-500 mb-5">
                  You can fill in the rest — photos, description, services — after signing up.
                </p>

                <div className="space-y-4 mb-5">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Business name <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      value={businessName}
                      onChange={(e) => setBusinessName(e.target.value)}
                      className="input"
                      placeholder="Sunshine STR Cleaning Co."
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Service type <span className="text-red-500">*</span>
                    </label>
                    <select
                      value={categoryId}
                      onChange={(e) => setCategoryId(e.target.value)}
                      className="input"
                    >
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
                      <input
                        type="url"
                        value={vendorWebsite}
                        onChange={(e) => setVendorWebsite(e.target.value)}
                        className="input"
                        placeholder="https://…"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Phone <span className="text-gray-400 font-normal">(optional)</span>
                      </label>
                      <input
                        type="tel"
                        value={vendorPhone}
                        onChange={(e) => setVendorPhone(e.target.value)}
                        className="input"
                        placeholder="+1 (555) 000-0000"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1.5">
                      Markets you serve <span className="text-gray-400 font-normal">(optional — add more later)</span>
                    </label>
                    <MarketMultiSelect
                      selected={vendorMarkets}
                      onChange={setVendorMarkets}
                      placeholder="Search markets…"
                    />
                  </div>
                </div>
              </>
            )}

            {stepError && (
              <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">
                {stepError}
              </div>
            )}

            <button type="button" onClick={goToStep3} className="btn-primary w-full justify-center">
              Continue
            </button>
          </div>
        )}

        {/* ── Step 3: Account credentials ── */}
        {step === 3 && (
          <form onSubmit={handleSubmit}>
            <button
              type="button"
              onClick={() => {
                setStep(accountType === "user" ? 1 : 2);
                setStepError("");
              }}
              className="flex items-center gap-1 text-sm text-gray-400 hover:text-gray-600 mb-4 transition"
            >
              <ChevronLeft className="h-4 w-4" /> Back
            </button>

            <h2 className="text-xl font-bold text-gray-900 mb-1">Create your account</h2>
            <p className="text-sm text-gray-500 mb-5">Almost there.</p>

            <div className="space-y-4 mb-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Full name</label>
                <input
                  type="text"
                  value={fullName}
                  onChange={(e) => setFullName(e.target.value)}
                  className="input"
                  placeholder="Jane Smith"
                  autoComplete="name"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Email address</label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="input"
                  placeholder="you@example.com"
                  autoComplete="email"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <div className="relative">
                  <input
                    type={showPassword ? "text" : "password"}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    className="input pr-10"
                    placeholder="At least 8 characters"
                    autoComplete="new-password"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                  >
                    {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </button>
                </div>
              </div>
            </div>

            {stepError && (
              <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700 mb-4">
                {stepError}
              </div>
            )}

            <button
              type="submit"
              disabled={isSubmitting}
              className="btn-primary w-full justify-center"
            >
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
        <Link href="/login" className="text-brand-600 font-medium hover:underline">
          Sign in
        </Link>
      </p>
    </div>
  );
}
