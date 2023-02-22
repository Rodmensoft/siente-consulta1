import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget({
    Key? key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  }) : super(key: key);
  final String days;
  final String hours;
  final String minutes;
  final String seconds;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorTheme.timeGradient,
        borderRadius: BorderRadius.circular(15.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.99.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CountDownText(number: days, text: 'Días'),
              CountDownText(number: hours, text: 'Horas'),
              CountDownText(number: minutes, text: 'Minutos'),
              CountDownText(number: seconds, text: 'Segundos'),
            ],
          ),
          SizedBox(height: 15.02.sp),
          const DescriptionOrangeCard(),
          SizedBox(height: 15.02.sp),
        ],
      ),
    );
  }
}

class CountDownText extends StatelessWidget {
  const CountDownText({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);
  final String? number;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorTheme.danger2,
      margin: EdgeInsets.symmetric(horizontal: 11.875.sp),
      child: Column(
        children: <Widget>[
          Text(
            number ?? '0',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 23.33.sp,
              color: Colors.white,
            ),
          ),
          Text(
            text!,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 10.9.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionOrangeCard extends StatelessWidget {
  const DescriptionOrangeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/new/details/clock.png',
          height: 11.36,
          width: 11.34,
        ),
        Text(
          'Tiempo para la entrega',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 10.9.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
