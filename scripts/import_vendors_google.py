#!/usr/bin/env python3
"""
STR Pro Directory — Google Places → Supabase Vendor Importer
============================================================
Fetches real business data from the Google Places API and upserts
it directly into your Supabase vendors table, replacing (or
supplementing) the dummy seed data.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 1 — Get a Google Places API key
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Go to https://console.cloud.google.com/
2. Create a new project (or select an existing one)
3. Go to APIs & Services → Library
4. Search for "Places API" and click Enable
5. Go to APIs & Services → Credentials → + Create Credentials → API key
6. (Optional but recommended) Click "Restrict Key":
   - Under API restrictions, choose "Restrict key" → Places API
7. Copy the key — you'll use it below

Cost: Text Search = $32/1,000 requests, Place Details = $17/1,000 requests
With ~1,272 markets×categories this run costs roughly $40–60 in API fees.
Use --tier 1 or --market nashville to test cheaply first.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 2 — Get your Supabase service-role key
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Go to https://supabase.com/dashboard/project/<your-project>/settings/api
2. Copy the "service_role" key (NOT the anon key)
   The service-role key bypasses RLS so the script can insert as the
   admin service account — never expose it in client-side code.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 3 — Install dependencies & configure
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  pip install requests supabase python-dotenv

Then either:
  a) Set these environment variables in your shell, OR
  b) Create a file called .env.import in this scripts/ folder:

    GOOGLE_PLACES_KEY=AIzaSy...
    SUPABASE_URL=https://xxxxxxxxxxxx.supabase.co
    SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 4 — Run
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  python scripts/import_vendors_google.py                 # all 106 markets
  python scripts/import_vendors_google.py --tier 1        # Tier 1 only (8 markets)
  python scripts/import_vendors_google.py --tier 1 2      # Tier 1 + 2
  python scripts/import_vendors_google.py --market nashville
  python scripts/import_vendors_google.py --category cleaning-turnover
  python scripts/import_vendors_google.py --dry-run       # preview, no DB writes
  python scripts/import_vendors_google.py --limit 3       # max 3 vendors per slot
  python scripts/import_vendors_google.py --skip-existing # skip markets already seeded

Results are also saved to scripts/import_log.json for review.
"""

import argparse
import json
import os
import re
import sys
import time
from datetime import datetime
from pathlib import Path

import requests

# ── Load .env.import if present ──────────────────────────────────────────────
env_file = Path(__file__).parent / ".env.import"
if env_file.exists():
    for line in env_file.read_text().splitlines():
        line = line.strip()
        if line and not line.startswith("#") and "=" in line:
            key, _, val = line.partition("=")
            os.environ.setdefault(key.strip(), val.strip())

GOOGLE_KEY     = os.environ.get("GOOGLE_PLACES_KEY", "")
SUPABASE_URL   = os.environ.get("SUPABASE_URL", "")
SUPABASE_KEY   = os.environ.get("SUPABASE_SERVICE_KEY", "")

# New Places API (v2) endpoints
PLACES_SEARCH_URL = "https://places.googleapis.com/v1/places:searchText"

# Fields to request in a single Text Search call (no separate Details call needed)
PLACES_FIELD_MASK = ",".join([
    "places.id",
    "places.displayName",
    "places.formattedAddress",
    "places.internationalPhoneNumber",
    "places.websiteUri",
    "places.rating",
    "places.userRatingCount",
    "places.businessStatus",
])

