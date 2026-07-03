import Link from "next/link";
import { XCircle } from "lucide-react";

export default function AuthErrorPage() {
  return (
    <div className="w-full max-w-sm">
      <div className="card p-8 text-center">
        <XCircle className="mx-auto h-12 w-12 text-red-400 mb-4" />
        <h1 className="text-xl font-bold text-gray-900 mb-2">Link expired or invalid</h1>
        <p className="text-sm text-gray-500 mb-6">
          This link may have already been used or has expired.
          Request a new one below.
        </p>
        <div className="flex flex-col gap-2">
          <Link href="/forgot-password" className="btn-primary w-full justify-center text-center">
            Reset Password
          </Link>
          <Link href="/login" className="text-sm text-brand-600 hover:underline">
            Back to sign in
          </Link>
        </div>
      </div>
    </div>
  );
}
