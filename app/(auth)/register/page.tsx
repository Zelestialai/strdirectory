"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { Building2, Search, Home, CheckCircle2 } from "lucide-react";
import { useState } from "react";

const schema = z.object({
  full_name: z.string().min(2, "Name is required"),
  email: z.string().email("Enter a valid email"),
  password: z.string().min(8, "Password must be at least 8 characters"),
  account_type: z.enum(["vendor", "host", "user"]),
});
type FormValues = z.infer<typeof schema>;

const ACCOUNT_TYPES = [
  {
    value: "vendor" as const,
    label: "List My Business",
    description: "I offer services to STR hosts",
    icon: Building2,
  },
  {
    value: "host" as const,
    label: "I'm an STR Host",
    description: "I manage short-term rentals",
    icon: Home,
  },
  {
    value: "user" as const,
    label: "Just Browsing",
    description: "Explore vendors & resources",
    icon: Search,
  },
];

export default function RegisterPage() {
  const router = useRouter();
  const supabase = createClient();
  const [emailSent, setEmailSent] = useState(false);

  const { register, handleSubmit, setError, watch, setValue, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
    defaultValues: { account_type: "host" },
  });

  const accountType = watch("account_type");

  const onSubmit = async ({ full_name, email, password, account_type }: FormValues) => {
    const next =
      account_type === "vendor" ? "/dashboard/onboarding" :
      account_type === "host"   ? "/host/dashboard" : "/";

    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { full_name, role: account_type },
        emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL}/auth/callback?next=${encodeURIComponent(next)}`,
      },
    });
    if (error) {
      setError("root", { message: error.message });
    } else if (data.session) {
      // Email confirmation disabled — session is live immediately
      router.push(next);
      router.refresh();
    } else {
      // Email confirmation required — tell the user to check their inbox
      setEmailSent(true);
    }
  };

  if (emailSent) {
    return (
      <div className="w-full max-w-sm">
        <div className="card p-8 text-center">
          <CheckCircle2 className="mx-auto h-12 w-12 text-green-500 mb-4" />
          <h2 className="text-xl font-bold mb-2">Check your email</h2>
          <p className="text-sm text-gray-500">
            We sent a confirmation link to your inbox. Click it to activate your account.
          </p>
          <p className="mt-4 text-xs text-gray-400">
            Didn't get it?{" "}
            <button
              className="text-brand-600 hover:underline"
              onClick={() => setEmailSent(false)}
            >
              Try again
            </button>
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full max-w-sm">
      <div className="card p-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-1">Create your account</h1>
        <p className="text-sm text-gray-500 mb-6">Join the STR Pro Directory</p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          {/* Account type selector */}
          <div className="space-y-2">
            <p className="text-xs font-semibold uppercase tracking-wider text-gray-400">I want to…</p>
            {ACCOUNT_TYPES.map(({ value, label, description, icon: Icon }) => (
              <label
                key={value}
                className={`flex items-center gap-3 cursor-pointer rounded-xl border-2 px-4 py-3 transition-all ${
                  accountType === value
                    ? "border-brand-600 bg-brand-50"
                    : "border-gray-200 hover:border-gray-300 bg-white"
                }`}
              >
                <input
                  {...register("account_type")}
                  type="radio"
                  value={value}
                  className="sr-only"
                  onChange={() => setValue("account_type", value)}
                />
                <Icon className={`h-5 w-5 shrink-0 ${accountType === value ? "text-brand-600" : "text-gray-400"}`} />
                <div className="min-w-0">
                  <p className={`text-sm font-semibold ${accountType === value ? "text-brand-700" : "text-gray-700"}`}>
                    {label}
                  </p>
                  <p className="text-xs text-gray-400">{description}</p>
                </div>
                {accountType === value && (
                  <div className="ml-auto h-4 w-4 rounded-full bg-brand-600 flex items-center justify-center">
                    <div className="h-1.5 w-1.5 rounded-full bg-white" />
                  </div>
                )}
              </label>
            ))}
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
            <input {...register("full_name")} className="input" placeholder="Jane Smith" />
            {errors.full_name && <p className="text-xs text-red-500 mt-1">{errors.full_name.message}</p>}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input {...register("email")} type="email" className="input" placeholder="you@example.com" />
            {errors.email && <p className="text-xs text-red-500 mt-1">{errors.email.message}</p>}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Password</label>
            <input {...register("password")} type="password" className="input" placeholder="••••••••" />
            {errors.password && <p className="text-xs text-red-500 mt-1">{errors.password.message}</p>}
          </div>

          {errors.root && (
            <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700">
              {errors.root.message}
            </div>
          )}

          <button type="submit" disabled={isSubmitting} className="btn-primary w-full justify-center">
            {isSubmitting ? "Creating account…" : "Create Account"}
          </button>
        </form>
      </div>

      <p className="mt-4 text-center text-sm text-gray-500">
        Already have an account?{" "}
        <Link href="/login" className="text-brand-600 font-medium hover:underline">Sign in</Link>
      </p>
    </div>
  );
}