# ── All 106 markets ──────────────────────────────────────────────────────────
# (tier, name, slug, state, primary_city_for_search)
MARKETS = [
    # ── Tier 1 ──
    (1, "Nashville",       "nashville",       "TN", "Nashville"),
    (1, "Miami",           "miami",           "FL", "Miami Beach"),
    (1, "Orlando",         "orlando",         "FL", "Orlando"),
    (1, "Los Angeles",     "los-angeles",     "CA", "Los Angeles"),
    (1, "Austin",          "austin",          "TX", "Austin"),
    (1, "Las Vegas",       "las-vegas",       "NV", "Las Vegas"),
    (1, "Scottsdale",      "scottsdale",      "AZ", "Scottsdale"),
    (1, "New York City",   "new-york-city",   "NY", "New York City"),
    # ── Tier 2 ──
    (2, "Denver",          "denver",          "CO", "Denver"),
    (2, "New Orleans",     "new-orleans",     "LA", "New Orleans"),
    (2, "San Diego",       "san-diego",       "CA", "San Diego"),
    (2, "Charleston",      "charleston",      "SC", "Charleston"),
    (2, "Myrtle Beach",    "myrtle-beach",    "SC", "Myrtle Beach"),
    (2, "Destin",          "destin",          "FL", "Destin"),
    (2, "Smoky Mountains", "smoky-mountains", "TN", "Gatlinburg"),
    (2, "Chicago",         "chicago",         "IL", "Chicago"),
    # ── Tier 3 ──
    (3, "Asheville",       "asheville",       "NC", "Asheville"),
    (3, "Outer Banks",     "outer-banks",     "NC", "Kill Devil Hills"),
    (3, "Hilton Head",     "hilton-head",     "SC", "Hilton Head Island"),
    (3, "Key West",        "key-west",        "FL", "Key West"),
    (3, "Lake Tahoe",      "lake-tahoe",      "CA", "South Lake Tahoe"),
    (3, "Park City",       "park-city",       "UT", "Park City"),
    (3, "Sedona",          "sedona",          "AZ", "Sedona"),
    (3, "Savannah",        "savannah",        "GA", "Savannah"),
    (3, "Virginia Beach",  "virginia-beach",  "VA", "Virginia Beach"),
    (3, "San Antonio",     "san-antonio",     "TX", "San Antonio"),
    # ── Tier 4 — Beach/Coastal ──
    (4, "Gulf Shores",        "gulf-shores",        "AL", "Gulf Shores"),
    (4, "Panama City Beach",  "panama-city-beach",  "FL", "Panama City Beach"),
    (4, "Naples",             "naples",             "FL", "Naples"),
    (4, "Anna Maria Island",  "anna-maria-island",  "FL", "Anna Maria"),
    (4, "Cape Cod",           "cape-cod",           "MA", "Hyannis"),
    (4, "Hamptons",           "hamptons",           "NY", "Southampton"),
    (4, "Jersey Shore",       "jersey-shore",       "NJ", "Ocean City"),
    (4, "Ocean City",         "ocean-city",         "MD", "Ocean City"),
    (4, "Galveston",          "galveston",          "TX", "Galveston"),
    (4, "Rehoboth Beach",     "rehoboth-beach",     "DE", "Rehoboth Beach"),
    (4, "South Padre Island", "south-padre-island", "TX", "South Padre Island"),
    (4, "30A",                "thirty-a",           "FL", "Santa Rosa Beach"),
    # ── Tier 4 — Mountain/Ski ──
    (4, "Breckenridge",    "breckenridge",    "CO", "Breckenridge"),
    (4, "Vail",            "vail",            "CO", "Vail"),
    (4, "Aspen",           "aspen",           "CO", "Aspen"),
    (4, "Steamboat Springs","steamboat-springs","CO","Steamboat Springs"),
    (4, "Telluride",       "telluride",       "CO", "Telluride"),
    (4, "Jackson Hole",    "jackson-hole",    "WY", "Jackson"),
    (4, "Big Sky",         "big-sky",         "MT", "Big Sky"),
    (4, "Sun Valley",      "sun-valley",      "ID", "Ketchum"),
    (4, "Mammoth Lakes",   "mammoth-lakes",   "CA", "Mammoth Lakes"),
    (4, "Big Bear",        "big-bear",        "CA", "Big Bear Lake"),
    (4, "Bend",            "bend",            "OR", "Bend"),
    (4, "Whitefish",       "whitefish",       "MT", "Whitefish"),
    # ── Tier 5 — Beach ──
    (5, "Clearwater",          "clearwater",          "FL", "Clearwater Beach"),
    (5, "Fort Lauderdale",     "fort-lauderdale",     "FL", "Fort Lauderdale"),
    (5, "Nantucket",           "nantucket",           "MA", "Nantucket"),
    (5, "Martha's Vineyard",   "marthas-vineyard",    "MA", "Edgartown"),
    (5, "Bar Harbor",          "bar-harbor",          "ME", "Bar Harbor"),
    (5, "Mississippi Gulf Coast","mississippi-gulf-coast","MS","Biloxi"),
    (5, "Crystal Coast",       "crystal-coast",       "NC", "Emerald Isle"),
    (5, "Newport",             "newport",             "RI", "Newport"),
    (5, "Port Aransas",        "port-aransas",        "TX", "Port Aransas"),
    (5, "Amelia Island",       "amelia-island",       "FL", "Fernandina Beach"),
    # ── Tier 5 — Mountain/Nature ──
    (5, "Blue Ridge",      "blue-ridge",      "GA", "Blue Ridge"),
    (5, "Poconos",         "poconos",         "PA", "Stroudsburg"),
    (5, "Flagstaff",       "flagstaff",       "AZ", "Flagstaff"),
    (5, "Durango",         "durango",         "CO", "Durango"),
    (5, "Boone",           "boone",           "NC", "Boone"),
    (5, "Door County",     "door-county",     "WI", "Sturgeon Bay"),
    (5, "Traverse City",   "traverse-city",   "MI", "Traverse City"),
    # ── Tier 5 — Urban/Diverse ──
    (5, "Joshua Tree",     "joshua-tree",     "CA", "Joshua Tree"),
    (5, "Palm Springs",    "palm-springs",    "CA", "Palm Springs"),
    (5, "Napa Valley",     "napa-valley",     "CA", "Napa"),
    (5, "San Francisco",   "san-francisco",   "CA", "San Francisco"),
    (5, "Seattle",         "seattle",         "WA", "Seattle"),
    (5, "Dallas",          "dallas",          "TX", "Dallas"),
    (5, "Houston",         "houston",         "TX", "Houston"),
    (5, "Atlanta",         "atlanta",         "GA", "Atlanta"),
    (5, "Boston",          "boston",          "MA", "Boston"),
    (5, "Washington DC",   "washington-dc",   "DC", "Washington DC"),
    (5, "Philadelphia",    "philadelphia",    "PA", "Philadelphia"),
    (5, "Tampa",           "tampa",           "FL", "Tampa"),
    (5, "Portland",        "portland",        "OR", "Portland"),
    # ── Tier 6 — Hawaii ──
    (6, "Maui",            "maui",            "HI", "Lahaina"),
    (6, "Oahu",            "oahu",            "HI", "Honolulu"),
    (6, "Kauai",           "kauai",           "HI", "Lihue"),
    (6, "Big Island",      "big-island",      "HI", "Kailua-Kona"),
    # ── Tier 6 — Mountain/Nature ──
    (6, "Moab",            "moab",            "UT", "Moab"),
    (6, "Santa Fe",        "santa-fe",        "NM", "Santa Fe"),
    (6, "Taos",            "taos",            "NM", "Taos"),
    (6, "Stowe",           "stowe",           "VT", "Stowe"),
    (6, "Catskills",       "catskills",       "NY", "Woodstock"),
    (6, "Finger Lakes",    "finger-lakes",    "NY", "Ithaca"),
    (6, "Hudson Valley",   "hudson-valley",   "NY", "Kingston"),
    (6, "Broken Bow",      "broken-bow",      "OK", "Broken Bow"),
    (6, "Lake of the Ozarks","lake-of-the-ozarks","MO","Osage Beach"),
    (6, "Coeur d'Alene",   "coeur-dalene",    "ID", "Coeur d'Alene"),
    # ── Tier 6 — Beach/Coastal ──
    (6, "Pigeon Forge",    "pigeon-forge",    "TN", "Pigeon Forge"),
    (6, "Sarasota",        "sarasota",        "FL", "Sarasota"),
    (6, "St. Augustine",   "st-augustine",    "FL", "St. Augustine"),
    (6, "Pensacola",       "pensacola",       "FL", "Pensacola Beach"),
    (6, "Cannon Beach",    "cannon-beach",    "OR", "Cannon Beach"),
    (6, "Tybee Island",    "tybee-island",    "GA", "Tybee Island"),
    (6, "Kiawah Island",   "kiawah-island",   "SC", "Kiawah Island"),
    (6, "St. Simons Island","st-simons-island","GA","St. Simons Island"),
    (6, "Chattanooga",     "chattanooga",     "TN", "Chattanooga"),
    (6, "Fredericksburg TX","fredericksburg-tx","TX","Fredericksburg"),
    (6, "New Braunfels",   "new-braunfels",   "TX", "New Braunfels"),
    (6, "Lake Geneva",     "lake-geneva",     "WI", "Lake Geneva"),
]

