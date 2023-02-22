import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FailedMessage extends StatelessWidget {
  const FailedMessage({
    Key? key,
    required this.failed,
  }) : super(key: key);
  final bool failed;
  @override
  Widget build(BuildContext context) {
    const String message =
        '\nLo sentimos\nel usuario o la contraseña es incorrecta';
    return Column(
      children: <Widget>[
        SizedBox(
          height: 54.sp,
          child: Text(
            failed ? message : '',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w300,
              fontSize: 13.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
