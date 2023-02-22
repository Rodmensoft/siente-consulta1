import 'package:get/instance_manager.dart';
import 'package:siente_app/app/data/models/remote/indicadores_globales.dart';
import 'package:siente_app/app/data/provider/indicadores_globales_api.dart';

class IndicadoresGlobalesService {
  final IndicadoresGlobalesApi _api = Get.find<IndicadoresGlobalesApi>();
  Future<IndicadoresGlobales?> getIndicadorByCategory({required int codigo}) =>
      _api.getIndicadorByCategory(codigo);

  Future<List<IndicadoresGlobales>> getIndicadoresGlobales() =>
      _api.getIndicadoresGlobales();
}
