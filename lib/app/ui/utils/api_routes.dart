import 'package:dio/dio.dart';
import 'package:siente_app/app/ui/utils/user_preferences.dart';

class ApiRoutes {
  static const String login = '/login';
  static const String configuracionApp = '/configuracion-app';
  static const String indicadoresGlobales = '/indicadores-globales';
  static const String vistaListaConsulta = '/vista-lista-consulta';
  static const String detalleProyecto = '/detalle-proyecto';
}

class ApiOptions {
  static Options options(UserPreferences prefs) {
    return Options(headers: <String, dynamic>{'Authorization': prefs.token});
  }

  static Options optionsHeaders() {
    return Options(headers: <String, String>{
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers':
          // ignore: lines_longer_than_80_chars
          'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
      'Access-Control-Allow-Methods': 'POST, OPTIONS'
    });
  }
}
