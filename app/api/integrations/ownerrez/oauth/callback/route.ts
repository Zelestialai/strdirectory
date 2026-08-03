import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { createClient } from "@/lib/supabase/server";
import { exchangeOwnerRezCode, syncOwnerRezForHost } from "@/lib/ownerrez";

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "https://strvend.com";
const DEST = `${SITE_URL}/host/dashboard/properties`;

// GET — OwnerRez redirects here with ?code & ?state after the host approves.
export async function GET(req: NextRequest) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.redirect(`${SITE_URL}/login?next=/host/dashboard/properties`);

  const url = new URL(req.url);
  const code = url.searchParams.get("code");
  const state = url.searchParams.get("state");
  const err = url.searchParams.get("error");

  if (err) return NextResponse.redirect(`${DEST}?ownerrez=denied`);

  // Verify CSRF state
  const savedState = cookies().get("ownerrez_oauth_state")?.value;
  cookies().delete("ownerrez_oauth_state");
  if (!code || !state || !savedState || state !== savedState) {
    return NextResponse.redirect(`${DEST}?ownerrez=state_mismatch`);
  }

  try {
    const redirectUri = `${SITE_URL}/api/integrations/ownerrez/oauth/callback`;
    const tokens = await exchangeOwnerRezCode(code, redirectUri);

    await supabase.from("host_integrations").upsert(
      {
        host_id: user.id,
        provider: "ownerrez",
        auth_method: "oauth",
        access_token: tokens.access_token,
        refresh_token: tokens.refresh_token ?? null,
        token_expires_at: tokens.expires_in
          ? new Date(Date.now() + tokens.expires_in * 1000).toISOString()
          : null,
        // clear any old PAT fields
        api_username: null,
        api_token: null,
        status: "active",
        last_error: null,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "host_id,provider" }
    );

    // Kick off an initial sync (best-effort)
    await syncOwnerRezForHost(user.id).catch(() => {});

    return NextResponse.redirect(`${DEST}?ownerrez=connected`);
  } catch {
    return NextResponse.redirect(`${DEST}?ownerrez=error`);
  }
}
