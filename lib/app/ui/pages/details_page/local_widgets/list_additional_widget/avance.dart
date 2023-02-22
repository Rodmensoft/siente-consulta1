import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Avance extends StatelessWidget {
  const Avance({
    Key? key,
    required this.borderRadius2,
    required this.edgeInsets,
    required this.detallesProyecto,
  }) : super(key: key);

  final BorderRadius borderRadius2;
  final EdgeInsets edgeInsets;
  final DatosProyecto? detallesProyecto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.sp),
        Expanded(
          child: GaugeContainer(
              borderRadius2: borderRadius2,
              edgeInsets: edgeInsets,
              value: detallesProyecto!.avanceProyecto,
              label: 'Así va'),
        ),
        SizedBox(width: 15.sp),
        Expanded(
          child: GaugeContainer(
              borderRadius2: borderRadius2,
              edgeInsets: edgeInsets,
              value: detallesProyecto!.debeIr,
              label: 'Así debería ir'),
        ),
        SizedBox(width: 15.sp),
      ],
    );
  }
}

class GaugeContainer extends StatelessWidget {
  const GaugeContainer({
    Key? key,
    required this.borderRadius2,
    required this.edgeInsets,
    required this.value,
    required this.label,
  }) : super(key: key);

  final BorderRadius borderRadius2;
  final EdgeInsets edgeInsets;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius2,
        color: Colors.white,
      ),
      padding: edgeInsets,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150.sp,
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(endAngle: 0, startAngle: 180, ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: double.parse(value),
                    labelStyle: GaugeTextStyle(
                      fontSize: 10.0.sp,
                    ),
                    color: ColorTheme.secondary,
                  ),
                ], pointers: <GaugePointer>[
                  NeedlePointer(
                    value: double.parse(value),
                    needleEndWidth: 3.sp,
                    needleStartWidth: 0.5.sp,
                    needleLength: 0.3.sp,
                  )
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Column(
                        children: <Widget>[
                          Text(
                            '$value%',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              color: ColorTheme.secondary,
                            ),
                          ),
                          Text(
                            label,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: ColorTheme.detailsText,
                            ),
                          ),
                        ],
                      ),
                      angle: 90,
                      positionFactor: 1.6)
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
