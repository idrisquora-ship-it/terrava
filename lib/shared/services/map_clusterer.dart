import 'package:latlong2/latlong.dart';

import '../models/place_models.dart';

/// Lightweight grid clustering (no third-party dependency required at runtime).
class PlaceClusterItem {
  const PlaceClusterItem(this.place);
  final PlaceSummary place;
  LatLng get location => LatLng(place.lat!, place.lng!);
}

class ClusterBucket {
  ClusterBucket(this.items);
  final List<PlaceClusterItem> items;

  LatLng get center {
    final lat = items.map((e) => e.location.latitude).reduce((a, b) => a + b) /
        items.length;
    final lng =
        items.map((e) => e.location.longitude).reduce((a, b) => a + b) /
            items.length;
    return LatLng(lat, lng);
  }
}

class MapClusterer {
  const MapClusterer();

  List<ClusterBucket> cluster({
    required List<PlaceSummary> places,
    required double zoom,
  }) {
    final items = places
        .where((p) => p.lat != null && p.lng != null)
        .map(PlaceClusterItem.new)
        .toList();

    final cell = zoom >= 15
        ? 0.005
        : zoom >= 13
            ? 0.02
            : zoom >= 11
                ? 0.05
                : 0.12;

    final buckets = <String, List<PlaceClusterItem>>{};
    for (final item in items) {
      final key =
          '${(item.location.latitude / cell).floor()}:${(item.location.longitude / cell).floor()}';
      buckets.putIfAbsent(key, () => []).add(item);
    }
    return buckets.values.map(ClusterBucket.new).toList();
  }
}
