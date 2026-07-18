# Terrava — Full Implementation Plan

Step-by-step roadmap to ship the mobile app.  
**Rule:** Finish and get approval for each milestone before starting the next.

**Decision locked:** Neighborhood insights use **logic + APIs**, not generative AI, in MVP.

---

## Milestone overview

| # | Milestone | Outcome |
|---|-----------|---------|
| M0 | Foundation | Runnable Flutter app + folders + env + Supabase stub |
| M1 | Design system & shell | Theme, routing shell, splash/onboarding shells |
| M2 | Authentication | Email, Google, forgot password, profile bootstrap |
| M3 | Home | Search bar, categories, discovery sections |
| M4 | Search | Autocomplete, recent/popular, coordinate parse |
| M5 | Maps core | Map, location, markers, clustering, styles |
| M6 | Location details | Neighborhood overview + nearby categories |
| M7 | Place details | POI detail actions |
| M8 | Directions | Routes between points |
| M9 | Favorites | Save places/areas, collections, recently viewed |
| M10 | Settings | Theme, language, units, legal, logout |
| M11 | Logic scores & context | Scores, weather, FX (logic-first) |
| M12 | Performance & polish | Cache, pagination, skeletons, a11y |
| M13 | Security & release | RLS audit, store prep, QA |

---

# M0 — Foundation & project bootstrap

### What will be built
- Flutter project (latest stable)
- Feature-first folder structure (`core/`, `shared/`, `features/`)
- Env config (`.env` / `--dart-define` / flutter_dotenv)
- Dio client skeleton
- Riverpod + GoRouter bootstrap
- Supabase client init (no auth UI yet)
- README with run instructions
- `.gitignore` for secrets

### Why
Everything else depends on a clean, scalable base. Wrong structure early = expensive rewrites.

### Screens
- None product-facing (or blank `MaterialApp` smoke screen)

### APIs
- None live yet; clients stubbed

### Database changes
- Create Supabase project
- Enable Email auth provider (config only)
- No tables required yet (or empty migrations folder)

### Dependencies
```
flutter_riverpod
go_router
dio
supabase_flutter
flutter_dotenv
equatable / freezed (optional early)
json_annotation + build_runner (if using codegen)
```

### Reusable widgets
- None yet — shared folder placeholders only

### Exit criteria
- `flutter run` works
- Folder architecture matches [ARCHITECTURE.md](./ARCHITECTURE.md)
- Env loads without committing secrets
- **Stop for approval**

---

# M1 — Design system & app shell

### What will be built
- Light / dark `ThemeData` (Terrava tokens: color, type, radius, spacing)
- Typography (non-default expressive fonts via `google_fonts` or bundled fonts)
- Shared UI primitives: buttons, text fields, app scaffold, section headers
- Loading skeletons base
- Page transition helpers (`flutter_animate` subtle)
- Splash screen
- Onboarding (3–4 value slides → CTA to auth)
- Root shell: bottom nav placeholders (Home, Search/Map, Saved, Profile)
- GoRouter routes + auth redirect stubs

### Why
Visual identity and navigation must exist before feature screens so every screen stays consistent and premium.

### Screens
- Splash
- Onboarding
- AppShell (tabs: Home, Explore/Map, Saved, Profile) — placeholders OK
- Theme preview / component gallery (dev-only optional)

### APIs
- None

### Database changes
- None

### Dependencies
```
google_fonts (or custom fonts)
flutter_animate
cached_network_image (prep)
flutter_svg (if using SVG brand assets)
```

### Reusable widgets
- `TerravaButton`, `TerravaTextField`, `TerravaAppBar`
- `SectionHeader`, `EmptyState`, `ErrorState`
- `SkeletonBox`, `SkeletonCard`
- `TerravaCard` (interaction containers only — avoid decorative card spam)
- `ResponsivePadding` / spacing helpers

### Exit criteria
- Light + dark look correct
- Splash → Onboarding → Shell navigation works
- Spacing/typography tokens documented in [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md)
- **Stop for approval**

---

# M2 — Authentication & profile bootstrap

### What will be built
- Supabase Email sign up / sign in
- Google Sign-In
- Apple Sign-In **architecture** (interfaces + stubs; enable when certificates ready)
- Forgot password / reset flow
- Session restore on cold start
- Auth guards in GoRouter
- Profile row creation on first login
- Basic Profile screen (avatar placeholder, name, email, logout)

### Why
Auth gates personalized features (saved, history, sync). Must be solid before Home personalization.

### Screens
- Sign In
- Sign Up
- Forgot Password
- Reset Password (deep link if configured)
- Profile (basic)

