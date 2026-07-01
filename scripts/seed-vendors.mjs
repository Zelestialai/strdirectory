// One-off helper: seed real vendor rows directly via the Supabase service-role
// key, bypassing the flaky Studio SQL editor UI. Usage:
//   node scripts/seed-vendors.mjs <path-to-json-file>
//
// JSON file shape: an array of objects:
//   { business_name, slug, tagline, description, website, category_slug, city, state }
//
// Reads SUPABASE creds from .env.local in the project root. Inserts are
// upserts on `slug` with ignoreDuplicates so re-running is always safe.

import { createClient } from "@supabase/supabase-js";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const envPath = path.join(__dirname, "..", ".env.local");
const env = Object.fromEntries(
  fs
    .readFileSync(envPath, "utf-8")
    .split("\n")
    .filter((l) => l.includes("=") && !l.trim().startsWith("#"))
    .map((l) => {
      const idx = l.indexOf("=");
      return [l.slice(0, idx).trim(), l.slice(idx + 1).trim()];
    })
);

const supabase = createClient(
  env.NEXT_PUBLIC_SUPABASE_URL,
  env.SUPABASE_SERVICE_ROLE_KEY
);

const jsonPath = process.argv[2];
if (!jsonPath) {
  console.error("Usage: node scripts/seed-vendors.mjs <path-to-json-file>");
  process.exit(1);
}
const vendors = JSON.parse(fs.readFileSync(jsonPath, "utf-8"));

async function main() {
  const { data: categories, error: catErr } = await supabase
    .from("categories")
    .select("id, slug");
  if (catErr) throw catErr;
  const catMap = Object.fromEntries(categories.map((c) => [c.slug, c.id]));

  const { data: admin, error: adminErr } = await supabase
    .from("profiles")
    .select("id")
    .eq("role", "admin")
    .limit(1)
    .single();
  if (adminErr) throw adminErr;

  const rows = vendors.map((v) => {
    const categoryId = catMap[v.category_slug];
    if (!categoryId) throw new Error(`Unknown category slug: ${v.category_slug}`);
    return {
      business_name: v.business_name,
      slug: v.slug,
      tagline: v.tagline,
      description: v.description,
      website: v.website,
      category_id: categoryId,
      city: v.city,
      state: v.state,
      user_id: admin.id,
      is_verified: false,
      is_featured: false,
      is_active: true,
      avg_rating: 0,
      review_count: 0,
    };
  });

  const { data, error } = await supabase
    .from("vendors")
    .upsert(rows, { onConflict: "slug", ignoreDuplicates: true })
    .select("id, business_name, slug");

  if (error) throw error;
  console.log(`Inserted/skipped ${rows.length} rows. Returned ${data.length} rows:`);
  for (const r of data) console.log(`  - ${r.business_name} (${r.slug})`);
}

main().catch((e) => {
  console.error("ERROR:", e.message || e);
  process.exit(1);
});
