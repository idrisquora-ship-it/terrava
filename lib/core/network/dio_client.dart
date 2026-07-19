import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/env.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      // Avoid setting Content-Type on GETs — it forces CORS preflights on web.
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final uri = options.uri;
        final host = uri.host;
        final path = uri.path;
        if (host.contains('api.mapbox.com')) {
          options.queryParameters.putIfAbsent(
            'access_token',
            () => Env.mapboxAccessToken,
          );
        }
        // Direct Foursquare host only. Same-origin `/api/fsq/*` proxy adds auth
        // server-side so the browser key is not required for web requests.
        final isDirectFoursquare = host.contains('foursquare.com');
        final isLocalFsqProxy = path.startsWith('/api/fsq/');
        if (isDirectFoursquare) {
          final key = Env.foursquareApiKey;
          options.headers['Authorization'] =
              key.startsWith('Bearer ') ? key : 'Bearer $key';
          options.headers.putIfAbsent('Accept', () => 'application/json');
          options.headers.putIfAbsent(
            'X-Places-Api-Version',
            () => '2025-06-17',
          );
        } else if (isLocalFsqProxy) {
          // Proxy injects auth; keep browser request “simple” for CORS.
          options.headers.remove('Authorization');
          options.headers.remove('X-Places-Api-Version');
        }
        handler.next(options);
      },
    ),
  );

  return dio;
});