### APIs
- Supabase Auth (email, Google OAuth)
- Secure storage for session (via supabase_flutter)

### Database changes
See [DATABASE.md](./DATABASE.md):
- `profiles`
- RLS: user can read/update own profile
- Trigger: create profile on `auth.users` insert

### Dependencies
```
supabase_flutter
google_sign_in
sign_in_with_apple (wired but feature-flagged)
flutter_secure_storage (if needed beyond supabase)
```

### Reusable widgets
- `AuthScaffold`, `SocialAuthButton`, `PasswordField`
- `ProfileHeader` (minimal)

### Exit criteria
- Email + Google flows work on device/emulator
- Unauthenticated users cannot reach Home
- Profile row exists after signup
- Apple path compiles behind flag
- **Stop for approval**

---

# M3 — Home & discovery feed

### What will be built
- Modern search bar (navigates to Search)
- Current location chip / permission request UX
- Quick categories grid:
  - Restaurants, Hotels, Hospitals, Banks, Pharmacies, Schools, Supermarkets, Markets, Fuel Stations
- Sections:
  - Nearby
  - Popular Places
  - Trending Places (heuristic: high rating + review count proxy)
  - Recently Viewed (local + synced when logged in)
  - Recommended Locations (rule-based: category mix near user)
- Beautiful list/horizontal cards
- Pull-to-refresh + skeleton loading

### Why
Home is the product’s first impression and primary discovery surface.

### Screens
- Home

### APIs
- Google Places (Nearby Search / Place Text)
- Google Geocoding (reverse geocode current location)
- Device location (geolocator / permission_handler)

### Database changes
- `search_history` (optional write from home search taps)
- `recently_viewed` (read for section)

### Dependencies
```
geolocator
permission_handler
google_maps_flutter (client may init later; Places via Dio OK here)
cached_network_image
```

### Reusable widgets
- `SearchBarButton` (opens Search)
- `CategoryChip` / `CategoryGrid`
- `PlaceCardHorizontal`, `PlaceCardLarge`
- `HomeSection` (title + horizontal list)
- `LocationPermissionBanner`

### Exit criteria
- Categories open filtered nearby results (even if temporary list screen)
- Nearby loads with permission granted
- Empty/error/skeleton states polished
- **Stop for approval**

---

# M4 — Search

### What will be built
- Autocomplete (country, state, city, area, street, landmark)
- Coordinate paste/parse (`lat,lng`)
- Recent searches
- Popular searches (curated static list + later remote config)
- Voice search **architecture** (interface + disabled UI affordance)
- Debounced queries via Dio
- Navigate to Location Details or Place Details based on result type

### Why
Search is how users jump to any place on earth — core to “global” positioning.

### Screens
- Search
- Search Results (can be same screen)

### APIs
- Google Places Autocomplete / Details
- Google Geocoding

### Database changes
- `search_history` (insert on submit)
- Optional `popular_searches` table or remote config

### Dependencies
```
dio (Places)
uuid (history ids)
speech_to_text (dependency optional; stub service only)
```

### Reusable widgets
- `SearchField`, `SuggestionTile`, `RecentSearchList`
- `CoordinateHint`, `VoiceSearchButton` (disabled / “coming soon”)

### Exit criteria
- Autocomplete works
- Recent searches persist per user
- Coordinates resolve to a map point / location details
- Voice is stubbed cleanly
- **Stop for approval**

---

# M5 — Maps core

### What will be built
- Full-screen / tab map experience
- Current location puck
- Custom markers (category-styled)
- Marker clustering
- Nearby search on camera idle (debounced)
- Map styles (light/dark JSON matching Terrava theme)
- Smooth camera animations
- Tap marker → Place preview sheet → Place Details

### Why
Map is essential for spatial understanding without copying Google Maps chrome — keep UI Terrava-branded (custom sheets, markers, controls).

### Screens
- Explore / Map tab
- Place preview bottom sheet

### APIs
- Google Maps Flutter
- Google Places Nearby
- Device location

### Database changes
- None required

### Dependencies
```
google_maps_flutter
google_maps_cluster_manager (or equivalent)
```

### Reusable widgets
- `TerravaMap`
- `ClusterMarker`, `CategoryMarker`
- `MapControlButton` (locate me, style toggle)
- `PlacePreviewSheet`

### Exit criteria
- Clustering stable at city zoom
- Dark/light map styles
- Preview sheet feels premium
- **Stop for approval**

---

# M6 — Location (neighborhood) details

