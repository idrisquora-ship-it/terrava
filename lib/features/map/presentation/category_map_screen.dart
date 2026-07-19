import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/constants/place_categories.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/place_cards.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_map.dart';
import '../../favorites/controllers/favorites_controller.dart';

class CategoryMapScreen extends ConsumerStatefulWidget {
  const CategoryMapScreen({
    super.key,
    required this.type,
    this.lat,
    this.lng,
  });

  final String type;
  final double? lat;
  final double? lng;

  @override
  ConsumerState<CategoryMapScreen> createState() => _CategoryMapScreenState();
}

class _CategoryMapScreenState extends ConsumerState<CategoryMapScreen> {
  final _mapController = MapController();
  List<PlaceSummary> _places = [];
  List<Marker> _markers = [];
  bool _loading = true;
  bool _showList = false;
  String? _error;
  LatLng? _center;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap({bool forceRefresh = false}) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    LatLng? center;
    if (!forceRefresh && widget.lat != null && widget.lng != null) {
      center = LatLng(widget.lat!, widget.lng!);
    } else {
      // Prefer the cached home-screen fix; only force a new GPS read on retry.
      final result = await ref
          .read(locationServiceProvider)
          .resolveCurrent(forceRefresh: forceRefresh);
      if (!mounted) return;
      if (result.location != null) {
        center = LatLng(result.location!.lat, result.location!.lng);
        // Keep Riverpod in sync without discarding a good cache on open.
        ref.invalidate(currentLocationProvider);
      } else {
        setState(() {
          _loading = false;
          _error = switch (result.failure) {
            LocationFailureReason.permissionDenied =>
              context.l10n.locationPermissionNeeded,
            LocationFailureReason.serviceDisabled =>
              context.l10n.locationServicesDisabled,
            _ => context.l10n.locationUnavailable,
          };
        });
        return;
      }
    }
    if (!mounted) return;
    setState(() {
      _center = center;
      _error = null;
    });
    _mapController.move(center, 14);
    await _load(center);
  }

  Future<void> _load(LatLng target) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final places = await ref.read(placesServiceProvider).nearbySearch(
            lat: target.latitude,
            lng: target.longitude,
            type: widget.type,
            radiusMeters: 4000,
          );
      if (!mounted) return;
      _places = places.where((p) => p.lat != null && p.lng != null).toList();
      _markers = [
        for (final p in _places)
          terravaPlaceMarker(
            point: LatLng(p.lat!, p.lng!),
            label: p.name,
            onTap: () => _showPlaceSheet(p),
          ),
      ];
    } catch (e) {
      if (mounted) _error = e.toString();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _savePlace(PlaceSummary place) async {
    await ref.read(favoritesControllerProvider.notifier).savePlace(place);
    if (!mounted) return;
    final result = ref.read(favoritesControllerProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result.hasError ? result.error.toString() : context.l10n.placeSaved,
        ),
      ),
    );
  }

  void _showPlaceSheet(PlaceSummary place) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        final l10n = context.l10n;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlaceListTileCard(
                place: place,
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push(AppRoutes.placeDetailsPath(place.placeId));
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  AppSpacing.lg,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TerravaButton(
                        label: l10n.commonSave,
                        onPressed: () async {
                          Navigator.pop(sheetContext);
                          await _savePlace(place);
                        },
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: TerravaButton(
                        label: l10n.commonDirections,
                        variant: TerravaButtonVariant.outlined,
                        onPressed: place.lat == null || place.lng == null
                            ? null
                            : () {
                                Navigator.pop(sheetContext);
                                context.push(
                                  '${AppRoutes.directions}'
                                  '?destLat=${place.lat}&destLng=${place.lng}'
                                  '&destName=${Uri.encodeComponent(place.name)}',
                                );
                              },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _focusPlace(PlaceSummary place) async {
    if (place.lat == null || place.lng == null) return;
    setState(() => _showList = false);
    _mapController.move(LatLng(place.lat!, place.lng!), 16);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final matched = kPlaceCategories.where((c) => c.typeKey == widget.type);
    final title = matched.isEmpty
        ? widget.type.replaceAll('_', ' ')
        : matched.first.localizedLabel(l10n);
    final center = _center ?? const LatLng(6.5244, 3.3792);

    return Scaffold(
      appBar: TerravaAppBar(
        title: title,
        actions: [
          IconButton(
            onPressed: () => setState(() => _showList = !_showList),
            icon: Icon(_showList ? Icons.map_rounded : Icons.list_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          TerravaMap(
            mapController: _mapController,
            center: center,
            zoom: 14,
            markers: _markers,
          ),
          if (_showList)
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: _places.isEmpty
                  ? EmptyState(
                      title: l10n.categoryNoResultsTitle,
                      message: l10n.categoryNoResultsMessage,
                    )
                  : ListView.separated(
                      itemCount: _places.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final place = _places[index];
                        return PlaceListTileCard(
                          place: place,
                          onTap: () => _showPlaceSheet(place),
                        );
                      },
                    ),
            )
          else ...[
            if (_places.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: AppSpacing.md,
                child: SizedBox(
                  height: 230,
                  child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    scrollDirection: Axis.horizontal,
                    itemCount: _places.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: AppSpacing.sm),
                    itemBuilder: (context, index) {
                      final place = _places[index];
                      return Stack(
                        children: [
                          PlaceCardHorizontal(
                            place: place,
                            onTap: () => _focusPlace(place),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Material(
                              color: Theme.of(context).colorScheme.surface,
                              shape: const CircleBorder(),
                              child: IconButton(
                                tooltip: l10n.commonSave,
                                iconSize: 20,
                                icon: const Icon(Icons.bookmark_add_outlined),
                                onPressed: () => _savePlace(place),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            if (!_loading && _error == null && _places.isEmpty)
              Positioned(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                bottom: AppSpacing.xl,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(
                      l10n.categoryNoResultsMessage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
          if (_error != null)
            Positioned(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.xl,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_error!, textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.sm),
                      TerravaButton(
                        label: l10n.commonTryAgain,
                        expand: false,
                        onPressed: () => _bootstrap(forceRefresh: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (_loading)
            const Positioned(
              top: AppSpacing.lg,
              left: 0,
              right: 0,
              child: Center(child: CircularProgressIndicator()),
            ),
          Positioned(
            top: AppSpacing.md,
            right: AppSpacing.md,
            child: Material(
              borderRadius: AppRadius.mdAll,
              color: Theme.of(context).cardTheme.color,
              child: IconButton(
                tooltip: l10n.mapMyLocation,
                onPressed: () => _bootstrap(forceRefresh: true),
                icon: const Icon(Icons.my_location_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
