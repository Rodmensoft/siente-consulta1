import 'package:flutter/widgets.dart';
import 'package:siente_app/app/data/models/remote/indicadores_globales.dart';

class SummaryData {
  SummaryData({
    this.image,
    this.value,
    this.name,
  });
  String? image;
  String? value;
  String? name;

  static List<SummaryData> sampleSummary = <SummaryData>[
    SummaryData(
        image: 'assets/new/home/family.png',
        value: '...',
        name: 'Población Beneficiada'),
    SummaryData(
        image: 'assets/new/home/proyects.png',
        value: '...',
        name: 'Total de Proyectos'),
    SummaryData(
        image: 'assets/new/home/executed.png',
        value: '...',
        name: 'Total Ejecutado'),
    SummaryData(
        image: 'assets/new/home/invested.png',
        value: '...',
        name: 'Total Invertido'),
    SummaryData(
        image: 'assets/new/home/progress.png',
        value: '...',
        name: 'Avance Global'),
  ];
}

class CategoryData {
  CategoryData({
    required this.image,
    required this.color,
    required this.name,
    required this.height,
    required this.width,
    required this.isSelected,
    required this.codigoCategoria,
    required this.key,
    this.indicadoresGlobales,
  });
  String? image;
  Color? color;
  String? name;
  double? height;
  double? width;
  bool isSelected = false;
  int? codigoCategoria;
  IndicadoresGlobales? indicadoresGlobales;
  GlobalKey key;
}
