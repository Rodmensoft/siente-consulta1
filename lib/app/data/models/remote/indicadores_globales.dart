import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';

import '../sample_data.dart';

List<IndicadoresGlobales> indicadoresGlobalesFromJsonList(String str) =>
    List<IndicadoresGlobales>.from(
        json.decode(str).map((x) => IndicadoresGlobales.fromJson(x)));
IndicadoresGlobales indicadoresGlobalesFromJson(String str) =>
    IndicadoresGlobales.fromJson(json.decode(str));

String indicadoresGlobalesToJson(List<IndicadoresGlobales> data) => json.encode(
    List<dynamic>.from(data.map((IndicadoresGlobales x) => x.toJson())));

final NumberFormat numberFormat = NumberFormat('#,##0', 'es_AR');
final NumberFormat currencyFormat = NumberFormat('#,##0.00', 'es_AR');

class IndicadoresGlobales {
  IndicadoresGlobales({
    required this.codigocategoria,
    required this.colorcategoria,
    this.botoncategoriaactivo,
    this.botoncategoriainactivo,
    this.logototalavanceproyectos,
    this.logototalempleosdirectos,
    this.logototalempleosindirectos,
    this.logototalhabitantesbeneficiados,
    this.logototalproyectos,
    this.logototalproyectosejecucion,
    this.logototalproyectosiniciar,
    this.logototalproyectosterminados,
    this.logototalvalorejecutadoproyectos,
    this.logototalvalorproyectos,
    this.nombrecategoria,
    this.totalavanceproyectos,
    this.totalempleosdirectos,
    this.totalempleosindirectos,
    this.totalhabitantesbeneficiados,
    this.totalproyectos,
    this.totalproyectosejecucion,
    this.totalproyectosiniciar,
    this.totalproyectosterminados,
    this.totalvalorejecutadoproyectos,
    this.totalvalorproyectos,
  });
  factory IndicadoresGlobales.fromJson(Map<String, dynamic> json) =>
      IndicadoresGlobales(
        totalvalorproyectos: json['totalvalorproyectos'] == null
            ? 0
            : json['totalvalorproyectos'].toDouble() as double,
        logototalvalorproyectos: json['logototalvalorproyectos'] == null
            ? ''
            : json['logototalvalorproyectos'] as String,
        totalvalorejecutadoproyectos:
            json['totalvalorejecutadoproyectos'] == null
                ? 0
                : json['totalvalorejecutadoproyectos'].toDouble() as double,
        logototalvalorejecutadoproyectos:
            json['logototalvalorejecutadoproyectos'] == null
                ? ''
                : json['logototalvalorejecutadoproyectos'] as String,
        totalavanceproyectos: json['totalavanceproyectos'] == null
            ? 0
            : json['totalavanceproyectos'].toDouble() as double,
        logototalavanceproyectos: json['logototalavanceproyectos'] == null
            ? ''
            : json['logototalavanceproyectos'] as String,
        totalempleosdirectos: json['totalempleosdirectos'] == null
            ? 0
            : json['totalempleosdirectos'] as int,
        logototalempleosdirectos: json['logototalempleosdirectos'] == null
            ? ''
            : json['logototalempleosdirectos'] as String,
        totalempleosindirectos: json['totalempleosindirectos'] == null
            ? 0
            : json['totalempleosindirectos'] as int,
        logototalempleosindirectos:
            json['logototalempleosindirectos'] as String,
        totalhabitantesbeneficiados: json['totalhabitantesbeneficiados'] == null
            ? 0
            : json['totalhabitantesbeneficiados'].toDouble() as double,
        logototalhabitantesbeneficiados:
            json['logototalhabitantesbeneficiados'] as String,
        totalproyectos:
            json['totalproyectos'] == null ? 0 : json['totalproyectos'] as int,
        logototalproyectos: json['logototalproyectos'] == null
            ? ''
            : json['logototalproyectos'] as String,
        totalproyectosejecucion: json['totalproyectosejecucion'] == null
            ? 0
            : json['totalproyectosejecucion'] as int,
        logototalproyectosejecucion: json['logototalproyectosejecucion'] == null
            ? ''
            : json['logototalproyectosejecucion'] as String,
        totalproyectosiniciar: json['totalproyectosiniciar'] == 0
            ? 0
            : json['totalproyectosiniciar'] as int,
        logototalproyectosiniciar: json['logototalproyectosiniciar'] == null
            ? ''
            : json['logototalproyectosiniciar'] as String,
        totalproyectosterminados: json['totalproyectosterminados'] == null
            ? 0
            : json['totalproyectosterminados'] as int,
        logototalproyectosterminados:
            json['logototalproyectosterminados'] == null
                ? ''
                : json['logototalproyectosterminados'] as String,
        codigocategoria: json['codigocategoria'] == null
            ? 0
            : json['codigocategoria'] as int,
        nombrecategoria: json['nombrecategoria'] == null
            ? ''
            : json['nombrecategoria'] as String,
        colorcategoria: json['colorcategoria'] as String,
        botoncategoriainactivo: json['botoncategoriainactivo'] as String,
        botoncategoriaactivo: json['botoncategoriaactivo'] as String,
      );

