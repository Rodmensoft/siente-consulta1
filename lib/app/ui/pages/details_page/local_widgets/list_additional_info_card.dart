import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_widget/avance.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_widget/costo.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_widget/datos_relevantes.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_widget/imagenes.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_widget/participantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> additionalInfoCard(DatosProyecto? detallesProyecto) {
  final EdgeInsets padding1 = EdgeInsets.symmetric(
    horizontal: 15.sp,
    vertical: 25.sp,
  );
  final EdgeInsets subEdgeInsets = EdgeInsets.symmetric(
    horizontal: 15.sp,
    vertical: 5.sp,
  );
  final BorderRadius borderRadius = BorderRadius.circular(
    10.sp,
  );
  final Color whiteOpacity = Colors.white.withOpacity(0.7);
  return <Widget>[
    Costo(
      edgeInsets: padding1,
      borderRadius2: borderRadius,
      withOpacity: whiteOpacity,
      detallesProyecto: detallesProyecto,
    ),
    Avance(
      borderRadius2: borderRadius,
      edgeInsets: padding1,
      detallesProyecto: detallesProyecto,
    ),
    Participantes(
      subEdgeInsets: subEdgeInsets,
      borderRadius2: borderRadius,
      withOpacity: whiteOpacity,
      detallesProyecto: detallesProyecto,
    ),
    Imagenes(
      borderRadius2: borderRadius,
      detallesProyecto: detallesProyecto,
    ),
    DatosRelevantes(
      subEdgeInsets: subEdgeInsets,
      borderRadius2: borderRadius,
      withOpacity: whiteOpacity,
      detallesProyecto: detallesProyecto,
    ),
    SizedBox(height: 15.sp),
  ];
}