# ── Search queries per category ───────────────────────────────────────────────
# Each entry is (category_slug, [search_queries])
# The script tries queries in order and picks the best distinct results.
CATEGORY_SEARCHES = {
    "cleaning-turnover": [
        "vacation rental cleaning service",
        "Airbnb cleaning turnover service",
        "short term rental cleaning company",
    ],
    "photography-design": [
        "real estate photographer",
        "vacation rental photographer",
        "Airbnb listing photography",
    ],
    "maintenance-repairs": [
        "vacation rental maintenance handyman",
        "property maintenance repair service",
        "handyman service",
    ],
    "property-management": [
        "vacation rental property management",
        "Airbnb property management company",
        "short term rental management",
    ],
    "real-estate": [
        "investment property real estate agent",
        "vacation rental real estate broker",
        "short term rental investment realtor",
    ],
    "interior-design": [
        "interior designer vacation rental",
        "Airbnb interior design staging",
        "short term rental interior design",
    ],
    "renovation": [
        "vacation rental renovation contractor",
        "home renovation contractor",
        "general contractor remodeling",
    ],
    "accounting-tax": [
        "vacation rental accounting CPA",
        "short term rental tax preparation",
        "Airbnb accountant tax service",
    ],
    "insurance": [
        "vacation rental insurance agency",
        "short term rental insurance",
        "Airbnb host insurance broker",
    ],
    "furniture-supplies": [
        "vacation rental furniture supplier",
        "home furnishings store",
        "furniture rental service",
    ],
    "smart-home-tech": [
        "smart home installation service",
        "home automation installer",
        "smart lock keypad installation",
    ],
    "legal-regulations": [
        "short term rental attorney lawyer",
        "vacation rental legal compliance",
        "real estate attorney",
    ],
}

