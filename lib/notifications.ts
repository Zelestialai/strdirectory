import { supabaseAdmin } from "@/lib/supabase/admin";

export type NotificationType = "inquiry" | "review" | "reply" | "subscription" | "system";

export interface CreateNotificationInput {
  userId: string;
  type: NotificationType;
  title: string;
  body?: string;
  link?: string;
}

/**
 * Insert an in-app notification for a user (server-side only, uses service role).
 * Fire-and-forget: never throws — a failed notification must not break the
 * request that triggered it.
 */
export async function createNotification(input: CreateNotificationInput): Promise<void> {
  try {
    await supabaseAdmin.from("notifications").insert({
      user_id: input.userId,
      type: input.type,
      title: input.title,
      body: input.body ?? null,
      link: input.link ?? null,
    });
  } catch (err) {
    console.error("createNotification failed:", err);
  }
}

/** Look up a vendor's owning user id from a vendor id. */
export async function getVendorOwnerId(vendorId: string): Promise<string | null> {
  const { data } = await supabaseAdmin
    .from("vendors")
    .select("user_id")
    .eq("id", vendorId)
    .single();
  return data?.user_id ?? null;
}
