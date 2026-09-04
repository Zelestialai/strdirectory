import { supabaseAdmin } from "@/lib/supabase/admin";

export interface PhotoAuth {
  ok: boolean;
  isHost: boolean;
  isVendor: boolean;
  hostId: string | null;
  vendorId: string | null;
  propertyId: string | null;
}

const DENY: PhotoAuth = {
  ok: false, isHost: false, isVendor: false, hostId: null, vendorId: null, propertyId: null,
};

/** The vendor id belonging to a user, if they are a vendor. */
async function vendorIdForUser(userId: string): Promise<string | null> {
  const { data } = await supabaseAdmin
    .from("vendors").select("id").eq("user_id", userId).maybeSingle();
  return data?.id ?? null;
}

/**
 * Authorize a user for a property album. Allowed if they are the property's
 * host, or a vendor who is/was assigned to a turnover on that property.
 */
export async function authorizeForProperty(propertyId: string, userId: string): Promise<PhotoAuth> {
  const { data: property } = await supabaseAdmin
    .from("properties").select("id, host_id").eq("id", propertyId).maybeSingle();
  if (!property) return DENY;

  if (property.host_id === userId) {
    return { ok: true, isHost: true, isVendor: false, hostId: property.host_id, vendorId: null, propertyId };
  }

  const vendorId = await vendorIdForUser(userId);
  if (vendorId) {
    const { count } = await supabaseAdmin
      .from("turnover_tasks")
      .select("id", { count: "exact", head: true })
      .eq("property_id", propertyId)
      .eq("assigned_vendor_id", vendorId);
    if ((count ?? 0) > 0) {
      return { ok: true, isHost: false, isVendor: true, hostId: property.host_id, vendorId, propertyId };
    }
  }
  return { ...DENY, hostId: property.host_id, propertyId };
}

/**
 * Authorize a user for a specific turnover job. Allowed if they are the job's
 * host or its assigned vendor.
 */
export async function authorizeForTask(taskId: string, userId: string): Promise<PhotoAuth> {
  const { data: task } = await supabaseAdmin
    .from("turnover_tasks")
    .select("id, host_id, property_id, assigned_vendor_id")
    .eq("id", taskId)
    .maybeSingle();
  if (!task) return DENY;

  if (task.host_id === userId) {
    return { ok: true, isHost: true, isVendor: false, hostId: task.host_id, vendorId: null, propertyId: task.property_id };
  }
  if (task.assigned_vendor_id) {
    const vendorId = await vendorIdForUser(userId);
    if (vendorId && vendorId === task.assigned_vendor_id) {
      return { ok: true, isHost: false, isVendor: true, hostId: task.host_id, vendorId, propertyId: task.property_id };
    }
  }
  return DENY;
}
