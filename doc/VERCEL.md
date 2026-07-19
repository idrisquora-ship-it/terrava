# Terrava website (Vercel)

Prebuilt Flutter Web output lives in `public/`.

## Deploy

1. Import the GitHub repo in [Vercel](https://vercel.com/new).
2. Framework: **Other**
3. Output directory: `public`
4. Build command: empty
5. Deploy

## After deploy

1. Mapbox token URL restrictions: `https://your-app.vercel.app/*`
2. Google OAuth JS origins: `https://your-app.vercel.app`
3. Supabase redirects: `https://your-app.vercel.app/**`
4. Confirm `MAPBOX_ACCESS_TOKEN` + `FOURSQUARE_API_KEY` were present when `public/` was built (they ship inside Flutter assets)

See [MAPBOX_FOURSQUARE_SETUP.md](MAPBOX_FOURSQUARE_SETUP.md).

## Android APK download

Release APK is copied to `public/downloads/terrava.apk` and offered on web after each sign-in.

```powershell
$env:Path = "C:\Users\DELL\flutter\bin;$env:Path"
flutter build apk --release
New-Item -ItemType Directory -Force -Path public\downloads | Out-Null
Copy-Item build\app\outputs\flutter-apk\app-release.apk public\downloads\terrava.apk -Force
```

Then rebuild web into `public/` (prepare_web + `flutter build web` + copy) and push.
