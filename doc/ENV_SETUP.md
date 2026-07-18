# Environment setup

Terrava is **Flutter**, not Expo. Use these key names (no `EXPO_PUBLIC_`):

```env
APP_ENV=development
APP_NAME=Terrava

SUPABASE_URL=https://ghwokfnrimqpvuiuzaly.supabase.co
SUPABASE_ANON_KEY=your_anon_or_publishable_key

GOOGLE_MAPS_API_KEY=your_maps_key
GOOGLE_OAUTH_CLIENT_ID=your_oauth_client_id.apps.googleusercontent.com

WEATHER_API_KEY=your_weather_key
EXCHANGE_RATE_API_KEY=your_fx_key

ENABLE_APPLE_SIGN_IN=false
ENABLE_VOICE_SEARCH=false
ENABLE_AI_SUMMARY=false
```

## Rules

- Never commit `.env`
- Never put OAuth **client secrets** in the mobile app
- Android package for key restriction / Firebase: `com.terrava.terrava`
- Copy from `.env.example`

`Env` also accepts legacy `EXPO_PUBLIC_*` aliases if you still have them, but Flutter names are preferred.
