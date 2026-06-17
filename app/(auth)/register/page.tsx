"use client";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { createClient } from "@/lib/supabase/client";

const schema = z.object({
  full_name: z.string().min(2, "Name is required"),
  email: z.string().email("Enter a valid email"),
  password: z.string().min(8, "Password must be at least 8 characters"),
  account_type: z.enum(["user", "vendor"]),
});
type FormValues = z.infer<typeof schema>;

export default function RegisterPage() {
  const router = useRouter();
  const supabase = createClient();

  const { register, handleSubmit, setError, watch, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
    defaultValues: { account_type: "vendor" },
  });

  const accountType = watch("account_type");

  const onSubmit = async ({ full_name, email, password, account_type }: FormValues) => {
    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { full_name, role: account_type },
        emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL}/auth/callback`,
      },
    });
    if (error) {
      setError("root", { message: error.message });
    } else {
      router.push(account_type === "vendor" ? "/dashboard" : "/");
      router.refresh();
    }
  };

  return (
    <div className="w-full max-w-sm">
      <div className="card p-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-1">Create your account</h1>
        <p className="text-sm text-gray-500 mb-6">Join the STR Pro Directory</p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          {/* Account type toggle */}
          <div className="grid grid-cols-2 gap-2 rounded-lg border p-1">
            {(["vendor", "user"] as const).map((type) => (
              <label
                key={type}
                className={`cursor-pointer rounded-md px-3 py-2 text-sm text-center transition font-medium ${
                  accountType === type ? "bg-brand-600 text-white shadow-sm" : "text-gray-500 hover:text-gray-700"
                }`}
              >
                <input {...register("account_type")} type="radio" value={type} className="sr-only" />
                {type === "vendor" ? "List My Business" : "Find Vendors"}
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