### What will be built
- Hero image (Places photo or curated fallback)
- Embedded map snapshot / mini-map
- Description (from Places editorial summary or geocode address context)
- Statistics strip (counts by category within radius — logic)
- Nearby sections: Top Restaurants, Hotels, Hospitals, Schools, Banks, Shopping, Transportation
- Photos carousel
- Reviews (Google where available; Terrava reviews later)
- Actions: Share, Save, Open in Maps, Directions
- Persist recently viewed neighborhood

### Why
This is the signature Terrava screen — “understand this area,” not just a pin.

### Screens
- Location Details
- Category “see all” list (optional sub-route)

### APIs
- Google Places Details + Photos + Nearby
- Google Geocoding
- Share sheet (platform)

### Database changes
- `saved_locations`
- `recently_viewed` (type = location)

### Dependencies
```
share_plus
url_launcher
cached_network_image
```

### Reusable widgets
- `HeroPhotoHeader`
- `StatPillRow` (counts — not cluttered chips overload; keep minimal)
- `NearbyCategorySection`
- `ActionBar` (save/share/directions)
- `PhotoCarousel`, `ReviewList`

### Exit criteria
- Radius-based nearby categories load
- Save + share + directions entry points work
- Screen has **one purpose**: understand the neighborhood
- **Stop for approval**

---

# M7 — Place details

### What will be built
- Large cover image
- Name, category, rating, address
- Phone, website, opening hours
- Photos, reviews
- Actions: Call, Directions, Save, Share
- Opening-hours status (“Open now”)

### Why
POI depth converts discovery into action (call, go, save).

### Screens
- Place Details

### APIs
- Google Places Details / Photos
- `url_launcher` (tel, http)
- Google Directions entry (handoff to M8)

### Database changes
- `saved_places`
- `recently_viewed` (type = place)

### Dependencies
```
url_launcher
share_plus
intl (hours formatting)
```

### Reusable widgets
- `PlaceHeader`, `HoursSchedule`, `ContactRow`
- Reuse `ActionBar`, `PhotoCarousel`, `ReviewList`

### Exit criteria
- Call/website/share/save work when data exists
- Graceful missing-data states
- **Stop for approval**

---

# M8 — Directions

### What will be built
- Origin (current location or chosen place) → destination
- Travel modes: drive / walk / transit (as API allows)
- Polyline on map
- Duration / distance summary
- Step list (basic)
- Open in external maps fallback

### Why
Closes the loop from discovery to “how do I get there?”

### Screens
- Directions

### APIs
- Google Directions
- Google Maps Flutter (polyline)
- Google Timezone (optional ETA local time)

### Database changes
- None required (optional `directions_history` later)

### Dependencies
```
google_* via Dio service
flutter_polyline_points (or decode polyline manually)
```

### Reusable widgets
- `ModeSelector`, `RouteSummaryCard`, `StepTile`
- Reuse `TerravaMap`

### Exit criteria
- Route renders with correct distance/duration
- Mode switching works
- **Stop for approval**

---

# M9 — Favorites, collections, recently viewed

### What will be built
- Save / unsave places
- Save / unsave neighborhoods (locations)
- Collections (create, rename, add/remove)
- Recently viewed list
- Saved tab populated

### Why
Retention and relocation planning require memory across sessions.

### Screens
- Saved (hub)
- Collection Details
- Recently Viewed (section or screen)

### APIs
- Supabase CRUD only (Places data refreshed via Google when opening detail)

### Database changes
- `saved_places`
- `saved_locations`
- `collections`
- `collection_items`
- `recently_viewed`
- RLS for all user-owned rows

### Dependencies
- Existing Supabase stack

### Reusable widgets
- `SavedToggleButton`
- `CollectionCard`, `CollectionPickerSheet`
- `SavedPlaceTile`

### Exit criteria
- Sync across reinstall when logged in
- Offline read of last cached saved list (best-effort; full offline in M12)
- **Stop for approval**

---

# M10 — Profile & settings

### What will be built
- Profile management (display name, avatar upload via Supabase Storage)
- Settings:
  - Dark / Light / System
  - Language (i18n scaffold + EN minimum)
  - Units (km/mi)
  - Notification preferences (local flags; push later)
  - About, Help, Privacy Policy, Terms (WebView or in-app markdown)
- Logout / delete account (delete via Edge Function or Supabase policy)

### Why
Trust, personalization, and store compliance.

### Screens
- Profile (full)
- Settings
- About / Help / Legal viewers
- Edit Profile

### APIs
- Supabase Storage (avatars)
- Supabase Auth update user

### Database changes
- `profiles` columns: `display_name`, `avatar_url`, `locale`, `units`, `theme_mode`, `notification_prefs` (jsonb)
- Storage bucket `avatars` + RLS

