// Minimal RFC 5545 iCalendar builder for all-day event feeds.

export interface IcsEvent {
  uid: string;
  date: string;        // YYYY-MM-DD (all-day start)
  endDate?: string;    // YYYY-MM-DD exclusive end; defaults to date + 1 day
  summary: string;
  description?: string;
  location?: string;
}

function pad(n: number) {
  return String(n).padStart(2, "0");
}

/** YYYY-MM-DD -> YYYYMMDD */
function toIcsDate(d: string) {
  return d.replace(/-/g, "");
}

/** add N days to a YYYY-MM-DD date */
function addDays(d: string, days: number) {
  const dt = new Date(d + "T00:00:00Z");
  dt.setUTCDate(dt.getUTCDate() + days);
  return `${dt.getUTCFullYear()}-${pad(dt.getUTCMonth() + 1)}-${pad(dt.getUTCDate())}`;
}

function stamp() {
  const d = new Date();
  return (
    `${d.getUTCFullYear()}${pad(d.getUTCMonth() + 1)}${pad(d.getUTCDate())}` +
    `T${pad(d.getUTCHours())}${pad(d.getUTCMinutes())}${pad(d.getUTCSeconds())}Z`
  );
}

/** Escape text per RFC 5545 (commas, semicolons, backslashes, newlines). */
function esc(text: string) {
  return text
    .replace(/\\/g, "\\\\")
    .replace(/;/g, "\\;")
    .replace(/,/g, "\\,")
    .replace(/\r?\n/g, "\\n");
}

/** Fold lines longer than 75 octets (simple char-based folding). */
function fold(line: string) {
  if (line.length <= 75) return line;
  const chunks: string[] = [];
  let s = line;
  chunks.push(s.slice(0, 75));
  s = s.slice(75);
  while (s.length > 74) {
    chunks.push(" " + s.slice(0, 74));
    s = s.slice(74);
  }
  if (s.length) chunks.push(" " + s);
  return chunks.join("\r\n");
}

export function buildIcs(calName: string, events: IcsEvent[]): string {
  const now = stamp();
  const lines: string[] = [
    "BEGIN:VCALENDAR",
    "VERSION:2.0",
    "PRODID:-//STRVend//Calendar//EN",
    "CALSCALE:GREGORIAN",
    "METHOD:PUBLISH",
    `X-WR-CALNAME:${esc(calName)}`,
    "X-PUBLISHED-TTL:PT1H",
    "REFRESH-INTERVAL;VALUE=DURATION:PT1H",
  ];

  for (const ev of events) {
    const end = ev.endDate ?? addDays(ev.date, 1);
    lines.push("BEGIN:VEVENT");
    lines.push(`UID:${esc(ev.uid)}@strvend.com`);
    lines.push(`DTSTAMP:${now}`);
    lines.push(`DTSTART;VALUE=DATE:${toIcsDate(ev.date)}`);
    lines.push(`DTEND;VALUE=DATE:${toIcsDate(end)}`);
    lines.push(fold(`SUMMARY:${esc(ev.summary)}`));
    if (ev.description) lines.push(fold(`DESCRIPTION:${esc(ev.description)}`));
    if (ev.location) lines.push(fold(`LOCATION:${esc(ev.location)}`));
    lines.push("END:VEVENT");
  }

  lines.push("END:VCALENDAR");
  return lines.join("\r\n") + "\r\n";
}
