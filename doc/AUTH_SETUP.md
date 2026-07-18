# Auth & Supabase setup (required for Google / Email)

Project: `https://ghwokfnrimqpvuiuzaly.supabase.co`  
Android package: `com.terrava.terrava`  
Debug SHA-1: `01:FB:52:8E:2B:C9:FC:7A:34:23:BA:47:93:92:46:50:E9:87:F7:56`

Terrava Google Sign-In uses **native ID tokens** (`signInWithIdToken`).  
The Android OAuth client ID stays in Google Cloud only — never paste it into `.env` or Supabase.

---

## Where each ID goes

| Credential | Put it here |
|------------|-------------|
| **Web** OAuth client ID | `.env` → `GOOGLE_OAUTH_CLIENT_ID` **and** Supabase Google provider Client ID |
| **Web** OAuth client secret | Supabase Google provider only (never in the app) |
| **Android** OAuth client ID | Nowhere — Google matches package + SHA-1 automatically |
| Maps API key | `.env` → `GOOGLE_MAPS_API_KEY` |

The Android build also injects the Web client ID as `default_web_client_id` so Google Sign-In works even when `google-services.json` has an empty `oauth_client` list.

---

## 1) Email (Supabase)

1. Authentication → Providers → Email → Enable  
2. Disable **Confirm email** for APK testing  
3. Save

---

## 2) Google (Google Cloud + Supabase)

1. Create **Web** OAuth client → use its ID in `.env` + Supabase  
2. Create **Android** OAuth client: package `com.terrava.terrava` + debug SHA-1 above  
3. Supabase → Google provider ON with Web ID + Web secret  
4. Google Web client Authorized redirect URI:

```text
https://ghwokfnrimqpvuiuzaly.supabase.co/auth/v1/callback
```

Optional but recommended: Firebase Console → Project settings → Your Android app → add the same debug SHA-1, then re-download `google-services.json` if you want Firebase to list OAuth clients too.

---

## 3) Supabase URL Configuration

Authentication → URL Configuration

**Site URL**
```text
https://ghwokfnrimqpvuiuzaly.supabase.co
```

**Additional Redirect URLs**
```text
com.terrava.terrava://login-callback/
com.terrava.terrava://login-callback/**
https://ghwokfnrimqpvuiuzaly.supabase.co/**
```

---

## 4) Maps key restriction

- Application restriction: Android apps  
- Package: `com.terrava.terrava`  
- SHA-1: debug fingerprint above  
- APIs: Maps SDK Android, Places, Geocoding, Directions, Time Zone

---

## Quick test

```powershell
$env:PATH = "$env:USERPROFILE\flutter\bin;$env:PATH"
cd c:\Users\DELL\Desktop\terrava
flutter run
# or
flutter build apk --release
```

If Google Sign-In shows **code 10**, the Android OAuth client SHA-1/package or Web client ID in `.env` is wrong.

## Build APK

```powershell
$env:PATH = "$env:USERPROFILE\flutter\bin;$env:PATH"
cd c:\Users\DELL\Desktop\terrava
flutter build apk --release
```
