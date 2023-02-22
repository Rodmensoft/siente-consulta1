import 'dart:convert';

import 'package:siente_app/app/data/models/remote/vista_lista.dart';
import 'package:siente_app/app/ui/utils/api_routes.dart';
import 'package:siente_app/main.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class VistaListaConsultaApi {
  final Dio _dio = Get.find<Dio>();
  Future<List<VistaListaConsulta>> getApi(
    int categoriaproyecto,
    String nombreProyecto,
    double latitud,
    double longitud,
  ) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'codigousuario': 0,
        'filtroproyectos': <String, dynamic>{
          'categoriaproyecto': categoriaproyecto,
          'nombreproyecto': nombreProyecto,
        },
        'latitud': latitud,
        'longitud': longitud
      };
      final Response<dynamic> response = await _dio.post(
        ApiRoutes.vistaListaConsulta,
        data: data,
        options: ApiOptions.options(prefs),
      );
      if (response.statusCode == 200) {
        final List<VistaListaConsulta> lista = <VistaListaConsulta>[];
        for (final dynamic item in response.data) {
          lista.add(vistaConsultaFromJson(json.encode(item)));
        }
        return lista;
      }
      return <VistaListaConsulta>[];
    } catch (e) {
      return <VistaListaConsulta>[];
    }
  }
}
