// import 'package:siente_app/main.dart';
import 'package:get/get.dart';
import 'package:siente_app/app/routes/app_routes.dart';
import 'package:siente_app/main.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    goToNextPage();
  }

  Future<void> goToNextPage() async {
    // ignore: always_specify_types
    await Future.delayed(const Duration(seconds: 4));

    prefs.token.isNotEmpty
        ? Get.offAllNamed(AppRoutes.home)
        : Get.offAllNamed(AppRoutes.login);
  }
}
