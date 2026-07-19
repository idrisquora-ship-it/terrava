import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../core/config/env.dart';
import '../../core/theme/app_tokens.dart';

/// Cross-platform Mapbox-backed map (Android + Web via flutter_map tiles).
class TerravaMap extends StatelessWidget {
  const TerravaMap({
    super.key,
    required this.center,
    this.zoom = 14,
    this.markers = const [],
    this.polylines = const [],
    this.onMapReady,
    this.onPositionChanged,
    this.mapController,
    this.showMyLocationDot = false,
    this.myLocation,
    this.interactive = true,
  });

  final LatLng center;
  final double zoom;
  final List<Marker> markers;
  final List<Polyline> polylines;
  final void Function(MapController controller)? onMapReady;
  final void Function(MapCamera camera)? onPositionChanged;
  final MapController? mapController;
  final bool showMyLocationDot;
  final LatLng? myLocation;
  final bool interactive;

  static String tileUrl({required bool dark}) {
    final style = dark ? 'dark-v11' : 'streets-v12';
    final token = Env.mapboxAccessToken;
    return 'https://api.mapbox.com/styles/v1/mapbox/$style/tiles/256/{z}/{x}/{y}'
        '@2x?access_token=$token';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = mapController ?? MapController();
    final allMarkers = [
      ...markers,
      if (showMyLocationDot && myLocation != null)
        Marker(
          point: myLocation!,
          width: 18,
          height: 18,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.sage,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(blurRadius: 4, color: Color(0x44000000)),
              ],
            ),
          ),
        ),
    ];

    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: center,
        initialZoom: zoom,
        interactionOptions: InteractionOptions(
          flags: interactive
              ? InteractiveFlag.all
              : InteractiveFlag.none,
        ),
        onMapReady: () => onMapReady?.call(controller),
        onPositionChanged: (camera, _) => onPositionChanged?.call(camera),
      ),
      children: [
        TileLayer(
          urlTemplate: tileUrl(dark: isDark),
          userAgentPackageName: 'com.terrava.terrava',
          maxZoom: 20,
        ),
        if (polylines.isNotEmpty) PolylineLayer(polylines: polylines),
        if (allMarkers.isNotEmpty) MarkerLayer(markers: allMarkers),
      ],
    );
  }
}

Marker terravaPlaceMarker({
  required LatLng point,
  required String label,
  VoidCallback? onTap,
  Color color = AppColors.forest,
}) {
  return Marker(
    point: point,
    width: 40,
    height: 40,
    child: GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: label,
        child: Icon(Icons.location_on, color: color, size: 36),
      ),
    ),
  );
}
