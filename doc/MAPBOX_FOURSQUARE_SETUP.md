# Mapbox + Foursquare setup

Terrava no longer uses Google Maps Platform for location. Stack:

| Feature | Provider |
|---|---|
| Map tiles | Mapbox (via `flutter_map`) |
| Search / geocode / reverse | Mapbox Geocoding API |
| Directions | Mapbox Directions API |
| Nearby categories + place details | Foursquare Places API |
| Device GPS | Geolocator (unchanged) |
| Google Sign-In | Still Google OAuth (auth only) |

## 1. Mapbox

1. Create an account at [mapbox.com](https://account.mapbox.com/).
2. Create a **public** token (`pk.…`).
3. Restrict it:
   - **URL** (web): your Vercel domain + `http://localhost:*`
   - Optional download restrictions for mobile if offered
4. Enable / allow: Styles, Geocoding, Directions.
5. Put in `.env`:

```env
MAPBOX_ACCESS_TOKEN=pk.your_token_here
```

## 2. Foursquare Places (required for categories / nearby)

I cannot generate this key for you — it must come from your Foursquare developer account.

1. Sign up / log in: [foursquare.com/developers/signup](https://foursquare.com/developers/signup)
2. [Create a project](https://docs.foursquare.com/developer/docs/create-a-new-project)
3. Project **Settings** → **Service API Keys** → **Generate Service API Key**  
   ([manage keys guide](https://docs.foursquare.com/developer/docs/manage-service-api-keys))
4. Copy the key **once** (you won’t see it again) into `.env`:

```env
FOURSQUARE_API_KEY=paste_the_service_api_key_here
```

Terrava calls the **current** Places host (`https://places-api.foursquare.com`) with:

- `Authorization: Bearer <FOURSQUARE_API_KEY>`
- `X-Places-Api-Version: 2025-06-17`
- Category filter query param: `fsq_category_ids` (not the legacy `categories`)

### Web / Vercel (required)

Browsers cannot call Foursquare directly (CORS preflight fails → DioException / XMLHttpRequest). Deployed web uses the serverless proxy at `/api/fsq/*`.

1. In **Vercel → Project → Settings → Environment Variables**, add:
   - `FOURSQUARE_API_KEY` = same service key as `.env`
2. Redeploy after adding the variable.
3. Optional client overrides in `.env`:
   - `APP_WEB_URL=https://your-app.vercel.app` (Android fallback proxy)
   - `FOURSQUARE_PROXY_BASE=https://your-app.vercel.app/api/fsq`

Proxy URL shape (single Vercel function — multi-segment `/api/fsq/places/search` returns 404):

```
GET /api/fsq?path=places/search&ll=6.52,3.38&radius=4000&limit=20
```

Free allowance is limited (hundreds of Pro calls/month); enough to develop. Enable billing in the Foursquare console if you need more.

**Without this key:** Mapbox still draws the map and can search areas/cities, but Home “Nearby”, category map (Restaurants, Markets, …), and place details that load POIs will fail until the key is set.

**Do not** put a Mapbox **secret** token (`sk.…`) in `.env` or `public/assets/.env` — only the public `pk.…` token belongs in the Flutter client.



## 3. Rebuild

```powershell
$env:Path = "C:\Users\DELL\flutter\bin;$env:Path"
flutter pub get
flutter build apk --release
.\tool\prepare_web.ps1
flutter build web --release --base-href=/
Remove-Item -Recurse -Force public -ErrorAction SilentlyContinue
New-Item -ItemType Directory public | Out-Null
Copy-Item build\web\* public\ -Recurse -Force
```

## Saved places note

Older saves that used **Google `place_id`** will not open on Foursquare. New saves use `fsq_…` ids.
