import 'package:fluster/fluster.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarker extends Clusterable {
  MapMarker({
    required this.id,
    required this.position,
    required this.onTap,
    this.icon,
    bool isCluster = false,
    int? clusterId,
    int? pointsSize,
    String? childMarkerId,
  }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
          isCluster: isCluster,
          clusterId: clusterId,
          pointsSize: pointsSize,
          childMarkerId: childMarkerId,
        );
  final String id;
  final LatLng position;
  BitmapDescriptor? icon;
  void Function()? onTap;

  Marker toMarker() => Marker(
        markerId: MarkerId(isCluster! ? 'cl_$id' : id),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        icon: icon!,
        onTap: onTap,
      );
}
