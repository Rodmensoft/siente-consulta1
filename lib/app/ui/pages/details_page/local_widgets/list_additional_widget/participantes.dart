import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class Participantes extends StatelessWidget {
  const Participantes({
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
        ParticipantsWidget(
          subEdgeInsets: subEdgeInsets,
          borderRadius2: borderRadius2,
          withOpacity: withOpacity,
          title: 'Contratista',
          participant: detallesProyecto!.contrarista,
        ),
        SizedBox(height: 5.sp),
        ParticipantsWidget(
          subEdgeInsets: subEdgeInsets,
          borderRadius2: borderRadius2,
          withOpacity: withOpacity,
          title: 'Interventor',
          participant: detallesProyecto!.interventor,
        ),
        SizedBox(height: 5.sp),
        ParticipantsWidget(
          subEdgeInsets: subEdgeInsets,
          borderRadius2: borderRadius2,
          withOpacity: withOpacity,
          title: 'Contratante',
          participant: detallesProyecto!.contratante,
        ),
      ],
    ));
  }
}

class ParticipantsWidget extends StatelessWidget {
  const ParticipantsWidget({
    Key? key,
    required this.subEdgeInsets,
    required this.borderRadius2,
    required this.withOpacity,
    required this.title,
    required this.participant,
  }) : super(key: key);

  final EdgeInsets subEdgeInsets;
  final BorderRadius borderRadius2;
  final Color withOpacity;
  final String title;
  final String participant;

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
              'assets/new/details/participants.png',
              width: 30.sp,
              height: 30.sp,
            ),
            SizedBox(width: 30.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: ColorTheme.detailsText,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  Text(
                    participant,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: ColorTheme.detailsText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
