"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { X, Loader2, Check } from "lucide-react";
import { MarketMultiSelect } from "@/components/MarketMultiSelect";

export interface AdminCategory {
  id: string;
  name: string;
}

export interface EditableVendor {
  id: string;
  business_name: string;
  category_id?: string | null;
  tagline?: string | null;
  description?: string | null;
  website?: string | null;
  phone?: string | null;
  email?: string | null;
  city?: string | null;
  state?: string | null;
  markets?: string[] | null;
  subscription_tier?: string | null;
  is_verified?: boolean;
  is_featured?: boolean;
  is_active?: boolean;
}

export function AdminVendorForm({
  categories,
  vendor = null,
  onClose,
}: {
  categories: AdminCategory[];
  vendor?: EditableVendor | null;
  onClose: () => void;
}) {
  const router = useRouter();
  const editing = !!vendor;

  const [f, setF] = useState({
    business_name: vendor?.business_name ?? "",
    category_id: vendor?.category_id ?? "",
    city: vendor?.city ?? "",
    state: vendor?.state ?? "",
    email: vendor?.email ?? "",
    phone: vendor?.phone ?? "",
    website: vendor?.website ?? "",
    tagline: vendor?.tagline ?? "",
    description: vendor?.description ?? "",
    subscription_tier: vendor?.subscription_tier ?? "free",
    is_verified: vendor?.is_verified ?? false,
    is_featured: vendor?.is_featured ?? false,
  });
  const [markets, setMarkets] = useState<string[]>(vendor?.markets ?? []);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  function set<K extends keyof typeof f>(k: K, v: (typeof f)[K]) {
    setF((p) => ({ ...p, [k]: v }));
  }

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    if (!f.business_name.trim() || !f.category_id) {
      setError("Business name and category are required.");
      return;
    }
    setBusy(true);
    setError(null);
    try {
      const payload = { ...f, markets };
      const res = await fetch(
        editing ? `/api/admin/vendors/${vendor!.id}` : "/api/admin/vendors",
        {
          method: editing ? "PATCH" : "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(payload),
        }
      );
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Save failed");
      onClose();
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Save failed");
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-start justify-center overflow-y-auto bg-black/40 p-4 sm:p-8">
      <div className="w-full max-w-2xl rounded-2xl bg-white shadow-xl">
        <div className="flex items-center justify-between border-b px-5 py-4">
          <h2 className="text-lg font-semibold text-gray-900">
            {editing ? "Edit vendor" : "Add vendor"}
          </h2>
          <button onClick={onClose} className="p-1 text-gray-400 hover:text-gray-700">
            <X className="h-5 w-5" />
          </button>
        </div>

        <form onSubmit={submit} className="max-h-[75vh] overflow-y-auto p-5 space-y-4">
          <div className="grid gap-4 sm:grid-cols-2">
            <div className="sm:col-span-2">
              <label className="mb-1 block text-sm font-medium text-gray-700">Business name *</label>
              <input value={f.business_name} onChange={(e) => set("business_name", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>

            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">Category *</label>
              <select value={f.category_id} onChange={(e) => set("category_id", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none">
                <option value="">Select a category…</option>
                {categories.map((c) => (
                  <option key={c.id} value={c.id}>{c.name}</option>
                ))}
              </select>
            </div>

            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">Plan / tier</label>
              <select value={f.subscription_tier} onChange={(e) => set("subscription_tier", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none">
                <option value="free">Free</option>
                <option value="pro">Pro</option>
                <option value="featured">Featured</option>
              </select>
            </div>

            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">City</label>
              <input value={f.city} onChange={(e) => set("city", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">State</label>
              <input value={f.state} onChange={(e) => set("state", e.target.value)} maxLength={2}
                placeholder="e.g. CA"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm uppercase focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>

            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">Email</label>
              <input value={f.email} onChange={(e) => set("email", e.target.value)} type="email"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div>
              <label className="mb-1 block text-sm font-medium text-gray-700">Phone</label>
              <input value={f.phone} onChange={(e) => set("phone", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div className="sm:col-span-2">
              <label className="mb-1 block text-sm font-medium text-gray-700">Website</label>
              <input value={f.website} onChange={(e) => set("website", e.target.value)}
                placeholder="https://…"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>

            <div className="sm:col-span-2">
              <label className="mb-1 block text-sm font-medium text-gray-700">Markets served</label>
              <MarketMultiSelect selected={markets} onChange={setMarkets} placeholder="Search markets…" />
            </div>

            <div className="sm:col-span-2">
              <label className="mb-1 block text-sm font-medium text-gray-700">Tagline</label>
              <input value={f.tagline} onChange={(e) => set("tagline", e.target.value)}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div className="sm:col-span-2">
              <label className="mb-1 block text-sm font-medium text-gray-700">Description</label>
              <textarea value={f.description} onChange={(e) => set("description", e.target.value)} rows={4}
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
          </div>

          <div className="flex flex-wrap gap-5 pt-1">
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" checked={f.is_verified} onChange={(e) => set("is_verified", e.target.checked)} />
              Verified
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" checked={f.is_featured} onChange={(e) => set("is_featured", e.target.checked)} />
              Featured
            </label>
          </div>

          {error && <p className="text-sm text-red-600">{error}</p>}

          <div className="flex items-center justify-end gap-2 border-t pt-4">
            <button type="button" onClick={onClose} className="rounded-lg px-4 py-2 text-sm text-gray-600 hover:bg-gray-100">
              Cancel
            </button>
            <button type="submit" disabled={busy}
              className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
              {busy ? <Loader2 className="h-4 w-4 animate-spin" /> : <Check className="h-4 w-4" />}
              {editing ? "Save changes" : "Create vendor"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
