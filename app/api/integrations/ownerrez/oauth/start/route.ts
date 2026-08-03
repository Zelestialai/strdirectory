import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { randomUUID } from "crypto";
import { createClient } from "@/lib/supabase/server";
import { ownerRezOAuthConfigured, buildOwnerRezAuthorizeUrl } from "@/lib/ownerrez";

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "https://strvend.com";

// GET — kick off the OwnerRez OAuth flow (redirects the host to OwnerRez).
export async function GET() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.redirect(`${SITE_URL}/login?next=/host/dashboard/properties`);
  }

  if (!ownerRezOAuthConfigured()) {
    return NextResponse.redirect(
      `${SITE_URL}/host/dashboard/properties?ownerrez=unconfigured`
    );
  }

  const state = randomUUID();
  // Store state in an httpOnly cookie to verify on callback (CSRF protection)
  cookies().set("ownerrez_oauth_state", state, {
    httpOnly: true,
    secure: true,
    sameSite: "lax",
    path: "/",
    maxAge: 600, // 10 min, matches OwnerRez code lifetime
  });

  const redirectUri = `${SITE_URL}/api/integrations/ownerrez/oauth/callback`;
  return NextResponse.redirect(buildOwnerRezAuthorizeUrl(redirectUri, state));
}