  final double? totalvalorproyectos;
  final String? logototalvalorproyectos;
  final double? totalvalorejecutadoproyectos;
  final String? logototalvalorejecutadoproyectos;
  final double? totalavanceproyectos;
  final String? logototalavanceproyectos;
  final int? totalempleosdirectos;
  final String? logototalempleosdirectos;
  final int? totalempleosindirectos;
  final String? logototalempleosindirectos;
  final double? totalhabitantesbeneficiados;
  final String? logototalhabitantesbeneficiados;
  final int? totalproyectos;
  final String? logototalproyectos;
  final int? totalproyectosejecucion;
  final String? logototalproyectosejecucion;
  final int? totalproyectosiniciar;
  final String? logototalproyectosiniciar;
  final int? totalproyectosterminados;
  final String? logototalproyectosterminados;
  final int codigocategoria;
  final String? nombrecategoria;
  final String colorcategoria;
  final String? botoncategoriainactivo;
  final String? botoncategoriaactivo;
  final bool isSelected = false;

  Color get colorCategoria {
    //CONVIERTE EL STRING A UN COLOR ADMITIDO POR DART
    final String newColor = colorcategoria.replaceAll('#', '0XFF');
    return Color(int.parse(newColor));
  }

  String get poblacionBeneficiada {
    final String poblacionBeneficiada =
        numberFormat.format(totalhabitantesbeneficiados);
    return poblacionBeneficiada;
  }

  String get totalDeProyectos {
    return totalproyectos.toString();
  }

  String get totalEjecutado {
    final double totalEjecutadoRedondeado =
        totalvalorejecutadoproyectos! / 1000000;
    final String totalEjecutado =
        currencyFormat.format(totalEjecutadoRedondeado);
    if (totalEjecutado == '0,00') return '\$ 0';
    return '\$ ${totalEjecutado}M';
  }

  String get totalInvertido {
    final double totalValorProyecto = totalvalorproyectos! / 1000000;
    final String totalInvertido = currencyFormat.format(totalValorProyecto);
    if (totalInvertido == '0,00') return '\$ 0';
    return '\$ ${totalInvertido}M';
  }

  String get avanceGlobal {
    final String avanceGlobal = totalavanceproyectos!.toStringAsFixed(2);
    return '$avanceGlobal%';
  }

  String get formattedNombreCat =>
      capitalizeExceptConnectors(nombrecategoria ?? '');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'totalvalorproyectos': totalvalorproyectos,
      'logototalvalorproyectos': logototalvalorproyectos,
      'totalvalorejecutadoproyectos': totalvalorejecutadoproyectos,
      'logototalvalorejecutadoproyectos': logototalvalorejecutadoproyectos,
      'totalavanceproyectos': totalavanceproyectos,
      'logototalavanceproyectos': logototalavanceproyectos,
      'totalempleosdirectos': totalempleosdirectos,
      'logototalempleosdirectos': logototalempleosdirectos,
      'totalempleosindirectos': totalempleosindirectos,
      'logototalempleosindirectos': logototalempleosindirectos,
      'totalhabitantesbeneficiados': totalhabitantesbeneficiados,
      'logototalhabitantesbeneficiados': logototalhabitantesbeneficiados,
      'totalproyectos': totalproyectos,
      'logototalproyectos': logototalproyectos,
      'totalproyectosejecucion': totalproyectosejecucion,
      'logototalproyectosejecucion': logototalproyectosejecucion,
      'totalproyectosiniciar': totalproyectosiniciar,
      'logototalproyectosiniciar': logototalproyectosiniciar,
      'totalproyectosterminados': totalproyectosterminados,
      'logototalproyectosterminados': logototalproyectosterminados,
      'codigocategoria': codigocategoria,
      'nombrecategoria': nombrecategoria,
      'colorcategoria': colorcategoria,
      'botoncategoriainactivo': botoncategoriainactivo,
      'botoncategoriaactivo': botoncategoriaactivo,
    };
  }
}
