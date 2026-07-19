# Terrava — API Integrations

All API I/O lives in **Services**. Widgets never call Dio/Google/Supabase directly.

## Environment variables

| Key | Used for |
|-----|----------|
| `SUPABASE_URL` | Backend |
| `SUPABASE_ANON_KEY` | Client auth/data (RLS-protected) |
| `MAPBOX_ACCESS_TOKEN` | Map tiles, geocoding, directions |
| `FOURSQUARE_API_KEY` | Nearby places + place details |
| `GOOGLE_OAUTH_CLIENT_ID` | Google Sign-In only (not Maps) |
| `WEATHER_API_KEY` | WeatherAPI |
| `EXCHANGE_RATE_API_KEY` | ExchangeRate API |

Never hardcode secrets. Never commit `.env` with production values.

## Mapbox + Foursquare

| API | Service responsibility |
|-----|------------------------|
| Mapbox tiles (`flutter_map`) | Map UI on Android + Web |
| Mapbox Geocoding | Autocomplete, forward/reverse geocode |
| Mapbox Directions | Route polylines |
| Foursquare Places | Nearby by category, place details |

See `doc/MAPBOX_FOURSQUARE_SETUP.md`.

## Google (auth only)


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
