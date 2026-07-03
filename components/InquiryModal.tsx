"use client";
import { useState, useEffect, useRef } from "react";
import { X, Send } from "lucide-react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import type { Vendor } from "@/types";

const schema = z.object({
  sender_phone: z.string().optional(),
  message: z.string().min(10, "Please describe what you need (min 10 chars)"),
});
type FormValues = z.infer<typeof schema>;

interface InquiryModalProps {
  vendor: Vendor;
  userEmail: string;
  userName: string | null;
  onClose: () => void;
}

export function InquiryModal({ vendor, userEmail, userName, onClose }: InquiryModalProps) {
  const [sent, setSent] = useState(false);
  const [submitError, setSubmitError] = useState<string | null>(null);
  const messageRef = useRef<HTMLTextAreaElement | null>(null);

  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm<FormValues>({
    resolver: zodResolver(schema),
  });

  // Lock body scroll while modal is open
  useEffect(() => {
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => { document.body.style.overflow = prev; };
  }, []);

  // Close on Escape
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    document.addEventListener("keydown", handler);
    return () => document.removeEventListener("keydown", handler);
  }, [onClose]);

  // Auto-focus the message field
  useEffect(() => {
    messageRef.current?.focus();
  }, []);

  const { ref: messageFormRef, ...messageRest } = register("message");

  const onSubmit = async (values: FormValues) => {
    setSubmitError(null);
    const res = await fetch("/api/inquiries", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        vendor_id: vendor.id,
        sender_name: userName ?? userEmail.split("@")[0],
        sender_email: userEmail,
        sender_phone: values.sender_phone ?? null,
        message: values.message,
      }),
    });
    if (res.ok) {
      setSent(true);
    } else {
      const err = await res.json().catch(() => ({}));
      setSubmitError(err?.error ?? "Something went wrong. Please try again.");
    }
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-sm"
      onClick={(e) => { if (e.target === e.currentTarget) onClose(); }}
      role="dialog"
      aria-modal="true"
      aria-label={`Contact ${vendor.business_name}`}
    >
      <div className="relative w-full max-w-md rounded-2xl bg-white shadow-2xl p-6">
        <button
          onClick={onClose}
          className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition"
          aria-label="Close"
        >
          <X className="h-5 w-5" />
        </button>

        {sent ? (
          <div className="text-center py-8">
            <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-green-100">
              <Send className="h-6 w-6 text-green-600" />
            </div>
            <h3 className="text-lg font-semibold">Message Sent!</h3>
            <p className="mt-1 text-sm text-gray-500">
              {vendor.business_name} will get back to you at {userEmail}.
            </p>
            <button onClick={onClose} className="btn-primary mt-6">Done</button>
          </div>
        ) : (
          <>
            <h2 className="text-lg font-semibold mb-1">Contact {vendor.business_name}</h2>
            <p className="text-sm text-gray-500 mb-5">They'll reply to your email directly.</p>

            {/* Sender identity — read-only since user is logged in */}
            <div className="mb-4 rounded-lg bg-gray-50 border px-4 py-3 text-sm text-gray-600">
              Sending as{" "}
              <span className="font-medium text-gray-800">{userName ?? userEmail.split("@")[0]}</span>
              <span className="text-gray-400"> · {userEmail}</span>
            </div>

            <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Phone (optional)</label>
                <input
                  {...register("sender_phone")}
                  type="tel"
                  className="input"
                  placeholder="+1 (555) 000-0000"
                />
              </div>
              <div>
            