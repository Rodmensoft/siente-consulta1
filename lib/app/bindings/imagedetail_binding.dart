
import 'package:get/get.dart';
import '../controllers/imagedetail_controller.dart';


class ImageDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageDetailController>(() => ImageDetailController());
  }
}