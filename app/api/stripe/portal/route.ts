import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { stripe } from "@/lib/stripe";

export async function POST(req: NextRequest) {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, stripe_customer_id, subscription_tier")
    .eq("user_id", user.id)
    .single();

  if (!vendor) {
    return NextResponse.json({ error: "No vendor listing found" }, { status: 404 });
  }

  if (!vendor.stripe_customer_id) {
    return NextResponse.json(
      { error: "No billing account found. Please subscribe to a plan first." },
      { status: 400 }
    );
  }

  const appUrl = process.env.NEXT_PUBLIC_APP_URL ?? "https://www.strvend.com";

  const portalSession = await stripe.billingPortal.sessions.create({
    customer: vendor.stripe_customer_id,
    return_url: `${appUrl}/dashboard/upgrade`,
  });

  return NextResponse.json({ url: portalSession.url });
}
