import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../../auth/controllers/profile_role_providers.dart';
import '../models/listing.dart';
import '../repositories/listings_repository.dart';

class CreateListingScreen extends ConsumerStatefulWidget {
  const CreateListingScreen({super.key});

  @override
  ConsumerState<CreateListingScreen> createState() =>
      _CreateListingScreenState();
}

class _CreateListingScreenState extends ConsumerState<CreateListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _city = TextEditingController();
  final _area = TextEditingController();
  final _address = TextEditingController();
  final _state = TextEditingController();
  final _phone = TextEditingController();
  final _bedrooms = TextEditingController();
  final _bathrooms = TextEditingController();
  final _hours = TextEditingController();
  final _services = TextEditingController();

  ListingKind _kind = ListingKind.rental;
  late String _category;
  LatLng? _point;
  final List<String> _photos = [];
  int _coverIndex = 0;
  final Set<String> _amenities = {};
  bool _furnished = false;
  ListingPricePeriod _pricePeriod = ListingPricePeriod.yearly;
  DateTime? _availableFrom;
  bool _saving = false;
  bool _locating = true;

  @override
  void initState() {
    super.initState();
    _category = kListingCategoriesByKind[_kind]!.first;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final role = ref.read(userRoleProvider);
      if (!role.canList && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.listingsPublishFailed)),
        );
        Navigator.of(context).maybePop();
        return;
      }
      await _loadLocation();
    });
  }

  Future<void> _loadLocation() async {
    final result = await ref.read(locationServiceProvider).resolveCurrent();
    if (!mounted) return;
    setState(() {
      _locating = false;
      if (result.location != null) {
        _point = LatLng(result.location!.lat, result.location!.lng);
      } else {
        _point = const LatLng(7.7716, 4.5569); // Osogbo fallback
      }
    });
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _price.dispose();
    _city.dispose();
    _area.dispose();
    _address.dispose();
    _state.dispose();
    _phone.dispose();
    _bedrooms.dispose();
    _bathrooms.dispose();
    _hours.dispose();
    _services.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final categories = kListingCategoriesByKind[_kind]!;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.listingsCreateTitle),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(l10n.listingsKindLabel),
            const SizedBox(height: AppSpacing.sm),
            SegmentedButton<ListingKind>(
              segments: [
                ButtonSegment(
                  value: ListingKind.rental,
                  label: Text(l10n.listingsKindRental),
                ),
                ButtonSegment(
                  value: ListingKind.sale,
                  label: Text(l10n.listingsKindSale),
                ),
                ButtonSegment(
                  value: ListingKind.business,
                  label: Text(l10n.listingsKindBusiness),
                ),
              ],
              selected: {_kind},
              onSelectionChanged: (v) {
                setState(() {
                  _kind = v.first;
                  _category = kListingCategoriesByKind[_kind]!.first;
                });
              },
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<String>(
              key: ValueKey(_kind),
              initialValue:
                  categories.contains(_category) ? _category : categories.first,
              decoration: InputDecoration(labelText: l10n.listingsCategoryLabel),
              items: categories
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c.replaceAll('_', ' ')),
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                if (v != null) setState(() => _category = v);
              },
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _title,
              label: l10n.listingsTitleLabel,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.listingsRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _description,
              label: l10n.listingsDescriptionLabel,
              maxLines: 4,
            ),
            if (_kind != ListingKind.business) ...[
              const SizedBox(height: AppSpacing.md),
              TerravaTextField(
                controller: _price,
                label: l10n.listingsPriceLabel,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(l10n.listingsPricePeriod, style: theme.textTheme.titleSmall),
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  for (final p in ListingPricePeriod.values)
                    ChoiceChip(
                      label: Text(_pricePeriodLabel(l10n, p)),
                      selected: _pricePeriod == p,
                      onSelected: (_) => setState(() => _pricePeriod = p),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.listingsAvailableFrom),
                subtitle: Text(
                  _availableFrom == null
                      ? l10n.listingsPickAvailableFrom
                      : '${_availableFrom!.year}-'
                          '${_availableFrom!.month.toString().padLeft(2, '0')}-'
                          '${_availableFrom!.day.toString().padLeft(2, '0')}',
                ),
                trailing: const Icon(Icons.event_outlined),
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _availableFrom ?? now,
                    firstDate: DateTime(now.year - 1),
                    lastDate: DateTime(now.year + 5),
                  );
                  if (picked != null) {
                    setState(() => _availableFrom = picked);
                  }
                },
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: TerravaTextField(
                      controller: _bedrooms,
                      label: l10n.listingsBedrooms,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TerravaTextField(
                      controller: _bathrooms,
                      label: l10n.listingsBathrooms,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.listingsFurnished),
                value: _furnished,
                onChanged: (v) => setState(() => _furnished = v),
              ),
              Text(l10n.listingsAmenities, style: theme.textTheme.titleSmall),
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  for (final a in kPropertyAmenityOptions)
                    FilterChip(
                      label: Text(a.replaceAll('_', ' ')),
                      selected: _amenities.contains(a),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _amenities.add(a);
                          } else {
                            _amenities.remove(a);
                          }
                        });
                      },
                    ),
                ],
              ),
            ] else ...[
              const SizedBox(height: AppSpacing.md),
              TerravaTextField(
                controller: _hours,
                label: l10n.listingsOpeningHours,
                hint: 'Mon–Sat 9am–8pm',
              ),
              const SizedBox(height: AppSpacing.md),
              TerravaTextField(
                controller: _services,
                label: l10n.listingsServices,
                hint: l10n.listingsServicesHint,
                maxLines: 3,
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _address,
              label: l10n.listingsAddressLabel,
              hint: '12 Ring Road, opposite …',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.listingsRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _area,
              label: l10n.listingsAreaLabel,
              hint: 'Ayekale',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.listingsRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _city,
              label: l10n.listingsCityLabel,
              hint: 'Osogbo',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.listingsRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _state,
              label: l10n.listingsStateLabel,
              hint: 'Osun',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.listingsRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _phone,
              label: l10n.listingsPhoneLabel,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              _locating
                  ? l10n.listingsLocating
                  : l10n.listingsLocationSet(
                      _point!.latitude.toStringAsFixed(4),
                      _point!.longitude.toStringAsFixed(4),
                    ),
            ),
            TextButton(
              onPressed: _loadLocation,
              child: Text(l10n.listingsUseMyLocation),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.listingsPhotosCount(_photos.length, Listing.maxPhotos),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (var i = 0; i < _photos.length; i++)
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _coverIndex = i),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.smAll,
                            border: Border.all(
                              color: i == _coverIndex
                                  ? theme.colorScheme.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: AppRadius.smAll,
                            child: CachedNetworkImage(
                              imageUrl: _photos[i],
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (i == _coverIndex)
                        Positioned(
                          left: 4,
                          bottom: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 1,
                            ),
                            color: theme.colorScheme.primary,
                            child: Text(
                              l10n.listingsCoverBadge,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Material(
                          color: Colors.black54,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: _saving
                                ? null
                                : () => setState(() {
                                      _photos.removeAt(i);
                                      if (_coverIndex >= _photos.length) {
                                        _coverIndex =
                                            _photos.isEmpty ? 0 : _photos.length - 1;
                                      } else if (i < _coverIndex) {
                                        _coverIndex -= 1;
                                      }
                                    }),
                            child: const Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.close_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_photos.length < Listing.maxPhotos)
                  OutlinedButton.icon(
                    onPressed: _saving ? null : _pickPhoto,
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: Text(l10n.listingsAddPhoto),
                  ),
              ],
            ),
            if (_photos.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  l10n.listingsSetCover,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: AppSpacing.xl),
            TerravaButton(
              label: l10n.listingsPublish,
              isLoading: _saving,
              onPressed: _publish,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickPhoto() async {
    if (_photos.length >= Listing.maxPhotos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.listingsPhotosMaxReached(Listing.maxPhotos),
          ),
        ),
      );
      return;
    }
    final picker = ImagePicker();
    final remaining = Listing.maxPhotos - _photos.length;
    final files = await picker.pickMultiImage(
      maxWidth: 1600,
      imageQuality: 85,
      limit: remaining,
    );
    if (files.isEmpty) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(listingsRepositoryProvider);
      for (final file in files.take(remaining)) {
        final bytes = await file.readAsBytes();
        final name = file.name.toLowerCase();
        final ext = name.endsWith('.png')
            ? 'png'
            : name.endsWith('.webp')
                ? 'webp'
                : 'jpg';
        final url = await repo.uploadPhoto(
          listingId: 'draft',
          bytes: bytes,
          ext: ext,
        );
        if (!mounted) return;
        setState(() {
          if (_photos.length < Listing.maxPhotos) {
            _photos.add(url);
          }
        });
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.listingsPhotoFailed)),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _publish() async {
    if (!_formKey.currentState!.validate()) return;
    if (_point == null) return;
    if (_photos.length > Listing.maxPhotos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.listingsPhotosMaxReached(Listing.maxPhotos),
          ),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final listing = await ref.read(listingsRepositoryProvider).create(
            Listing(
              id: '',
              ownerUserId: '',
              kind: _kind,
              category: _category,
              title: _title.text.trim(),
              description: _description.text.trim(),
              price: _kind == ListingKind.business
                  ? null
                  : double.tryParse(_price.text.trim()),
              areaLabel: _area.text.trim().isEmpty ? null : _area.text.trim(),
              address:
                  _address.text.trim().isEmpty ? null : _address.text.trim(),
              city: _city.text.trim(),
              state: _state.text.trim().isEmpty ? null : _state.text.trim(),
              lat: _point!.latitude,
              lng: _point!.longitude,
              photos: _photos.take(Listing.maxPhotos).toList(),
              coverPhotoIndex: _coverIndex.clamp(
                0,
                _photos.isEmpty ? 0 : _photos.length - 1,
              ),
              phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
              pricePeriod: _kind == ListingKind.business ? null : _pricePeriod,
              availableFrom:
                  _kind == ListingKind.business ? null : _availableFrom,
              bedrooms: _kind == ListingKind.business
                  ? null
                  : int.tryParse(_bedrooms.text.trim()),
              bathrooms: _kind == ListingKind.business
                  ? null
                  : int.tryParse(_bathrooms.text.trim()),
              furnished: _kind == ListingKind.business ? null : _furnished,
              amenities:
                  _kind == ListingKind.business ? const [] : _amenities.toList(),
              openingHours: _kind == ListingKind.business
                  ? (_hours.text.trim().isEmpty ? null : _hours.text.trim())
                  : null,
              services: _kind == ListingKind.business
                  ? (_services.text.trim().isEmpty
                      ? null
                      : _services.text.trim())
                  : null,
            ),
          );
      if (!mounted) return;
      context.go(AppRoutes.listingPath(listing.id));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.listingsPublishFailed)),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  String _pricePeriodLabel(AppLocalizations l10n, ListingPricePeriod p) {
    switch (p) {
      case ListingPricePeriod.monthly:
        return l10n.listingsPriceMonthly;
      case ListingPricePeriod.yearly:
        return l10n.listingsPriceYearly;
      case ListingPricePeriod.negotiable:
        return l10n.listingsPriceNegotiable;
      case ListingPricePeriod.total:
        return l10n.listingsPriceTotal;
    }
  }
}
