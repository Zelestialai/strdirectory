"use client";

import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import { Loader2, Plug, RefreshCw, Check, AlertTriangle, X } from "lucide-react";

interface Integration {
  status: string;
  api_username: string | null;
  last_synced_at: string | null;
  last_error: string | null;
}

export function OwnerRezConnect() {
  const router = useRouter();
  const [integration, setIntegration] = useState<Integration | null>(null);
  const [oauthAvailable, setOauthAvailable] = useState(false);
  const [loaded, setLoaded] = useState(false);
  const [open, setOpen] = useState(false);
  const [username, setUsername] = useState("");
  const [token, setToken] = useState("");
  const [busy, setBusy] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [result, setResult] = useState<string | null>(null);

  const load = useCallback(async () => {
    try {
      const res = await fetch("/api/integrations/ownerrez");
      if (res.ok) {
        const data = await res.json();
        setIntegration(data.integration);
        setOauthAvailable(!!data.oauthAvailable);
      }
    } finally {
      setLoaded(true);
    }
  }, []);

  useEffect(() => {
    load();
  }, [load]);

  const connected = !!integration;

  async function connect(e: React.FormEvent) {
    e.preventDefault();
    if (!username.trim() || !token.trim()) {
      setError("Enter your OwnerRez username and API token.");
      return;
    }
    setBusy("connect");
    setError(null);
    setResult(null);
    try {
      const res = await fetch("/api/integrations/ownerrez", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username: username.trim(), token: token.trim() }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Failed to connect");
      setResult(
        `Connected! Synced ${data.result?.properties ?? 0} properties, ${data.result?.reservations ?? 0} reservations, created ${data.result?.turnovers ?? 0} turnovers.`
      );
      setOpen(false);
      setUsername("");
      setToken("");
      await load();
      router.refresh();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
    } finally {
      setBusy(null);
    }
  }

  async function syncNow() {
    setBusy("sync");
    setError(null);
    setResult(null);
    try {
      const res = await fetch("/api/integrations/ownerrez/sync", { method: "POST" });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Sync failed");
      setResult(
        `Synced ${data.result?.reservations ?? 0} reservations, created ${data.result?.turnovers ?? 0} new turnovers.`
      );
      await load();
      router.refresh();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Sync failed");
    } finally {
      setBusy(null);
    }
  }

  async function disconnect() {
    if (!confirm("Disconnect OwnerRez? Your synced properties and reservations stay, but they'll stop updating.")) return;
    setBusy("disconnect");
    try {
      await fetch("/api/integrations/ownerrez", { method: "DELETE" });
      setIntegration(null);
      await load();
      router.refresh();
    } finally {
      setBusy(null);
    }
  }

  if (!loaded) {
    return <div className="rounded-xl border border-gray-200 bg-white h-[76px] animate-pulse" />;
  }

  return (
    <div className="rounded-xl border border-gray-200 bg-white overflow-hidden">
      <div className="p-5 flex items-start justify-between gap-4 flex-wrap">
        <div className="flex items-start gap-3">
          <span className="flex h-10 w-10 items-center justify-center rounded-lg bg-brand-50 text-brand-600">
            <Plug className="h-5 w-5" />
          </span>
          <div>
            <div className="flex items-center gap-2">
              <h3 className="font-semibold text-gray-900">OwnerRez</h3>
              {connected && integration!.status === "active" && (
                <span className="inline-flex items-center gap-1 rounded-full bg-green-50 text-green-700 border border-green-200 px-2 py-0.5 text-xs font-medium">
                  <Check className="h-3 w-3" /> Connected
                </span>
              )}
              {connected && integration!.status === "error" && (
                <span className="inline-flex items-center gap-1 rounded-full bg-red-50 text-red-700 border border-red-200 px-2 py-0.5 text-xs font-medium">
                  <AlertTriangle className="h-3 w-3" /> Error
                </span>
              )}
            </div>
            <p className="text-sm text-gray-500 mt-0.5">
              {connected
                ? `Auto-syncs daily${integration!.last_synced_at ? ` · last synced ${new Date(integration!.last_synced_at).toLocaleString()}` : ""}.`
                : "Connect once and your reservations sync automatically every day — turnovers are created for every check-out."}
            </p>
            {connected && integration!.last_error && (
              <p className="text-xs text-red-600 mt-1">{integration!.last_error}</p>
            )}
          </div>
        </div>

        <div className="flex items-center gap-2 shrink-0">
          {connected ? (
            <>
              <button onClick={syncNow} disabled={busy === "sync"}
                className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50">
                {busy === "sync" ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <RefreshCw className="h-3.5 w-3.5" />} Sync now
              </button>
              <button onClick={disconnect} disabled={busy === "disconnect"}
                className="inline-flex items-center gap-1.5 rounded-lg px-2.5 py-2 text-sm text-gray-400 hover:text-red-600 hover:bg-red-50">
                <X className="h-3.5 w-3.5" /> Disconnect
              </button>
            </>
          ) : oauthAvailable ? (
            <div className="flex items-center gap-2">
              <a href="/api/integrations/ownerrez/oauth/start"
                className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700">
                <Plug className="h-4 w-4" /> Connect with OwnerRez
              </a>
              <button onClick={() => setOpen((o) => !o)} className="text-xs text-gray-500 hover:text-gray-700">
                Use API token
              </button>
            </div>
          ) : (
            <button onClick={() => setOpen((o) => !o)}
              className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700">
              <Plug className="h-4 w-4" /> Connect
            </button>
          )}
        </div>
      </div>

      {result && (
        <div className="mx-5 mb-4 rounded-lg bg-green-50 border border-green-200 px-3 py-2 text-sm text-green-800">
          {result}
        </div>
      )}

      {open && !connected && (
        <form onSubmit={connect} className="border-t border-gray-100 p-5 space-y-3 bg-gray-50/50">
          <div className="grid gap-3 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">OwnerRez username (email)</label>
              <input value={username} onChange={(e) => setUsername(e.target.value)} autoComplete="off"
                placeholder="you@example.com"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">API token</label>
              <input value={token} onChange={(e) => setToken(e.target.value)} type="password" autoComplete="off"
                placeholder="Personal Access Token"
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm focus:border-brand-400 focus:ring-2 focus:ring-brand-100 focus:outline-none" />
            </div>
          </div>
          <p className="text-xs text-gray-500">
            In OwnerRez, go to <span className="font-medium">Settings → API → Personal Access Tokens</span> to create a token. We validate it before saving and only use it to read your reservations.
          </p>
          {error && <p className="text-xs text-red-600">{error}</p>}
          <div className="flex items-center gap-2">
            <button type="submit" disabled={busy === "connect"}
              className="inline-flex items-center gap-1.5 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700 disabled:opacity-50">
              {busy === "connect" && <Loader2 className="h-3.5 w-3.5 animate-spin" />} Connect & sync
            </button>
            <button type="button" onClick={() => setOpen(false)} className="rounded-lg px-4 py-2 text-sm text-gray-600 hover:bg-gray-100">Cancel</button>
          </div>
        </form>
      )}

      {error && !open && (
        <div className="mx-5 mb-4 rounded-lg bg-red-50 border border-red-200 px-3 py-2 text-sm text-red-700">
          {error}
        </div>
      )}
    </div>
  );
}
