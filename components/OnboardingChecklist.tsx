import Link from "next/link";
import { CheckCircle2, Circle, ArrowRight, Sparkles } from "lucide-react";
import type { ChecklistStep } from "@/lib/profile-completeness";

interface Props {
  steps: ChecklistStep[];
  score: number;
  compact?: boolean; // compact=true for dashboard sidebar card, false for full onboarding page
}

export function OnboardingChecklist({ steps, score, compact = false }: Props) {
  const isComplete = score === 100;

  if (isComplete) {
    return (
      <div className="rounded-xl border border-green-200 bg-green-50 p-5 flex items-start gap-3">
        <Sparkles className="h-5 w-5 text-green-500 mt-0.5 shrink-0" />
        <div>
          <p className="font-semibold text-green-800">Profile complete!</p>
          <p className="text-sm text-green-700 mt-0.5">
            Your listing is fully set up. Hosts can find everything they need to contact you.
          </p>
        </div>
      </div>
    );
  }

  const doneCount = steps.filter((s) => s.done).length;

  return (
    <div className="rounded-xl border bg-white overflow-hidden">
      {/* Header + progress */}
      <div className="px-5 pt-5 pb-4 border-b border-gray-100">
        <div className="flex items-center justify-between mb-2">
          <h3 className={`font-semibold text-gray-900 ${compact ? "text-sm" : "text-base"}`}>
            Complete your profile
          </h3>
          <span className="text-sm font-bold text-brand-600">{score}%</span>
        </div>
        <div className="h-2 w-full bg-gray-100 rounded-full overflow-hidden">
          <div
            className="h-full bg-brand-500 rounded-full transition-all duration-500"
            style={{ width: `${score}%` }}
          />
        </div>
        <p className="text-xs text-gray-400 mt-1.5">
          {doneCount} of {steps.length} steps complete
        </p>
      </div>

      {/* Steps */}
      <ul className="divide-y divide-gray-50">
        {steps.map((step) => (
          <li key={step.id}>
            {step.done ? (
              <div className="flex items-center gap-3 px-5 py-3 opacity-60">
                <CheckCircle2 className="h-4 w-4 text-green-500 shrink-0" />
                <span className="text-sm text-gray-500 line-through">{step.label}</span>
              </div>
            ) : (
              <Link
                href={step.href}
                className="flex items-center gap-3 px-5 py-3 hover:bg-brand-50 transition-colors group"
              >
                <Circle className="h-4 w-4 text-gray-300 shrink-0 group-hover:text-brand-400 transition-colors" />
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-gray-800 group-hover:text-brand-700 transition-colors">
                    {step.label}
                  </p>
                  {!compact && (
                    <p className="text-xs text-gray-400 mt-0.5 truncate">{step.description}</p>
                  )}
                </div>
                <ArrowRight className="h-3.5 w-3.5 text-gray-300 group-hover:text-brand-500 shrink-0 transition-colors" />
              </Link>
            )}
          </li>
        ))}
      </ul>
    </div>
  );
}
