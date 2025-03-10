import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siente_app/app/ui/utils/map_marker.dart';

class MapHelper {
  static Future<BitmapDescriptor> getMarkerImageFromUrl(String url,
      {int width = 80}) async {
    final File markerImageFile = await DefaultCacheManager().getSingleFile(url);

    Uint8List markerImageBytes = await markerImageFile.readAsBytes();

    markerImageBytes = await _resizeImageBytes(
      markerImageBytes,
      width,
    );

    return BitmapDescriptor.fromBytes(markerImageBytes);
  }

  static Future<Uint8List> _resizeImageBytes(
    Uint8List imageBytes,
    int targetWidth,
  ) async {
    final Codec imageCodec = await instantiateImageCodec(
      imageBytes,
      targetWidth: targetWidth,
    );

    final FrameInfo frameInfo = await imageCodec.getNextFrame();

    final ByteData? data =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return data!.buffer.asUint8List();
  }

  static Future<BitmapDescriptor> _getClusterMarker(
    int clusterSize,
    Color clusterColor,
    Color textColor,
    int width,
  ) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = clusterColor;
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final double radius = width / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      paint,
    );

    textPainter.text = TextSpan(
      text: clusterSize.toString(),
      style: TextStyle(
        fontSize: radius - 5,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(radius - textPainter.width / 2, radius - textPainter.height / 2),
    );

    // ignore: always_specify_types
    final image = await pictureRecorder.endRecording().toImage(
          radius.toInt() * 2,
          radius.toInt() * 2,
        );
    final ByteData? data = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  static late int selectedClusterId;
  static Future<Fluster<MapMarker>> initClusterManager(
    List<MapMarker> markers,
    int minZoom,
    int maxZoom,
  ) async {
    return Fluster<MapMarker>(
      minZoom: minZoom,
      maxZoom: maxZoom,
      radius: 150,
      extent: 2048,
      nodeSize: 64,
      points: markers,
      createCluster: (
        BaseCluster? cluster,
        double? lng,
        double? lat,
      ) =>
          MapMarker(
        id: cluster!.id.toString(),
        position: LatLng(lat!, lng!),
        isCluster: cluster.isCluster,
        clusterId: cluster.id,
        pointsSize: cluster.pointsSize,
        childMarkerId: cluster.childMarkerId,
        onTap: () {
          // homeCtrl.getClusterMarkers(cluster.id!);

          // List<MapMarker> points = _clusterManager!.points(clusterId);
        },
      ),
    );
  }

  static Future<List<Marker>> getClusterMarkers(
    Fluster<MapMarker>? clusterManager,
    double currentZoom,
    Color clusterColor,
    Color clusterTextColor,
    int clusterWidth,
    void Function()? onTap,
  ) {
    if (clusterManager == null) {
      // ignore: always_specify_types
      return Future.value([]);
    }

    return Future.wait(clusterManager.clusters(
      <double>[-180, -85, 180, 85],
      currentZoom.toInt(),
    ).map((MapMarker mapMarker) async {
      if (mapMarker.isCluster!) {
        mapMarker.icon = await _getClusterMarker(
          mapMarker.pointsSize!,
          clusterColor,
          clusterTextColor,
          clusterWidth,
        );
      }

      return mapMarker.toMarker();
    }).toList());
  }
}
