import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:siente_app/app/data/models/sample_data.dart';
import 'package:siente_app/app/ui/utils/time_left.dart';
import 'package:siente_app/main.dart';

DatosProyecto datosProyectoFromJson(String str) =>
    DatosProyecto.fromJson(json.decode(str) as Map<String, dynamic>);

String datosProyectoToJson(DatosProyecto data) => json.encode(data.toJson());

class DatosProyecto {
  DatosProyecto({
    required this.contratistasproyecto,
    required this.avanceproyecto,
    required this.codigocategoria,
    required this.codigoproyecto,
    required this.colorcategoria,
    required this.contrarista,
    required this.contratante,
    required this.debeir,
    required this.distancia,
    required this.duracionproyecto,
    required this.estadoproyecto,
    required this.fechafinproyecto,
    required this.fechainicioproyecto,
    required this.imagencategoria,
    required this.imagenesproyecto,
    required this.imagenproyecto,
    required this.indicadoresresultadosproyecto,
    required this.interventor,
    required this.latitudproyecto,
    required this.localidadproyecto,
    required this.logoestadoproyecto,
    required this.longitudproyecto,
    required this.nombrecategoria,
    required this.nombreproyecto,
    required this.objetoproyecto,
    required this.semaforoproyecto,
    required this.valorinterventoria,
    required this.valorproyecto,
  });

  factory DatosProyecto.fromJson(Map<String, dynamic> json) {
    return DatosProyecto(
      avanceproyecto: json['avanceproyecto'] as String,
      codigocategoria: json['codigocategoria'] as int,
      codigoproyecto: json['codigoproyecto'] as int,
      colorcategoria: json['colorcategoria'] as String,
      contrarista:
          json['contrarista'] == null ? '' : json['contrarista'] as String,
      contratante: json['contratante'] as String,
      contratistasproyecto: json['contratistasproyecto'] == null
          ? <Contratistasproyecto>[]
          : contratistaproyectoFromJson(json['contratistasproyecto']),
      debeir: json['debeir'] as String,
      distancia: json['distancia'] as String,
      duracionproyecto: json['duracionproyecto'] == null
          ? 0
          : json['duracionproyecto'] as int,
      estadoproyecto: json['estadoproyecto'] as String,
      fechafinproyecto: json['fechafinproyecto'] == null
          ? ''
          : json['fechafinproyecto'] as String,
      fechainicioproyecto: json['fechainicioproyecto'] == null
          ? ''
          : json['fechainicioproyecto'] as String,
      imagencategoria: json['imagencategoria'] == null
          ? ''
          : json['imagencategoria'] as String,
      imagenesproyecto: json['imagenesproyecto'].length == 0
          ? <Imagenesproyecto>[]
          : imagenesproyectoFromJson(json['imagenesproyecto']),
      imagenproyecto: json['imagenproyecto'] == null
          ? ''
          : json['imagenproyecto'] as String,
      indicadoresresultadosproyecto:
          json['indicadoresresultadosproyecto'].length == 0
              ? <Indicadoresresultadosproyecto>[]
              : indicadoresresultadosproyectoFromJson(
                  json['indicadoresresultadosproyecto']),
      interventor:
          json['interventor'] == null ? '' : json['interventor'] as String,
      latitudproyecto: json['latitudproyecto'] == null
          ? 0.0
          : json['latitudproyecto'] as double,
      localidadproyecto: json['localidadproyecto'] == null
          ? ''
          : json['localidadproyecto'] as String,
      logoestadoproyecto: json['logoestadoproyecto'] == null
          ? ''
          : json['logoestadoproyecto'] as String,
      longitudproyecto: json['longitudproyecto'] == null
          ? 0.0
          : json['longitudproyecto'] as double,
      nombrecategoria: json['nombrecategoria'] == null
          ? ''
          : json['nombrecategoria'] as String,
      nombreproyecto: json['nombreproyecto'] == null
          ? ''
          : json['nombreproyecto'] as String,
      objetoproyecto: json['objetoproyecto'] == null
          ? ''
          : json['objetoproyecto'] as String,
      semaforoproyecto: json['semaforoproyecto'] == null
          ? ''
          : json['semaforoproyecto'] as String,
      valorinterventoria: json['valorinterventoria'] == null
          ? ''
          : json['valorinterventoria'] as String,
      valorproyecto:
          json['valorproyecto'] == null ? '' : json['valorproyecto'] as String,
    );
  }
  final String avanceproyecto;
  final int codigocategoria;
  final int codigoproyecto;
  final String colorcategoria;
  final String contrarista;
  final String contratante;
  final List<Contratistasproyecto> contratistasproyecto;
  final String debeir;
  final String distancia;
  final int duracionproyecto;
  final String estadoproyecto;
  final String fechafinproyecto;
  final String fechainicioproyecto;
  final String imagencategoria;
  final List<Imagenesproyecto> imagenesproyecto;
  final String imagenproyecto;
  final List<Indicadoresresultadosproyecto> indicadoresresultadosproyecto;
  final String interventor;
  final double latitudproyecto;
  final String localidadproyecto;
  final String logoestadoproyecto;
  final double longitudproyecto;
  final String nombrecategoria;
  final String nombreproyecto;
  final String objetoproyecto;
  final String semaforoproyecto;
  final String valorinterventoria;
  final String valorproyecto;

