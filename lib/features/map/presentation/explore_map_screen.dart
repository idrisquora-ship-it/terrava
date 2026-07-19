import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/map_clusterer.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/place_cards.dart';
import '../../../shared/widgets/terrava_map.dart';
import '../../listings/models/listing.dart';
import '../../listings/repositories/listings_repository.dart';

class ExploreMapScreen extends ConsumerStatefulWidget {
  const ExploreMapScreen({super.key});

  @override
  ConsumerState<ExploreMapScreen> createState() => _ExploreMapScreenState();
}

class _ExploreMapScreenState extends ConsumerState<ExploreMapScreen> {
  final _mapController = MapController();
  List<Marker> _markers = [];
  List<PlaceSummary> _places = [];
  List<Listing> _listings = [];
  bool _loading = false;
  double _zoom = 14;

  Future<void> _loadNearby(LatLng target) async {
    setState(() => _loading = true);
    try {
      final places = await ref.read(placesServiceProvider).nearbySearch(
            lat: target.latitude,
            lng: target.longitude,
            radiusMeters: 1800,
          );
      final listings = await ref.read(listingsRepositoryProvider).nearby(
            lat: target.latitude,
            lng: target.longitude,
            radiusKm: 8,
          );
      _places = places.where((p) => p.lat != null && p.lng != null).toList();
      _listings = listings;
      _rebuildMarkers();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _rebuildMarkers() {
    if (!mounted) return;
    final buckets = const MapClusterer().cluster(places: _places, zoom: _zoom);
    final markers = <Marker>[];

    for (final listing in _listings) {
      markers.add(
        terravaPlaceMarker(
          point: LatLng(listing.lat, listing.lng),
          label: '★ ${listing.title}',
          onTap: () => context.push(AppRoutes.listingPath(listing.id)),
        ),
      );
    }

    for (final bucket in buckets) {
      if (bucket.items.length == 1) {
        final p = bucket.items.first.place;
        markers.add(
          terravaPlaceMarker(
            point: LatLng(p.lat!, p.lng!),
            label: p.name,
            onTap: () => _showPlaceSheet(p),
          ),
        );
      } else {
        markers.add(
          Marker(
            point: bucket.center,
            width: 44,
            height: 44,
            child: GestureDetector(
              onTap: () {
                _mapController.move(bucket.center, _zoom + 2);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.sage,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  '${bucket.items.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    setState(() => _markers = markers);
  }

  void _showPlaceSheet(PlaceSummary place) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: PlaceListTileCard(
            place: place,
            onTap: () {
              Navigator.pop(context);
              context.push(AppRoutes.placeDetailsPath(place.placeId));
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locationAsync = ref.watch(currentLocationProvider);
    final initial = locationAsync.valueOrNull;
    final center = LatLng(
      initial?.lat ?? 6.5244,
      initial?.lng ?? 3.3792,
    );

    return Scaffold(
      body: Stack(
        children: [
          TerravaMap(
            mapController: _mapController,
            center: center,
            zoom: 14,
            markers: _markers,
            myLocation: initial == null
                ? null
                : LatLng(initial.lat, initial.lng),
            showMyLocationDot: initial != null,
            onMapReady: (_) => _loadNearby(center),
            onPositionChanged: (camera) {
              _zoom = camera.zoom;
              // Debounce-ish: reload when idle enough via gesture end is hard;
              // reload on significant moves from my-location / initial only.
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      borderRadius: AppRadius.mdAll,
                      color: Theme.of(context).cardTheme.color,
                      child: InkWell(
                        borderRadius: AppRadius.mdAll,
                        onTap: () => context.push(AppRoutes.search),
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Row(
                            children: [
                              const Icon(Icons.search_rounded),
                              const SizedBox(width: AppSpacing.sm),
                              Text(l10n.mapSearchArea),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Material(
                    borderRadius: AppRadius.mdAll,
                    color: Theme.of(context).cardTheme.color,
                    child: IconButton(
                      tooltip: l10n.mapMyLocation,
                      onPressed: () async {
                        final loc = await ref
                            .read(locationServiceProvider)
                            .currentPosition();
                        if (loc == null) return;
                        final target = LatLng(loc.lat, loc.lng);
                        _mapController.move(target, 15);
                        await _loadNearby(target);
                      },
                      icon: const Icon(Icons.my_location_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_loading)
            const Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
