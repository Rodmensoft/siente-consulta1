import 'package:siente_app/app/data/provider/configuracion_app_api.dart';
import 'package:get/instance_manager.dart';

class ConfiguracionService {
  final ConfiguracionApi _authApi = Get.find<ConfiguracionApi>();

  Future<void> getService() {
    return _authApi.getApi();
  }
}
