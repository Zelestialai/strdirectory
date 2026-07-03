"use client";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";
import { CheckCircle2 } from "lucide-react";
import { useState } from "react";

const schema = z
  .object({
    password: z.string().min(8, "Password must be at least 8 characters"),
    confirm: z.string(),
  })
  .refine((d) => d.password === d.confirm, {
    message: "Passwords do not match",
    path: ["confirm"],
  });

type FormValues = z.infer<typeof schema>;

export default function UpdatePasswordPage() {
  const router = useRouter();
  const supabase = createClient();
  const [done, setDone] = useState(false);

  const {
    register,
    handleSubmit,
    setError,
    formState: { errors, isSubmitting },
  } = useForm<FormValues>({ resolver: zodResolver(schema) });

  const onSubmit = async ({ password }: FormValues) => {
    const { error } = await supabase.auth.updateUser({ password });
    if (error) {
      setError("root", { message: error.message });
    } else {
      setDone(true);
      setTimeout(() => router.push("/dashboard"), 2000);
    }
  };

  if (done) {
    return (
      <div className="w-full max-w-sm">
        <div className="card p-8 text-center">
          <CheckCircle2 className="mx-auto h-12 w-12 text-green-500 mb-4" />
          <h2 className="text-xl font-bold mb-2">Password updated!</h2>
          <p className="text-sm text-gray-500">Redirecting you to your dashboard…</p>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full max-w-sm">
      <div className="card p-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-1">Set new password</h1>
        <p className="text-sm text-gray-500 mb-6">Choose a strong password for your account.</p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">New password</label>
            <input
              {...register("password")}
              type="password"
              className="input"
              placeholder="••••••••"
              autoComplete="new-password"
            />
            {errors.password && (
              <p className="text-xs text-red-500 mt-1">{errors.password.message}</p>
            )}
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Confirm password</label>
            <input
              {...register("confirm")}
              type="password"
              className="input"
              placeholder="••••••••"
              autoComplete="new-password"
            />
            {errors.confirm && (
              <p className="text-xs text-red-500 mt-1">{errors.confirm.message}</p>
            )}
          </div>

          {errors.root && (
            <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700">
              {errors.root.message}
            </div>
          )}

          <button
            type="submit"
            disabled={isSubmitting}
            className="btn-primary w-full justify-center"
          >
            {isSubmitting ? "Updating…" : "Update Password"}
          </button>
        </form>
      </div>
    </div>
  );
}
