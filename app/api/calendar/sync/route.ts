import { createClient } from "@/lib/supabase/server";
import { NextRequest, NextResponse } from "next/server";

// ─── iCal parser ─────────────────────────────────────────────────────────────
function parseDate(value: string): string {
  // Handles: YYYYMMDD  or  YYYYMMDDTHHmmssZ
  const dateStr = value.replace(/T.*$/, "").trim();
  if (dateStr.length === 8) {
    return `${dateStr.slice(0, 4)}-${dateStr.slice(4, 6)}-${dateStr.slice(6, 8)}`;
  }
  return dateStr;
}

interface CalEvent {
  uid: string;
  summary: string;
  description: string;
  start: string;
  end: string;
}

function parseIcal(text: string): CalEvent[] {
  const events: CalEvent[] = [];

  // Unfold lines (continuation lines start with space or tab)
  const raw = text.replace(/\r\n/g, "\n").replace(/\r/g, "\n");
  const lines: string[] = [];
  for (const line of raw.split("\n")) {
    if ((line.startsWith(" ") || line.startsWith("\t")) && lines.length > 0) {
      lines[lines.length - 1] += line.slice(1);
    } else {
      lines.push(line);
    }
  }

  let inEvent = false;
  let current: Partial<CalEvent> = {};

  for (const line of lines) {
    if (line === "BEGIN:VEVENT") {
      inEvent = true;
      current = {};
      continue;
    }
    if (line === "END:VEVENT") {
      inEvent = false;
      if (current.uid && current.start && current.end) {
        events.push({
          uid: current.uid,
          summary: current.summary ?? "Reservation",
          description: current.description ?? "",
          start: current.start,
          end: current.end,
        });
      }
      continue;
    }
    if (!inEvent) continue;

    const colonIdx = line.indexOf(":");
    if (colonIdx === -1) continue;
    const key = line.slice(0, colonIdx).toUpperCase();
    const value = line.slice(colonIdx + 1);

    if (key === "UID") {
      current.uid = value;
    } else if (key === "SUMMARY") {
      current.summary = value;
    } else if (key === "DESCRIPTION") {
      current.description = value
        .replace(/\\n/g, " ")
        .replace(/\\,/g, ",")
        .replace(/\\;/g, ";");
    } else if (key.startsWith("DTSTART")) {
      current.start = parseDate(value);
    } else if (key.startsWith("DTEND")) {
      current.end = parseDate(value);
    }
  }

  return events;
}

// ─── Route handler ────────────────────────────────────────────────────────────
export async function POST(req: NextRequest) {
  try {
    const supabase = createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { property_id } = await req.json();
    if (!property_id) {
      return NextResponse.json({ error: "Missing property_id" }, { status: 400 });
    }

    // Verify ownership + get ical_url
    const { data: property } = await supabase
      .from("properties")
      .select("id, ical_url, host_id")
      .eq("id", property_id)
      .eq("host_id", user.id)
      .single();

    if (!property) {
      return NextResponse.json({ error: "Property not found" }, { status: 404 });
    }
    if (!property.ical_url) {
      return NextResponse.json({ error: "No iCal URL set for this property" }, { status: 400 });
    }

    // Fetch iCal feed
    let icalText: string;
    try {
      const res = await fetch(property.ical_url, {
        headers: { "User-Agent": "STRVend/1.0 Calendar Sync" },
        signal: AbortSignal.timeout(10_000),
      });
      if (!res.ok) {
        return NextResponse.json(
          { error: `Failed to fetch iCal feed (HTTP ${res.status})` },
          { status: 400 }
        );
      }
      icalText = await res.text();
    } catch {
      return NextResponse.json(
        { error: "Could not reach the iCal URL. Make sure it is publicly accessible." },
        { status: 400 }
      );
    }

    // Parse events
    const events = parseIcal(icalText);

    if (events.length === 0) {
      return NextResponse.json({ synced: 0, message: "No events found in this calendar" });
    }

    // Upsert into calendar_events
    const rows = events.map((e) => ({
      property_id: property.id,
      host_id: user.id,
      event_uid: e.uid,
      summary: e.summary,
      description: e.description,
      start_date: e.start,
      end_date: e.end,
    }));

    const { error: upsertError } = await supabase
      .from("calendar_events")
      .upsert(rows, { onConflict: "property_id,event_uid" });

    if (upsertError) throw upsertError;

    // Update last_synced_at
    await supabase
      .from("properties")
      .update({ last_synced_at: new Date().toISOString() })
      .eq("id", property.id);

    return NextResponse.json({ synced: events.length });
  } catch (err) {
    console.error("Calendar sync error:", err);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}
