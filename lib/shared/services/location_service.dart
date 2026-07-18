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
  /// Prefer this over [currentPosition] when the UI needs a clear error reason.
  Future<LocationResult> resolveCurrent() async {
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

      // Last known is instant and avoids timeouts when GPS is cold-starting.
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        return LocationResult.ok(
          DeviceLocation(
            lat: last.latitude,
            lng: last.longitude,
            accuracy: last.accuracy,
          ),
        );
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 12),
        ),
      );

      return LocationResult.ok(
        DeviceLocation(
          lat: position.latitude,
          lng: position.longitude,
          accuracy: position.accuracy,
        ),
      );
    } catch (_) {
      return const LocationResult.fail(LocationFailureReason.unavailable);
    }
  }

  Future<DeviceLocation?> currentPosition() async {
    final result = await resolveCurrent();
    return result.location;
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
