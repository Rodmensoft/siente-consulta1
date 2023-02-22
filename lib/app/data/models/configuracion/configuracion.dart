import 'dart:convert';

ConfiguracionApp configuracionAppFromJson(String str) =>
    ConfiguracionApp.fromJson(json.decode(str) as Map<String, dynamic>);

String configuracionAppToJson(ConfiguracionApp data) =>
    json.encode(data.toJson());

class ConfiguracionApp {
  ConfiguracionApp({
    required this.endpoint,
    required this.endpointimagenes,
    required this.tipomoneda,
    required this.keygmaps,
    required this.formatofecha,
  });

  factory ConfiguracionApp.fromJson(Map<String, dynamic> json) =>
      ConfiguracionApp(
        endpoint: json['endpoint'] as String,
        endpointimagenes: json['endpointimagenes'] as String,
        tipomoneda: json['tipomoneda'] as String,
        keygmaps: json['keygmaps'] as String,
        formatofecha: json['formatofecha'] as String,
      );
  final String endpoint;
  final String endpointimagenes;
  final String tipomoneda;
  final String keygmaps;
  final String formatofecha;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endpoint': endpoint,
        'endpointimagenes': endpointimagenes,
        'tipomoneda': tipomoneda,
        'keygmaps': keygmaps,
        'formatofecha': formatofecha,
      };
}
