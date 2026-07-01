"use client";
import { useState, useEffect } from "react";
import { useParams, useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import Link from "next/link";
import { ArrowLeft, Shield, CheckCircle, Mail } from "lucide-react";

const schema = z.object({
  contact_name: z.string().min(2, "Please enter your name"),
  email:        z.string().email("Please enter a valid email address"),
  message:      z.string().max(500).optional(),
});
type FormValues = z.infer<typeof schema>;

export default function ClaimVendorPage() {
  const { id: slug } = useParams<{ id: string }>();
  const router = useRouter();
  const [vendorId, setVendorId] = useState<string | null>(null);
  const [vendorName, setVendorName] = useState("");
  const [isClaimed, setIsClaimed] = useState<boolean | null>(null);
  const [submitted, setSubmitted] = useState(false);
  const [serverError, setServerError] = useState("");
  const supabase = createClient();

  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    supabase
      .from("vendors")
      .select("id, business_name, is_claimed")
      .eq("slug", slug)
      .single()
      .then(({ data }) => {
        if (!data) { router.push("/404"); return; }
        setVendorId(data.id);
        setVendorName(data.business_name);
        setIsClaimed(data.is_claimed);
      });
  }, [slug]);

  const onSubmit = async (values: FormValues) => {
    if (!vendorId) return;
    setServerError("");
    const res = await fetch("/api/claim-requests", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ vendor_id: vendorId, ...values }),
    });
    const data = await res.json();
    if (!res.ok) {
      setServerError(data.error ?? "Something went wrong. Please try again.");
      return;
    }
    setSubmitted(true);
  };

  // Loading
  if (isClaimed === null) {
    return (
      <div className="flex items-center justify-center py-24">
        <div className="h-6 w-6 animate-spin rounded-full border-2 border-brand-400 border-t-transparent" />
      </div>
    );
  }

  // Already claimed
  if (isClaimed) {
    return (
      <div className="mx-auto max-w-lg px-4 py-16 text-center">
        <Shield className="mx-auto h-12 w-12 text-gray-300 mb-4" />
        <h1 className="text-xl font-semibold text-gray-800 mb-2">Listing already claimed</h1>
        <p className="text-gray-500 text-sm mb-6">
          <strong>{vendorName}</strong> has already been claimed by its owner.
          If you believe this is an error, please contact us.
        </p>
        <Link href={`/vendors/${slug}`} className="btn-secondary text-sm">
          <ArrowLeft className="h-4 w-4" /> Back to listing
        </Link>
      </div>
    );
  }

  // Success state
  if (submitted) {
    return (
      <div className="mx-auto max-w-lg px-4 py-16 text-center">
        <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-green-50">
          <Mail className="h-7 w-7 text-green-600" />
        </div>
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Check your email</h1>
        <p className="text-gray-500 mb-6 leading-relaxed">
          We sent a verification link to your email address. Click it to instantly claim
          <strong> {vendorName}</strong> and access your vendor dashboard.
        </p>
        <ul className="text-sm text-gray-500 space-y-2 text-left bg-gray-50 rounded-xl p-5 mb-6">
          <li className="flex items-start gap-2"><CheckCircle className="h-4 w-4 text-green-500 mt-0.5 shrink-0" /> Your listing will be linked to a new vendor account</li>
          <li className="flex items-start gap-2"><CheckCircle className="h-4 w-4 text-green-500 mt-0.5 shrink-0" /> You'll be signed in automatically — no password needed</li>
          <li className="flex items-start gap-2"><CheckCircle className="h-4 w-4 text-green-500 mt-0.5 shrink-0" /> The link expires in 24 hours</li>
        </ul>
        <Link href={`/vendors/${slug}`} className="text-sm text-gray-400 hover:text-brand-700">
          ← Back to listing
        </Link>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-lg px-4 py-12 sm:px-6">
      <Link href={`/vendors/${slug}`} className="flex items-center gap-1 text-sm text-gray-500 hover:text-brand-700 mb-6">
        <ArrowLeft className="h-4 w-4" /> Back to {vendorName}
      </Link>

      <div className="card p-8">
        <div className="flex items-center gap-3 mb-1">
          <div className="flex h-10 w-10 items-center justify-center rounded-full bg-brand-50">
            <Shield className="h-5 w-5 text-brand-600" />
          </div>
          <h1 className="text-2xl font-bold text-gray-900">Claim this listing</h1>
        </div>
        <p className="text-sm text-gray-500 mb-6 mt-1">
          Is <strong>{vendorName}</strong> your business? Claim it to manage your profile,
          respond to inquiries, and reply to reviews.
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Your name *</label>
            <input
              {...register("contact_name")}
              className="input"
              placeholder="Jane Smith"
            />
            {errors.contact_name && <p className="text-xs text-red-500 mt-1">{errors.contact_name.message}</p>}
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Business email *</label>
            <input
              {...register("email")}
              type="email"
              className="input"
              placeholder="you@yourbusiness.com"
            />
            <p className="text-xs text-gray-400 mt-1">We'll send a verification link to this address.</p>
            {errors.email && <p className="text-xs text-red-500 mt-1">{errors.email.message}</p>}
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Anything you'd like to add? <span className="text-gray-400 font-normal">(optional)</span>
            </label>
            <textarea
              {...register("message")}
              rows={3}
              className="input resize-none"
              placeholder="e.g. I'm the owner of this business and want to manage my listing…"
            />
          </div>

          {serverError && (
            <div className="rounded-lg bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-700">
              {serverError}
            </div>
          )}

          <button
            type="submit"
            disabled={isSubmitting || !vendorId}
            className="btn-primary w-full justify-center"
          >
            {isSubmitting ? "Sending verification…" : "Send verification email"}
          </button>
        </form>

        <p className="mt-4 text-xs text-gray-400 text-center leading-relaxed">
          By claiming this listing you confirm you are authorized to represent{" "}
          <strong>{vendorName}</strong>.
        </p>
      </div>
    </div>
  );
}
