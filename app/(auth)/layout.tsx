import Link from "next/link";

export default function AuthHelperLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-50 px-4">
      <Link href="/" className="flex items-center gap-2.5 mb-10">
        <div className="w-9 h-9 rounded-xl bg-coral-500 flex items-center justify-center shrink-0">
          <svg width="20" height="20" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M9 1.5L0.75 8.25H3V16.5H7.5V12H10.5V16.5H15V8.25H17.25L9 1.5Z" fill="white"/>
          </svg>
        </div>
        <span className="font-bold text-xl tracking-tight leading-none">
          <span className="text-brand-600">STR</span>
          <span className="text-gray-900">Vend</span>
        </span>
      </Link>
      {children}
    </div>
  );
}
