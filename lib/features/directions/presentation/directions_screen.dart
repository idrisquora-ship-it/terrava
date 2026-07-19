import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_map.dart';

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
  final route = await ref.watch(placesServiceProvider).directions(
        originLat: origin.lat,
        originLng: origin.lng,
        destLat: args.destLat,
        destLng: args.destLng,
      );
  return (
    points: route.points,
    distance: route.distanceText,
    duration: route.durationText,
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
          final linePoints = data.points
              .map((p) => LatLng(p.lat, p.lng))
              .toList(growable: false);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Expanded(child: Text('${data.distance} · ${data.duration}')),
                  ],
                ),
              ),
              Expanded(
                child: TerravaMap(
                  center: data.origin,
                  zoom: 13,
                  markers: [
                    terravaPlaceMarker(
                      point: data.origin,
                      label: 'Start',
                      color: AppColors.sage,
                    ),
                    terravaPlaceMarker(
                      point: data.destination,
                      label: destName ?? 'Destination',
                    ),
                  ],
                  polylines: [
                    Polyline(
                      points: linePoints,
                      color: AppColors.forest,
                      strokeWidth: 4,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
