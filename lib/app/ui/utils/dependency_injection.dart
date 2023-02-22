import 'package:siente_app/app/data/provider/auth_api.dart';
import 'package:siente_app/app/data/provider/configuracion_app_api.dart';
import 'package:siente_app/app/data/provider/datos_proyecto_api.dart';
import 'package:siente_app/app/data/provider/indicadores_globales_api.dart';
import 'package:siente_app/app/data/provider/vista_lista_api.dart';
import 'package:siente_app/app/data/services/auth_service.dart';
import 'package:siente_app/app/data/services/configuracion_app_service.dart';
import 'package:siente_app/app/data/services/datos_proyecto_service.dart';
import 'package:siente_app/app/data/services/indicadores_globales_service.dart';
import 'package:siente_app/app/data/services/vista_lista_service.dart';
import 'package:siente_app/app/ui/utils/api_base_url.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class DependencyInjection {
  static void init() {
    Get.put(Dio(BaseOptions(
      baseUrl: ApiBaseURL.baseUrl,
    )));

    ///PROVIDERS
    Get.put(AuthApi());
    Get.put(ConfiguracionApi());
    Get.put(IndicadoresGlobalesApi());
    Get.put(VistaListaConsultaApi());
    Get.put(DatosProyectoApi());

    ///SERVICES
    Get.put(AuthService());
    Get.put(ConfiguracionService());
    Get.put(IndicadoresGlobalesService());
    Get.put(VistaListaConsultaService());
    Get.put(DatosProyectoService());
  }
}
