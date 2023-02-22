import 'package:get/get.dart';

import 'listview_controller.dart';

class ListViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ListViewController(), permanent: true);
  }
}
