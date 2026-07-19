import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../models/listing.dart';
import '../repositories/listings_repository.dart';

/// Browse rental houses by city / area (supports other states for relocation).
class RentalsBrowseScreen extends ConsumerStatefulWidget {
  const RentalsBrowseScreen({super.key});

  @override
  ConsumerState<RentalsBrowseScreen> createState() =>
      _RentalsBrowseScreenState();
}

class _RentalsBrowseScreenState extends ConsumerState<RentalsBrowseScreen> {
  final _city = TextEditingController();
  final _area = TextEditingController();
  final _state = TextEditingController();

  List<Listing> _listings = [];
  List<String> _areas = [];
  bool _loading = true;
  bool _detecting = true;
  String? _error;
  String? _detectedLabel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    _city.dispose();
    _area.dispose();
    _state.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    setState(() {
      _detecting = true;
      _loading = true;
      _error = null;
    });
    try {
      final loc = await ref.read(locationServiceProvider).resolveCurrent();
      if (loc.location != null) {
        try {
          final geo = await ref.read(placesServiceProvider).reverseGeocode(
                lat: loc.location!.lat,
                lng: loc.location!.lng,
              );
          if (geo?.city != null && geo!.city!.trim().isNotEmpty) {
            _city.text = geo.city!;
          }
          if (geo?.state != null && geo!.state!.trim().isNotEmpty) {
            _state.text = geo.state!;
          }
          if (geo?.neighborhood != null &&
              geo!.neighborhood!.trim().isNotEmpty &&
              _area.text.isEmpty) {
            // Don't force area — user browses whole city first.
          }
          _detectedLabel = geo?.formattedAddress;
        } catch (_) {
          // Keep empty city; user can type.
        }
      }
      if (_city.text.trim().isEmpty) {
        _city.text = 'Osogbo';
      }
      await _load();
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
          _detecting = false;
        });
      }
    }
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
      _detecting = false;
    });
    try {
      final city = _city.text.trim();
      final area = _area.text.trim();
      final state = _state.text.trim();
      final results = await ref.read(listingsRepositoryProvider).search(
            kind: ListingKind.rental,
            city: city.isEmpty ? null : city,
            state: state.isEmpty ? null : state,
            area: area.isEmpty ? null : area,
            // City/state search should not be clipped to GPS radius.
            limit: 80,
          );
      final areas = results
          .map((l) => l.areaLabel?.trim() ?? '')
          .where((a) => a.isNotEmpty)
          .toSet()
          .toList()
        ..sort();
      if (!mounted) return;
      setState(() {
        _listings = results;
        _areas = areas;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _listings = [];
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.rentalsBrowseTitle),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.rentalsBrowseIntro,
                  style: theme.textTheme.bodyMedium,
                ),
                if (_detectedLabel != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.rentalsDetectedLocation(_detectedLabel!),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
                const SizedBox(height: AppSpacing.md),
                TerravaTextField(
                  controller: _city,
                  label: l10n.listingsCityLabel,
                  hint: 'Osogbo, Ibadan, Lagos…',
                ),
                const SizedBox(height: AppSpacing.sm),
                TerravaTextField(
                  controller: _state,
                  label: l10n.listingsStateLabel,
                  hint: 'Osun, Oyo, Lagos…',
                ),
                const SizedBox(height: AppSpacing.sm),
                TerravaTextField(
                  controller: _area,
                  label: l10n.listingsAreaLabel,
                  hint: 'Ayekale, Ring Road…',
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: TerravaButton(
                        label: l10n.rentalsSearch,
                        onPressed: _load,
                        isLoading: _loading,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    IconButton.filledTonal(
                      tooltip: l10n.rentalsUseMyCity,
                      onPressed: _detecting ? null : _bootstrap,
                      icon: const Icon(Icons.my_location_rounded),
                    ),
                  ],
                ),
                if (_areas.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FilterChip(
                          label: Text(l10n.rentalsAllAreas),
                          selected: _area.text.trim().isEmpty,
                          onSelected: (_) {
                            _area.clear();
                            _load();
                          },
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        for (final a in _areas) ...[
                          FilterChip(
                            label: Text(a),
                            selected:
                                _area.text.trim().toLowerCase() == a.toLowerCase(),
                            onSelected: (_) {
                              _area.text = a;
                              _load();
                            },
                          ),
                          const SizedBox(width: AppSpacing.sm),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                    ? ErrorState(
                        message: l10n.listingsLoadFailed,
                        onRetry: _load,
                      )
                    : _listings.isEmpty
                        ? EmptyState(
                            title: l10n.rentalsEmptyTitle,
                            message: l10n.rentalsEmptyMessage,
                            icon: Icons.home_work_outlined,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            itemCount: _listings.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: AppSpacing.md),
                            itemBuilder: (context, index) {
                              final listing = _listings[index];
                              return _RentalCard(
                                listing: listing,
                                onOpen: () => context.push(
                                  AppRoutes.listingPath(listing.id),
                                ),
                                onExploreArea: () => context.push(
                                  AppRoutes.locationDetailsPath(
                                    listing.lat,
                                    listing.lng,
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

class _RentalCard extends StatelessWidget {
  const _RentalCard({
    required this.listing,
    required this.onOpen,
    required this.onExploreArea,
  });

  final Listing listing;
  final VoidCallback onOpen;
  final VoidCallback onExploreArea;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final location = listing.locationLine.isEmpty
        ? l10n.rentalsNoAddress
        : listing.locationLine;

    return Material(
      color: theme.cardTheme.color,
      shape: theme.cardTheme.shape,
      child: InkWell(
        onTap: onOpen,
        borderRadius: AppRadius.mdAll,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppRadius.smAll,
                child: listing.coverPhoto == null
                    ? Container(
                        width: 84,
                        height: 84,
                        color: theme.colorScheme.primaryContainer,
                        child: const Icon(Icons.home_work_outlined),
                      )
                    : CachedNetworkImage(
                        imageUrl: listing.coverPhoto!,
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listing.title,
                      style: theme.textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      location,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (listing.price != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '${listing.currency} ${listing.price!.toStringAsFixed(0)}',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sm),
                    TextButton.icon(
                      onPressed: onExploreArea,
                      icon: const Icon(Icons.explore_outlined, size: 18),
                      label: Text(l10n.rentalsExploreArea),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
