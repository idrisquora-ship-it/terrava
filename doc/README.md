# Terrava — Documentation Index

**Product:** Neighborhood Discovery Platform  
**Stack:** Flutter · Riverpod · GoRouter · Dio · Google Maps/Places · Supabase  
**MVP scoring:** Logic-first (no LLM). AI summaries are future-only.

---

## How to use this plan

1. Read [PRODUCT_VISION.md](./PRODUCT_VISION.md) for scope and non-goals.
2. Follow [IMPLEMENTATION_PLAN.md](./IMPLEMENTATION_PLAN.md) **milestone by milestone**.
3. **Do not start the next milestone until the current one is approved.**
4. Use supporting docs while building:

| Document | Purpose |
|----------|---------|
| [IMPLEMENTATION_PLAN.md](./IMPLEMENTATION_PLAN.md) | Step-by-step milestones (screens, APIs, DB, deps, widgets) |
| [ARCHITECTURE.md](./ARCHITECTURE.md) | Feature-first clean architecture, folders, SOLID |
| [DATABASE.md](./DATABASE.md) | Supabase / PostGIS schema + RLS |
| [LOGIC_SCORING.md](./LOGIC_SCORING.md) | Neighborhood scores without AI |
| [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md) | UI identity, spacing, theming |
| [API_INTEGRATIONS.md](./API_INTEGRATIONS.md) | External APIs, env keys, service boundaries |
| [FUTURE_FEATURES.md](./FUTURE_FEATURES.md) | Planned but not MVP |
| [ENV_SETUP.md](./ENV_SETUP.md) | `.env` example and key rules |
| [ANDROID_FIREBASE_BUILD.md](./ANDROID_FIREBASE_BUILD.md) | Package name, APK/AAB (Flutter), Firebase |
| [AUTH_SETUP.md](./AUTH_SETUP.md) | Email/Google auth + SHA-1 + Maps restrictions |

---

## Current status

| Milestone | Name | Status |
|-----------|------|--------|
| M0 | Foundation & project bootstrap | Done |
| M1 | Design system & shell navigation | Done |
| M2 | Authentication & profile | Done |
| M3 | Home & discovery feed | Done |
| M4 | Search | Done |
| M5 | Maps core | Done |
| M6 | Location (neighborhood) details | Done |
| M7 | Place details | Done |
| M8 | Directions | Done |
| M9 | Favorites & collections | Done |
| M10 | Settings & preferences | Done |
| M11 | Logic scores & context APIs | Done |
| M12 | Performance, offline cache, polish | Done |
| M13 | Security hardening & release prep | Done (RLS + advisors; store release signing later) |

---

## Working rule

> Analyze → implement one milestone → demo/review → **approve** → next milestone.

Never build “everything at once.”
