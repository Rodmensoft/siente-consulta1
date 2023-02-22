import 'package:siente_app/app/ui/pages/mapview_page/mapview_controller.dart';
import 'package:get/get.dart';

class MapViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapViewController>(() => MapViewController(), fenix: true);
  }
}
