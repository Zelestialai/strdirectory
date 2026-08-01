import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { HostSidebar } from "@/components/HostSidebar";

export default async function HostLayout({ children }: { children: React.ReactNode }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile && profile.role === "vendor") redirect("/dashboard");
  if (profile && profile.role === "admin") redirect("/admin");

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
      <div className="flex flex-col lg:flex-row gap-8">
        <HostSidebar />
        <div className="flex-1 min-w-0">{children}</div>
      </div>
    </div>
  );
}
