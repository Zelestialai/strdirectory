"use client";
import { useEffect, useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import { MessageSquare } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import { InquiryModal } from "./InquiryModal";
import type { Vendor } from "@/types";

interface Props {
  vendor: Vendor;
  /** "default" = full-width primary button (profile page), "sm" = compact (card) */
  size?: "default" | "sm";
}

export function VendorContactButton({ vendor, size = "default" }: Props) {
  const [open, setOpen] = useState(false);
  const [userEmail, setUserEmail] = useState<string | null>(null);
  const [userName, setUserName] = useState<string | null>(null);
  const router = useRouter();
  const pathname = usePathname();
  const supabase = createClient();

  useEffect(() => {
    supabase.auth.getUser().then(async ({ data }) => {
      if (!data.user) return;
      setUserEmail(data.user.email ?? null);
      const { data: profile } = await supabase
        .from("profiles")
        .select("full_name")
        .eq("id", data.user.id)
        .single();
      setUserName(profile?.full_name ?? null);
    });
  }, []);

  const handleClick = () => {
    if (!userEmail) {
      router.push(`/login?next=${encodeURIComponent(pathname)}`);
      return;
    }
    setOpen(true);
  };

  if (size === "sm") {
    return (
      <>
        <button
          onClick={handleClick}
          className="btn-secondary w-full justify-center text-xs py-1.5"
        >
          <MessageSquare className="h-3.5 w-3.5" />
          {userEmail ? "Message" : "Sign in to Message"}
        </button>
        {open && userEmail && (
          <InquiryModal
            vendor={vendor}
            userEmail={userEmail}
            userName={userName}
            onClose={() => setOpen(false)}
          />
        )}
      </>
    );
  }

  return (
    <>
      <button onClick={handleClick} className="btn-primary justify-center">
        <MessageSquare className="h-4 w-4" />
        {userEmail ? "Send Message" : "Sign in to Message"}
      </button>
      {open && userEmail && (
        <InquiryModal
          vendor={vendor}
          userEmail={userEmail}
          userName={userName}
          onClose={() => setOpen(false)}
        />
      )}
    </>
  );
}
