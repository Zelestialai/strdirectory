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
    const { data, error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) {
      // New OAuth users have no role yet — send them to pick their account type.
      // Otherwise honour an explicit `next`, or route hosts to their dashboard.
      const userId = data.user?.id;
      if (userId) {
        const { data: profile } = await supabase
          .from("profiles")
          .select("onboarded, role")
          .eq("id", userId)
          .maybeSingle();

        if (profile && !profile.onboarded) {
          return NextResponse.redirect(`${origin}/welcome`);
        }
        if (!searchParams.get("next") && profile?.role === "host") {
          return NextResponse.redirect(`${origin}/host/dashboard`);
        }
      }
      return NextResponse.redirect(`${origin}${next}`);
    }
  }

  // Something went wrong — send the user to an error page
  return NextResponse.redirect(`${origin}/auth/error`);
}
