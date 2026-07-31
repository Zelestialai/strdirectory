import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { ProfileForm } from "@/components/settings/ProfileForm";
import { NotificationToggles, type NotificationPrefs } from "@/components/settings/NotificationToggles";
import { ChangePasswordForm } from "@/components/settings/ChangePasswordForm";
import { DangerZone } from "@/components/settings/DangerZone";

export const metadata = { title: "Settings" };

export default async function SettingsPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/dashboard/settings");

  const { data: profile } = await supabase
    .from("profiles")
    .select(
      "full_name, email_on_inquiry, email_on_review, email_weekly_digest, email_product_updates"
    )
    .eq("id", user.id)
    .single();

  const prefs: NotificationPrefs = {
    email_on_inquiry: profile?.email_on_inquiry ?? true,
    email_on_review: profile?.email_on_review ?? true,
    email_weekly_digest: profile?.email_weekly_digest ?? true,
    email_product_updates: profile?.email_product_updates ?? true,
  };

  return (
    <div className="space-y-6 max-w-2xl">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Settings</h1>
        <p className="text-sm text-gray-500 mt-0.5">Manage your account, notifications and security.</p>
      </div>

      <ProfileForm initialName={profile?.full_name ?? ""} email={user.email ?? ""} />
      <NotificationToggles initial={prefs} />
      <ChangePasswordForm />
      <DangerZone />
    </div>
  );
}