  String get formatFinProyecto {
    if (fechafinproyecto == '') {
      return '';
    }

    final String format = DateFormat('yyyy-MM-dd', 'es').format(finProyecto!);
    return format;
  }

  String get formatInicioProyecto {
    if (fechainicioproyecto == '') {
      return '';
    }

    final String format =
        DateFormat('yyyy-MM-dd', 'es').format(inicioProyecto!);
    return format;
  }

  String get duracionDias {
    try {
      final DateTime now = inicioProyecto ?? DateTime.now();
      final DateTime limit = finProyecto ?? DateTime.now();

      final int days = TimeLeft().daysLeft(
        now: now,
        limit: limit,
      );
      if (days == 1) return '1 día';
      return '$days días';
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return '0 días';
    }
  }

  String get avanceProyecto {
    String avanceProyecto = '0';
    if (avanceproyecto != '') {
      avanceProyecto = avanceproyecto.substring(0, avanceproyecto.length - 1);
    }
    if (avanceProyecto == '') {
      avanceProyecto = '0';
    }
    return avanceProyecto;
  }

  String get debeIr {
    String debeIr = '0';
    if (debeir != '') {
      debeIr = debeir.substring(0, debeir.length - 1);
    }
    if (debeIr == '') {
      debeIr = '0';
    }
    return debeIr;
  }

  String? get urlImageProyecto {
    String url = imagenproyecto;
    if (imagenproyecto == '') {
      url = '/resources/imgs/bt_nodisponible.png';
    }
    return prefs.imagesUrl + url;
  }

  DateTime? get finProyecto {
    DateTime? finProyecto;

    if (fechafinproyecto != '') {
      finProyecto = DateTime.parse(fechafinproyecto);
    }

    return finProyecto;
  }

  DateTime? get inicioProyecto {
    DateTime? inicioProyecto;

    if (fechafinproyecto != '') {
      inicioProyecto = DateTime.parse(fechainicioproyecto);
    }

    return inicioProyecto;
  }

  String get formattedNombreCat => capitalizeExceptConnectors(nombrecategoria);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'avanceproyecto': avanceproyecto,
        'codigocategoria': codigocategoria,
        'codigoproyecto': codigoproyecto,
        'colorcategoria': colorcategoria,
        'contrarista': contrarista,
        'contratante': contratante,
        'contratistasproyecto': List<dynamic>.from(
          contratistasproyecto.map(
            (Contratistasproyecto x) => x.toJson(),
          ),
        ),
        'debeir': debeir,
        'distancia': distancia,
        'duracionproyecto': duracionproyecto,
        'estadoproyecto': estadoproyecto,
        'fechafinproyecto': fechafinproyecto,
        'fechainicioproyecto': fechainicioproyecto,
        'imagencategoria': imagencategoria,
        'imagenesproyecto': List<dynamic>.from(
          imagenesproyecto.map(
            (Imagenesproyecto x) => x.toJson(),
          ),
        ),
        'imagenproyecto': imagenproyecto,
        'indicadoresresultadosproyecto': List<dynamic>.from(
            indicadoresresultadosproyecto
                .map((Indicadoresresultadosproyecto x) => x.toJson())),
        'interventor': interventor,
        'latitudproyecto': latitudproyecto,
        'localidadproyecto': localidadproyecto,
        'logoestadoproyecto': logoestadoproyecto,
        'longitudproyecto': longitudproyecto,
        'nombrecategoria': nombrecategoria,
        'nombreproyecto': nombreproyecto,
        'objetoproyecto': objetoproyecto,
        'semaforoproyecto': semaforoproyecto,
        'valorinterventoria': valorinterventoria,
        'valorproyecto': valorproyecto,
      };
}

