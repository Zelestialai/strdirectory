import type { Vendor } from "@/types";

export interface ChecklistStep {
  id: string;
  label: string;
  description: string;
  done: boolean;
  href: string; // where to go to complete this step
  weight: number; // relative importance (weights sum to 100)
}

export function getChecklistSteps(vendor: Vendor & { services?: { id: string }[] }): ChecklistStep[] {
  return [
    {
      id: "basic_info",
      label: "Business name & category",
      description: "Your listing is created and categorised.",
      done: !!(vendor.business_name && vendor.category_id),
      href: "/dashboard/profile",
      weight: 10,
    },
    {
      id: "location",
      label: "Add your location",
      description: "Let hosts know which city and state you serve.",
      done: !!(vendor.city && vendor.state),
      href: "/dashboard/profile#location",
      weight: 15,
    },
    {
      id: "description",
      label: "Write a description",
      description: "Tell hosts what makes your business great (at least 80 characters).",
      done: !!(vendor.description && vendor.description.trim().length >= 80),
      href: "/dashboard/profile#description",
      weight: 20,
    },
    {
      id: "logo",
      label: "Upload a logo",
      description: "A professional logo builds trust and recognition.",
      done: !!vendor.logo_url,
      href: "/dashboard/profile#logo",
      weight: 15,
    },
    {
      id: "cover",
      label: "Add a cover photo",
      description: "A great cover photo makes your card stand out in search results.",
      done: !!vendor.cover_url,
      href: "/dashboard/profile#cover",
      weight: 10,
    },
    {
      id: "services",
      label: "List your services",
      description: "Add the specific services you offer so hosts know what to expect.",
      done: !!(vendor.services && vendor.services.length > 0),
      href: "/dashboard/profile#services",
      weight: 15,
    },
    {
      id: "contact",
      label: "Add contact info",
      description: "Phone number or website so hosts can reach you directly.",
      done: !!(vendor.phone || vendor.website),
      href: "/dashboard/profile#contact",
      weight: 15,
    },
  ];
}

export function getCompletionScore(steps: ChecklistStep[]): number {
  const totalWeight = steps.reduce((sum, s) => sum + s.weight, 0);
  const doneWeight = steps.filter((s) => s.done).reduce((sum, s) => sum + s.weight, 0);
  return Math.round((doneWeight / totalWeight) * 100);
}

export function getNextIncompleteStep(steps: ChecklistStep[]): ChecklistStep | null {
  return steps.find((s) => !s.done) ?? null;
}
