"use client";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { slugify } from "@/lib/utils";
import { Info } from "lucide-react";
import { MarketMultiSelect } from "@/components/MarketMultiSelect";
import { LogoUploader, GalleryUploader } from "@/components/PhotoUploader";
import type { Category, VendorPhoto } from "@/types";

const schema = z.object({
  business_name: z.string().min(2, "Business name required"),
  category_id: z.string().uuid("Select a category"),
  tagline: z.string().max(120).optional(),
  description: z.string().max(2000).optional(),
  email: z.string().email("A valid contact email is required"),
  notification_email: z.string().email("Enter a valid email").optional().or(z.literal("")),
  phone: z.string().optional(),
  website: z.string().url("Enter a full URL (https://…)").optional().or(z.literal("")),
  city: z.string().optional(),
  state: z.string().max(2).optional(),
  zip: z.string().optional(),
  service_radius: z.coerce.number().min(0).max(500).optional(),
  services_raw: z.string().optional(),
  google_place_id: z.string().optional(),
});
type FormValues = z.infer<typeof schema>;

export default function EditProfilePage() {
  const router = useRouter();
  const supabase = createClient();
  const [categories, setCategories] = useState<Category[]>([]);
  const [saved, setSaved] = useState(false);
  const [existingVendorId, setExistingVendorId] = useState<string | null>(null);
  const [markets, setMarkets] = useState<string[]>([]);
  const [logoUrl, setLogoUrl] = useState<string | null>(null);
  const [galleryPhotos, setGalleryPhotos] = useState<VendorPhoto[]>([]);
  const [googlePlaceId, setGooglePlaceId] = useState<string>("");

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
        .select("*, services:vendor_services(*), photos:vendor_photos(*)")
        .eq("user_id", user.id)
        .single();

      if (v) {
        setExistingVendorId(v.id);
        setMarkets(v.markets ?? []);
        setLogoUrl(v.logo_url ?? null);
        setGalleryPhotos((v.photos ?? []).sort((a: VendorPhoto, b: VendorPhoto) => a.sort_order - b.sort_order));
        setGooglePlaceId(v.google_place_id ?? "");
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
          google_place_id: v.google_place_id ?? "",
        });
      } else {
        const meta = user.user_metadata ?? {};
        if (meta.markets && Array.isArray(meta.markets)) setMarkets(meta.markets);
        reset({
          business_name: meta.business_name ?? "",
          category_id: meta.category_id ?? "",
          website: meta.website ?? "",
          phone: meta.phone ?? "",
          email: user.email ?? "",
        });
      }
    };
    load();
  }, []);

  const onSubmit = async (values: FormValues) => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;

    const isNewVendor = !existingVendorId;
    let vendorId = existingVendorId;

    if (vendorId) {
      await supabase.from("vendors").update({
        business_name: values.business_name,
        category_id: values.category_id,
        tagline: values.tagline || null,
        description: values.description || null,
        email: values.email,
        notification_email: values.notification_email || null,
        phone: values.phone || null,
        website: values.website || null,
        city: values.city || null,
        state: values.state?.toUpperCase() || null,
        zip: values.zip || null,
        service_radius: values.service_radius || null,
        google_place_id: values.google_place_id || null,
        markets,
      }).eq("id", vendorId);
    } else {
      const slug = slugify(values.business_name);
      const { data } = await supabase.from("vendors").insert({
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
        state: values.state?.toUpperCase() || null,
        zip: values.zip || null,
        service_radius: values.service_radius || null,
        google_place_id: values.google_place_id || null,
        markets,
        is_claimed: true,
      }).select("id").single();
      vendorId = data?.id ?? null;
    }

    if (vendorId) {
      await supabase.from("vendor_services").delete().eq("vendor_id", vendorId);
      const names = (values.services_raw ?? "").split(",").map((s) => s.trim()).filter(Boolean);
      if (names.length) {
        await supabase.from("vendor_services").insert(names.map((name) => ({ vendor_id: vendorId, name })));
      }
      setExistingVendorId(vendorId);
    }

    if (isNewVendor) {
      router.push("/dashboard/onboarding");
      return;
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

        {/* Photos — only available once listing exists */}
        {existingVendorId ? (
          <div className="card p-6 space-y-6">
            <h2 className="font-semibold text-gray-800">Photos</h2>
            <div className="grid gap-8 sm:grid-cols-2">
              <LogoUploader
                vendorId={existingVendorId}
                initialUrl={logoUrl}
                onUploaded={setLogoUrl}
              />
              <GalleryUploader
                vendorId={existingVendorId}
                initialPhotos={galleryPhotos}
              />
            </div>
          </div>
        ) : (
          <div className="card p-5 flex items-center gap-3 border-dashed">
            <div className="h-9 w-9 rounded-lg bg-gray-100 flex items-center justify-center shrink-0 text-gray-400">
              <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5}
                  d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
            <p className="text-sm text-gray-500">
              <span className="font-medium text-gray-700">Photos</span> — Save your listing first to upload a logo and gallery photos.
            </p>
          </div>
        )}

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

        {/* Markets */}
        <div className="card p-6 space-y-4">
          <div>
            <h2 className="font-semibold text-gray-800">Markets Served</h2>
            <p className="text-sm text-gray-500 mt-0.5">
              Select the STR markets where you offer services. Your listing will appear in those market directories.
            </p>
          </div>
          <MarketMultiSelect
            selected={markets}
            onChange={setMarkets}
            placeholder="Search 106 STR markets…"
          />
          {markets.length === 0 && (
            <p className="text-xs text-amber-600 bg-amber-50 rounded-lg px-3 py-2 border border-amber-100">
              Select at least one market to appear in market-specific searches.
            </p>
          )}
        </div>

        {/* Contact */}
        <div className="card p-6 space-y-5">
          <h2 className="font-semibold text-gray-800">Contact Information</h2>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Business Email *</label>
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

          <div>
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

        {/* Google Place ID */}
        <div className="card p-6 space-y-4">
          <div>
            <h2 className="font-semibold text-gray-800">Google Reviews</h2>
            <p className="text-xs text-gray-500 mt-0.5">
              Link your Google Business profile to display your Google reviews on your public listing.
            </p>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Google Place ID
            </label>
            <input
              {...register("google_place_id")}
              className="input"
              placeholder="ChIJN1t_tDeuEmsRUsoyG83frY4"
            />
            <p className="text-xs text-gray-400 mt-1.5">
              Find your Place ID at{" "}
              <a
                href="https://developers.google.com/maps/documentation/places/web-service/place-id"
                target="_blank"
                rel="noopener noreferrer"
                className="text-brand-600 hover:underline"
              >
                developers.google.com/maps/…/place-id
              </a>
            </p>
          </div>
        </div>

        <div className="flex items-center gap-4">
          