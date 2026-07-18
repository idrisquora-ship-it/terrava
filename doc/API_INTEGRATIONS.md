# Terrava — API Integrations

All API I/O lives in **Services**. Widgets never call Dio/Google/Supabase directly.

## Environment variables

| Key | Used for |
|-----|----------|
| `SUPABASE_URL` | Backend |
| `SUPABASE_ANON_KEY` | Client auth/data (RLS-protected) |
| `GOOGLE_MAPS_API_KEY` | Maps SDK + Places/Geocoding/Directions/Timezone (restrict by app + APIs) |
| `WEATHER_API_KEY` | WeatherAPI |
| `EXCHANGE_RATE_API_KEY` | ExchangeRate API |

Never hardcode secrets. Never commit `.env` with production values.

## Google

| API | Milestone | Service responsibility |
|-----|-----------|------------------------|
| Maps SDK Flutter | M5 | Render map, markers, polylines |
| Places | M3–M7 | Autocomplete, nearby, details, photos |
| Geocoding | M3–M6 | Forward/reverse geocode, coordinates |
| Directions | M8 | Routes, legs, traffic duration when available |
| Timezone | M8/M11 | Local time for location |

**Key restriction:** Android package + SHA-1; iOS bundle id; limit APIs.

## Supabase

| Capability | Milestone |
|------------|-----------|
| Auth email / Google | M2 |
| Apple (prep) | M2 |
| Postgres + RLS | M2+ |
| Storage avatars | M10 |
| Realtime (optional) | later for collaborative features |
| Edge Functions | M13 (account delete, privileged ops) |

## WeatherAPI

- M11: current weather for Location Details
- Cache 15–30 minutes per geohash

## ExchangeRate API

- M11: convert / display rates vs user preference currency
- Cache daily

## Device / platform

| Plugin | Milestone |
|--------|-----------|
| geolocator + permission_handler | M3 |
| url_launcher | M7 |
| share_plus | M6 |
| image_picker | M10 |
| google_sign_in | M2 |
| speech_to_text | Stub only M4 |

## Service folder convention

```
features/<feature>/services/<name>_service.dart
core/network/dio_client.dart
```

Shared Google clients may live in `core/network/google/` and be injected into feature repositories.

## Error handling

Map network errors → domain `Failure` types → user-friendly messages in controllers.  
Retry only idempotent GETs.
