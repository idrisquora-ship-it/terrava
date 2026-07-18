# Terrava website (Flutter Web)

Terrava is **one Flutter codebase** for Android and the website. Every feature change you ship in `lib/` automatically applies to both targets — there is no separate web app to keep in sync.

## Quick start (local)

```powershell
# 1. Inject Maps + Google Sign-In keys into web/index.html from .env
.\tool\prepare_web.ps1

# 2. Run in Chrome
flutter run -d chrome
```

## Production build

```powershell
.\tool\prepare_web.ps1
flutter build web --release
```

Output: `build/web/` — upload that folder to any static host (Firebase Hosting, Netlify, Vercel, Cloudflare Pages, S3+CloudFront, nginx, etc.).

SPA note: configure the host to rewrite unknown paths to `index.html` so GoRouter deep links work.

### Firebase Hosting example

```bash
firebase init hosting   # public directory: build/web
firebase deploy --only hosting
```

`firebase.json` rewrite:

```json
{
  "hosting": {
    "public": "build/web",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [{ "source": "**", "destination": "/index.html" }]
  }
}
```

## Google Cloud / Supabase checklist

### 1. Maps API key (required)

Android-restricted keys **do not** work from the browser.

1. In Google Cloud → Credentials, create (or duplicate) a key for web.
2. Application restriction: **HTTP referrers**
   - `http://localhost:*/*` (local)
   - `https://your-domain.com/*`
3. API restrictions: enable Maps JavaScript API, Places API, Geocoding API, Directions API.
4. Put it in `.env` as either:
   - `GOOGLE_MAPS_WEB_API_KEY=...` (preferred — keeps Android key separate), or
   - reuse `GOOGLE_MAPS_API_KEY` only if that key allows HTTP referrers.

Then re-run `.\tool\prepare_web.ps1` before building.

### 2. Google Sign-In

Use the **same Web OAuth client ID** already in `GOOGLE_OAUTH_CLIENT_ID`.

1. Google Cloud → OAuth client (Web) → Authorized JavaScript origins:
   - `http://localhost:XXXX` (Flutter picks a port; also add `http://localhost`)
   - `https://your-domain.com`
2. Authorized redirect URIs (if prompted by GIS):
   - `https://your-domain.com`
   - `http://localhost`
3. Supabase → Authentication → Providers → Google: same Web client ID + secret.
4. Supabase → URL Configuration:
   - Site URL: `https://your-domain.com`
   - Additional Redirect URLs: `https://your-domain.com/**`, `http://localhost/**`, plus the mobile deep link `com.terrava.terrava://login-callback/`

Optional `.env`:

```env
WEB_AUTH_REDIRECT_URL=https://your-domain.com/
```

If unset, the website uses the current browser origin.

### 3. What works on web today

| Feature | Status |
|---|---|
| Email auth, Google Sign-In | Yes |
| Search, Places, geocoding | Yes (with web Maps key) |
| Explore / category maps | Yes |
| Save places & neighborhoods | Yes |
| Language & currency | Yes |
| Profile / avatar upload | Yes |
| Location (browser prompt) | Yes |
| Push notifications (FCM) | Not yet — needs `flutterfire configure` + service worker |
| Voice search | Browser-dependent; keep `ENABLE_VOICE_SEARCH=false` if noisy |

## Keeping app + website in sync

There is nothing extra to do:

1. Change code once in `lib/`.
2. Ship Android: `flutter build apk` / App Bundle.
3. Ship web: `.\tool\prepare_web.ps1` then `flutter build web --release`.

Same Supabase project, same feature flags, same screens.
