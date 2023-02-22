import 'package:siente_app/app/data/models/remote/vista_lista.dart';
import 'package:siente_app/app/data/provider/vista_lista_api.dart';
import 'package:get/instance_manager.dart';

class VistaListaConsultaService {
  final VistaListaConsultaApi _api = Get.find<VistaListaConsultaApi>();
  Future<List<VistaListaConsulta>> getService({
    int categoriaproyecto = 0,
    String nombreProyecto = '',
    double latitud = 0.0,
    double longitud = 0.0,
  }) =>
      _api.getApi(categoriaproyecto, nombreProyecto, latitud, longitud);
}
