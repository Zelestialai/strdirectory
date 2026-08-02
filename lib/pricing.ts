// Built-in dynamic pricing engine for direct booking sites.
// Pure functions — safe to use on both server (checkout) and client (booking form).

export interface SeasonalRate {
  start_date: string; // YYYY-MM-DD inclusive
  end_date: string;   // YYYY-MM-DD inclusive
  nightly_rate_cents: number;
}

export interface PricingConfig {
  baseCents: number;
  weekendMultiplier?: number;   // applied to Fri/Sat nights
  minPriceCents?: number | null;
  cleaningFeeCents?: number;
  seasonalRates?: SeasonalRate[];
}

export interface NightPrice {
  date: string;   // YYYY-MM-DD
  cents: number;
  weekend: boolean;
  seasonal: boolean;
}

export interface StayQuote {
  nights: number;
  perNight: NightPrice[];
  nightsSubtotalCents: number;
  cleaningFeeCents: number;
  totalCents: number;
  avgNightlyCents: number;
}

function eachNight(checkIn: string, checkOut: string): string[] {
  const out: string[] = [];
  const start = new Date(checkIn + "T00:00:00Z");
  const end = new Date(checkOut + "T00:00:00Z");
  for (let d = new Date(start); d < end; d.setUTCDate(d.getUTCDate() + 1)) {
    out.push(d.toISOString().slice(0, 10));
  }
  return out;
}

/** Is this YYYY-MM-DD a Friday or Saturday night? */
function isWeekend(dateStr: string): boolean {
  const day = new Date(dateStr + "T00:00:00Z").getUTCDay(); // 0=Sun … 6=Sat
  return day === 5 || day === 6;
}

function seasonalFor(dateStr: string, rates: SeasonalRate[]): SeasonalRate | null {
  for (const r of rates) {
    if (dateStr >= r.start_date && dateStr <= r.end_date) return r;
  }
  return null;
}

/**
 * Price a stay night-by-night: seasonal override (if any) or base, then the
 * weekend multiplier, then the min-price floor.
 */
export function quoteStay(config: PricingConfig, checkIn: string, checkOut: string): StayQuote {
  const {
    baseCents,
    weekendMultiplier = 1,
    minPriceCents = null,
    cleaningFeeCents = 0,
    seasonalRates = [],
  } = config;

  const nightsArr = eachNight(checkIn, checkOut);
  const perNight: NightPrice[] = [];

  for (const date of nightsArr) {
    const season = seasonalFor(date, seasonalRates);
    let cents = season ? season.nightly_rate_cents : baseCents;
    const weekend = isWeekend(date);
    if (weekend && weekendMultiplier > 1) {
      cents = Math.round(cents * weekendMultiplier);
    }
    if (minPriceCents != null && cents < minPriceCents) {
      cents = minPriceCents;
    }
    perNight.push({ date, cents, weekend, seasonal: !!season });
  }

  const nightsSubtotalCents = perNight.reduce((s, n) => s + n.cents, 0);
  const nights = perNight.length;
  const totalCents = nightsSubtotalCents + cleaningFeeCents;

  return {
    nights,
    perNight,
    nightsSubtotalCents,
    cleaningFeeCents,
    totalCents,
    avgNightlyCents: nights > 0 ? Math.round(nightsSubtotalCents / nights) : baseCents,
  };
}
