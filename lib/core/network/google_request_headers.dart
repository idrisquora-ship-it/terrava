import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_api_headers/google_api_headers.dart';

Map<String, String> _cached = const {};
Future<Map<String, String>>? _pending;

/// Headers (X-Android-Package / X-Android-Cert) required so Google Web
/// Service calls pass the "Android apps" restriction on the API key.
Future<Map<String, String>> googleApiRequestHeaders() {
  final pending = _pending;
  if (pending != null) return pending;

  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return _pending = Future.value(_cached);
  }

  Future<Map<String, String>> fetch() async {
    try {
      final headers = await const GoogleApiHeaders().getHeaders();
      _cached = headers;
      return headers;
    } catch (_) {
      _pending = null;
      return _cached;
    }
  }

  return _pending = fetch();
}

/// Last known headers; empty until [googleApiRequestHeaders] completes once.
Map<String, String> get googleApiRequestHeadersSync => _cached;
