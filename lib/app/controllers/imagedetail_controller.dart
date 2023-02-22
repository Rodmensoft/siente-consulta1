import 'package:get/get.dart';

class ImageDetailController extends GetxController {
  final String image = Get.arguments[0] as String;
  final int index = Get.arguments[1] as int;
}
