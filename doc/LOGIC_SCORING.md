# Terrava — Logic-First Scoring (No AI in MVP)

## Decision

Neighborhood insights use **deterministic logic** over Google Places (and related) data.  
Generative AI summaries are **out of MVP**; an interface is reserved for later.

## Why logic first

- Free / predictable cost
- No hallucinations about safety or prices
- Testable unit math
- Works offline once facts are cached

---

## Inputs (facts gathered in radius R, default 1.5 km)

For a center `(lat, lng)`:

| Fact | Source |
|------|--------|
| Counts per category | Places Nearby (restaurant, hospital, school, supermarket, pharmacy, bank, transit_station, etc.) |
| Average rating / ratings count | Places |
| Distance to nearest essential | Places + haversine |
| Open-now ratio (optional) | Places opening hours |
| Weather now | WeatherAPI |
| FX snapshot | ExchangeRate API |
| Local time | Google Timezone |

---

## Category groups

| Group | Place types (examples) |
|-------|----------------------|
| Essentials | supermarket, grocery_or_supermarket, convenience_store, pharmacy |
| Health | hospital, doctor, dentist, pharmacy |
| Food | restaurant, cafe, bakery |
| Money | bank, atm |
| Education | school, primary_school, secondary_school, university |
| Transport | bus_station, subway_station, train_station, transit_station, taxi_stand |
| Stay | lodging |
| Fuel | gas_station |

Exact type lists live in `features/scoring/`.

---

## Score model (0–100)

Each group score:

```
coverage = clamp(count / target_count, 0, 1)
quality  = clamp((avg_rating - 3.0) / 2.0, 0, 1)   // 3★→0, 5★→1
access   = 1 - clamp(nearest_distance_m / max_distance_m, 0, 1)

group_score = 100 * (0.45*coverage + 0.30*quality + 0.25*access)
```

**Neighborhood Score** (livability proxy):

```
neighborhood =
  0.25*essentials +
  0.20*health +
  0.15*food +
  0.15*transport +
  0.10*money +
  0.10*education +
  0.05*fuel
```

Weights are configurable constants — tune after dogfooding.

### Honest labeling

UI copy must say this is a **convenience / amenity score**, not crime safety, school quality, or official livability.

**Safety / crime:** not scored in MVP without a real crime dataset.  
**Cost of living:** MVP shows FX + optional price proxies (avg hotel / restaurant price_level), not a full COL index.

---

## Templated summary (replaces AI)

Example template:

```
{area_name} scores {neighborhood}/100 for everyday convenience.
Strongest: {top_group}. Weakest: {bottom_group}.
Within {radius_label}: {essentials_count} grocery options, {health_count} health-related places,
{food_count} food places, {transport_count} transit-related places.
```

Rules fill blanks; no LLM.

---

## Cost of living (MVP light)

1. Detect country from reverse geocode.
2. Show currency code + FX vs user’s home currency.
3. Optional: average `price_level` of nearby restaurants/hotels as a rough “local spend feel” ($-$$$$).

Full COL indices → future data partnership ([FUTURE_FEATURES.md](./FUTURE_FEATURES.md)).

---

## Traffic (MVP light)

- On Directions screen: compare duration in traffic vs static duration when API provides both.
- Location Details: optional “typical travel time to city center” only if a center point is defined — otherwise skip.

No fake traffic score without Directions samples.

---

## Architecture

```
NeighborhoodFactsAssembler  → gathers Places facts
NeighborhoodScoreEngine     → pure Dart, no I/O
TemplateSummaryBuilder      → string templates
NeighborhoodSummaryPort     → interface (template impl now; AI later)
```

Unit-test `NeighborhoodScoreEngine` heavily in M11.

---

## Future AI swap

When approved later:

1. Implement `GeminiNeighborhoodSummary` (or Groq) behind `NeighborhoodSummaryPort`.
2. Pass **only** `NeighborhoodFacts` + scores (never ask model to invent crime stats).
3. Feature-flag remotely.