# ── Helpers ──────────────────────────────────────────────────────────────────

def slugify(text: str) -> str:
    """Convert arbitrary text to a URL-safe slug."""
    text = text.lower().strip()
    text = re.sub(r"[''']", "", text)
    text = re.sub(r"[^a-z0-9\s-]", " ", text)
    text = re.sub(r"[\s-]+", "-", text)
    return text.strip("-")


def make_vendor_slug(business_name: str, city: str, state: str) -> str:
    """Create a unique-ish slug: business-name-city-state."""
    base = slugify(f"{business_name} {city} {state}")
    # Trim to 100 chars max
    return base[:100].rstrip("-")


def places_text_search(query: str, location: str) -> list[dict]:
    """Call Places API (New) Text Search and return normalised result list."""
    headers = {
        "Content-Type":   "application/json",
        "X-Goog-Api-Key": GOOGLE_KEY,
        "X-Goog-FieldMask": PLACES_FIELD_MASK,
    }
    body = {"textQuery": f"{query} {location}"}
    resp = requests.post(PLACES_SEARCH_URL, headers=headers, json=body, timeout=15)
    resp.raise_for_status()
    data = resp.json()
    if "error" in data:
        err = data["error"]
        raise RuntimeError(f"Places API error: {err.get('status')} — {err.get('message','')}")
    return data.get("places", [])


