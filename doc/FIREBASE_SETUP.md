# Firebase FCM setup (Flutter)

Package / bundle:

```text
com.terrava.terrava
```

Debug SHA-1 (add in Firebase Project settings → Your apps):

```text
01:FB:52:8E:2B:C9:FC:7A:34:23:BA:47:93:92:46:50:E9:87:F7:56
```

## Files

| File | Path |
|------|------|
| Android config | `android/app/google-services.json` |
| iOS config | `ios/Runner/GoogleService-Info.plist` |
| Admin SDK (server only) | `secrets/firebase-admin-sdk.json` (gitignored) |

## What the app does

- Requests notification permission on sign-in (when push is enabled)
- Saves `profiles.fcm_token` and clears it on logout / push off
- Shows notifications in foreground via `flutter_local_notifications`
- Opens routes from payload (`type`: `place`, `location`, `saved`, `home`, …)
- Local alerts when you save a place / neighborhood
- Welcome push via Edge Function `send-push` (falls back to local if secret missing)

## Required: Edge Function secret

The `send-push` function needs your Firebase Admin JSON as a Supabase secret.

Dashboard → **Project Settings → Edge Functions → Secrets**, or CLI:

```powershell
$env:PATH = "$env:USERPROFILE\flutter\bin;$env:PATH"
cd c:\Users\DELL\Desktop\terrava
npx supabase login
npx supabase secrets set FIREBASE_SERVICE_ACCOUNT_JSON="$(Get-Content -Raw .\secrets\firebase-admin-sdk.json)" --project-ref ghwokfnrimqpvuiuzaly
```

Do **not** put the Admin SDK JSON in the mobile app or `.env`.

## Test from Firebase Console

1. Run the app signed in with push enabled  
2. Firebase Console → Messaging → Create campaign → Firebase Notification messages  
3. Send a test message to the device FCM token (or topic later)

Or call the function while signed in:

```http
POST /functions/v1/send-push
Authorization: Bearer <user_access_token>
{ "type": "welcome", "title": "Hello", "body": "Test from Terrava" }
```

## Notification payload deep links

| `data.type` | Opens |
|-------------|--------|
| `place` + `place_id` | Place details |
| `location` + `lat`/`lng` | Location details |
| `saved` | Saved tab |
| `settings` | Settings |
| `home` / `explore` / `search` | Matching screen |
| `path` | Any app path starting with `/` |
