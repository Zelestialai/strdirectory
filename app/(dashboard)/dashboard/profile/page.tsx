"use client";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { slugify } from "@/lib/utils";
import { Info } from "lucide-react";
import type { Category } from "@/types";

const schema = z.object({
  business_name: z.string().min(2, "Business name required"),
  category_id: z.string().uuid("Select a category"),
  tagline: z.string().max(120).optional(),
  description: z.string().max(2000).optional(),
  // Contact email is required — shown publicly and used for message notifications
  email: z.string().email("A valid contact email is required"),
  notification_email: z.string().email("Enter a valid email").optional().or(z.literal("")),
  phone: z.string().optional(),
  website: z.string().url("Enter a full URL (https://…)").optional().or(z.literal("")),
  city: z.string().optional(),
  state: z.string().max(2).optional(),
  zip: z.string().optional(),
  service_radius: z.coerce.number().min(0).max(500).optional(),
  services_raw: z.string().optional(),
});
type FormValues = z.infer<typeof schema>;

export default function EditProfilePage() {
  const router = useRouter();
  const supabase = createClient();
  const [categories, setCategories] = useState<Category[]>([]);
  const [saved, setSaved] = useState(false);
  const [existingVendorId, setExistingVendorId] = useState<string | null>(null);

  const { register, handleSubmit, reset, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    const load = async () => {
      const { data: cats } = await supabase.from("categories").select("*").order("name");
      setCategories(cats ?? []);

      const { data: { user } } = await supabase.auth.getUser();
      if (!user) { router.push("/login"); return; }

      const { data: v } = await supabase
        .from("vendors")
        .select("*, services:vendor_services(*)")
        .eq("user_id", user.id)
        .single();

      if (v) {
        setExistingVendorId(v.id);
        reset({
          business_name: v.business_name,
          category_id: v.category_id,
          tagline: v.tagline ?? "",
          description: v.description ?? "",
          email: v.email ?? user.email ?? "",
          notification_email: v.notification_email ?? "",
          phone: v.phone ?? "",
          website: v.website ?? "",
          city: v.city ?? "",
          state: v.state ?? "",
          zip: v.zip ?? "",
          service_radius: v.service_radius ?? undefined,
          services_raw: v.services?.map((s: { name: string }) => s.name).join(", ") ?? "",
        });
      } else {
        // Pre-fill contact email with auth email for new listings
        reset({ email: user.email ?? "" });
      }
    };
    load();
  }, []);

  const onSubmit = async (values: FormValues) => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;

    const slug = slugify(values.business_name);
    const payload = {
      user_id: user.id,
      business_name: values.business_name,
      slug,
      category_id: values.category_id,
      tagline: values.tagline || null,
      description: values.description || null,
      email: values.email,
      notification_email: values.notification_email || null,
      phone: values.phone || null,
      website: values.website || null,
      city: values.city || null,
      state: values.state || null,
      zip: values.zip || null,
      service_radius: values.service_radius || null,
      // Mark this vendor as claimed by their own registered account
      is_claimed: true,
    };

    let vendorId = existingVendorId;
    if (vendorId) {
      await supabase.from("vendors").update(payload).eq("id", vendorId);
    } else {
      const { data } = await supabase.from("vendors").insert(payload).select("id").single();
      vendorId = data?.id ?? null;
    }

    // Sync services
    if (vendorId) {
      await supabase.from("vendor_services").delete().eq("vendor_id", vendorId);
      const names = (values.services_raw ?? "").split(",").map((s) => s.trim()).filter(Boolean);
      if (names.length) {
        await supabase.from("vendor_services").insert(names.map((name) => ({ vendor_id: vendorId, name })));
      }
      setExistingVendorId(vendorId);
    }
    setSaved(true);
    setTimeout(() => setSaved(false), 3000);
  };

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 mb-6">
        {existingVendorId ? "Edit Your Listing" : "Create Your Listing"}
      </h1>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-8">
        {/* Basic info */}
        <div className="card p-6 space-y-5">
          <h2 className="font-semibold text-gray-800">Basic Information</h2>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Business Name *</label>
              <input {...register("business_name")} className="input" placeholder="My Cleaning Co." />
              {errors.business_name && <p className="text-xs text-red-500 mt-1">{errors.business_name.message}</p>}
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Category *</label>
              <select {...register("category_id")} className="input">
                <option value="">Select a category…</option>
                {categories.map((c) => (
                  <option key={c.id} value={c.id}>{c.name}</option>
                ))}
              </select>
              {errors.category_id && <p className="text-xs text-red-500 mt-1">{errors.category_id.message}</p>}
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Tagline <span className="text-gray-400">(max 120 chars)</span>
            </label>
            <input {...register("tagline")} className="input" placeholder="The best STR cleaners in Miami" />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
            <textarea
              {...register("description")}
              rows={6}
              className="input resize-none"
              placeholder="Describe your business, experience, and what makes you stand out…"
            />
          </div>
        </div>

        {/* Services */}
        <div className="card p-6 space-y-4">
          <h2 className="font-semibold text-gray-800">Services Offered</h2>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Services <span className="text-gray-400">(comma-separated)</span>
            </label>
            <input
              {...register("services_raw")}
              className="input"
              placeholder="Deep Cleaning, Same-Day Turnover, Linen Service"
            />
          </div>
        </div>

        {/* Contact & location */}
        <div className="card p-6 space-y-5">
          <h2 className="font-semibold text-gray-800">Contact Information</h2>

          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Business Email *
              </label>
              <input {...register("email")} type="email" className="input" placeholder="hello@mybusiness.com" />
              <p className="mt-1 text-xs text-gray-400">Displayed publicly on your profile.</p>
              {errors.email && <p className="text-xs text-red-500 mt-1">{errors.email.message}</p>}
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Phone</label>
              <input {...register("phone")} type="tel" className="input" placeholder="+1 (555) 000-0000" />
              <p className="mt-1 text-xs text-gray-400">Displayed publicly on your profile.</p>
            </div>
          </div>

          {/* Notification email */}
          <div className="rounded-lg bg-brand-50 border border-brand-100 p-4 space-y-3">
            <div className="flex items-start gap-2">
              <Info className="h-4 w-4 text-brand-600 shrink-0 mt-0.5" />
              <p className="text-sm text-brand-800 font-medium">Message Notification Email</p>
            </div>
            <p className="text-xs text-brand-700 -mt-1 ml-6">
              When a host sends you a message through the directory, we'll alert you at this address.
              Leave blank to use your business email above.
            </p>
            <div className="ml-6">
              <input
                {...register("notification_email")}
                type="email"
                className="input bg-white"
                placeholder="alerts@mybusiness.com  (optional)"
              />
              {errors.notification_email && (
                <p className="text-xs text-red-500 mt-1">{errors.notification_email.message}</p>
              )}
            </div>
          </div>

          <div className="sm:col-span-2">
            <label className="block text-sm font-medium text-gray-700 mb-1">Website</label>
            <input {...register("website")} type="url" className="input" placeholder="https://mybusiness.com" />
            {errors.website && <p className="text-xs text-red-500 mt-1">{errors.website.message}</p>}
          </div>
        </div>

        {/* Location */}
        <div className="card p-6 space-y-5">
          <h2 className="font-semibold text-gray-800">Location & Service Area</h2>
          <div className="grid gap-4 sm:grid-cols-3">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">City</label>
              <input {...register("city")} className="input" placeholder="Miami" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">State</label>
              <input {...register("state")} className="input" placeholder="FL" maxLength={2} />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">ZIP</label>
              <input {...register("zip")} className="input" placeholder="33101" />
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Service Radius (miles)</label>
            <input
              {...register("service_radius")}
              type="number"
              min="0"
              max="500"
              className="input w-32"
              placeholder="25"
            />
          </div>
        </div>

        <div className="flex items-center gap-4">
          <button type="submit" disabled={isSubmitting} className="btn-primary px-8">
            {isSubmitting ? "Saving…" : existingVendorId ? "Save Changes" : "Create Listing"}
          </button>
          {saved && <span className="text-sm text-green-600 font-medium">✓ Saved successfully</span>}
        </div>
      </form>
    </div>
  );
}