### Dependencies
```
image_picker
flutter_localizations / easy_localization (choose one)
webview_flutter (legal pages) OR static assets
```

### Reusable widgets
- `SettingsTile`, `SettingsSection`
- `ThemeModeSelector`, `UnitSelector`
- `AvatarPicker`

### Exit criteria
- Theme persists
- Units affect distance labels app-wide
- Logout clears session and returns to auth
- **Stop for approval**

---

# M11 — Logic scores & context APIs

### What will be built
- Neighborhood score engine (pure Dart logic) — see [LOGIC_SCORING.md](./LOGIC_SCORING.md)
- Category coverage scores (essentials, food, health, transport proxies)
- Weather card on Location Details (WeatherAPI)
- Local currency / FX snippet (ExchangeRate API) when user locale ≠ local country
- Templated neighborhood summary text (no LLM)
- Architecture hooks for future AI summary provider interface

### Why
Differentiates Terrava from a raw Places browser — insight without AI cost/hallucination.

### Screens
- Enhancements on Location Details (scores, weather, FX)
- Optional “How we score” explainer sheet

### APIs
- WeatherAPI
- ExchangeRate API
- Existing Places nearby counts
- Google Timezone (local time display)

### Database changes
- Optional `neighborhood_score_cache` (lat/lng geohash + payload + ttl)
- Future-ready columns only — no AI tables required

### Dependencies
```
dio services for weather + FX
crypto / geohash helper for cache keys
```

### Reusable widgets
- `ScoreRing` / `ScoreBreakdownList`
- `WeatherCard`, `FxRateChip`
- `TemplatedSummaryText`
- `ScoringInfoSheet`

### Exit criteria
- Scores deterministic for same inputs
- Summary is template-based and honest about limitations
- `NeighborhoodAiSummaryPort` interface exists but unused
- **Stop for approval**

---

# M12 — Performance, caching, polish

### What will be built
- Lazy loading + pagination for lists
- Image cache / compression guidelines
- Offline cache for recent details & saved items
- Fast splash / deferred init of heavy SDKs
- Memory-conscious map marker recycling
- Accessibility pass (semantics, contrast, hit targets)
- Motion polish (2–3 intentional animations per key flows)
- Error taxonomy + retry UX

### Why
“Premium” fails if the app feels slow or fragile.

### Screens
- All existing (hardening)

### APIs
- Same; add caching layers in repositories

### Database changes
- None required (local Hive/Isar/SharedPreferences cache)

### Dependencies
```
hive_ce / isar / drift (pick one for local cache)
connectivity_plus
```

### Reusable widgets
- `PagedHorizontalList`
- `OfflineBanner`
- Improved skeletons

### Exit criteria
- Cold start measurable and acceptable
- Airplane-mode: saved + last viewed readable
- **Stop for approval**

---

# M13 — Security hardening & release prep

### What will be built
- RLS audit for every table
- Confirm no secret keys in client (Maps key restricted by package/SHA; Supabase anon only)
- Edge Functions for privileged ops (account delete, etc.)
- Input validation on writes
- Privacy policy / terms URLs live
- Store listings assets, screenshots checklist
- Crash logging (Firebase Crashlytics or Sentry — choose)
- QA checklist sign-off

### Why
Production readiness and user trust.

### Screens
- None new (fix legal/about)

### APIs
- Restricted API keys / App Check if adopted
- Edge Functions

### Database changes
- Final RLS policies
- Indexes for geo queries (PostGIS) if any server-side radius search

### Dependencies
```
sentry_flutter or firebase_crashlytics
```

### Reusable widgets
- None

### Exit criteria
- Security checklist passed
- Internal Test / TestFlight build
- **MVP release candidate**

---

## Cross-cutting checklist (every milestone)

- [ ] No business logic in widgets
- [ ] Logic in services / controllers / use-cases
- [ ] API keys from env only
- [ ] Light + dark verified
- [ ] Loading / empty / error states
- [ ] One purpose per screen
- [ ] Large touch targets
- [ ] Feature folder structure respected

---

## Suggested calendar (flexible)

| Phase | Milestones | Rough focus |
|-------|------------|-------------|
| Week 1–2 | M0–M2 | Foundation + auth |
| Week 3–4 | M3–M5 | Home, search, map |
| Week 5–6 | M6–M8 | Details + directions |
| Week 7 | M9–M10 | Saved + settings |
| Week 8 | M11–M13 | Scores, polish, release |

Adjust to team size; **approval gates stay mandatory**.

---

## What happens after this doc

1. Approve **M0**.
2. Switch to implementation for M0 only.
3. Return here, mark M0 complete in [README.md](./README.md), approve M1.
