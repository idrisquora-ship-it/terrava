import 'dart:async';

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

final _searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

final autocompleteProvider =
    FutureProvider.autoDispose<List<AutocompleteSuggestion>>((ref) async {
  final query = ref.watch(_searchQueryProvider);
  if (query.trim().length < 2) return [];
  return ref.watch(placesServiceProvider).autocomplete(query);
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      ref.read(_searchQueryProvider.notifier).state = value;
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
      // Mapbox suggestions are areas/POIs by coordinates — open neighborhood.
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

  Future<void> _submitRaw(String query) async {
    await ref.read(historyRepositoryProvider).addSearch(query: query);

    final coords = RegExp(r'^\s*(-?\d+(\.\d+)?)\s*,\s*(-?\d+(\.\d+)?)\s*$')
        .firstMatch(query);
    if (coords != null) {
      final lat = double.parse(coords.group(1)!);
      final lng = double.parse(coords.group(3)!);
      if (!mounted) return;
      context.push(AppRoutes.locationDetailsPath(lat, lng));
      return;
    }

    final places = ref.read(placesServiceProvider);
    try {
      final geo = await places.geocode(query);
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

      // Geocoder found nothing — try a Places text search biased to the
      // user's location so local names still resolve.
      final loc = await ref.read(currentLocationProvider.future);
      final results = await places.textSearch(
        query,
        lat: loc?.lat,
        lng: loc?.lng,
      );
      final match = results
          .where((p) => p.lat != null && p.lng != null)
          .toList();
      if (match.isNotEmpty) {
        final first = match.first;
        await ref.read(historyRepositoryProvider).addSearch(
              query: query,
              lat: first.lat,
              lng: first.lng,
            );
        if (!mounted) return;
        final isEstablishment = first.types.contains('establishment') ||
            first.types.contains('point_of_interest');
        if (isEstablishment) {
          context.push(AppRoutes.placeDetailsPath(first.placeId));
        } else {
          context.push(AppRoutes.locationDetailsPath(first.lat!, first.lng!));
        }
        return;
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.searchNoResults)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
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
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: TextField(
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
          ),
          Expanded(
            child: suggestions.when(
              data: (items) {
                if (_controller.text.trim().isEmpty) {
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
