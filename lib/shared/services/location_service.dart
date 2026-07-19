import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class DeviceLocation {
  const DeviceLocation({
    required this.lat,
    required this.lng,
    this.accuracy,
  });

  final double lat;
  final double lng;
  final double? accuracy;
}

enum LocationFailureReason {
  permissionDenied,
  serviceDisabled,
  unavailable,
}

class LocationResult {
  const LocationResult._({this.location, this.failure});

  const LocationResult.ok(DeviceLocation location)
      : this._(location: location);

  const LocationResult.fail(LocationFailureReason failure)
      : this._(failure: failure);

  final DeviceLocation? location;
  final LocationFailureReason? failure;

  bool get isOk => location != null;
}

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

class LocationService {
  DeviceLocation? _cached;

  /// Prefer this over [currentPosition] when the UI needs a clear error reason.
  ///
  /// Set [forceRefresh] to bypass the in-memory cache (e.g. "Try again" /
  /// "My location"). Permission is still re-checked every call.
  Future<LocationResult> resolveCurrent({bool forceRefresh = false}) async {
    try {
      final permission = await _ensurePermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const LocationResult.fail(LocationFailureReason.permissionDenied);
      }

      final enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled && !kIsWeb) {
        return const LocationResult.fail(LocationFailureReason.serviceDisabled);
      }

      if (!forceRefresh && _cached != null) {
        return LocationResult.ok(_cached!);
      }

      // Platform last-known (Android/iOS only — throws UnsupportedError on web).
      if (!kIsWeb) {
        try {
          final last = await Geolocator.getLastKnownPosition();
          if (last != null) {
            return _remember(
              DeviceLocation(
                lat: last.latitude,
                lng: last.longitude,
                accuracy: last.accuracy,
              ),
            );
          }
        } catch (_) {
          // Continue to a live fix.
        }
      }

      final position = await _readFreshPosition();
      if (position == null) {
        if (_cached != null) return LocationResult.ok(_cached!);
        return const LocationResult.fail(LocationFailureReason.unavailable);
      }

      return _remember(
        DeviceLocation(
          lat: position.latitude,
          lng: position.longitude,
          accuracy: position.accuracy,
        ),
      );
    } catch (_) {
      if (_cached != null) return LocationResult.ok(_cached!);
      return const LocationResult.fail(LocationFailureReason.unavailable);
    }
  }

  Future<DeviceLocation?> currentPosition({bool forceRefresh = false}) async {
    final result = await resolveCurrent(forceRefresh: forceRefresh);
    return result.location;
  }

  LocationResult _remember(DeviceLocation location) {
    _cached = location;
    return LocationResult.ok(location);
  }

  /// Live GPS / network fix with platform settings and accuracy fallbacks.
  Future<Position?> _readFreshPosition() async {
    // Prefer a quick network/low-power fix first (works indoors + on web).
    final soft = await _tryCurrentPosition(_settings(
      accuracy: LocationAccuracy.medium,
      timeLimit: const Duration(seconds: 20),
      maximumAge: const Duration(minutes: 5),
    ));
    if (soft != null) return soft;

    // Stronger attempt if the first pass timed out (common outdoors cold-start).
    final precise = await _tryCurrentPosition(_settings(
      accuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 25),
      maximumAge: Duration.zero,
    ));
    if (precise != null) return precise;

    // Last resort: first event from the position stream.
    return _tryStreamPosition(_settings(
      accuracy: LocationAccuracy.low,
      timeLimit: const Duration(seconds: 20),
      maximumAge: const Duration(minutes: 5),
    ));
  }

  LocationSettings _settings({
    required LocationAccuracy accuracy,
    required Duration timeLimit,
    required Duration maximumAge,
  }) {
    if (kIsWeb) {
      return WebSettings(
        accuracy: accuracy,
        timeLimit: timeLimit,
        maximumAge: maximumAge,
      );
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidSettings(
        accuracy: accuracy,
        timeLimit: timeLimit,
        intervalDuration: const Duration(seconds: 1),
      );
    }
    return LocationSettings(
      accuracy: accuracy,
      timeLimit: timeLimit,
    );
  }

  Future<Position?> _tryCurrentPosition(LocationSettings settings) async {
    try {
      return await Geolocator.getCurrentPosition(locationSettings: settings);
    } on TimeoutException {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<Position?> _tryStreamPosition(LocationSettings settings) async {
    try {
      return await Geolocator.getPositionStream(locationSettings: settings)
          .first
          .timeout(settings.timeLimit ?? const Duration(seconds: 20));
    } catch (_) {
      return null;
    }
  }

  /// Use Geolocator on every platform. Mixing [permission_handler] with
  /// Geolocator/Google Maps can report "denied" even after the user allowed
  /// location for the app (the map blue-dot works, but our fetch returns null).
  Future<LocationPermission> _ensurePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }
}

final currentLocationProvider = FutureProvider<DeviceLocation?>((ref) async {
  return ref.watch(locationServiceProvider).currentPosition();
});
