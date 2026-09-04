import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { HostTurnovers } from "@/components/turnover/HostTurnovers";

export const metadata = { title: "Turnovers" };

export default async function HostTurnoversPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/host/dashboard/turnovers");

  const [{ data: tasks }, { data: properties }] = await Promise.all([
    supabase
      .from("turnover_tasks")
      .select(
        `id, property_id, title, notes, scheduled_date, status, price_cents,
         property:properties(name),
         assigned:vendors(business_name),
         bids:turnover_bids(id, price_cents, message, status, vendor:vendors(business_name, avg_rating, slug))`
      )
      .eq("host_id", user.id)
      .order("scheduled_date", { ascending: true }),
    supabase
      .from("properties")
      .select("id, name")
      .eq("host_id", user.id)
      .order("name"),
  ]);

  return (
    <HostTurnovers
      tasks={(tasks as any) ?? []}
      properties={(properties as any) ?? []}
    />
  );
}
