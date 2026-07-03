import Link from "next/link";
import { Building2 } from "lucide-react";

export default function AuthHelperLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-50 px-4">
      <Link href="/" className="flex items-center gap-2 text-brand-700 font-bold text-xl mb-8">
        <Building2 className="h-6 w-6" /> STR Pro Directory
      </Link>
      {children}
    </div>
  );
}