def extract_email_from_website(website: str) -> str | None:
    """
    Attempt a lightweight HEAD request to guess a contact email.
    In practice most sites need a full HTML scrape — we skip that here
    and leave email blank for manual enrichment.
    """
    return None  # Intentionally left simple; enrich separately if needed


def build_vendor_row(
    place: dict,
    details: dict,          # unused now — kept for signature compat
    category_slug: str,
    market_city: str,
    market_state: str,
    category_id: str,
    admin_user_id: str,
) -> dict | None:
    """Map a Places API v2 result to a vendor DB row dict."""
    # v2 returns displayName.text instead of name
    name = (place.get("displayName") or {}).get("text", "").strip()
    if not name:
        return None

    # v2: formattedAddress e.g. "123 Main St, Nashville, TN 37201, USA"
    address_comps = place.get("formattedAddress", "").split(",")
    city     = market_city
    state    = market_state
    zip_code = None

    if len(address_comps) >= 3:
        raw_city  = address_comps[-3].strip()
        state_zip = address_comps[-2].strip().split()
        if raw_city:
            city = raw_city
        if len(state_zip) >= 1:
            state = state_zip[0]
        if len(state_zip) >= 2:
            zip_code = state_zip[1]

    slug = make_vendor_slug(name, city, state)

    # v2 field names
    phone   = place.get("internationalPhoneNumber")
    website = place.get("websiteUri")

    g_rating = place.get("rating")
    g_count  = place.get("userRatingCount") or 0
    avg_rating   = round(float(g_rating), 1) if g_rating else 4.5
    review_count = min(int(g_count), 500)

    return {
        "business_name": name,
        "slug":          slug,
        "tagline":       f"{name} — serving {market_city}, {market_state}",
        "description":   (
            f"{name} is a local service provider in {city}, {state} "
            f"serving short-term rental hosts in the {market_city} area."
        ),
        "category_id":   category_id,
        "city":          city,
        "state":         state,
        "zip":           zip_code,
        "phone":         phone,
        "website":       website,
        "email":         None,
        "user_id":       admin_user_id,
        "is_verified":   False,
        "is_featured":   False,
        "is_claimed":    False,
        "is_active":     True,
        "avg_rating":    avg_rating,
        "review_count":  review_count,
    }


# ── Supabase helpers ──────────────────────────────────────────────────────────

def sb_get(path: str, params: dict = None) -> dict:
    headers = {
        "apikey":        SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
    }
    resp = requests.get(f"{SUPABASE_URL}/rest/v1/{path}", headers=headers, params=params, timeout=15)
    resp.raise_for_status()
    return resp.json()


def sb_upsert(table: str, rows: list[dict]) -> dict:
    """Upsert rows; conflicts on 'slug' are ignored (do nothing)."""
    headers = {
        "apikey":           SUPABASE_KEY,
        "Authorization":    f"Bearer {SUPABASE_KEY}",
        "Content-Type":     "application/json",
        "Prefer":           "resolution=ignore-duplicates,return=minimal",
    }
    resp = requests.post(
        f"{SUPABASE_URL}/rest/v1/{table}",
        headers=headers,
        json=rows,
        timeout=30,
    )
    resp.raise_for_status()
    return resp


def fetch_category_ids() -> dict[str, str]:
    """Return {slug: id} for all categories."""
    rows = sb_get("categories", {"select": "id,slug"})
    return {r["slug"]: r["id"] for r in rows}


