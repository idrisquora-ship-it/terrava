/**
 * Same-origin proxy for Foursquare Places API.
 *
 * Browser clients cannot call places-api.foursquare.com directly: the
 * preflight OPTIONS request returns 400, which surfaces in Flutter web as
 * DioException [connection error] / XMLHttpRequest onError.
 *
 * Set FOURSQUARE_API_KEY in the Vercel project environment (same value as .env).
 */

function cors(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'Authorization,Content-Type,Accept,X-Places-Api-Version',
  );
}

module.exports = async function handler(req, res) {
  cors(res);

  if (req.method === 'OPTIONS') {
    res.status(204).end();
    return;
  }

  if (req.method !== 'GET') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  const key = process.env.FOURSQUARE_API_KEY;
  if (!key || key.includes('YOUR_FOURSQUARE')) {
    res.status(500).json({
      error:
        'FOURSQUARE_API_KEY is not configured on the server. Add it in Vercel → Settings → Environment Variables.',
    });
    return;
  }

  const parts = req.query.path;
  const path = Array.isArray(parts) ? parts.join('/') : `${parts || ''}`;
  if (!path) {
    res.status(400).json({ error: 'Missing path' });
    return;
  }

  const upstreamUrl = new URL(`https://places-api.foursquare.com/${path}`);
  for (const [k, v] of Object.entries(req.query)) {
    if (k === 'path') continue;
    if (Array.isArray(v)) {
      for (const item of v) upstreamUrl.searchParams.append(k, String(item));
    } else if (v != null) {
      upstreamUrl.searchParams.set(k, String(v));
    }
  }

  try {
    const upstream = await fetch(upstreamUrl.toString(), {
      method: 'GET',
      headers: {
        Authorization: key.startsWith('Bearer ') ? key : `Bearer ${key}`,
        Accept: 'application/json',
        'X-Places-Api-Version': '2025-06-17',
      },
    });

    const body = await upstream.text();
    res.status(upstream.status);
    res.setHeader(
      'Content-Type',
      upstream.headers.get('content-type') || 'application/json',
    );
    res.send(body);
  } catch (err) {
    res.status(502).json({
      error: 'Upstream Foursquare request failed',
      detail: err instanceof Error ? err.message : String(err),
    });
  }
};
