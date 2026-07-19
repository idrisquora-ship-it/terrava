# Terrava website (Flutter Web)

Terrava is **one Flutter codebase** for Android and the website.

Maps use **Mapbox** tiles (no Google Maps JS script). See [MAPBOX_FOURSQUARE_SETUP.md](MAPBOX_FOURSQUARE_SETUP.md).

## Quick start (local)

```powershell
.\tool\prepare_web.ps1
$env:Path = "C:\Users\DELL\flutter\bin;$env:Path"
flutter run -d chrome
```

## Production build

```powershell
.\tool\prepare_web.ps1
flutter build web --release --base-href=/
```

Copy `build/web` → `public/` for Vercel (see [VERCEL.md](VERCEL.md)).

## Auth checklist (unchanged)

1. Google OAuth Web client → Authorized JavaScript origins for your domain
2. Supabase URL Configuration → Site URL + Additional Redirect URLs
3. Optional: `WEB_AUTH_REDIRECT_URL=https://your-domain.com/`
