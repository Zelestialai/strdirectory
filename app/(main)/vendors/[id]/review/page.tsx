"use client";
import { useState, useEffect } from "react";
import { useRouter, useParams } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { StarRating } from "@/components/StarRating";
import { ArrowLeft } from "lucide-react";
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
  const supabase = createClient();

  const { register, handleSubmit, setValue, watch, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
    defaultValues: { rating: 0 },
  });
  const rating = watch("rating");

  useEffect(() => {
    supabase.from("vendors").select("id, business_name").eq("slug", slug).single()
      .then(({ data }) => { if (data) { setVendorId(data.id); setVendorName(data.business_name); } });
  }, [slug]);

  const onSubmit = async (values: FormValues) => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user || !vendorId) { router.push("/login"); return; }
    const { error } = await supabase.from("reviews").insert({
      vendor_id: vendorId,
      reviewer_id: user.id,
      ...values,
    });
    if (!error) router.push(`/vendors/${slug}?reviewed=1`);
  };

  return (
    <div className="mx-auto max-w-xl px-4 py-12 sm:px-6">
      <Link href={`/vendors/${slug}`} className="flex items-center gap-1 text-sm text-gray-500 hover:text-brand-700 mb-6">
        <ArrowLeft className="h-4 w-4" /> Back to {vendorName}
      </Link>
      <div className="card p-8">
        <h1 className="text-2xl font-bold mb-1">Write a Review</h1>
        <p className="text-sm text-gray-500 mb-6">Share your experience with {vendorName}</p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-5">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">Your Rating *</label>
            <StarRating rating={rating} size="lg" interactive onRate={(r) => setValue("rating", r)} />
            {errors.rating && <p className="text-xs text-red-500 mt-1">{errors.rating.message}</p>}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Review Title</label>
            <input {...register("title")} className="input" placeholder="Summarize your experience" />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Your Review *</label>
            <textarea {...register("body")} rows={5} className="input resize-none" placeholder="Tell others about your experience with this vendor…" />
            {errors.body && <p className="text-xs text-red-500 mt-1">{errors.body.message}</p>}
          </div>
          <button type="submit" disabled={isSubmitting} className="btn-primary w-full justify-center">
            {isSubmitting ? "Submitting…" : "Submit Review"}
          </button>
        </form>
      </div>
    </div>
  );
}
