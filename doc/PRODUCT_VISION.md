# Terrava — Product Vision & Scope

## Mission

Help anyone understand any neighborhood before visiting, moving, or living there.

Terrava is **not** a Google Maps clone. It is a premium neighborhood discovery, relocation-planning, and local-exploration app.

## Questions the product must answer

- What is around this location?
- Is this neighborhood good for living?
- Where are the nearest supermarkets, hospitals, restaurants, hotels, banks/ATMs, schools, pharmacies?
- Is there public transportation?
- What essential services are available?

## Brand & feel

| Principle | Meaning |
|-----------|---------|
| Premium / minimal | Lots of whitespace, large cards, calm hierarchy |
| Unique identity | Mix of Airbnb · Notion · Apple Maps · Uber — **not** Google Maps UI |
| Global | Works for any place in the world |
| Smooth | Subtle animations, skeletons, fast transitions |
| Accessible | Large touch targets, readable type, light + dark |

## User flow (MVP)

```
Splash → Onboarding → Authentication → Home
  → Search → Location Details → Place Details
  → Directions → Saved → Profile / Settings
```

## In scope for MVP

- Email + Google auth (Apple prepared in architecture)
- Home discovery (categories, nearby, popular, recent)
- Search (places, areas, coordinates, autocomplete)
- Custom map experience
- Location (neighborhood) details
- Place details
- Directions
- Save places / neighborhoods / collections
- Profile + settings (theme, language, units)
- Weather + exchange rate context
- **Logic-based** neighborhood / livability proxies (no LLM)

## Explicitly out of MVP (architect only)

AI neighborhood summary · AI relocation/trip assistants · full safety/crime scores without data · property listings · business claim · events · community Q&A · offline vector maps · subscriptions UI (schema ready only)

See [FUTURE_FEATURES.md](./FUTURE_FEATURES.md).

## Success criteria

- Production-ready modular Flutter codebase
- Feature-first clean architecture
- Secrets never hardcoded; Supabase RLS enabled
- Easy to extend for 3–5 years of features
