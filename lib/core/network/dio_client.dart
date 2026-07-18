import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/env.dart';
import 'google_request_headers.dart';

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
      onRequest: (options, handler) async {
        final isGoogle = options.uri.host.endsWith('googleapis.com');
        if (isGoogle) {
          options.queryParameters.putIfAbsent(
            'key',
            () => Env.googleMapsApiKey,
          );
          // Identify the app so Android-restricted API keys are accepted
          // by Google Web Service endpoints (Places, Geocoding, etc.).
          final headers = await googleApiRequestHeaders();
          options.headers.addAll(headers);
        }
        handler.next(options);
      },
    ),
  );

  return dio;
});
