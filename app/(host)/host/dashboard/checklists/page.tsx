import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { ChecklistEditor } from "@/components/turnover/ChecklistEditor";

export const metadata = { title: "Cleaning Checklists" };

export default async function HostChecklistsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/host/dashboard/checklists");

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Cleaning Checklists</h1>
        <p className="text-sm text-gray-500 mt-0.5">
          Set the checklist your cleaners follow on every turnover. Start from the
          default, add rooms and items, and create custom lists for specific properties.
        </p>
      </div>
      <ChecklistEditor />
    </div>
  );
}
