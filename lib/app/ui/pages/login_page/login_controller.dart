import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siente_app/app/data/services/auth_service.dart';
import 'package:siente_app/app/routes/app_routes.dart';
import 'package:siente_app/app/ui/global_widgets/customed_toast.dart';
import 'package:siente_app/main.dart';

class LoginController extends GetxController {
  //SERVICIOS
  final AuthService _authService = Get.find<AuthService>();

  TextEditingController userCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  FocusNode userNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  bool loading = false;
  bool failed = false;

  @override
  void onInit() {
    super.onInit();
    setInitData();
    userCtrl.text = 'interkont@2';
    passwordCtrl.text = 'Int4rkont*_22';
  }

  Future<void> login() async {
    userCtrl.text = 'interkont@2';
    passwordCtrl.text = 'Int4rkont*_22';

    update(<Object>['failed_field']);

    failed = false;
    if (userCtrl.text == '') {
      buildCustomedToast(
        message: 'Ingrese su usuario',
        snackPosition: SnackPosition.BOTTOM,
        bottom: 10,
      );
      userNode.requestFocus();
      update(<Object>['user_field', 'password_field']);
      return;
    }
    if (passwordCtrl.text == '') {
      buildCustomedToast(
        message: 'Ingrese su contraseña',
        snackPosition: SnackPosition.BOTTOM,
        bottom: 10,
      );
      passwordNode.requestFocus();
      update(<Object>['user_field', 'password_field']);
      return;
    }
    Get.focusScope!.unfocus();
    loading = true;

    update(<Object>['button_field']);

    final bool succeed = await _authService.login(
      user: userCtrl.text,
      password: passwordCtrl.text,
    );

    if (succeed) {
      // ignore: unused_local_variable

      buildCustomedToast(
        message: 'Bienvenido ${prefs.user}',
        snackPosition: SnackPosition.BOTTOM,
        bottom: 160,
      );

      failed = false;
      loading = false;
      update(<Object>['button_field']);
      update(<Object>['failed_field']);
      Get.offAllNamed(AppRoutes.home);
      return;
    }
    passwordCtrl.clear();
    loading = false;
    failed = true;

    update(<Object>['button_field']);
    update(<Object>['failed_field']);
  }

  void setInitData() {}

  void nextFocus() {
    if (userCtrl.text == '') return;
    passwordNode.requestFocus();
    update(<Object>['user_field', 'password_field']);
  }

  void focusUsuario() {
    userNode.requestFocus();
    update(<Object>['user_field', 'password_field']);
  }

  void focusPassword() {
    passwordNode.requestFocus();
    update(<Object>['user_field', 'password_field']);
  }
}
