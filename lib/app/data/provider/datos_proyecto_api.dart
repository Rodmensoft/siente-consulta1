import 'dart:convert';

import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/utils/api_routes.dart';
import 'package:siente_app/main.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class DatosProyectoApi {
  final Dio _dio = Get.find<Dio>();
  Future<DatosProyecto?> getApi(
    int codigoProyecto,
    double latitud,
    double longitud,
  ) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'codigousuario': 0,
        'codigoproyecto': codigoProyecto,
        'latitud': latitud,
        'longitud': longitud
      };
      final Response<dynamic> response = await _dio.post(
        ApiRoutes.detalleProyecto,
        data: data,
        options: ApiOptions.options(prefs),
      );
      if (response.statusCode == 200) {
        return datosProyectoFromJson(json.encode(response.data));
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
