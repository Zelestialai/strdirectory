"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { Send } from "lucide-react";

interface Message {
  id: string;
  sender_id: string;
  body: string;
  is_read: boolean;
  created_at: string;
}

interface Props {
  teamMemberId: string;
  currentUserId: string;
  otherName: string;
}

export function TeamMessageThread({ teamMemberId, currentUserId, otherName }: Props) {
  const [messages, setMessages] = useState<Message[]>([]);
  const [body, setBody] = useState("");
  const [sending, setSending] = useState(false);
  const [loading, setLoading] = useState(true);
  const bottomRef = useRef<HTMLDivElement>(null);
  const textareaRef = useRef<HTMLTextAreaElement>(null);

  const fetchMessages = useCallback(async () => {
    const res = await fetch(`/api/team/messages?team_member_id=${teamMemberId}`);
    if (res.ok) {
      const data = await res.json();
      setMessages(data.messages ?? []);
    }
    setLoading(false);
  }, [teamMemberId]);

  useEffect(() => {
    fetchMessages();
    // Poll every 8 seconds
    const interval = setInterval(fetchMessages, 8000);
    return () => clearInterval(interval);
  }, [fetchMessages]);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  async function handleSend(e: React.FormEvent) {
    e.preventDefault();
    if (!body.trim() || sending) return;
    setSending(true);
    const optimistic: Message = {
      id: `opt-${Date.now()}`,
      sender_id: currentUserId,
      body: body.trim(),
      is_read: false,
      created_at: new Date().toISOString(),
    };
    setMessages((prev) => [...prev, optimistic]);
    setBody("");
    try {
      await fetch("/api/team/messages", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ team_member_id: teamMemberId, body: body.trim() }),
      });
      fetchMessages(); // refresh to get real ID
    } finally {
      setSending(false);
      textareaRef.current?.focus();
    }
  }

  function handleKeyDown(e: React.KeyboardEvent<HTMLTextAreaElement>) {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend(e as unknown as React.FormEvent);
    }
  }

  function formatTime(iso: string) {
    return new Date(iso).toLocaleString(undefined, {
      month: "short", day: "numeric",
      hour: "numeric", minute: "2-digit",
    });
  }

  if (loading) {
    return <div className="py-8 text-center text-sm text-gray-400">Loading messages…</div>;
  }

  return (
    <div className="flex flex-col" style={{ height: "420px" }}>
      {/* Messages area */}
      <div className="flex-1 overflow-y-auto space-y-3 p-4 bg-gray-50 rounded-t-xl border border-b-0">
        {messages.length === 0 && (
          <p className="text-center text-sm text-gray-400 pt-8">
            No messages yet — say hi to {otherName}!
          </p>
        )}
        {messages.map((msg) => {
          const isMe = msg.sender_id === currentUserId;
          return (
            <div key={msg.id} className={`flex ${isMe ? "justify-end" : "justify-start"}`}>
              <div
                className={`max-w-xs rounded-2xl px-4 py-2.5 text-sm leading-relaxed ${
                  isMe
                    ? "bg-teal-600 text-white rounded-br-sm"
                    : "bg-white border text-gray-800 rounded-bl-sm"
                }`}
              >
                <p className="whitespace-pre-wrap">{msg.body}</p>
                <p className={`text-[10px] mt-1 ${isMe ? "text-teal-200" : "text-gray-400"}`}>
                  {formatTime(msg.created_at)}
                </p>
              </div>
            </div>
          );
        })}
        <div ref={bottomRef} />
      </div>

      {/* Input area */}
      <form
        onSubmit={handleSend}
        className="flex items-end gap-2 p-3 bg-white border rounded-b-xl"
      >
        <textarea
          ref={textareaRef}
          value={body}
          onChange={(e) => setBody(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder={`Message ${otherName}…`}
          rows={2}
          className="flex-1 resize-none rounded-lg border border-gray-200 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-teal-400"
        />
        <button
          type="submit"
          disabled={!body.trim() || sending}
          className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-teal-600 text-white hover:bg-teal-700 disabled:opacity-40 transition"
        >
          <Send className="h-4 w-4" />
        </button>
      </form>
    </div>
  );
}
