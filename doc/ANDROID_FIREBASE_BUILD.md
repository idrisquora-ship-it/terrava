# Android / Firebase / Build (Flutter — not Expo)

## Important: Expo cannot build this app

Terrava is a **Flutter** project. Expo only builds React Native / Expo apps.

| Goal | Tool |
|------|------|
| Run on device/emulator | `flutter run` |
| Debug APK | `flutter build apk --debug` |
| Release APK | `flutter build apk --release` |
| Play Store AAB | `flutter build appbundle --release` |
| iOS IPA | `flutter build ipa` (macOS + Xcode) |

---

## App identity (use these in Firebase / Google Cloud)

| Field | Value |
|-------|--------|
| **Android applicationId (package name)** | `com.terrava.terrava` |
| **Android namespace** | `com.terrava.terrava` |
| **iOS bundle ID** | `com.terrava.terrava` |
| **Display name** | Terrava |
| **Supabase project URL** | `https://ghwokfnrimqpvuiuzaly.supabase.co` |

### Firebase Console steps (FCM)

1. Open [Firebase Console](https://console.firebase.google.com/) → Add project (or use existing).
2. Add an **Android** app.
3. Enter package name exactly: **`com.terrava.terrava`**
4. Download `google-services.json`.
5. Place it at:

```text
android/app/google-services.json
```

6. (Later, when enabling FCM in code) add the Google Services Gradle plugin — see `FIREBASE_SETUP.md`.
7. Add your **debug SHA-1** (and later release SHA-1) in Firebase for Google Sign-In / App Check.

Get debug SHA-1:

```powershell
cd android
.\gradlew signingReport
```

Or:

```powershell
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```

---

## Build APK / AAB with Flutter

```powershell
$env:PATH = "$env:USERPROFILE\flutter\bin;$env:PATH"
cd c:\Users\DELL\Desktop\terrava

# Install deps
flutter pub get

# APK (sideload / testing)
flutter build apk --release

# AAB (Google Play)
flutter build appbundle --release
```

Outputs:

- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AAB: `build/app/outputs/bundle/release/app-release.aab`

Before Play Store release, create a real upload keystore (do not ship with debug signing).

---

## Permissions already declared

- Internet / network state  
- Fine + coarse location (needed from M3)  
- Post notifications (FCM, Android 13+)
