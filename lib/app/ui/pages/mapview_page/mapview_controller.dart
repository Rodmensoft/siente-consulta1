import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';

class MapViewController extends GetxController {
  late CameraPosition initGMapPosition;
  // ignore: always_specify_types

  final HomeController _homeCtrl = Get.find<HomeController>();
  @override
  void onInit() {
    super.onInit();
    initGMapPosition = const CameraPosition(
      target: LatLng(0.0, 0.0),
    );
  }

  @override
  void onClose() {
    super.onClose();
    // ignore: always_specify_types
    HomeController.gmapController = Completer();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    await _homeCtrl.getUserCurrentLocation();
    const CameraPosition cameraPosition = CameraPosition(
      target: LatLng(0.0, 0.0),
    );
    try {
      HomeController.gmapController.complete(controller);
      // ignore: empty_catches
    } catch (e) {}
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    goToCurrentPosition();
  }

  Future<void> goToCurrentPosition() async {
    // ignore: alw ays_specify_types
    final GoogleMapController controller =
        await HomeController.gmapController.future;
    await controller.animateCamera(
      CameraUpdate.newLatLngBounds(_homeCtrl.bounds, 80),
    );
  }
}
