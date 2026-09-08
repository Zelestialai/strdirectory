import { NextResponse } from "next/server";
import { notifyAdminsOfSignup, isRecentSignup, type SignupNotice } from "@/lib/admin-notify";

export const runtime = "nodejs";

/**
 * Fire-and-forget admin notification for a new registration. Called by the
 * client right after sign-up. Guarded so it only fires for an email that
 * actually belongs to a recently-created auth user (prevents spam).
 */
export async function POST(request: Request) {
  const body = (await request.json().catch(() => ({}))) as Partial<SignupNotice>;
  const email = String(body.email ?? "").trim();
  const kind = body.kind;

  if (!email || !["user", "host", "vendor"].includes(kind ?? "")) {
    return NextResponse.json({ ok: false }, { status: 400 });
  }

  // Only notify for genuine, recent signups.
  const legit = await isRecentSignup(email, 30);
  if (!legit) return NextResponse.json({ ok: false });

  await notifyAdminsOfSignup({
    kind: kind as SignupNotice["kind"],
    email,
    fullName: body.fullName ?? null,
    businessName: body.businessName ?? null,
    categoryName: body.categoryName ?? null,
    market: body.market ?? null,
  });

  return NextResponse.json({ ok: true });
}
