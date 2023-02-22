import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/data/provider/datos_proyecto_api.dart';
import 'package:get/instance_manager.dart';

class DatosProyectoService {
  final DatosProyectoApi _api = Get.find<DatosProyectoApi>();
  Future<DatosProyecto?> getService({
    required int codigoProyecto,
    double latitud = 0.0,
    double longitud = 0.0,
  }) =>
      _api.getApi(codigoProyecto, latitud, longitud);
}
