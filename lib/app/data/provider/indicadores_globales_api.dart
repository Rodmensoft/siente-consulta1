import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:siente_app/app/data/models/remote/indicadores_globales.dart';
import 'package:siente_app/app/ui/utils/api_routes.dart';
import 'package:siente_app/main.dart';

class IndicadoresGlobalesApi {
  final Dio _dio = Get.find<Dio>();
  Future<IndicadoresGlobales?> getIndicadorByCategory(
    int codigo,
  ) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'codigocategoria': codigo,
      };
      final Response<dynamic> response = await _dio.post(
        ApiRoutes.indicadoresGlobales,
        data: data,
        options: ApiOptions.options(prefs),
      );
      if (response.statusCode == 200) {
        if (response.data == <dynamic>[]) {
          return null;
        }
        return indicadoresGlobalesFromJson(json.encode(response.data[0]));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<IndicadoresGlobales>> getIndicadoresGlobales() async {
    try {
      final Response<dynamic> response = await _dio.post(
        ApiRoutes.indicadoresGlobales,
        data: {},
        options: ApiOptions.options(prefs),
      );
      if (response.statusCode == 200) {
        if (response.data == <dynamic>[]) {
          return [];
        }
        return indicadoresGlobalesFromJsonList(json.encode(response.data));
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
