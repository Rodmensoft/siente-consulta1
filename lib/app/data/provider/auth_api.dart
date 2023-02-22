import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:siente_app/app/ui/utils/api_routes.dart';
import 'package:siente_app/main.dart';

class AuthApi {
  final Dio _dio = Get.find<Dio>();

  Future<bool> login(String usuario, String contrasena) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'usuario': usuario,
        'contrasena': contrasena
      };
      final Response<dynamic> response = await _dio.post(
        ApiRoutes.login,
        data: data,
        options: ApiOptions.optionsHeaders(),
      );
      if (response.statusCode == 200) {
        prefs.token = response.headers['authorization']![0];
        prefs.user = usuario;
      }
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
