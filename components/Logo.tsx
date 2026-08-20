interface LogoProps {
  /** Height of the mark in px (wordmark scales with it). Default 28. */
  size?: number;
  /** Show the "STRVend" wordmark next to the mark. Default true. */
  showWordmark?: boolean;
  className?: string;
}

/**
 * STRVend logo — rooftop house mark (teal tile + coral roof) with wordmark.
 * The wordmark uses currentColor for "STR" so it inherits the surrounding
 * text color; "Vend" is brand teal.
 */
export function Logo({ size = 28, showWordmark = true, className }: LogoProps) {
  return (
    <span className={`inline-flex items-center gap-2 ${className ?? ""}`}>
      <svg
        width={size}
        height={size}
        viewBox="0 0 64 64"
        role="img"
        aria-label="STRVend"
        className="shrink-0"
      >
        <rect width="64" height="64" rx="14" fill="#0d9488" />
        <polygon points="32,14 51,33 13,33" fill="#fb7185" />
        <rect x="19" y="33" width="26" height="18" rx="1.5" fill="#ffffff" />
        <rect x="28" y="40" width="8" height="11" rx="1" fill="#0d9488" />
      </svg>
      {showWordmark && (
        <span
          className="font-bold tracking-tight"
          style={{ fontSize: size * 0.66, lineHeight: 1 }}
        >
          <span style={{ color: "currentColor" }}>STR</span>
          <span className="text-brand-600">Vend</span>
        </span>
      )}
    </span>
  );
}
