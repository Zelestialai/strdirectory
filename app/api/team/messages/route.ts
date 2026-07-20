import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const teamMemberId = req.nextUrl.searchParams.get("team_member_id");
  if (!teamMemberId) return NextResponse.json({ error: "Missing team_member_id" }, { status: 400 });

  // RLS ensures only parties to this relationship can see messages
  const { data: messages, error } = await supabase
    .from("team_messages")
    .select("id, sender_id, body, is_read, created_at")
    .eq("team_member_id", teamMemberId)
    .order("created_at", { ascending: true });

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Mark unread messages as read (for the viewer)
  const unread = (messages ?? [])
    .filter((m) => !m.is_read && m.sender_id !== user.id)
    .map((m) => m.id);

  if (unread.length > 0) {
    await supabase
      .from("team_messages")
      .update({ is_read: true })
      .in("id", unread);
  }

  return NextResponse.json({ messages: messages ?? [] });
}

export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { team_member_id, body } = await req.json();
  if (!team_member_id || !body?.trim()) {
    return NextResponse.json({ error: "Missing team_member_id or body" }, { status: 400 });
  }

  // Verify relationship exists and is accepted, get host/vendor_user_id
  const { data: member } = await supabase
    .from("team_members")
    .select("id, host_id, vendor_user_id, status")
    .eq("id", team_member_id)
    .single();

  if (!member) return NextResponse.json({ error: "Team relationship not found" }, { status: 404 });
  if (member.status !== "accepted") {
    return NextResponse.json({ error: "Team invite has not been accepted yet" }, { status: 400 });
  }
  if (user.id !== member.host_id && user.id !== member.vendor_user_id) {
    return NextResponse.json({ error: "Not authorized" }, { status: 403 });
  }

  const { data: message, error } = await supabase
    .from("team_messages")
    .insert({
      team_member_id,
      host_id: member.host_id,
      vendor_user_id: member.vendor_user_id,
      sender_id: user.id,
      body: body.trim(),
    })
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ message }, { status: 201 });
}
