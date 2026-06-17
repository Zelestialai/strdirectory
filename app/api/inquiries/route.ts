import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { z } from "zod";
import { sendInquiryNotification } from "@/lib/email";

const inquirySchema = z.object({
  vendor_id:    z.string().uuid(),
  sender_name:  z.string().min(2),
  sender_email: z.string().email(),
  sender_phone: z.string().optional().nullable(),
  message:      z.string().min(10).max(2000),
});

export async function POST(req: NextRequest) {
  const supabase = createClient();
  const body = await req.json();
  const parsed = inquirySchema.safeParse(body);
  if (!parsed.success) return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });

  const { data: { user } } = await supabase.auth.getUser();

  // Require authentication — only registered users can send messages
  if (!user) {
    return NextResponse.json({ error: "You must be signed in to send a message." }, { status: 401 });
  }

  // Insert inquiry
  const { data, error } = await supabase
    .from("inquiries")
    .insert({ ...parsed.data, sender_id: user.id })
    .select()
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Determine notification email:
  // Priority 1 — vendor.notification_email (separate alerts address)
  // Priority 2 — vendor.email (business contact address)
  // Priority 3 — auth email of the vendor's account (from profiles)
  const { data: vendor } = await supabase
    .from("vendors")
    .select("business_name, email, notification_email, slug, user_id")
    .eq("id", parsed.data.vendor_id)
    .single();

  if (vendor && process.env.RESEND_API_KEY) {
    let notifyEmail = vendor.notification_email ?? vendor.email ?? null;

    // Fall back to the vendor's auth account email
    if (!notifyEmail && vendor.user_id) {
      const { data: profile } = await supabase
        .from("profiles")
        .select("email")
        .eq("id", vendor.user_id)
        .single();
      notifyEmail = profile?.email ?? null;
    }

    if (notifyEmail) {
      try {
        await sendInquiryNotification({
          vendorName:   vendor.business_name,
          vendorEmail:  notifyEmail,
          vendorSlug:   vendor.slug,
          senderName:   parsed.data.sender_name,
          senderEmail:  parsed.data.sender_email,
          senderPhone:  parsed.data.sender_phone ?? null,
          message:      parsed.data.message,
        });
      } catch (emailErr) {
        // Don't fail the request if email fails — inquiry is already saved
        console.error("Inquiry notification email failed:", emailErr);
      }
    }
  }

  return NextResponse.json({ data }, { status: 201 });
}
