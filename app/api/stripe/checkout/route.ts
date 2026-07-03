import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { stripe, STRIPE_PLANS, type PlanKey } from "@/lib/stripe";

// Prevent Next.js from statically rendering this route at build time
export const dynamic = "force-dynamic";

export async function POST(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const body = await req.json();
  const plan = body.plan as PlanKey;

  if (!STRIPE_PLANS[plan]) {
    return NextResponse.json({ error: "Invalid plan" }, { status: 400 });
  }

  // Get vendor + existing stripe customer
  const { data: vendor } = await supabase
    .from("vendors")
    .select("id, business_name, stripe_customer_id, subscription_tier")
    .eq("user_id", user.id)
    .single();

  if (!vendor) {
    return NextResponse.json({ error: "No vendor listing found" }, { status: 404 });
  }

  // Create or reuse Stripe customer
  let customerId = vendor.stripe_customer_id;
  if (!customerId) {
    const customer = await stripe.customers.create({
      email: user.email,
      name: vendor.business_name,
      metadata: { vendor_id: vendor.id, user_id: user.id },
    });
    customerId = customer.id;

    await supabase
      .from("vendors")
      .update({ stripe_customer_id: customerId })
      .eq("id", vendor.id);
  }

  const appUrl = process.env.NEXT_PUBLIC_APP_URL ?? "https://strdirectory-qccmytf7r-zelestialai-6207s-projects.vercel.app";
  const selectedPlan = STRIPE_PLANS[plan];

  const session = await stripe.checkout.sessions.create({
    customer: customerId,
    mode: "subscription",
    payment_method_types: ["card"],
    line_items: [{ price: selectedPlan.priceId, quantity: 1 }],
    success_url: `${appUrl}/dashboard/upgrade/success?session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${appUrl}/dashboard/upgrade`,
    metadata: { vendor_id: vendor.id, plan },
    subscription_data: {
      metadata: { vendor_id: vendor.id, plan },
    },
  });

  return NextResponse.json({ url: session.url });
}
