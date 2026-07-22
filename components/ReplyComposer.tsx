"use client";

import { useState, useRef, useEffect } from "react";
import { Send, Loader2 } from "lucide-react";
import { useRouter } from "next/navigation";

interface ReplyComposerProps {
  inquiryId: string;
}

export function ReplyComposer({ inquiryId }: ReplyComposerProps) {
  const [body, setBody] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [sent, setSent] = useState(false);
  const textareaRef = useRef<HTMLTextAreaElement>(null);
  const router = useRouter();

  // Auto-resize textarea
  useEffect(() => {
    const el = textareaRef.current;
    if (!el) return;
    el.style.height = "auto";
    el.style.height = `${Math.min(el.scrollHeight, 240)}px`;
  }, [body]);

  async function handleSend() {
    if (!body.trim() || submitting) return;
    setSubmitting(true);
    setError(null);

    try {
      const res = await fetch(`/api/inquiries/${inquiryId}/reply`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ body }),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Failed to send reply");
      }

      setBody("");
      setSent(true);
      setTimeout(() => setSent(false), 3000);
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Something went wrong");
    } finally {
      setSubmitting(false);
    }
  }

  function handleKeyDown(e: React.KeyboardEvent) {
    if (e.key === "Enter" && (e.metaKey || e.ctrlKey)) {
      handleSend();
    }
  }

  return (
    <div className="border-t border-gray-100 pt-4 mt-2">
      <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">
        Your reply
      </p>
      <div className="relative rounded-xl border border-gray-200 bg-white focus-within:border-brand-400 focus-within:ring-2 focus-within:ring-brand-100 transition">
        <textarea
          ref={textareaRef}
          value={body}
          onChange={(e) => setBody(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="Write your reply… (Cmd+Enter to send)"
          rows={3}
          className="w-full resize-none rounded-xl px-4 pt-3 pb-10 text-sm text-gray-800 placeholder:text-gray-400 focus:outline-none bg-transparent"
          disabled={submitting}
        />
        <div className="absolute bottom-2 right-2 flex items-center gap-2">
          {sent && (
            <span className="text-xs text-green-600 font-medium animate-fade-in">
              ✓ Sent
            </span>
          )}
          <button
            onClick={handleSend}
            disabled={!body.trim() || submitting}
            className="flex items-center gap-1.5 rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 disabled:opacity-40 disabled:cursor-not-allowed transition"
          >
            {submitting ? (
              <Loader2 className="h-3.5 w-3.5 animate-spin" />
            ) : (
              <Send className="h-3.5 w-3.5" />
            )}
            Send reply
          </button>
        </div>
      </div>
      {error && <p className="mt-1.5 text-xs text-red-600">{error}</p>}
      <p className="mt-1.5 text-xs text-gray-400">
        The host will be notified by email when you reply.
      </p>
    </div>
  );
}
