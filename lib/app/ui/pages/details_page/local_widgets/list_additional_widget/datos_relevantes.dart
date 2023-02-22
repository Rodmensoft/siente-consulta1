import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class DatosRelevantes extends StatelessWidget {
  const DatosRelevantes({
    Key? key,
    required this.subEdgeInsets,
    required this.borderRadius2,
    required this.withOpacity,
    required this.detallesProyecto,
  }) : super(key: key);

  final EdgeInsets subEdgeInsets;
  final BorderRadius borderRadius2;
  final Color withOpacity;
  final DatosProyecto? detallesProyecto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: <Widget>[
        RelevantDataContainer(
            subEdgeInsets: subEdgeInsets,
            borderRadius2: borderRadius2,
            withOpacity: withOpacity,
            icon: 'assets/new/details/clock2.png',
            title: 'Duración',
            text1: 'Desde ${detallesProyecto!.formatInicioProyecto}',
            text2: 'Hasta  ${detallesProyecto!.formatFinProyecto}',
            text3: detallesProyecto!.duracionDias),
        SizedBox(height: 10.sp),
        RelevantDataContainer(
          subEdgeInsets: subEdgeInsets,
          borderRadius2: borderRadius2,
          withOpacity: withOpacity,
          icon: 'assets/new/details/status.png',
          title: 'Estado',
          text1: detallesProyecto!.estadoproyecto,
          text2: '',
          text3: '',
        ),
        SizedBox(height: 10.sp),
        RelevantDataContainer(
          subEdgeInsets: subEdgeInsets,
          borderRadius2: borderRadius2,
          withOpacity: withOpacity,
          icon: 'assets/new/details/category.png',
          title: 'Tipo',
          text1: detallesProyecto!.formattedNombreCat,
          text2: '',
          text3: '',
        ),
      ],
    ));
  }
}

class RelevantDataContainer extends StatelessWidget {
  const RelevantDataContainer({
    Key? key,
    required this.subEdgeInsets,
    required this.borderRadius2,
    required this.withOpacity,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.title,
  }) : super(key: key);

  final EdgeInsets subEdgeInsets;
  final BorderRadius borderRadius2;
  final Color withOpacity;
  final String icon;
  final String text1;
  final String text2;
  final String text3;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: subEdgeInsets,
      decoration: BoxDecoration(
        borderRadius: borderRadius2,
        color: withOpacity,
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            height: 40.sp,
          ),
          SizedBox(width: 20.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
              SizedBox(height: 5.sp),
              Text(
                text1,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
              Visibility(
                visible: text2 != '',
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.sp),
                  child: Text(
                    text2,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorTheme.detailsText,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: text2 != '',
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.sp),
                  child: Text(
                    text3,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorTheme.detailsText,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
