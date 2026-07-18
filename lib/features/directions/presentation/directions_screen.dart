import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/config/env.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/widgets/terrava_app_bar.dart';

class DirectionsArgs {
  const DirectionsArgs({
    required this.destLat,
    required this.destLng,
    this.destName,
  });

  final double destLat;
  final double destLng;
  final String? destName;
}

final directionsProvider =
    FutureProvider.autoDispose.family((ref, DirectionsArgs args) async {
  final origin = await ref.watch(currentLocationProvider.future);
  if (origin == null) {
    throw Exception('Current location required for directions');
  }
  final dio = ref.watch(dioProvider);
  final response = await dio.get<Map<String, dynamic>>(
    'https://maps.googleapis.com/maps/api/directions/json',
    queryParameters: {
      'origin': '${origin.lat},${origin.lng}',
      'destination': '${args.destLat},${args.destLng}',
      'mode': 'driving',
      'key': Env.googleMapsApiKey,
    },
  );
  final routes = response.data?['routes'] as List<dynamic>? ?? [];
  if (routes.isEmpty) throw Exception('No route found');
  final route = routes.first as Map<String, dynamic>;
  final overview = route['overview_polyline'] as Map<String, dynamic>;
  final points = overview['points'] as String;
  final leg = (route['legs'] as List).first as Map<String, dynamic>;
  return (
    polyline: points,
    distance: (leg['distance'] as Map)['text'] as String? ?? '',
    duration: (leg['duration'] as Map)['text'] as String? ?? '',
    origin: LatLng(origin.lat, origin.lng),
    destination: LatLng(args.destLat, args.destLng),
  );
});

class DirectionsScreen extends ConsumerWidget {
  const DirectionsScreen({
    super.key,
    required this.destLat,
    required this.destLng,
    this.destName,
  });

  final double destLat;
  final double destLng;
  final String? destName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = DirectionsArgs(
      destLat: destLat,
      destLng: destLng,
      destName: destName,
    );
    final async = ref.watch(directionsProvider(args));
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: destName ?? l10n.commonDirections),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) {
          final polyline = _decodePolyline(data.polyline);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${data.duration} · ${data.distance}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: data.origin,
                    zoom: 12,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('origin'),
                      position: data.origin,
                      infoWindow: InfoWindow(title: l10n.directionsOriginYou),
                    ),
                    Marker(
                      markerId: const MarkerId('dest'),
                      position: data.destination,
                      infoWindow: InfoWindow(
                          title: destName ?? l10n.directionsDestination),
                    ),
                  },
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId('route'),
                      points: polyline,
                      color: AppColors.forest,
                      width: 5,
                    ),
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<LatLng> _decodePolyline(String encoded) {
  final points = <LatLng>[];
  var index = 0;
  var lat = 0;
  var lng = 0;

  while (index < encoded.length) {
    var result = 0;
    var shift = 0;
    int b;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    final dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
    lat += dlat;

    result = 0;
    shift = 0;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);
    final dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
    lng += dlng;

    points.add(LatLng(lat / 1e5, lng / 1e5));
  }
  return points;
}
