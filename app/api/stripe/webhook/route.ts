import { NextRequest, NextResponse } from "next/server";
import { stripe } from "@/lib/stripe";
import { supabaseAdmin } from "@/lib/supabase/admin";
import type Stripe from "stripe";

// Must use raw body for Stripe signature verification
export const runtime = "nodejs";

async function activateTier(
  vendorId: string,
  tier: "pro" | "featured",
  subscriptionId: string,
  expiresAt: number | null
) {
  await supabaseAdmin
    .from("vendors")
    .update({
      subscription_tier: tier,
      stripe_subscription_id: subscriptionId,
      is_featured: tier === "featured",
      subscription_expires_at: expiresAt
        ? new Date(expiresAt * 1000).toISOString()
        : null,
    })
    .eq("id", vendorId);
}

async function deactivateTier(vendorId: string) {
  await supabaseAdmin
    .from("vendors")
    .update({
      subscription_tier: "free",
      stripe_subscription_id: null,
      is_featured: false,
      subscription_expires_at: null,
    })
    .eq("id", vendorId);
}

export async function POST(req: NextRequest) {
  const body = await req.text();
  const sig = req.headers.get("stripe-signature");

  if (!sig) {
    return NextResponse.json({ error: "No signature" }, { status: 400 });
  }

  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(
      body,
      sig,
      process.env.STRIPE_WEBHOOK_SECRET!
    );
  } catch (err) {
    console.error("Webhook signature verification failed:", err);
    return NextResponse.json({ error: "Invalid signature" }, { status: 400 });
  }

  switch (event.type) {
    case "checkout.session.completed": {
      const session = event.data.object as Stripe.Checkout.Session;
      const vendorId = session.metadata?.vendor_id;
      const plan = session.metadata?.plan as "pro" | "featured" | undefined;
      const subscriptionId = session.subscription as string;

      if (!vendorId || !plan || !subscriptionId) break;

      // Fetch subscription to get period end (Stripe v22: current_period_end is on items, not subscription)
      const subscription = await stripe.subscriptions.retrieve(subscriptionId);
      const periodEnd = subscription.items.data[0]?.current_period_end ?? null;
      await activateTier(vendorId, plan, subscriptionId, periodEnd);
      break;
    }

    case "customer.subscription.updated": {
      const subscription = event.data.object as Stripe.Subscription;
      const vendorId = subscription.metadata?.vendor_id;
      const plan = subscription.metadata?.plan as "pro" | "featured" | undefined;

      if (!vendorId || !plan) break;

      if (subscription.status === "active") {
        const periodEnd = subscription.items.data[0]?.current_period_end ?? null;
        await activateTier(vendorId, plan, subscription.id, periodEnd);
      } else if (["canceled", "unpaid", "past_due"].includes(subscription.status)) {
        await deactivateTier(vendorId);
      }
      break;
    }

    case "customer.subscription.deleted": {
      const subscription = event.data.object as Stripe.Subscription;
      const vendorId = subscription.metadata?.vendor_id;
      if (vendorId) await deactivateTier(vendorId);
      break;
    }

    case "invoice.payment_failed": {
      // Optionally notify vendor — for now just log
      const invoice = 