List<Contratistasproyecto> contratistaproyectoFromJson(
  final dynamic data,
) {
  final List<Contratistasproyecto> lista = <Contratistasproyecto>[];
  for (final dynamic item in data) {
    lista.add(Contratistasproyecto.fromJson(
        json.decode(json.encode(item)) as Map<String, dynamic>));
  }

  return lista;
}

class Contratistasproyecto {
  Contratistasproyecto({
    required this.codigocontratista,
    required this.codigocontrato,
    required this.codigoobra,
    required this.nombrecontratista,
    required this.nombrecontrato,
    required this.nombreobra,
  });

  factory Contratistasproyecto.fromJson(Map<String, dynamic> json) =>
      Contratistasproyecto(
        codigocontratista: json['codigocontratista'] as int,
        codigocontrato: json['codigocontrato'] as int,
        codigoobra: json['codigoobra'] as int,
        nombrecontratista: json['nombrecontratista'] as String,
        nombrecontrato: json['nombrecontrato'] as String,
        nombreobra: json['nombreobra'] as String,
      );
  final int codigocontratista;
  final int codigocontrato;
  final int codigoobra;
  final String nombrecontratista;
  final String nombrecontrato;
  final String nombreobra;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'codigocontratista': codigocontratista,
        'codigocontrato': codigocontrato,
        'codigoobra': codigoobra,
        'nombrecontratista': nombrecontratista,
        'nombrecontrato': nombrecontrato,
        'nombreobra': nombreobra,
      };
}

List<Imagenesproyecto> imagenesproyectoFromJson(final dynamic data) {
  final List<Imagenesproyecto> lista = <Imagenesproyecto>[];
  for (final dynamic item in data) {
    lista.add(Imagenesproyecto.fromJson(
        json.decode(json.encode(item)) as Map<String, dynamic>));
  }

  return lista;
}

class Imagenesproyecto {
  Imagenesproyecto({
    required this.intidimagen,
    required this.strnombre,
    required this.strubicacion,
  });

  factory Imagenesproyecto.fromJson(Map<String, dynamic> json) =>
      Imagenesproyecto(
        intidimagen: json['intidimagen'] as int,
        strnombre: json['strnombre'] as String,
        strubicacion: json['strubicacion'] as String,
      );
  final int intidimagen;
  final String strnombre;
  final String strubicacion;

  String get image {
    final String imagen = prefs.imagesUrl + strubicacion;
    return imagen;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'intidimagen': intidimagen,
        'strnombre': strnombre,
        'strubicacion': strubicacion,
      };
}

List<Indicadoresresultadosproyecto> indicadoresresultadosproyectoFromJson(
    final dynamic data) {
  final List<Indicadoresresultadosproyecto> lista =
      <Indicadoresresultadosproyecto>[];
  for (final dynamic item in data) {
    lista.add(Indicadoresresultadosproyecto.fromJson(
        json.decode(json.encode(item)) as Map<String, dynamic>));
  }

  return lista;
}

class Indicadoresresultadosproyecto {
  Indicadoresresultadosproyecto({
    required this.avanceresultado,
    required this.idindicador,
    required this.nombre,
    required this.peso,
    required this.porcentaje,
  });

  factory Indicadoresresultadosproyecto.fromJson(Map<String, dynamic> json) =>
      Indicadoresresultadosproyecto(
        avanceresultado: json['avanceresultado'] as double,
        idindicador: json['idindicador'] as int,
        nombre: json['nombre'] as String,
        peso: json['peso'] as double,
        porcentaje: json['porcentaje'] as double,
      );
  final double avanceresultado;
  final int idindicador;
  final String nombre;
  final double peso;
  final double porcentaje;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'avanceresultado': avanceresultado,
        'idindicador': idindicador,
        'nombre': nombre,
        'peso': peso,
        'porcentaje': porcentaje,
      };
}
