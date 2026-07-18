# Terrava website (Vercel)

This repo serves the **Flutter Web** build of Terrava.

## Deploy on Vercel

1. Import [idrisquora-ship-it/terrava](https://github.com/idrisquora-ship-it/terrava) in [Vercel](https://vercel.com/new).
2. Framework preset: **Other**
3. Output directory: `public` (already set in `vercel.json`)
4. Build command: leave empty (prebuilt static site)
5. Deploy

### After deploy — Google Cloud

1. Create/use a **browser-restricted** Maps API key (`GOOGLE_MAPS_WEB_API_KEY`).
2. Add your Vercel domain to HTTP referrers, e.g. `https://your-app.vercel.app/*`
3. Enable Billing + Places / Geocoding / Maps JavaScript API.
4. Google OAuth Web client → Authorized JavaScript origins: `https://your-app.vercel.app`
5. Supabase → Authentication → URL Configuration: add `https://your-app.vercel.app/**`

## Local rebuild (developers)

From the Flutter project root:

```powershell
$env:Path = "C:\Users\DELL\flutter\bin;$env:Path"
.\tool\prepare_web.ps1
flutter build web --release --base-href=/
Remove-Item -Recurse -Force public -ErrorAction SilentlyContinue
Copy-Item -Path build\web\* -Destination public -Recurse -Force
```

Then commit and push `public/` to update the live site.
