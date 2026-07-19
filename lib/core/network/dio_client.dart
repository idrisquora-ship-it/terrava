import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/env.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final host = options.uri.host;
        if (host.contains('api.mapbox.com')) {
          options.queryParameters.putIfAbsent(
            'access_token',
            () => Env.mapboxAccessToken,
          );
        }
        // Legacy v3 + current Places API hosts.
        if (host.contains('foursquare.com')) {
          final key = Env.foursquareApiKey;
          // New Places API expects Bearer; legacy v3 accepted the raw key.
          options.headers['Authorization'] =
              key.startsWith('Bearer ') ? key : 'Bearer $key';
          options.headers.putIfAbsent('Accept', () => 'application/json');
          options.headers.putIfAbsent(
            'X-Places-Api-Version',
            () => '2025-06-17',
          );
        }
        handler.next(options);
      },
    ),
  );

  return dio;
});
