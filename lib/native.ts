/**
 * Native bridge helpers for the Capacitor iOS/Android shell.
 *
 * Everything here is a progressive enhancement: on the web these functions
 * report "not native" and callers fall back to standard web behaviour, so the
 * Next.js/Vercel build and the browser experience are completely unaffected.
 * Capacitor plugins are only ever loaded via dynamic import inside a real
 * native runtime.
 */

let _isNative: boolean | null = null;

/** True only when running inside the Capacitor native shell (not a browser). */
export async function isNativePlatform(): Promise<boolean> {
  if (_isNative !== null) return _isNative;
  if (typeof window === "undefined") return (_isNative = false);
  try {
    const mod: any = await import("@capacitor/core");
    _isNative = !!mod?.Capacitor?.isNativePlatform?.();
  } catch {
    _isNative = false;
  }
  return _isNative;
}

export interface NativePhoto {
  /** A File suitable for uploading to Supabase storage. */
  file: File;
  /** Local object URL for immediate preview. */
  previewUrl: string;
}

/**
 * Capture a photo with the device camera via the native Camera plugin.
 * Returns null on web or if the user cancels / it isn't available, so the
 * caller can fall back to a normal <input type="file"> flow.
 */
export async function takeNativePhoto(): Promise<NativePhoto | null> {
  if (!(await isNativePlatform())) return null;
  try {
    const cam: any = await import("@capacitor/camera");
    const { Camera, CameraResultType, CameraSource } = cam;
    const photo = await Camera.getPhoto({
      quality: 70,
      resultType: CameraResultType.Uri,
      source: CameraSource.Prompt, // let the cleaner pick camera or library
      allowEditing: false,
      saveToGallery: false,
    });
    if (!photo?.webPath) return null;
    const res = await fetch(photo.webPath);
    const blob = await res.blob();
    const ext = (photo.format || "jpeg").replace("jpg", "jpeg");
    const file = new File([blob], `photo.${ext === "jpeg" ? "jpg" : ext}`, {
      type: blob.type || "image/jpeg",
    });
    return { file, previewUrl: photo.webPath };
  } catch {
    return null;
  }
}

/**
 * Register the device for push notifications and hand the token to the backend.
 * No-op on web. Safe to call once after login inside the native shell.
 * (Requires the backend token-registration endpoint + APNs/FCM — see the
 * mobile setup playbook. Left as a scaffold until push is wired server-side.)
 */
export async function registerPushIfNative(
  onToken?: (token: string) => void
): Promise<void> {
  if (!(await isNativePlatform())) return;
  try {
    const mod: any = await import("@capacitor/push-notifications");
    const { PushNotifications } = mod;
    const perm = await PushNotifications.requestPermissions();
    if (perm.receive !== "granted") return;
    await PushNotifications.register();
    PushNotifications.addListener("registration", (t: any) => onToken?.(t.value));
  } catch {
    /* ignore — push not available */
  }
}
