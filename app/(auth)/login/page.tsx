"use client";
import Link from "next/link";
import { useRouter, useSearchParams } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { GoogleButton } from "@/components/GoogleButton";
import { Eye, EyeOff } from "lucide-react";
import { Suspense, useState } from "react";

const schema = z.object({
  email: z.string().email("Enter a valid email"),
  password: z.string().min(6, "Password must be at least 6 characters"),
});
type FormValues = z.infer<typeof schema>;

function LoginForm() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const explicitNext = searchParams.get("next"); // null if not provided
  const supabase = createClient();

  const [showPassword, setShowPassword] = useState(false);

  const { register, handleSubmit, setError, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
  });

  const onSubmit = async ({ email, password }: FormValues) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) {
      setError("root", { message: error.message });
      return;
    }

    // If the caller asked for a specific destination, honour it.
    // Otherwise route by role so hosts land on their own dashboard.
    let destination = explicitNext ?? "/dashboard";
    if (!explicitNext && data.user) {
      const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", data.user.id)
        .single();
      if (profile?.role === "host") destination = "/host/dashboard";
    }

    router.push(destination);
    router.refresh();
  };

  return (
    <div className="w-full max-w-sm">
      <div className="card p-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-1">Welcome back</h1>
        <p className="text-sm text-gray-500 mb-6">Sign in to your account</p>

        <GoogleButton label="Sign in with Google" />
        <div className="flex items-center gap-3 my-5">
          <div className="h-px flex-1 bg-gray-200" />
          <span className="text-xs text-gray-400">or</span>
          <div className="h-px flex-1 bg-gray-200" />
        </div>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input {...register("email")} type="email" className="input" placeholder="you@example.com" autoComplete="email" />
            {errors.email && <p className="text-xs text-red-500 mt-1">{errors.email.message}</p>}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Password</label>
            <div className="relative">
              <input {...register("password")} type={showPassword ? "text" : "password"} className="input pr-10" placeholder="••••••••" autoComplete="current-password" />
              <button type="button" onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                aria-label={showPassword ? "Hide password" : "Show password"}>
                {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
              </button>
            </div>
            {errors.password && <p className="text-xs text-red-500 mt-1">{errors.password.message}</p>}
          </div>
          {errors.root && (
            <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700">
              {errors.root.message}
            </div>
          )}
          <button type="submit" disabled={isSubmitting} className="btn-primary w-full justify-center">
            {isSubmitting ? "Signing in…" : "Sign In"}
          </button>
        </form>

        <p className="mt-4 text-center text-sm text-gray-500">
          <Link href="/forgot-password" className="text-brand-600 hover:underline">Forgot password?</Link>
        </p>
      </div>

      <p className="mt-4 text-center text-sm text-gray-500">
        Don't have an account?{" "}
        <Link href="/register" className="text-brand-600 font-medium hover:underline">Create one</Link>
      </p>
    </div>
  );
}

export default function LoginPage() {
  return (
    <Suspense fallback={<div className="w-full max-w-sm h-80 bg-white rounded-2xl animate-pulse" />}>
      <LoginForm />
    </Suspense>
  );
}
