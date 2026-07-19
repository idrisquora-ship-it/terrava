# Injects Google Sign-In client id into web/index.html from .env.
# Map tiles come from Mapbox at runtime (flutter_map) — no Maps JS script needed.
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

$oauthId = Read-EnvValue 'GOOGLE_OAUTH_CLIENT_ID'
$mapbox = Read-EnvValue 'MAPBOX_ACCESS_TOKEN'
if ([string]::IsNullOrWhiteSpace($mapbox)) {
  $mapbox = Read-EnvValue 'MAPBOX_PUBLIC_TOKEN'
}
$fsq = Read-EnvValue 'FOURSQUARE_API_KEY'

if ([string]::IsNullOrWhiteSpace($oauthId) -or $oauthId.StartsWith('YOUR_')) {
  Write-Warning 'GOOGLE_OAUTH_CLIENT_ID missing/placeholder - Google Sign-In will fail on web.'
}
if ([string]::IsNullOrWhiteSpace($mapbox) -or $mapbox.StartsWith('pk.YOUR_') -or -not $mapbox.StartsWith('pk.')) {
  Write-Warning 'MAPBOX_ACCESS_TOKEN / MAPBOX_PUBLIC_TOKEN missing/placeholder - maps will not load.'
}
if ([string]::IsNullOrWhiteSpace($fsq) -or $fsq.StartsWith('YOUR_')) {
  Write-Warning 'FOURSQUARE_API_KEY missing/placeholder - nearby places will fail.'
}

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

  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="apple-mobile-web-app-title" content="Terrava">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <link rel="icon" type="image/png" href="favicon.png"/>
  <title>Terrava</title>
  <link rel="manifest" href="manifest.json">

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
Write-Host 'Prepared web/index.html from .env (Mapbox tiles load at runtime)'
