import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Costo extends StatelessWidget {
  const Costo({
    Key? key,
    required this.edgeInsets,
    required this.borderRadius2,
    required this.withOpacity,
    required this.detallesProyecto,
  }) : super(key: key);

  final EdgeInsets edgeInsets;
  final BorderRadius borderRadius2;
  final Color withOpacity;
  final DatosProyecto? detallesProyecto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsets,
      decoration: BoxDecoration(
        borderRadius: borderRadius2,
        color: withOpacity,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Presupuesto',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: ColorTheme.detailsText,
            ),
          ),
          Text(
            detallesProyecto!.valorproyecto,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: ColorTheme.detailsText,
            ),
          ),
          SizedBox(height: 10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$ Proyecto',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
              Text(
                detallesProyecto!.valorproyecto,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$ Interventoría',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
              Text(
                detallesProyecto!.valorinterventoria,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ColorTheme.detailsText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
