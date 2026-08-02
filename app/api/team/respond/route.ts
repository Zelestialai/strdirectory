import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";
import { createNotification } from "@/lib/notifications";

export async function POST(req: NextRequest) {
  try {
    const supabase = createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const { team_member_id, status } = await req.json();
    if (!team_member_id || !["accepted", "declined"].includes(status)) {
      return NextResponse.json({ error: "Invalid request" }, { status: 400 });
    }

    // Fetch the invite to verify this vendor owns it.
    // (profiles has no email column — only embed full_name / business_name.)
    const { data: member } = await supabase
      .from("team_members")
      .select("*, host:host_id(full_name), vendor:vendor_id(business_name)")
      .eq("id", team_member_id)
      .eq("vendor_user_id", user.id)
      .single();

    if (!member) return NextResponse.json({ error: "Invitation not found" }, { status: 404 });
    if (member.status !== "pending") {
      return NextResponse.json({ error: "Already responded to this invitation" }, { status: 400 });
    }

    const { data: updated, error } = await supabase
      .from("team_members")
      .update({ status, responded_at: new Date().toISOString() })
      .eq("id", team_member_id)
      .select()
      .single();

    if (error) return NextResponse.json({ error: error.message }, { status: 500 });

    // In-app notification to the host about the vendor's response
    const vendorName =
      (member.vendor as unknown as { business_name: string } | null)?.business_name ?? "A vendor";
    await createNotification({
      userId: member.host_id,
      type: "system",
      title: status === "accepted" ? "Team invite accepted" : "Team invite declined",
      body:
        status === "accepted"
          ? `${vendorName} accepted your team invitation. You can now message them.`
          : `${vendorName} declined your team invitation.`,
      link: "/host/dashboard/team",
    });

    return NextResponse.json({ member: updated });
  } catch (err) {
    console.error("Team respond error:", err);
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
