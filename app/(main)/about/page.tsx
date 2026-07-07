import type { Metadata } from "next";
import Link from "next/link";
import { MapPin, Users, Star, Shield } from "lucide-react";

export const metadata: Metadata = {
  title: "About",
  description: "STRVend is the vendor directory built for short-term rental hosts — connecting you with trusted cleaners, photographers, property managers, and more.",
};

export default function AboutPage() {
  return (
    <div>
      {/* Hero */}
      <section className="bg-brand-700 text-white py-20">
        <div className="mx-auto max-w-3xl px-4 sm:px-6 text-center">
          <div className="inline-flex items-center gap-2 rounded-full bg-white/10 border border-white/20 px-4 py-1.5 text-sm font-medium text-brand-100 mb-6">
            <MapPin className="h-3.5 w-3.5 text-coral-400" />
            Our mission
          </div>
          <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl">
            The vendor directory built for <span className="text-coral-400">STR hosts</span>
          </h1>
          <p className="mt-6 text-lg text-brand-100 leading-relaxed max-w-2xl mx-auto">
            Finding reliable service providers for your short-term rental shouldn&apos;t be a full-time job.
            STRVend brings together the best local pros — all in one place, all STR-focused.
          </p>
        </div>
      </section>

      {/* Story */}
      <section className="mx-auto max-w-3xl px-4 py-16 sm:px-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Why we built this</h2>
        <div className="prose prose-gray max-w-none text-gray-600 leading-relaxed space-y-4">
          <p>
            STR hosts spend hours hunting for reliable cleaners after every checkout, chasing down
            photographers before a listing launch, and scrambling to find a handyman on short notice.
            The services exist — finding the right one in your market is the problem.
          </p>
          <p>
            STRVend was built to solve exactly that. We&apos;ve indexed thousands of service providers
            across 106 STR markets — from Nashville to Napa Valley — so you can find a vetted local
            pro in minutes, not hours.
          </p>
          <p>
            Every vendor on STRVend understands the short-term rental world: fast turnovers, high guest
            expectations, and the need to respond quickly. That focus is what sets this directory apart
            from a generic business listing site.
          </p>
        </div>
      </section>

      {/* Stats */}
      <section className="bg-gray-50 py-14">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 gap-6 sm:grid-cols-4">
            {[
              { icon: Users,   value: "2,400+", label: "Verified vendors" },
              { icon: MapPin,  value: "106",    label: "STR markets" },
              { icon: Star,    value: "12",      label: "Service categories" },
              { icon: Shield,  value: "Free",    label: "To browse" },
            ].map(({ icon: Icon, value, label }) => (
              <div key={label} className="flex flex-col items-center text-center bg-white rounded-2xl border border-gray-100 p-6">
                <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-brand-50 mb-3">
                  <Icon className="h-5 w-5 text-brand-600" />
                </span>
                <p className="text-3xl font-extrabold text-gray-900">{value}</p>
                <p className="text-sm text-gray-500 mt-1">{label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* For vendors */}
      <section className="mx-auto max-w-3xl px-4 py-16 sm:px-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">For service providers</h2>
        <p className="text-gray-600 leading-relaxed mb-6">
          If you offer services to STR hosts — cleaning, maintenance, photography, property management,
          or anything else on the list — a free STRVend listing puts you in front of hosts actively
          looking for someone like you.
        </p>
        <Link
          href="/register"
          className="inline-flex items-center gap-2 rounded-xl bg-coral-500 px-6 py-3 text-sm font-semibold text-white hover:bg-coral-600 transition"
        >
          List your business — it&apos;s free
        </Link>
      </section>

      {/* CTA */}
      <section className="bg-brand-700 text-white py-14 text-center">
        <div className="mx-auto max-w-xl px-4 sm:px-6">
          <h2 className="text-2xl font-bold mb-4">Ready to find your next vendor?</h2>
          <p className="text-brand-200 mb-8">Browse 2,400+ STR service providers across 106 markets.</p>
          <Link
            href="/vendors"
            className="inline-flex items-center gap-2 rounded-xl bg-white px-6 py-3 text-sm font-semibold text-brand-700 hover:bg-brand-50 transition"
          >
            Browse vendors
          </Link>
        </div>
      </section>
    </div>
  );
}
