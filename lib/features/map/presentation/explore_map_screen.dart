import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/map_styles.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/map_clusterer.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/place_cards.dart';

class ExploreMapScreen extends ConsumerStatefulWidget {
  const ExploreMapScreen({super.key});

  @override
  ConsumerState<ExploreMapScreen> createState() => _ExploreMapScreenState();
}

class _ExploreMapScreenState extends ConsumerState<ExploreMapScreen> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  List<PlaceSummary> _places = [];
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
      _places = places.where((p) => p.lat != null && p.lng != null).toList();
      await _rebuildMarkers();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _rebuildMarkers() async {
    if (!mounted) return;
    final l10n = context.l10n;
    final buckets = const MapClusterer().cluster(places: _places, zoom: _zoom);
    final markers = <Marker>{};

    for (final bucket in buckets) {
      if (bucket.items.length == 1) {
        final p = bucket.items.first.place;
        markers.add(
          Marker(
            markerId: MarkerId(p.placeId),
            position: LatLng(p.lat!, p.lng!),
            icon: await clusterIcon(1),
            infoWindow: InfoWindow(
              title: p.name,
              snippet:
                  p.rating == null ? null : '★ ${p.rating!.toStringAsFixed(1)}',
            ),
            onTap: () => _showPlaceSheet(p),
          ),
        );
      } else {
        final id =
            'cluster_${bucket.center.latitude}_${bucket.center.longitude}';
        markers.add(
          Marker(
            markerId: MarkerId(id),
            position: bucket.center,
            icon: await clusterIcon(bucket.items.length),
            infoWindow: InfoWindow(
              title: l10n.mapClusterPlaces(bucket.items.length),
              snippet: l10n.mapTapToZoom,
            ),
            onTap: () async {
              await _controller?.animateCamera(
                CameraUpdate.newLatLngZoom(bucket.center, _zoom + 2),
              );
            },
          ),
        );
      }
    }

    if (mounted) setState(() => _markers = markers);
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final center = LatLng(
      initial?.lat ?? 6.5244,
      initial?.lng ?? 3.3792,
    );

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: center, zoom: 14),
            style: isDark ? TerravaMapStyles.dark : TerravaMapStyles.light,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            mapToolbarEnabled: false,
            markers: _markers,
            onMapCreated: (controller) async {
              _controller = controller;
              await _loadNearby(center);
            },
            onCameraMove: (pos) => _zoom = pos.zoom,
            onCameraIdle: () async {
              final bounds = await _controller?.getVisibleRegion();
              if (bounds == null) return;
              final mid = LatLng(
                (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
                (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
              );
              await _loadNearby(mid);
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
                        await _controller?.animateCamera(
                          CameraUpdate.newLatLngZoom(target, 15),
                        );
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