def fetch_admin_user_id() -> str:
    """Return the id of the first admin profile."""
    rows = sb_get("profiles", {"select": "id", "role": "eq.admin", "limit": "1"})
    if not rows:
        raise RuntimeError(
            "No admin profile found in Supabase. "
            "Create an admin user first via the Auth dashboard."
        )
    return rows[0]["id"]


def fetch_existing_slugs() -> set[str]:
    """Return all existing vendor slugs (for --skip-existing check)."""
    rows = sb_get("vendors", {"select": "slug", "limit": "10000"})
    return {r["slug"] for r in rows}


# ── Core import logic ─────────────────────────────────────────────────────────

def import_market_category(
    market: tuple,
    category_slug: str,
    category_id: str,
    admin_user_id: str,
    limit: int,
    dry_run: bool,
    existing_slugs: set[str],
    log: list,
) -> int:
    """
    Fetch real vendors for one market+category pair and upsert them.
    Returns the number of vendors inserted/attempted.
    """
    tier, market_name, market_slug, state, primary_city = market
    location = f"{primary_city}, {state}"
    queries   = CATEGORY_SEARCHES[category_slug]

    seen_place_ids: set[str] = set()
    candidates: list[dict] = []

    for query in queries:
        if len(candidates) >= limit:
            break
        try:
            results = places_text_search(query, location)
            time.sleep(0.5)  # be a polite API citizen
        except Exception as e:
            print(f"    ⚠  Search failed ({query!r}): {e}")
            continue

        for place in results:
            pid = place.get("id", "")          # v2 uses "id" not "place_id"
            if pid in seen_place_ids:
                continue
            if place.get("businessStatus") == "CLOSED_PERMANENTLY":  # v2 camelCase
                continue
            seen_place_ids.add(pid)
            candidates.append(place)
            if len(candidates) >= limit * 2:
                break

    inserted = 0
    for place in candidates[:limit]:
        # v2 returns all fields (phone, website, rating) in the text search
        # response itself — no separate details call needed.
        row = build_vendor_row(
            place, {},
            category_slug, primary_city, state,
            category_id, admin_user_id,
        )
        if not row:
            continue

        # Deduplicate against existing slugs
        if row["slug"] in existing_slugs:
            # Append a suffix to make it unique
            row["slug"] = f"{row['slug']}-{market_slug[:8]}"
        if row["slug"] in existing_slugs:
            continue  # Still a dupe — skip

        existing_slugs.add(row["slug"])

        log.append({
            "market": market_name,
            "category": category_slug,
            "business": row["business_name"],
            "city": row["city"],
            "state": row["state"],
            "slug": row["slug"],
            "phone": row["phone"],
            "website": row["website"],
            "rating": row["avg_rating"],
            "reviews": row["review_count"],
            "dry_run": dry_run,
        })

        if not dry_run:
            try:
                sb_upsert("vendors", [row])
                inserted += 1
            except Exception as e:
                print(f"    ✗  DB upsert failed for {row['business_name']!r}: {e}")
        else:
            inserted += 1  # count previewed rows the same way

    return inserted


