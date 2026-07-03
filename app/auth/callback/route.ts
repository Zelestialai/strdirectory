import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

/**
 * Supabase Auth callback handler.
 * Supabase redirects here after email confirmation, magic-link sign-in,
 * and OAuth flows with a one-time `code` query parameter.
 * We exchange it for a session then forward the user to their destination.
 */
export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get("code");
  // `next` lets callers specify a post-auth redirect (e.g. /dashboard/onboarding)
  const next = searchParams.get("next") ?? "/dashboard";

  if (code) {
    const supabase = createClient();
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) {
      // Redirect to intended destination after successful exchange
      return NextResponse.redirect(`${origin}${next}`);
    }
  }

  // Something went wrong — send the user to an error page
  return NextResponse.redirect(`${origin}/auth/error`);
}
