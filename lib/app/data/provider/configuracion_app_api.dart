import 'dart:convert';

import 'package:siente_app/app/ui/global_widgets/customed_toast.dart';
import 'package:siente_app/app/ui/utils/api_routes.dart';
import 'package:siente_app/main.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as x;

class ConfiguracionApi {
  final Dio _dio = x.Get.find<Dio>();

  Future<void> getApi() async {
    try {
      final Response<dynamic> response = await _dio.get(
        ApiRoutes.configuracionApp,
        options: ApiOptions.options(prefs),
      );
      if (response.statusCode == 200) {
        String endpoint;
        endpoint = json.encode(response.data['endpointimagenes']);
        endpoint = endpoint.substring(1, endpoint.length - 2);
        prefs.imagesUrl = endpoint;
        //////////////////////////////////////////////////////////
        String gmaps;
        gmaps = json.encode(response.data['keygmaps']);
        prefs.gmaps = gmaps;
      }
      return;
    } catch (e) {
      prefs.clear();
      // x.Get.offNamed(AppRoutes.login);
      buildCustomedToast(
        message: 'Su sesión venció. Por favor, vuelva a iniciar sesión',
        snackPosition: x.SnackPosition.BOTTOM,
        bottom: 10,
      );
      return;
    }
  }
}
