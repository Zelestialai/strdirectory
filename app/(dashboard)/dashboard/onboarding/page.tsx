import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";
import { CheckCircle2, ArrowRight, Rocket } from "lucide-react";
import type { Vendor } from "@/types";
import { getChecklistSteps, getCompletionScore } from "@/lib/profile-completeness";

export const metadata = { title: "Set up your listing" };

export default async function OnboardingPage({
  searchParams,
}: {
  searchParams?: { claimed?: string; step?: string };
}) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: vendor } = await supabase
    .from("vendors")
    .select("*, services:vendor_services(*)")
    .eq("user_id", user.id)
    .single();

  if (!vendor) redirect("/dashboard/profile");

  const v = vendor as Vendor;
  const steps = getChecklistSteps(v);
  const score = getCompletionScore(steps);

  const isClaimed = searchParams?.claimed === "1";
  const incompleteSteps = steps.filter((s) => !s.done);
  const nextStep = incompleteSteps[0] ?? null;

  return (
    <div className="max-w-xl mx-auto space-y-8 py-4">
      {/* Header */}
      <div className="text-center space-y-2">
        <div className="inline-flex h-14 w-14 items-center justify-center rounded-2xl bg-brand-50 mb-2">
          <Rocket className="h-7 w-7 text-brand-600" />
        </div>
        <h1 className="text-2xl font-bold text-gray-900">
          {isClaimed ? "You've claimed your listing!" : "Let's set up your listing"}
        </h1>
        <p className="text-gray-500">
          {isClaimed
            ? "Complete your profile to start attracting STR hosts in your area."
            : "A complete profile gets 3× more inquiries. It only takes a few minutes."}
        </p>
      </div>

      {/* Progress bar */}
      <div className="space-y-2">
        <div className="flex items-center justify-between text-sm">
          <span className="text-gray-500">{steps.filter((s) => s.done).length} of {steps.length} steps done</span>
          <span className="font-bold text-brand-600">{score}%</span>
        </div>
        <div className="h-3 w-full bg-gray-100 rounded-full overflow-hidden">
          <div
            className="h-full bg-brand-500 rounded-full transition-all duration-700"
            style={{ width: `${score}%` }}
          />
        </div>
      </div>

      {/* Step list */}
      <div className="divide-y divide-gray-100 rounded-2xl border bg-white overflow-hidden">
        {steps.map((step, i) => (
          <div
            key={step.id}
            className={`flex items-start gap-4 px-5 py-4 ${
              step.done ? "opacity-60" : "hover:bg-brand-50 transition-colors"
            }`}
          >
            {/* Step number / check */}
            <div className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-xs font-bold mt-0.5 ${
              step.done
                ? "bg-green-100 text-green-600"
                : "bg-brand-100 text-brand-700"
            }`}>
              {step.done ? <CheckCircle2 className="h-4 w-4" /> : i + 1}
            </div>

            {/* Content */}
            <div className="flex-1 min-w-0">
              <p className={`font-medium text-sm ${step.done ? "text-gray-400 line-through" : "text-gray-800"}`}>
                {step.label}
              </p>
              {!step.done && (
                <p className="text-xs text-gray-400 mt-0.5">{step.description}</p>
              )}
            </div>

            {/* CTA */}
            {!step.done && (
              <Link
                href={step.href}
                className="shrink-0 flex items-center gap-1 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 transition-colors"
              >
                Go <ArrowRight className="h-3 w-3" />
              </Link>
            )}
          </div>
        ))}
      </div>

      {/* CTA row */}
      {score === 100 ? (
        <div className="text-center space-y-3">
          <p className="text-sm font-semibold text-green-700">🎉 Your profile is 100% complete!</p>
          <Link href={`/vendors/${v.slug}`} className="btn-primary inline-flex">
            View my public listing →
          </Link>
        </div>
      ) : (
        <div className="flex flex-col sm:flex-row items-center justify-between gap-3">
          {nextStep && (
            <Link href={nextStep.href} className="btn-primary w-full sm:w-auto justify-center">
              Start: {nextStep.label} →
            </Link>
          )}
          <Link href="/dashboard" className="text-sm text-gray-400 hover:text-gray-600 transition-colors">
            Skip for now →
          </Link>
        </div>
      )}
    </div>
  );
}
