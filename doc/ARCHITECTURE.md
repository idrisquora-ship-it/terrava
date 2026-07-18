# Terrava — Architecture

## Principles

- Feature-first clean architecture
- SOLID
- No business logic in widgets
- Repositories own data sources; services own external APIs
- Controllers / notifiers own UI state (Riverpod)
- Future features plug in via interfaces (ports), not rewrites

## Top-level structure

```
lib/
  main.dart
  app.dart
  core/
    config/          # env, flavors
    theme/           # tokens, ThemeData
    router/          # GoRouter
    network/         # Dio, interceptors
    error/           # failures, exceptions
    utils/           # extensions, validators
    constants/
  shared/
    widgets/         # truly cross-feature UI
    models/
    services/        # e.g. location, share
    providers/
  features/
    auth/
    onboarding/
    home/
    search/
    map/
    location_details/
    place_details/
    directions/
    favorites/
    profile/
    settings/
    scoring/         # logic-first neighborhood engine
```

## Per-feature structure

Every feature must contain (as needed):

```
features/<feature>/
  presentation/      # screens / pages
  widgets/           # feature-specific UI
  controllers/       # Riverpod Notifiers / Controllers
  providers/         # provider declarations
  repositories/      # abstract + impl
  services/          # API adapters for this feature
  models/            # entities + DTOs
```

## Layer rules

| Layer | May depend on | Must not |
|-------|---------------|----------|
| Widgets / presentation | Controllers (via ref), models for display | Dio, Supabase, raw API keys |
| Controllers | Repositories, use-cases | BuildContext-heavy logic, widget trees |
| Repositories | Services, local DB | Flutter UI |
| Services | Dio / Supabase / plugins | Riverpod UI state |

## State management

- **Riverpod** for all app state
- Prefer `AsyncNotifier` / `Notifier` per feature
- Keep providers close to feature; export only public ones

## Navigation

- **GoRouter** with typed routes (or centralized path constants)
- Redirects:
  - no session → auth
  - session + not onboarded → onboarding (if flag used)
  - session → home

## Config & secrets

```
.env                  # never commit real secrets
core/config/env.dart  # reads keys
```

Keys expected (see [API_INTEGRATIONS.md](./API_INTEGRATIONS.md)):

- `SUPABASE_URL`, `SUPABASE_ANON_KEY`
- `GOOGLE_MAPS_API_KEY`
- `WEATHER_API_KEY`
- `EXCHANGE_RATE_API_KEY`

## Future AI (port only)

```dart
abstract class NeighborhoodSummaryPort {
  Future<String> summarize(NeighborhoodFacts facts);
}

class TemplateNeighborhoodSummary implements NeighborhoodSummaryPort { ... }
// later: GeminiNeighborhoodSummary implements NeighborhoodSummaryPort
```

MVP ships **only** the template/logic implementation.

## Testing strategy (progressive)

- M0–M2: widget/smoke + auth repository mocks
- M3+: repository unit tests for parsing
- M11: pure unit tests for scoring math (high value)
