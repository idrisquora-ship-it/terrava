import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/env.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_map.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../chat/repositories/chat_repository.dart';
import '../models/listing.dart';
import '../repositories/listings_repository.dart';

final listingDetailsProvider =
    FutureProvider.autoDispose.family<Listing?, String>((ref, id) async {
  return ref.watch(listingsRepositoryProvider).byId(id);
});

class ListingDetailsScreen extends ConsumerStatefulWidget {
  const ListingDetailsScreen({super.key, required this.listingId});

  final String listingId;

  @override
  ConsumerState<ListingDetailsScreen> createState() =>
      _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends ConsumerState<ListingDetailsScreen> {
  bool _photoBusy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(listingsRepositoryProvider).recordView(widget.listingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(listingDetailsProvider(widget.listingId));
    final l10n = context.l10n;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      body: async.when(
        data: (listing) {
          if (listing == null) {
            return Center(child: Text(l10n.listingsNotFound));
          }
          final isOwner = user?.id == listing.ownerUserId;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: listing.coverPhoto == null ? 120 : 240,
                pinned: true,
                actions: [
                  IconButton(
                    tooltip: l10n.listingsShare,
                    onPressed: () => _shareListing(listing),
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(listing.title, maxLines: 1),
                  background: listing.coverPhoto == null
                      ? ColoredBox(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )
                      : CachedNetworkImage(
                          imageUrl: listing.coverPhoto!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.listingsListedBadge,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        [
                          listing.kind.name,
                          listing.category.replaceAll('_', ' '),
                        ].join(' · '),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (listing.locationLine.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          listing.locationLine,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                      if (listing.price != null) ...[
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          [
                            '${listing.currency} ${listing.price!.toStringAsFixed(0)}',
                            if (listing.pricePeriod != null)
                              _pricePeriodLabel(l10n, listing.pricePeriod!),
                          ].join(' · '),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ] else if (listing.pricePeriod ==
                          ListingPricePeriod.negotiable) ...[
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          l10n.listingsPriceNegotiable,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                      if (listing.availableFrom != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          '${l10n.listingsAvailableFrom}: '
                          '${listing.availableFrom!.year}-'
                          '${listing.availableFrom!.month.toString().padLeft(2, '0')}-'
                          '${listing.availableFrom!.day.toString().padLeft(2, '0')}',
                        ),
                      ],
                      const SizedBox(height: AppSpacing.md),
                      Text(listing.description),
                      if (listing.ownerVerified) ...[
                        const SizedBox(height: AppSpacing.sm),
                        Chip(
                          avatar: const Icon(Icons.verified_rounded, size: 18),
                          label: Text(l10n.listingsVerifiedBadge),
                        ),
                      ],
                      if (listing.isProperty) ...[
                        const SizedBox(height: AppSpacing.md),
                        Wrap(
                          spacing: AppSpacing.sm,
                          runSpacing: AppSpacing.sm,
                          children: [
                            if (listing.bedrooms != null)
                              Chip(
                                label: Text(
                                  l10n.listingsBedroomsValue(listing.bedrooms!),
                                ),
                              ),
                            if (listing.bathrooms != null)
                              Chip(
                                label: Text(
                                  l10n.listingsBathroomsValue(
                                    listing.bathrooms!,
                                  ),
                                ),
                              ),
                            if (listing.furnished != null)
                              Chip(
                                label: Text(
                                  listing.furnished!
                                      ? l10n.listingsFurnished
                                      : l10n.listingsUnfurnished,
                                ),
                              ),
                            for (final a in listing.amenities)
                              Chip(label: Text(a.replaceAll('_', ' '))),
                          ],
                        ),
                      ],
                      if (listing.kind == ListingKind.business) ...[
                        if (listing.openingHours != null &&
                            listing.openingHours!.isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            '${l10n.listingsOpeningHours}: ${listing.openingHours}',
                          ),
                        ],
                        if (listing.services != null &&
                            listing.services!.isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            '${l10n.listingsServices}: ${listing.services}',
                          ),
                        ],
                      ],
                      if (listing.phone != null &&
                          listing.phone!.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.md),
                        Text('${l10n.listingsPhoneLabel}: ${listing.phone}'),
                      ],
                      if (!isOwner) ...[
                        const SizedBox(height: AppSpacing.md),
                        _SaveListingButton(listingId: listing.id),
                        const SizedBox(height: AppSpacing.sm),
                        TextButton.icon(
                          onPressed: () => _reportListing(listing),
                          icon: const Icon(Icons.flag_outlined),
                          label: Text(l10n.listingsReport),
                        ),
                        TextButton.icon(
                          onPressed: () => context.push(
                            AppRoutes.reportIssue,
                            extra: <String, String?>{
                              'relatedUserId': listing.ownerUserId,
                              'relatedListingId': listing.id,
                              'subject': l10n.reportUserSubject,
                            },
                          ),
                          icon: const Icon(Icons.person_off_outlined),
                          label: Text(l10n.reportUser),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        isOwner
                            ? l10n.listingsManagePhotos
                            : l10n.listingsPhotosCount(
                                listing.photos.length,
                                Listing.maxPhotos,
                              ),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (isOwner)
                        Text(
                          l10n.listingsPhotosCount(
                            listing.photos.length,
                            Listing.maxPhotos,
                          ),
                        ),
                      const SizedBox(height: AppSpacing.sm),
                      if (listing.photos.isNotEmpty || isOwner)
                        SizedBox(
                          height: 96,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < listing.photos.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: AppSpacing.sm,
                                  ),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: isOwner
                                            ? () => _setCover(listing, i)
                                            : null,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: AppRadius.smAll,
                                            border: Border.all(
                                              color: i == listing.safeCoverIndex
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: AppRadius.smAll,
                                            child: CachedNetworkImage(
                                              imageUrl: listing.photos[i],
                                              width: 96,
                                              height: 96,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (i == listing.safeCoverIndex)
                                        Positioned(
                                          left: 4,
                                          bottom: 4,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 1,
                                            ),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            child: Text(
                                              l10n.listingsCoverBadge,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (isOwner)
                                        Positioned(
                                          top: 2,
                                          right: 2,
                                          child: Material(
                                            color: Colors.black54,
                                            shape: const CircleBorder(),
                                            child: InkWell(
                                              customBorder:
                                                  const CircleBorder(),
                                              onTap: _photoBusy
                                                  ? null
                                                  : () => _removePhoto(
                                                        listing,
                                                        i,
                                                      ),
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
                                ),
                              if (isOwner &&
                                  listing.photos.length < Listing.maxPhotos)
                                OutlinedButton.icon(
                                  onPressed: _photoBusy
                                      ? null
                                      : () => _addPhotos(listing),
                                  icon: const Icon(Icons.add_a_photo_outlined),
                                  label: Text(l10n.listingsAddPhoto),
                                ),
                            ],
                          ),
                        ),
                      if (isOwner && listing.photos.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.xs),
                          child: Text(
                            l10n.listingsSetCover,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      const SizedBox(height: AppSpacing.lg),
                      TerravaButton(
                        label: l10n.listingsExploreArea,
                        variant: TerravaButtonVariant.outlined,
                        onPressed: () => context.push(
                          AppRoutes.locationDetailsPath(
                            listing.lat,
                            listing.lng,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: AppRadius.mdAll,
                          child: TerravaMap(
                            center: LatLng(listing.lat, listing.lng),
                            zoom: 14,
                            interactive: false,
                            markers: [
                              terravaPlaceMarker(
                                point: LatLng(listing.lat, listing.lng),
                                label: listing.title,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      if (!isOwner)
                        TerravaButton(
                          label: l10n.chatMessageSeller,
                          onPressed: () async {
                            if (user == null) {
                              context.push(AppRoutes.signIn);
                              return;
                            }
                            try {
                              final id = await ref
                                  .read(chatRepositoryProvider)
                                  .startConversation(
                                    listingId: listing.id,
                                    ownerUserId: listing.ownerUserId,
                                  );
                              if (context.mounted) {
                                context.push(AppRoutes.chatPath(id));
                              }
                            } catch (_) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(l10n.chatStartFailed),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      if (isOwner) ...[
                        TerravaButton(
                          label: l10n.listingsPause,
                          variant: TerravaButtonVariant.outlined,
                          onPressed: () async {
                            await ref.read(listingsRepositoryProvider).update(
                              listing.id,
                              {
                                'status': listing.status == 'active'
                                    ? 'paused'
                                    : 'active',
                              },
                            );
                            ref.invalidate(
                              listingDetailsProvider(widget.listingId),
                            );
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        TerravaButton(
                          label: l10n.commonDelete,
                          variant: TerravaButtonVariant.outlined,
                          onPressed: () async {
                            await ref
                                .read(listingsRepositoryProvider)
                                .delete(listing.id);
                            if (context.mounted) {
                              context.go(AppRoutes.listingsMine);
                            }
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.listingsLoadFailed)),
      ),
    );
  }

  Future<void> _setCover(Listing listing, int index) async {
    if (index == listing.safeCoverIndex) return;
    setState(() => _photoBusy = true);
    try {
      await ref.read(listingsRepositoryProvider).update(
        listing.id,
        {'cover_photo_index': index},
      );
      ref.invalidate(listingDetailsProvider(widget.listingId));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.listingsPhotoFailed)),
      );
    } finally {
      if (mounted) setState(() => _photoBusy = false);
    }
  }

  Future<void> _shareListing(Listing listing) async {
    final base = Env.appWebUrl.isEmpty
        ? 'https://terrava-nine.vercel.app'
        : Env.appWebUrl;
    final url = '$base${AppRoutes.listingPath(listing.id)}';
    await Share.share('${listing.title}\n$url');
  }

  Future<void> _reportListing(Listing listing) async {
    final l10n = context.l10n;
    final user = ref.read(currentUserProvider);
    if (user == null) {
      context.push(AppRoutes.signIn);
      return;
    }
    final reason = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(title: Text(l10n.listingsReportReason)),
              ListTile(
                title: Text(l10n.listingsReportSpam),
                onTap: () => Navigator.pop(context, l10n.listingsReportSpam),
              ),
              ListTile(
                title: Text(l10n.listingsReportWrongInfo),
                onTap: () =>
                    Navigator.pop(context, l10n.listingsReportWrongInfo),
              ),
              ListTile(
                title: Text(l10n.listingsReportInappropriate),
                onTap: () =>
                    Navigator.pop(context, l10n.listingsReportInappropriate),
              ),
              ListTile(
                title: Text(l10n.listingsReportOther),
                onTap: () => Navigator.pop(context, l10n.listingsReportOther),
              ),
            ],
          ),
        );
      },
    );
    if (reason == null || !mounted) return;
    try {
      await ref.read(listingsRepositoryProvider).reportListing(
            listingId: listing.id,
            reason: reason,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.listingsReportSubmitted)),
      );
    } catch (e) {
      if (!mounted) return;
      final msg = e.toString().contains('duplicate') ||
              e.toString().contains('unique')
          ? l10n.listingsReportAlready
          : l10n.listingsReportFailed;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
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

  Future<void> _addPhotos(Listing listing) async {
    final remaining = Listing.maxPhotos - listing.photos.length;
    if (remaining <= 0) {
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
    final files = await picker.pickMultiImage(
      maxWidth: 1600,
      imageQuality: 85,
      limit: remaining,
    );
    if (files.isEmpty) return;
    setState(() => _photoBusy = true);
    try {
      final urls = List<String>.from(listing.photos);
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
          listingId: listing.id,
          bytes: bytes,
          ext: ext,
        );
        urls.add(url);
        if (urls.length >= Listing.maxPhotos) break;
      }
      await repo.update(listing.id, {'photos': urls});
      ref.invalidate(listingDetailsProvider(widget.listingId));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.listingsPhotoFailed)),
      );
    } finally {
      if (mounted) setState(() => _photoBusy = false);
    }
  }

  Future<void> _removePhoto(Listing listing, int index) async {
    setState(() => _photoBusy = true);
    try {
      final urls = List<String>.from(listing.photos)..removeAt(index);
      var cover = listing.safeCoverIndex;
      if (urls.isEmpty) {
        cover = 0;
      } else if (index == cover) {
        cover = 0;
      } else if (index < cover) {
        cover -= 1;
      }
      if (cover >= urls.length) cover = 0;
      await ref.read(listingsRepositoryProvider).update(
        listing.id,
        {
          'photos': urls,
          'cover_photo_index': cover,
        },
      );
      ref.invalidate(listingDetailsProvider(widget.listingId));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.listingsPhotoFailed)),
      );
    } finally {
      if (mounted) setState(() => _photoBusy = false);
    }
  }
}

class _SaveListingButton extends ConsumerStatefulWidget {
  const _SaveListingButton({required this.listingId});

  final String listingId;

  @override
  ConsumerState<_SaveListingButton> createState() => _SaveListingButtonState();
}

class _SaveListingButtonState extends ConsumerState<_SaveListingButton> {
  bool? _saved;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final saved =
          await ref.read(listingsRepositoryProvider).isSaved(widget.listingId);
      if (mounted) setState(() => _saved = saved);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final saved = _saved ?? false;
    return TerravaButton(
      label: saved ? l10n.listingsUnsave : l10n.listingsSave,
      variant: TerravaButtonVariant.outlined,
      isLoading: _busy || _saved == null,
      onPressed: () async {
        final user = ref.read(currentUserProvider);
        if (user == null) {
          context.push(AppRoutes.signIn);
          return;
        }
        setState(() => _busy = true);
        try {
          final repo = ref.read(listingsRepositoryProvider);
          if (saved) {
            await repo.unsaveListing(widget.listingId);
          } else {
            await repo.saveListing(widget.listingId);
          }
          if (mounted) setState(() => _saved = !saved);
        } finally {
          if (mounted) setState(() => _busy = false);
        }
      },
    );
  }
}
