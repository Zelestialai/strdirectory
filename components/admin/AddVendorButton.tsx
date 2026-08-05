"use client";

import { useState } from "react";
import { Plus } from "lucide-react";
import { AdminVendorForm, type AdminCategory } from "@/components/admin/AdminVendorForm";

export function AddVendorButton({ categories }: { categories: AdminCategory[] }) {
  const [open, setOpen] = useState(false);
  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-3 py-2 text-sm font-semibold text-white hover:bg-brand-700"
      >
        <Plus className="h-4 w-4" /> Add Vendor
      </button>
      {open && <AdminVendorForm categories={categories} onClose={() => setOpen(false)} />}
    </>
  );
}
