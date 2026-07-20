"use client";

import { useState, useEffect, useCallback } from "react";
import { Plus, CalendarDays } from "lucide-react";
import Link from "next/link";
import { PropertyCard } from "@/components/PropertyCard";
import { AddPropertyModal } from "@/components/AddPropertyModal";

interface Property {
  id: string;
  name: string;
  address: string | null;
  ical_url: string | null;
  last_synced_at: string | null;
}

export default function PropertiesPage() {
  const [properties, setProperties] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);
  const [editing, setEditing] = useState<Property | null>(null);

  const fetchProperties = useCallback(async () => {
    const res = await fetch("/api/properties");
    const data = await res.json();
    setProperties(data.properties ?? []);
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchProperties();
  }, [fetchProperties]);

  function handleSaved(property: Property) {
    setProperties((prev) => {
      const exists = prev.find((p) => p.id === property.id);
      if (exists) return prev.map((p) => (p.id === property.id ? property : p));
      return [...prev, property];
    });
  }

  function handleDelete(id: string) {
    setProperties((prev) => prev.filter((p) => p.id !== id));
  }

  function openAdd() {
    setEditing(null);
    setShowModal(true);
  }

  function openEdit(property: Property) {
    setEditing(property);
    setShowModal(true);
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">My Properties</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            Add your STR listings and connect their iCal feeds to sync reservations.
          </p>
        </div>
        <button onClick={openAdd} className="btn-primary text-sm flex items-center gap-1.5">
          <Plus className="h-4 w-4" /> Add Property
        </button>
      </div>

      {/* Property list */}
      {loading ? (
        <div className="text-sm text-gray-400 py-8 text-center">Loading…</div>
      ) : properties.length === 0 ? (
        <div className="card p-10 text-center space-y-3">
          <div className="flex justify-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-full bg-brand-50">
              <CalendarDays className="h-7 w-7 text-brand-500" />
            </span>
          </div>
          <h3 className="font-semibold text-gray-800">No properties yet</h3>
          <p className="text-sm text-gray-500 max-w-sm mx-auto">
            Add your first STR property to start syncing your Airbnb or VRBO calendar and tracking upcoming check-outs.
          </p>
          <button onClick={openAdd} className="btn-primary text-sm">
            <Plus className="h-4 w-4" /> Add Your First Property
          </button>
        </div>
      ) : (
        <>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            {properties.map((p) => (
              <PropertyCard
                key={p.id}
                property={p}
                onEdit={openEdit}
                onDelete={handleDelete}
                onSynced={fetchProperties}
              />
            ))}
          </div>

          {/* Link to calendar view */}
          <div className="flex justify-end">
            <Link
              href="/host/dashboard/calendar"
              className="btn-secondary text-sm flex items-center gap-1.5"
            >
              <CalendarDays className="h-4 w-4" />
              View Calendar →
            </Link>
          </div>
        </>
      )}

      {/* Modal */}
      {showModal && (
        <AddPropertyModal
          editing={editing}
          onClose={() => { setShowModal(false); setEditing(null); }}
          onSaved={handleSaved}
        />
      )}
    </div>
  );
}
