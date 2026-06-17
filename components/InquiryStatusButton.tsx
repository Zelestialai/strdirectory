"use client";
import { useTransition } from "react";
import { CheckCheck, Archive } from "lucide-react";

interface Props {
  inquiryId: string;
  currentStatus: string;
  updateStatus: (id: string, status: string) => Promise<void>;
}

export function InquiryStatusButton({ inquiryId, currentStatus, updateStatus }: Props) {
  const [isPending, startTransition] = useTransition();

  if (currentStatus === "closed") return null;

  return (
    <div className="flex items-center gap-2">
      {currentStatus !== "replied" && (
        <button
          disabled={isPending}
          onClick={() => startTransition(() => updateStatus(inquiryId, "replied"))}
          className="btn-secondary text-xs flex items-center gap-1"
        >
          <CheckCheck className="h-3.5 w-3.5" />
          {isPending ? "Saving…" : "Mark Replied"}
        </button>
      )}
      <button
        disabled={isPending}
        onClick={() => startTransition(() => updateStatus(inquiryId, "closed"))}
        className="rounded-lg border border-gray-200 px-2.5 py-1.5 text-xs text-gray-400 hover:text-gray-600 hover:border-gray-300 transition flex items-center gap-1"
      >
        <Archive className="h-3.5 w-3.5" />
        {isPending ? "…" : "Archive"}
      </button>
    </div>
  );
}
