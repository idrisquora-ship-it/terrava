import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/env.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/history_repository.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/services/voice_search_service.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../listings/models/listing.dart';
import '../../listings/repositories/listings_repository.dart';
import '../../listings/services/listing_search_intent.dart';

final _searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

final autocompleteProvider =
    FutureProvider.autoDispose<List<AutocompleteSuggestion>>((ref) async {
  final query = ref.watch(_searchQueryProvider);
  if (query.trim().length < 2) return [];
  final loc = await ref.watch(currentLocationProvider.future);
  return ref.watch(placesServiceProvider).autocomplete(
        query,
        proximityLat: loc?.lat,
        proximityLng: loc?.lng,
      );
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _maxPriceController = TextEditingController();
  Timer? _debounce;
  List<Listing> _listings = [];
  bool _searchingListings = false;
  bool _showListingResults = false;
  ListingKind? _filterKind;
  double _radiusKm = 40;
  bool _nearMeOnly = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _areaController.dispose();
    _cityController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      ref.read(_searchQueryProvider.notifier).state = value;
      if (value.trim().length < 2) {
        setState(() {
          _showListingResults = false;
          _listings = [];
        });
      }
    });
  }

  Future<void> _openSuggestion(AutocompleteSuggestion suggestion) async {
    await ref.read(historyRepositoryProvider).addSearch(
          query: suggestion.description,
          resultPlaceId: suggestion.placeId,
          lat: suggestion.lat,
          lng: suggestion.lng,
        );
    if (!mounted) return;
    if (suggestion.lat != null && suggestion.lng != null) {
      context.push(
        AppRoutes.locationDetailsPath(suggestion.lat!, suggestion.lng!),
      );
      return;
    }
    final geo =
        await ref.read(placesServiceProvider).geocode(suggestion.description);
    if (!mounted || geo == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.searchNoResults)),
        );
      }
      return;
    }
    context.push(AppRoutes.locationDetailsPath(geo.lat, geo.lng));
  }

  Future<void> _runListingSearch(String query) async {
    setState(() {
      _searchingListings = true;
      _showListingResults = true;
    });
    try {
      final intent = parseListingSearchIntent(query);
      final loc = await ref.read(currentLocationProvider.future);
      final area = _areaController.text.trim();
      final city = _cityController.text.trim();
      // Prefer city/area discovery nationwide when city is set (relocation).
      // Only clip to GPS radius when "Near me" is on or no city/area filter.
      final useNear = _nearMeOnly || (city.isEmpty && area.isEmpty);
      final results = await ref.read(listingsRepositoryProvider).search(
            query: intent.cleanedQuery,
            area: area.isEmpty ? null : area,
            city: city.isEmpty ? null : city,
            kind: _filterKind ?? intent.kind,
            category: intent.category,
            maxPrice: double.tryParse(_maxPriceController.text.trim()),
            nearLat: useNear ? loc?.lat : null,
            nearLng: useNear ? loc?.lng : null,
            radiusKm: _radiusKm,
          );
      if (!mounted) return;
      setState(() => _listings = results);
    } catch (_) {
      if (!mounted) return;
      setState(() => _listings = []);
    } finally {
      if (mounted) setState(() => _searchingListings = false);
    }
  }

  Future<void> _submitRaw(String query) async {
    if (query.trim().isEmpty) return;
    await ref.read(historyRepositoryProvider).addSearch(query: query);
    await _runListingSearch(query);

    final coords = RegExp(r'^\s*(-?\d+(\.\d+)?)\s*,\s*(-?\d+(\.\d+)?)\s*$')
        .firstMatch(query);
    if (coords != null) {
      final lat = double.parse(coords.group(1)!);
      final lng = double.parse(coords.group(3)!);
      if (!mounted) return;
      context.push(AppRoutes.locationDetailsPath(lat, lng));
      return;
    }

    // If Terrava listings matched, stay on search results (listings first).
    // User can still open Mapbox suggestion chips below.
    if (_listings.isNotEmpty) return;

    final places = ref.read(placesServiceProvider);
    try {
      final loc = await ref.read(currentLocationProvider.future);
      final geo = await places.geocode(
        query,
        proximityLat: loc?.lat,
        proximityLng: loc?.lng,
      );
      if (geo != null) {
        await ref.read(historyRepositoryProvider).addSearch(
              query: query,
              lat: geo.lat,
              lng: geo.lng,
            );
        if (!mounted) return;
        context.push(AppRoutes.locationDetailsPath(geo.lat, geo.lng));
        return;
      }

      final results = await places.textSearch(
        query,
        lat: loc?.lat,
        lng: loc?.lng,
      );
      final match =
          results.where((p) => p.lat != null && p.lng != null).toList();
      if (match.isNotEmpty) {
        final first = match.first;
        await ref.read(historyRepositoryProvider).addSearch(
              query: query,
              lat: first.lat,
              lng: first.lng,
            );
        if (!mounted) return;
        context.push(AppRoutes.locationDetailsPath(first.lat!, first.lng!));
        return;
      }

      if (mounted && _listings.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.searchNoResults)),
        );
      }
    } catch (_) {
      if (mounted && _listings.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.placesNetworkError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final suggestions = ref.watch(autocompleteProvider);
    final recent = ref.watch(recentSearchesProvider);
    final popular = ref.watch(popularSearchesProvider);

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.searchTitle),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  onChanged: _onChanged,
                  onSubmitted: _submitRaw,
                  decoration: InputDecoration(
                    hintText: l10n.searchHint,
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: IconButton(
                      tooltip: Env.enableVoiceSearch
                          ? l10n.searchVoiceTooltip
                          : l10n.searchVoiceDisabledTooltip,
                      onPressed: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        final voice = ref.read(voiceSearchProvider);
                        final available = await voice.isAvailable;
                        if (!available) {
                          if (!mounted) return;
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text(
                                Env.enableVoiceSearch
                                    ? l10n.searchVoiceUnavailable
                                    : l10n.searchVoiceEnableInstruction,
                              ),
                            ),
                          );
                          return;
                        }
                        final text = await voice.listenOnce();
                        if (!mounted || text == null || text.isEmpty) return;
                        _controller.text = text;
                        _onChanged(text);
                        await _submitRaw(text);
                      },
                      icon: const Icon(Icons.mic_none_rounded),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _cityController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => _submitRaw(_controller.text),
                  decoration: InputDecoration(
                    hintText: l10n.searchCityHint,
                    prefixIcon: const Icon(Icons.location_city_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _areaController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => _submitRaw(_controller.text),
                  decoration: InputDecoration(
                    hintText: l10n.searchAreaHint,
                    prefixIcon: const Icon(Icons.map_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _maxPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: l10n.listingsMaxPrice,
                    prefixIcon: const Icon(Icons.payments_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                FilterChip(
                  label: Text(l10n.searchNearMeOnly),
                  selected: _nearMeOnly,
                  onSelected: (v) => setState(() => _nearMeOnly = v),
                ),
                const SizedBox(height: AppSpacing.sm),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: Text(l10n.listingsKindRental),
                        selected: _filterKind == ListingKind.rental,
                        onSelected: (v) => setState(
                          () => _filterKind = v ? ListingKind.rental : null,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      FilterChip(
                        label: Text(l10n.listingsKindSale),
                        selected: _filterKind == ListingKind.sale,
                        onSelected: (v) => setState(
                          () => _filterKind = v ? ListingKind.sale : null,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      FilterChip(
                        label: Text(l10n.listingsKindBusiness),
                        selected: _filterKind == ListingKind.business,
                        onSelected: (v) => setState(
                          () => _filterKind = v ? ListingKind.business : null,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      ChoiceChip(
                        label: Text('${_radiusKm.round()} km'),
                        selected: true,
                        onSelected: (_) {
                          setState(() {
                            _radiusKm = _radiusKm >= 80
                                ? 15
                                : _radiusKm >= 40
                                    ? 80
                                    : 40;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showListingResults) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.searchListedSection,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            if (_searchingListings)
              const LinearProgressIndicator()
            else if (_listings.isEmpty)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(l10n.searchListedEmpty),
              )
            else
              SizedBox(
                height: 210,
                child: ListView.separated(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  scrollDirection: Axis.horizontal,
                  itemCount: _listings.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final listing = _listings[index];
                    return SizedBox(
                      width: 220,
                      child: Card(
                        child: InkWell(
                          onTap: () =>
                              context.push(AppRoutes.listingPath(listing.id)),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (listing.coverPhoto != null)
                                  ClipRRect(
                                    borderRadius: AppRadius.smAll,
                                    child: CachedNetworkImage(
                                      imageUrl: listing.coverPhoto!,
                                      height: 90,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                else
                                  Container(
                                    height: 90,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: AppRadius.smAll,
                                    ),
                                    child: const Icon(Icons.home_work_outlined),
                                  ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  listing.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  listing.locationLine.isEmpty
                                      ? listing.category.replaceAll('_', ' ')
                                      : listing.locationLine,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.sm,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.searchMorePlacesSection,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
          Expanded(
            child: suggestions.when(
              data: (items) {
                if (_controller.text.trim().isEmpty && !_showListingResults) {
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                    ),
                    children: [
                      Text(
                        l10n.searchRecentTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      recent.when(
                        data: (rows) {
                          if (rows.isEmpty) {
                            return Text(l10n.searchNoRecent);
                          }
                          return Column(
                            children: rows.take(10).map((row) {
                              final q = row['query'] as String? ?? '';
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: const Icon(Icons.history_rounded),
                                title: Text(q),
                                onTap: () {
                                  _controller.text = q;
                                  _onChanged(q);
                                  _submitRaw(q);
                                },
                              );
                            }).toList(),
                          );
                        },
                        loading: () => const LinearProgressIndicator(),
                        error: (e, _) => Text(e.toString()),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        l10n.searchPopularTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      popular.when(
                        data: (rows) {
                          if (rows.isEmpty) {
                            return Text(l10n.searchNoPopular);
                          }
                          return Column(
                            children: rows
                                .map(
                                  (q) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading:
                                        const Icon(Icons.trending_up_rounded),
                                    title: Text(q),
                                    onTap: () {
                                      _controller.text = q;
                                      _onChanged(q);
                                      _submitRaw(q);
                                    },
                                  ),
                                )
                                .toList(),
                          );
                        },
                        loading: () => const LinearProgressIndicator(),
                        error: (e, _) => Text(e.toString()),
                      ),
                    ],
                  );
                }
                if (items.isEmpty) {
                  return EmptyState(
                    title: l10n.searchNoSuggestionsTitle,
                    message: l10n.searchNoSuggestionsMessage,
                  );
                }
                return ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      leading: const Icon(Icons.place_outlined),
                      title: Text(item.mainText ?? item.description),
                      subtitle: item.secondaryText == null
                          ? null
                          : Text(item.secondaryText!),
                      onTap: () => _openSuggestion(item),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => ErrorState(message: e.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
