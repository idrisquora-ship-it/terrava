import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../models/listing.dart';
import '../repositories/listings_repository.dart';

final listingAlertsProvider =
    FutureProvider.autoDispose<List<ListingAlert>>((ref) async {
  return ref.watch(listingsRepositoryProvider).myAlerts();
});

class ListingAlertsScreen extends ConsumerStatefulWidget {
  const ListingAlertsScreen({super.key});

  @override
  ConsumerState<ListingAlertsScreen> createState() =>
      _ListingAlertsScreenState();
}

class _ListingAlertsScreenState extends ConsumerState<ListingAlertsScreen> {
  final _query = TextEditingController();
  final _city = TextEditingController();
  final _area = TextEditingController();
  final _maxPrice = TextEditingController();
  ListingKind? _kind;
  bool _saving = false;

  @override
  void dispose() {
    _query.dispose();
    _city.dispose();
    _area.dispose();
    _maxPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(listingAlertsProvider);

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.listingsAlertsTitle),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.listingsAlertsIntro),
          const SizedBox(height: AppSpacing.md),
          TerravaTextField(
            controller: _query,
            label: l10n.searchHint,
          ),
          const SizedBox(height: AppSpacing.sm),
          TerravaTextField(
            controller: _city,
            label: l10n.listingsCityLabel,
          ),
          const SizedBox(height: AppSpacing.sm),
          TerravaTextField(
            controller: _area,
            label: l10n.listingsAreaLabel,
          ),
          const SizedBox(height: AppSpacing.sm),
          TerravaTextField(
            controller: _maxPrice,
            label: l10n.listingsMaxPrice,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              FilterChip(
                label: Text(l10n.listingsKindRental),
                selected: _kind == ListingKind.rental,
                onSelected: (v) => setState(
                  () => _kind = v ? ListingKind.rental : null,
                ),
              ),
              FilterChip(
                label: Text(l10n.listingsKindSale),
                selected: _kind == ListingKind.sale,
                onSelected: (v) =>
                    setState(() => _kind = v ? ListingKind.sale : null),
              ),
              FilterChip(
                label: Text(l10n.listingsKindBusiness),
                selected: _kind == ListingKind.business,
                onSelected: (v) => setState(
                  () => _kind = v ? ListingKind.business : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TerravaButton(
            label: l10n.listingsCreateAlert,
            isLoading: _saving,
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              setState(() => _saving = true);
              try {
                await ref.read(listingsRepositoryProvider).createAlert(
                      query: _query.text.trim().isEmpty
                          ? null
                          : _query.text.trim(),
                      city:
                          _city.text.trim().isEmpty ? null : _city.text.trim(),
                      areaLabel:
                          _area.text.trim().isEmpty ? null : _area.text.trim(),
                      kind: _kind?.name,
                      maxPrice: double.tryParse(_maxPrice.text.trim()),
                    );
                ref.invalidate(listingAlertsProvider);
                _query.clear();
                _city.clear();
                _area.clear();
                _maxPrice.clear();
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.listingsAlertSaved)),
                );
              } catch (_) {
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.listingsAlertFailed)),
                );
              } finally {
                if (mounted) setState(() => _saving = false);
              }
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.listingsYourAlerts, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          async.when(
            data: (alerts) {
              if (alerts.isEmpty) {
                return Text(l10n.listingsNoAlerts);
              }
              return Column(
                children: [
                  for (final a in alerts)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        [
                          if (a.query != null && a.query!.isNotEmpty) a.query!,
                          if (a.areaLabel != null) a.areaLabel!,
                          if (a.city != null) a.city!,
                          if (a.kind != null) a.kind!,
                        ].where((e) => e.isNotEmpty).join(' · '),
                      ),
                      subtitle: a.maxPrice == null
                          ? null
                          : Text('${l10n.listingsMaxPrice}: ${a.maxPrice}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () async {
                          await ref
                              .read(listingsRepositoryProvider)
                              .deleteAlert(a.id);
                          ref.invalidate(listingAlertsProvider);
                        },
                      ),
                    ),
                ],
              );
            },
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => ErrorState(message: l10n.listingsLoadFailed),
          ),
        ],
      ),
    );
  }
}
