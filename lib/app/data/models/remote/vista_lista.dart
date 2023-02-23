import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../main.dart';

VistaListaConsulta vistaConsultaFromJson(String str) {
  return VistaListaConsulta.fromJson(json.decode(str) as Map<String, dynamic>);
}

String vistaListaToJson(List<VistaListaConsulta> data) => json
    .encode(List<dynamic>.from(data.map((VistaListaConsulta x) => x.toJson())));

class VistaListaConsulta {
  VistaListaConsulta({
    this.codigoproyecto,
    this.nombreproyecto,
    this.imagenproyecto,
    this.valorproyecto,
    this.avanceproyecto,
    this.semaforoproyecto,
    this.latitudproyecto,
    this.longitudproyecto,
    this.codigocategoria,
    this.colorcategoria,
    this.imagencategoria,
    this.nombrecategoria,
    this.estadoproyecto,
    this.distaciaproyecto,
    this.localidadproyecto,
  });
  factory VistaListaConsulta.fromJson(Map<String, dynamic> json) =>
      VistaListaConsulta(
        codigoproyecto: json['codigoproyecto'] as int,
        nombreproyecto: json['nombreproyecto'] == null
            ? ''
            : json['nombreproyecto'] as String,
        imagenproyecto: json['imagenproyecto'] == null
            ? '/resources/imgs/bt_nodisponible.png'
            : json['imagenproyecto'] as String,
        valorproyecto: json['valorproyecto'] == null
            ? '\$0.00'
            : json['valorproyecto'] as String,
        avanceproyecto: json['avanceproyecto'] == null
            ? '%'
            : json['avanceproyecto'] as String,
        semaforoproyecto: json['semaforoproyecto'] as String,
        latitudproyecto: json['latitudproyecto'] == null
            ? 0.0
            : json['latitudproyecto'] as double,
        longitudproyecto: json['longitudproyecto'] == null
            ? 0.0
            : json['longitudproyecto'] as double,
        codigocategoria: json['codigocategoria'] as int,
        colorcategoria: json['colorcategoria'] == null
            ? '#FFFFFF'
            : json['colorcategoria'] as String,
        imagencategoria: json['imagencategoria'] == null
            ? '/resources/imgs/bt_nodisponible.png'
            : json['imagencategoria'] as String,
        nombrecategoria: json['nombrecategoria'] == null
            ? ''
            : json['nombrecategoria'] as String,
        estadoproyecto: json['estadoproyecto'] == null
            ? ''
            : json['estadoproyecto'] as String,
        distaciaproyecto: json['distaciaproyecto'] == null
            ? ''
            : json['distaciaproyecto'] as String,
        localidadproyecto: json['localidadproyecto'] == null
            ? ''
            : json['localidadproyecto'] as String,
      );

  final int? codigoproyecto;
  final String? nombreproyecto;
  final String? imagenproyecto;
  final String? valorproyecto;
  final String? avanceproyecto;
  final String? semaforoproyecto;
  final double? latitudproyecto;
  final double? longitudproyecto;
  final int? codigocategoria;
  final String? colorcategoria;
  final String? imagencategoria;
  final String? nombrecategoria;
  final String? estadoproyecto;
  final String? distaciaproyecto;
  final String? localidadproyecto;

  Color get colorCategoria {
    //CONVIERTE EL STRING A UN COLOR ADMITIDO POR DART
    final String newColor = colorcategoria!.replaceAll('#', '0XFF');
    return Color(int.parse(newColor));
  }

  String? get urlImageCategoria {
    return prefs.imagesUrl + imagencategoria!;
  }

  String? get urlImageProyecto {
    return prefs.imagesUrl + imagenproyecto!;
  }

  LatLng get position {
    final String latitudeString = '0.000${Random().nextInt(9999) + 1}';

    final double newLat = latitudproyecto! + double.parse(latitudeString);
    final double newLong = longitudproyecto! + double.parse(latitudeString);

    return LatLng(newLat, newLong);
  }

  Future<BitmapDescriptor> iconBitmap() => BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48.sp, 48.sp)),
      'assets/new/home/marker_$codigocategoria.png');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'codigoproyecto': codigoproyecto,
      'nombreproyecto': nombreproyecto,
      'imagenproyecto': imagenproyecto,
      'valorproyecto': valorproyecto,
      'avanceproyecto': avanceproyecto,
      'semaforoproyecto': semaforoproyecto,
      'latitudproyecto': latitudproyecto,
      'longitudproyecto': longitudproyecto,
      'codigocategoria': codigocategoria,
      'colorcategoria': colorcategoria,
      'imagencategoria': imagencategoria,
      'nombrecategoria': nombrecategoria,
      'estadoproyecto': estadoproyecto,
      'distaciaproyecto': distaciaproyecto,
      'localidadproyecto': localidadproyecto,
    };
  }
}
