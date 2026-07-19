# Terrava

Neighborhood discovery — Flutter app + website (same codebase).

## Website (Vercel)

Prebuilt site is in `public/`. Import this repo in Vercel; output directory is already `public`.

See [doc/VERCEL.md](doc/VERCEL.md).

## App (Android)

```powershell
$env:Path = "C:\Users\DELL\flutter\bin;$env:Path"
flutter pub get
flutter build apk --release
```

## Rebuild website after code changes

```powershell
.\tool\prepare_web.ps1
flutter build web --release --base-href=/
Remove-Item -Recurse -Force public -ErrorAction SilentlyContinue
New-Item -ItemType Directory public | Out-Null
Copy-Item build\web\* public\ -Recurse -Force
git add public
git commit -m "Update website build"
git push
```

## Docs

- `doc/MAPBOX_FOURSQUARE_SETUP.md` — Mapbox maps + Foursquare places
- `doc/WEB_SETUP.md` — Flutter web
- `doc/VERCEL.md` — Vercel deploy
- `doc/AUTH_SETUP.md` — Auth
- `.env.example` — env template (never commit `.env`)
