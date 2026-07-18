# Injects Maps + Google Sign-In values from .env into web/index.html
# so the website uses the same secrets source as the Flutter app.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$envFile = Join-Path $root '.env'
$indexPath = Join-Path $root 'web\index.html'

function Read-EnvValue([string]$key) {
  if (-not (Test-Path $envFile)) { return '' }
  $line = Get-Content $envFile | Where-Object {
    $_ -match "^\s*$([regex]::Escape($key))\s*="
  } | Select-Object -First 1
  if (-not $line) { return '' }
  return ($line -split '=', 2)[1].Trim().Trim('"').Trim("'")
}

$mapsKey = Read-EnvValue 'GOOGLE_MAPS_WEB_API_KEY'
if ([string]::IsNullOrWhiteSpace($mapsKey)) {
  $mapsKey = Read-EnvValue 'GOOGLE_MAPS_API_KEY'
}
$oauthId = Read-EnvValue 'GOOGLE_OAUTH_CLIENT_ID'

if ([string]::IsNullOrWhiteSpace($mapsKey) -or $mapsKey.StartsWith('YOUR_')) {
  Write-Warning 'GOOGLE_MAPS_API_KEY missing/placeholder - Maps will not load on web.'
}
if ([string]::IsNullOrWhiteSpace($oauthId) -or $oauthId.StartsWith('YOUR_')) {
  Write-Warning 'GOOGLE_OAUTH_CLIENT_ID missing/placeholder - Google Sign-In will fail on web.'
}

# ASCII-only template so Windows PowerShell encoding cannot corrupt the file.
$html = @"
<!DOCTYPE html>
<html>
<head>
  <base href="`$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="Terrava - explore neighborhoods, scores, and places.">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="theme-color" content="#1B3A2F">

  <!-- Google Sign-In (Web client ID from .env) -->
  <meta name="google-signin-client_id" content="$oauthId">

  <!-- iOS / PWA -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="apple-mobile-web-app-title" content="Terrava">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <link rel="icon" type="image/png" href="favicon.png"/>
  <title>Terrava</title>
  <link rel="manifest" href="manifest.json">

  <!-- Google Maps JavaScript API (required by google_maps_flutter_web) -->
  <script src="https://maps.googleapis.com/maps/api/js?key=$mapsKey"></script>

  <style>
    html, body {
      height: 100%;
      width: 100%;
      margin: 0;
      padding: 0;
      background: #0C1411;
      overflow: hidden;
    }
    #loading {
      position: fixed;
      inset: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #B7D0C2;
      font-family: system-ui, sans-serif;
      letter-spacing: 0.08em;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div id="loading">Loading Terrava...</div>
  <script src="flutter_bootstrap.js" async></script>
  <script>
    window.addEventListener('flutter-first-frame', function () {
      var el = document.getElementById('loading');
      if (el) el.remove();
    });
  </script>
</body>
</html>
"@

[System.IO.File]::WriteAllText($indexPath, $html.Replace("`r`n", "`n"))
Write-Host 'Prepared web/index.html from .env'
