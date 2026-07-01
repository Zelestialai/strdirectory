import Link from "next/link";
import { XCircle } from "lucide-react";

const MESSAGES: Record<string, string> = {
  missing_token:          "The verification link is incomplete. Please use the link from your email.",
  invalid_token:          "This verification link is invalid or has already been used.",
  already_used:           "This verification link has already been used.",
  expired:                "This verification link has expired. Please submit a new claim request.",
  already_claimed:        "This listing has already been claimed by another account.",
  vendor_not_found:       "The listing associated with this link could not be found.",
  account_creation_failed:"We couldn't create your account. Please try again or contact support.",
  claim_failed:           "Something went wrong while claiming your listing. Please try again.",
};

export default function ClaimErrorPage({
  searchParams,
}: {
  searchParams: { reason?: string };
}) {
  const reason = searchParams.reason ?? "invalid_token";
  const message = MESSAGES[reason] ?? MESSAGES.invalid_token;

  return (
    <div className="mx-auto max-w-lg px-4 py-20 text-center">
      <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-red-50">
        <XCircle className="h-7 w-7 text-red-500" />
      </div>
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Verification failed</h1>
      <p className="text-gray-500 mb-8 leading-relaxed">{message}</p>
      <div className="flex flex-col sm:flex-row items-center justify-center gap-3">
        <Link href="/vendors" className="btn-primary text-sm">
          Browse vendors
        </Link>
        <Link href="/" className="btn-secondary text-sm">
          Go home
        </Link>
      </div>
    </div>
  );
}
