"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { MapPin, Eye, EyeOff, Plus, X } from "lucide-react";

interface Market {
  id: string;
  name: string;
  slug: string;
  state: string;
  cities: string[];
  tagline: string | null;
  is_active: boolean;
}

export function AdminMarketsTable({ markets }: { markets: Market[] }) {
  const router = useRouter();
  const [, startTransition] = useTransition();
  const [loadingId, setLoadingId] = useState<string | null>(null);
  const [showAddForm, setShowAddForm] = useState(false);
  const [adding, setAdding] = useState(false);
  const [addError, setAddError] = useState<string | null>(null);
  const [form, setForm] = useState({ name: "", slug: "", state: "", cities: "", tagline: "" });

  const toggle = async (market: Market) => {
    setLoadingId(market.id);
    await fetch(`/api/admin/markets/${market.id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ is_active: !market.is_active }),
    });
    setLoadingId(null);
    startTransition(() => router.refresh());
  };

  const handleAdd = async (e: React.FormEvent) => {
    e.preventDefault();
    setAdding(true);
    setAddError(null);
    const res = await fetch("/api/admin/markets", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        name: form.name,
        slug: form.slug || form.name.toLowerCase().replace(/\s+/g, "-").replace(/[^a-z0-9-]/g, ""),
        state: form.state,
        cities: form.cities,
        tagline: form.tagline || null,
      }),
    });
    setAdding(false);
    if (res.ok) {
      setShowAddForm(false);
      setForm({ name: "", slug: "", state: "", cities: "", tagline: "" });
      startTransition(() => router.refresh());
    } else {
      const err = await res.json();
      setAddError(err.error ?? "Failed to add market");
    }
  };

  const active   = markets.filter((m) => m.is_active);
  const inactive = markets.filter((m) => !m.is_active);

  return (
    <div className="space-y-5">
      {/* Add market button */}
      <div className="flex justify-end">
        <button
          onClick={() => setShowAddForm(!showAddForm)}
          className={`flex items-center gap-1.5 rounded-lg px-4 py-2 text-sm font-medium transition ${
            showAddForm ? "bg-gray-100 text-gray-600" : "btn-primary"
          }`}
        >
          {showAddForm ? <><X className="h-4 w-4" /> Cancel</> : <><Plus className="h-4 w-4" /> Add Market</>}
        </button>
      </div>

      {/* Add market form */}
      {showAddForm && (
        <form onSubmit={handleAdd} className="card p-6 space-y-4 border-2 border-brand-200">
          <h3 className="font-semibold text-gray-800">New Market</h3>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">Name *</label>
              <input required value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="input" placeholder="e.g. Lake Placid" />
            </div>
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">State * (2-letter)</label>
              <input required maxLength={2} value={form.state} onChange={(e) => setForm({ ...form, state: e.target.value.toUpperCase() })} className="input" placeholder="NY" />
            </div>
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">Slug (auto-generated if blank)</label>
              <input value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })} className="input" placeholder="lake-placid" />
            </div>
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">Cities (comma-separated) *</label>
              <input required value={form.cities} onChange={(e) => setForm({ ...form, cities: e.target.value })} className="input" placeholder="Lake Placid, Saranac Lake, Wilmington" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-xs font-medium text-gray-600 mb-1">Tagline</label>
              <input value={form.tagline} onChange={(e) => setForm({ ...form, tagline: e.target.value })} className="input" placeholder="Short description for search results" />
            </div>
          </div>
          {addError && <p className="text-sm text-red-600">{addError}</p>}
          <div className="flex justify-end">
            <button type="submit" disabled={adding} className="btn-primary">
              {adding ? "Adding…" : "Add Market"}
            </button>
          </div>
        </form>
      )}

      {/* Active markets */}
      <div className="card overflow-hidden">
        <div className="px-4 py-3 border-b bg-gray-50 flex items-center gap-2 text-sm font-medium text-gray-700">
          <Eye className="h-4 w-4 text-green-500" /> Active Markets
          <span className="ml-auto text-xs text-gray-400 font-normal">{active.length}</span>
        </div>
        <table className="w-full text-sm">
          <thead className="text-xs text-gray-500 uppercase tracking-wider border-b">
            <tr>
              <th className="px-4 py-2 text-left">Market</th>
              <th className="px-4 py-2 text-left hidden md:table-cell">Cities</th>
              <th className="px-4 py-2 text-center">Toggle</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {active.map((m) => (
              <tr key={m.id} className="hover:bg-gray-50 transition">
                <td className="px-4 py-3">
                  <div className="flex items-center gap-2">
                    <MapPin className="h-3.5 w-3.5 text-brand-500 shrink-0" />
                    <div>
                      <p className="font-medium text-gray-800">{m.name}</p>
                      <p className="text-xs text-gray-400">{m.state} · /{m.slug}</p>
                    </div>
                  </div>
                </td>
                <td className="px-4 py-3 hidden md:table-cell text-gray-500 text-xs">
                  {m.cities.slice(0, 4).join(", ")}{m.cities.length > 4 ? ` +${m.cities.length - 4}` : ""}
                </td>
                <td className="px-4 py-3 text-center">
                  <button
                    disabled={loadingId === m.id}
                    onClick={() => toggle(m)}
                    className="rounded-lg p-1.5 text-green-500 hover:bg-red-50 hover:text-red-500 transition"
                    title="Deactivate market"
                  >
                    <EyeOff className="h-4 w-4" />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Inactive markets */}
      {inactive.length > 0 && (
        <div className="card overflow-hidden">
          <div className="px-4 py-3 border-b bg-gray-50 flex items-center gap-2 text-sm font-medium text-gray-500">
            <EyeOff className="h-4 w-4 text-gray-400" /> Inactive Markets
            <span className="ml-auto text-xs text-gray-400 font-normal">{inactive.length}</span>
          </div>
          <table className="w-full text-sm">
            <tbody className="divide-y">
              {inactive.map((m) => (
                <tr key={m.id} className="hover:bg-gray-50 transition opacity-60">
                  <td className="px-4 py-3">
                    <div className="flex items-center gap-2">
                      <MapPin className="h-3.5 w-3.5 text-gray-400 shrink-0" />
                      <div>
                        <p className="font-medium text-gray-600">{m.name}</p>
                        <p className="text-xs text-gray-400">{m.state} · /{m.slug}</p>
                      </div>
                    </div>
                  </td>
                  <td className="px-4 py-3 text-center">
                    <button
                      disabled={loadingId === m.id}
                      onClick={() => toggle(m)}
                      className="rounded-lg p-1.5 text-gray-400 hover:bg-green-50 hover:text-green-500 transition"
                      title="Activate market"
                    >
                      <Eye className="h-4 w-4" />
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
