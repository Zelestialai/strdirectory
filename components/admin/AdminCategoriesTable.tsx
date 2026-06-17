"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Pencil, Check, X } from "lucide-react";

const COLORS = ["sky", "violet", "amber", "green", "rose", "indigo", "teal", "orange", "emerald", "red", "blue", "yellow"];
const ICONS  = ["Sparkles","Camera","Wrench","Building2","Home","Palette","HardHat","Calculator","ShieldCheck","Sofa","Wifi","Scale"];

interface Category {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  icon: string | null;
  color: string | null;
  vendor_count: number;
}

export function AdminCategoriesTable({ categories }: { categories: Category[] }) {
  const router = useRouter();
  const [, startTransition] = useTransition();
  const [editId, setEditId] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [editForm, setEditForm] = useState<{ name: string; description: string; icon: string; color: string }>({
    name: "", description: "", icon: "", color: "",
  });

  const startEdit = (cat: Category) => {
    setEditId(cat.id);
    setEditForm({
      name: cat.name,
      description: cat.description ?? "",
      icon: cat.icon ?? "",
      color: cat.color ?? "sky",
    });
  };

  const save = async (id: string) => {
    setSaving(true);
    await fetch(`/api/admin/categories/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        name: editForm.name,
        description: editForm.description || null,
        icon: editForm.icon || null,
        color: editForm.color || null,
      }),
    });
    setSaving(false);
    setEditId(null);
    startTransition(() => router.refresh());
  };

  return (
    <div className="card overflow-x-auto">
      <table className="w-full text-sm">
        <thead className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wider">
          <tr>
            <th className="px-4 py-3 text-left">Category</th>
            <th className="px-4 py-3 text-left hidden md:table-cell">Slug</th>
            <th className="px-4 py-3 text-left">Color</th>
            <th className="px-4 py-3 text-left hidden lg:table-cell">Icon</th>
            <th className="px-4 py-3 text-right hidden sm:table-cell">Vendors</th>
            <th className="px-4 py-3 text-center">Edit</th>
          </tr>
        </thead>
        <tbody className="divide-y">
          {categories.map((cat) => (
            <tr key={cat.id} className="hover:bg-gray-50 transition">
              {editId === cat.id ? (
                /* ── Edit row ── */
                <>
                  <td className="px-4 py-2" colSpan={4}>
                    <div className="flex flex-col gap-2">
                      <input
                        value={editForm.name}
                        onChange={(e) => setEditForm({ ...editForm, name: e.target.value })}
                        className="input py-1 text-sm"
                        placeholder="Name"
                      />
                      <input
                        value={editForm.description}
                        onChange={(e) => setEditForm({ ...editForm, description: e.target.value })}
                        className="input py-1 text-sm"
                        placeholder="Description (optional)"
                      />
                      <div className="flex gap-2">
                        <select
                          value={editForm.color}
                          onChange={(e) => setEditForm({ ...editForm, color: e.target.value })}
                          className="input py-1 text-sm flex-1"
                        >
                          {COLORS.map((c) => <option key={c} value={c}>{c}</option>)}
                        </select>
                        <select
                          value={editForm.icon}
                          onChange={(e) => setEditForm({ ...editForm, icon: e.target.value })}
                          className="input py-1 text-sm flex-1"
                        >
                          <option value="">— No icon —</option>
                          {ICONS.map((i) => <option key={i} value={i}>{i}</option>)}
                        </select>
                      </div>
                    </div>
                  </td>
                  <td className="px-4 py-2" />
                  <td className="px-4 py-2 text-center">
                    <div className="flex items-center justify-center gap-1">
                      <button
                        onClick={() => save(cat.id)}
                        disabled={saving}
                        className="rounded-lg p-1.5 text-green-600 hover:bg-green-50 transition"
                        title="Save"
                      >
                        <Check className="h-4 w-4" />
                      </button>
                      <button
                        onClick={() => setEditId(null)}
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-gray-100 transition"
                        title="Cancel"
                      >
                        <X className="h-4 w-4" />
                      </button>
                    </div>
                  </td>
                </>
              ) : (
                /* ── View row ── */
                <>
                  <td className="px-4 py-3 font-medium text-gray-800">{cat.name}</td>
                  <td className="px-4 py-3 text-gray-400 font-mono text-xs hidden md:table-cell">{cat.slug}</td>
                  <td className="px-4 py-3">
                    <span className={`inline-block h-4 w-4 rounded-full bg-${cat.color ?? "sky"}-400`} />
                    <span className="ml-1.5 text-xs text-gray-500">{cat.color ?? "—"}</span>
                  </td>
                  <td className="px-4 py-3 text-gray-500 text-xs hidden lg:table-cell">{cat.icon ?? "—"}</td>
                  <td className="px-4 py-3 text-right text-gray-500 hidden sm:table-cell">{cat.vendor_count}</td>
                  <td className="px-4 py-3 text-center">
                    <button
                      onClick={() => startEdit(cat)}
                      className="rounded-lg p-1.5 text-gray-400 hover:bg-brand-50 hover:text-brand-600 transition"
                      title="Edit category"
                    >
                      <Pencil className="h-4 w-4" />
                    </button>
                  </td>
                </>
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
