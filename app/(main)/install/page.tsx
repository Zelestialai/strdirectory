"use client";

import { useEffect, useState } from "react";
import { Share, Plus, MoreVertical, Camera, Check, QrCode, Smartphone } from "lucide-react";

type Platform = "ios" | "android" | "desktop";

export default function InstallPage() {
  const [platform, setPlatform] = useState<Platform>("desktop");
  const [installed, setInstalled] = useState(false);

  useEffect(() => {
    const ua = navigator.userAgent || "";
    if (/iphone|ipad|ipod/i.test(ua)) setPlatform("ios");
    else if (/android/i.test(ua)) setPlatform("android");
    else setPlatform("desktop");

    const standalone =
      window.matchMedia?.("(display-mode: standalone)")?.matches ||
      // iOS Safari
      (window.navigator as unknown as { standalone?: boolean }).standalone === true;
    setInstalled(!!standalone);
  }, []);

  if (installed) {
    return (
      <div className="mx-auto max-w-lg px-4 py-16 text-center">
        <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-2xl bg-green-50">
          <Check className="h-7 w-7 text-green-600" />
        </div>
        <h1 className="text-2xl font-bold text-gray-900">You&apos;re all set</h1>
        <p className="mt-2 text-gray-500">
          STRVend is installed on this device. You can open it from your home screen any time.
        </p>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-3xl px-4 py-10">
      <div className="text-center">
        <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-2xl bg-brand-600">
          <Smartphone className="h-8 w-8 text-white" />
        </div>
        <h1 className="text-3xl font-bold text-gray-900">Get the STRVend app</h1>
        <p className="mx-auto mt-2 max-w-xl text-gray-500">
          Add STRVend to your phone&apos;s home screen for one-tap access to your jobs, cleaning
          checklists, and photo sharing — with the camera built right in. No app store needed.
        </p>
      </div>

      <div className="mt-10 grid gap-6 md:grid-cols-3">
        {/* Steps — 2 columns */}
        <div className="md:col-span-2 space-y-6">
          {/* iOS */}
          <div className={`card p-6 ${platform === "ios" ? "ring-2 ring-brand-500" : ""}`}>
            <div className="mb-3 flex items-center gap-2">
              <h2 className="text-lg font-semibold text-gray-900">iPhone &amp; iPad</h2>
              {platform === "ios" && (
                <span className="rounded-full bg-brand-50 px-2 py-0.5 text-xs font-medium text-brand-700">
                  Your device
                </span>
              )}
            </div>
            <ol className="space-y-3 text-sm text-gray-700">
              <Step n={1}>
                Open <span className="font-medium">strvend.com</span> in <span className="font-medium">Safari</span>.
              </Step>
              <Step n={2}>
                Tap the <Share className="inline h-4 w-4 -mt-0.5 text-brand-600" /> <span className="font-medium">Share</span> button at the bottom of the screen.
              </Step>
              <Step n={3}>
                Scroll down and tap <span className="font-medium">Add to Home Screen</span> <Plus className="inline h-4 w-4 -mt-0.5 text-brand-600" />.
              </Step>
              <Step n={4}>
                Tap <span className="font-medium">Add</span>. The STRVend icon appears on your home screen.
              </Step>
            </ol>
          </div>

          {/* Android */}
          <div className={`card p-6 ${platform === "android" ? "ring-2 ring-brand-500" : ""}`}>
            <div className="mb-3 flex items-center gap-2">
              <h2 className="text-lg font-semibold text-gray-900">Android</h2>
              {platform === "android" && (
                <span className="rounded-full bg-brand-50 px-2 py-0.5 text-xs font-medium text-brand-700">
                  Your device
                </span>
              )}
            </div>
            <ol className="space-y-3 text-sm text-gray-700">
              <Step n={1}>
                Open <span className="font-medium">strvend.com</span> in <span className="font-medium">Chrome</span>.
              </Step>
              <Step n={2}>
                Tap the <MoreVertical className="inline h-4 w-4 -mt-0.5 text-brand-600" /> <span className="font-medium">menu</span> (top-right).
              </Step>
              <Step n={3}>
                Tap <span className="font-medium">Install app</span> or <span className="font-medium">Add to Home screen</span>.
              </Step>
              <Step n={4}>
                Confirm. The STRVend icon appears in your app drawer.
              </Step>
            </ol>
          </div>

          <div className="flex items-start gap-3 rounded-xl bg-brand-50 p-4">
            <Camera className="h-5 w-5 shrink-0 text-brand-600" />
            <p className="text-sm text-brand-800">
              Once added, STRVend opens full-screen like a normal app and can use your camera to
              snap turnover photos on the job.
            </p>
          </div>
        </div>

        {/* QR panel */}
        <div className="card flex flex-col items-center p-6 text-center h-fit">
          <div className="mb-2 flex items-center gap-1.5 text-sm font-medium text-gray-700">
            <QrCode className="h-4 w-4" /> Scan to open
          </div>
          <div className="rounded-xl bg-white p-3 ring-1 ring-gray-100">
            <Image src="/install-qr.svg" alt="Scan to open strvend.com" width={160} height={160} />
          </div>
          <p className="mt-3 text-xs text-gray-500">
            Point your phone camera here, then follow the steps for your device.
          </p>
        </div>
      </div>

      <p className="mt-10 text-center text-sm text-gray-400">
        Managing a cleaning crew? Share this page — <span className="font-medium text-gray-500">strvend.com/install</span> — so everyone can set up in a minute.
      </p>
    </div>
  );
}

function Step({ n, children }: { n: number; children: React.ReactNode }) {
  return (
    <li className="flex gap-3">
      <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-brand-600 text-xs font-semibold text-white">
        {n}
      </span>
      <span className="pt-0.5">{children}</span>
    </li>
  );
}
