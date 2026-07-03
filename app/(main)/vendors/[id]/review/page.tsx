"use client";
import { useState, useEffect } from "react";
import { useRouter, useParams } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { StarRating } from "@/components/StarRating";
import { ArrowLeft, Lock } from "lucide-react";
import Link from "next/link";

const schema = z.object({
  rating: z.number().min(1, "Please select a rating").max(5),
  title: z.string().optional(),
  body: z.string().min(20, "Please write at least 20 characters"),
});
type FormValues = z.infer<typeof schema>;

export default function WriteReviewPage() {
  const router = useRouter();
  const { id: slug } = useParams<{ id: string }>();
  const [vendorId, setVendorId] = useState<string | null>(null);
  const [vendorName, setVendorName] = useState("");
  const [hasInquired, setHasInquired] = useState<boolean | null>(null); // null = loading
  const [alreadyReviewed, setAlreadyReviewed] = useState(false);
  const supabase = createClient();

  const {
    register,
    handleSubmit,
    setValue,
    watch,
    formState: { errors, isSubmitting },
  } = useForm<FormValues>({
    resolver: zodResolver(schema),
    defaultValues: { rating: 0 },
  });
  const rating = watch("rating");

  useEffect(() => {
    async function init() {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) { router.push("/login"); return; }

      const { data: v } = await supabase
        .from("vendors")
        .select("id, business_name")
        .eq("slug", slug)
        .single();

      if (!v) return;
      setVendorId(v.id);
      setVendorName(v.business_name);

      const [{ data: inq }, { data: existingReview }] = await Promise.all([
        supabase
          .from("inquiries")
          .select("id")
          .eq("sender_id", user.id)
          .eq("vendor_id", v.id)
          .limit(1)
          .maybeSingle(),
        supabase
          .from("reviews")
          .select("id")
          .eq("reviewer_id", user.id)
          .eq("vendor_id", v.id)
          .maybeSingle(),
      ]);
      setHasInquired(!!inq);
      setAlreadyReviewed(!!existingReview);
    }
    init();
  }, [slug]);

  const onSubmit = async (values: FormValues) => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user || !vendorId) return;
    const { error } = await supabase.from("reviews").insert({
      vendor_id: vendorId,
      reviewer_id: user.id,
      ...values,
    });
    if (!error) router.push(`/vendors/${slug}?reviewed=1`);
  };

  // Loading
  if (hasInquired === null) {
    return (
      <div className="mx-auto max-w-xl px-4 py-16 text-center">
        <div className="h-6 w-6 animate-spin rounded-full border-2 border-brand-400 border-t-transparent mx-auto" />
      </div>
    );
  }

  // Already reviewed
  if (alreadyReviewed) {
    return (
      <div className="mx-auto max-w-xl px-4 py-12 sm:px-6">
        <Link
          href={`/vendors/${slug}`}
          className="flex items-center gap-1 text-sm text-gray-500 hover:text-brand-700 mb-6"
        >
          <ArrowLeft className="h-4 w-4" /> Back to {vendorName}
        </Link>
        <div className="card p-8 text-center">
          <p className="text-lg font-semibold text-gray-700 mb-2">
            You've already reviewed {vendorName}
          </p>
          <p className="text-sm text-gray-500">
            Each vendor can only be reviewed once per account.
          </p>
          <Link href={`/vendors/${slug}`} className="btn-secondary mt-4 inline-block text-sm">
            View your review
          </Link>
        </div>
      </div>
    );
  }

  // No prior inquiry — hard gate
  if (!hasInquired) {
    return (
      <div className="mx-auto max-w-xl px-4 py-12 sm:px-6">
        <Link
          href={`/vendors/${slug}`}
          className="flex items-center gap-1 text-sm text-gray-500 hover:text-brand-700 mb-6"
        >
          <ArrowLeft className="h-4 w-4" /> Back to {vendorName}
        </Link>
        <div className="card p-8 text-center">
          <Lock className="mx-auto h-10 w-10 text-gray-300 mb-3" />
          <h2 className="text-lg font-semibold text-gray-800 mb-2">
            Contact this vendor first
          </h2>
          <p className="text-sm text-gray-500 mb-6">
            To keep reviews trustworthy, you need to have contacted{" "}
            <strong>{vendorName}</strong> through the directory before leaving
            a review.
          </p>
          <Link href={`/vendors/${slug}`} className="btn-primary text-sm">
            Go to {vendorName}'s Profile
          </Link>
        </div>
      </div>
    );
  }

  // Allowed — show the form
  return (
    <div className="mx-auto max-w-xl px-4 py-12 sm:px-6">
      <Link
        href={`/vendors/${slug}`}
        className="flex items-center gap-1 text-sm text-gray-500 hover:text-brand-700 mb-6"
      >
        <ArrowLeft className="h-4 w-4" /> Back to {vendorName}
      </Link>
      <div className="card p-8">
        <h1 className="text-2xl font-bold mb-1">Write a Review</h1>
        <p className="text-sm text-gray-500 mb-6">
          Share your experience with {vendorName}
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-5">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Your Rating *
            </label>
            <StarRating
              rating={rating}
              size="lg"
              interactive
              onRate={(r) => setValue("rating", r)}
            />
            {errors.rating && (
              <p className="text-xs text-red-500 mt-1">{errors.rating.message}</p>
            )}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Review Title
            </label>
            <input
              {...register("title")}
              className="input"
              placeholder="Summarize your experience"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Your Review *
            </label>
            <textarea
              {...register("body")}
              rows={5}
              className="input resize-none"
              placeholder="Tell others about your experience with this vendor…"
            />
            {errors.body && (
              <p className="text-xs text-red-500 mt-1">{errors.body.message}</p>
            )}
          </div>
          <button
            type="submit"
            disabled={isSubmitting}
            className="btn-primary w-full justify-center"
          >
            {isSubmitting ? "Submitting…" : "Submit Review"}
          </button>
        </form>
      </div>
    </div>
  );
}