# ── CLI ───────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(description="Import real vendors from Google Places into Supabase")
    parser.add_argument("--tier",          type=int,   nargs="+",  help="Only import these tier numbers (1-6)")
    parser.add_argument("--market",        type=str,   nargs="+",  help="Only import these market slugs")
    parser.add_argument("--category",      type=str,   nargs="+",  help="Only import these category slugs")
    parser.add_argument("--limit",         type=int,   default=5,  help="Max vendors per market+category (default 5)")
    parser.add_argument("--dry-run",       action="store_true",    help="Preview without writing to DB")
    parser.add_argument("--skip-existing", action="store_true",    help="Skip markets that already have vendors seeded")
    args = parser.parse_args()

    # ── Validate config ──
    missing = []
    if not GOOGLE_KEY:
        missing.append("GOOGLE_PLACES_KEY")
    if not SUPABASE_URL:
        missing.append("SUPABASE_URL")
    if not SUPABASE_KEY:
        missing.append("SUPABASE_SERVICE_KEY")
    if missing:
        print(f"\n❌  Missing environment variables: {', '.join(missing)}")
        print("    Set them in scripts/.env.import or export them in your shell.\n")
        sys.exit(1)

    # ── Filter markets ──
    markets = MARKETS
    if args.tier:
        markets = [m for m in markets if m[0] in args.tier]
    if args.market:
        markets = [m for m in markets if m[2] in args.market]

    # ── Filter categories ──
    categories_to_run = list(CATEGORY_SEARCHES.keys())
    if args.category:
        categories_to_run = [c for c in categories_to_run if c in args.category]

    print(f"\n{'DRY RUN — ' if args.dry_run else ''}STR Pro Directory — Google Places Importer")
    print(f"Markets  : {len(markets)}")
    print(f"Categories: {len(categories_to_run)}")
    print(f"Limit    : {args.limit} vendors per slot")
    print(f"Total API calls (est): {len(markets) * len(categories_to_run) * 3} text search + details\n")

    # ── Bootstrap Supabase lookups ──
    print("Fetching category IDs from Supabase…")
    try:
        cat_map = fetch_category_ids()
    except Exception as e:
        print(f"❌  Could not fetch categories: {e}")
        sys.exit(1)

    print("Fetching admin user ID…")
    try:
        admin_id = fetch_admin_user_id()
    except Exception as e:
        print(f"❌  Could not fetch admin user: {e}")
        sys.exit(1)

    existing_slugs: set[str] = set()
    if args.skip_existing or not args.dry_run:
        print("Fetching existing vendor slugs…")
        try:
            existing_slugs = fetch_existing_slugs()
            print(f"  Found {len(existing_slugs)} existing vendors\n")
        except Exception as e:
            print(f"⚠  Could not fetch existing slugs (continuing): {e}\n")

    log: list[dict] = []
    total_inserted = 0
    total_slots    = len(markets) * len(categories_to_run)
    slot           = 0

    start_time = datetime.now()

    for market in markets:
        tier, market_name, market_slug, state, primary_city = market

        # --skip-existing: if any vendor exists for this market city, skip entire market
        if args.skip_existing:
            market_has_data = any(
                s.endswith(f"-{market_slug[:8]}") or primary_city.lower().replace(" ", "-") in s
                for s in existing_slugs
            )
            if market_has_data:
                print(f"  ⏭  Skipping {market_name} (already has data)")
                continue

        print(f"📍 {market_name}, {state}  (Tier {tier})")

        for cat_slug in categories_to_run:
            slot += 1
            cat_id = cat_map.get(cat_slug)
            if not cat_id:
                print(f"    ⚠  Category {cat_slug!r} not found in DB — skipping")
                continue

            n = import_market_category(
                market=market,
                category_slug=cat_slug,
                category_id=cat_id,
                admin_user_id=admin_id,
                limit=args.limit,
                dry_run=args.dry_run,
                existing_slugs=existing_slugs,
                log=log,
            )
            total_inserted += n
            status = "✓" if n > 0 else "—"
            label  = "(preview)" if args.dry_run else "inserted"
            print(f"    {status}  {cat_slug:<24} {n} {label}   [{slot}/{total_slots}]")

            # Polite pause between categories
            time.sleep(0.5)

        print()

    elapsed = (datetime.now() - start_time).total_seconds()
    print(f"{'─'*60}")
    print(f"{'DRY RUN ' if args.dry_run else ''}Complete: {total_inserted} vendors in {elapsed:.0f}s")

    # ── Save log ──
    log_path = Path(__file__).parent / "import_log.json"
    log_path.write_text(json.dumps(log, indent=2))
    print(f"Log saved → {log_path}")

    if args.dry_run:
        print("\nRerun without --dry-run to write to Supabase.")


if __name__ == "__main__":
    main()
