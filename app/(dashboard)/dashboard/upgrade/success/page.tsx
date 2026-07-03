import Link from "next/link";
import { CheckCircle2, LayoutDashboard } from "lucide-react";

export const metadata = { title: "Upgrade successful!" };

export default function UpgradeSuccessPage() {
  return (
    <div className="flex flex-col items-center justify-center py-20 text-center space-y-5">
      <div className="h-16 w-16 rounded-full bg-green-50 flex items-center justify-center">
        <CheckCircle2 className="h-9 w-9 text-green-500" />
      </div>

      <div className="space-y-1">
        <h1 className="text-2xl font-bold text-gray-900">You&apos;re upgraded!</h1>
        <p className="text-gray-500">
          Your listing has been upgraded. Your badge and boosted placement are now live.
        </p>
      </div>

      <div className="rounded-xl border bg-amber-50 border-amber-200 px-6 py-4 text-sm text-amber-800 max-w-sm">
        It may take a minute for your listing to reflect the new badge across the site.
      </div>

      <Link
        href="/dashboard"
        className="inline-flex items-center gap-2 rounded-xl bg-brand-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-700 transition-colors"
      >
        <LayoutDashboard className="h-4 w-4" />
        Go to Dashboard
      </Link>
    </div>
  );
}
