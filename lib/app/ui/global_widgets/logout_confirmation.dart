import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutConfirmation extends StatelessWidget {
  const LogoutConfirmation({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);
  final void Function()? onConfirm;
  final void Function()? onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(
            'NO',
            style: GoogleFonts.montserrat(
              color: ColorTheme.primaryTint,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'SI',
            style: GoogleFonts.montserrat(
              color: ColorTheme.primaryTint,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
      content: SizedBox(
        height: 100.sp,
        child: Text(
          '¿Está seguro que desea cerrar la sesión?',
          style: GoogleFonts.montserrat(
            color: ColorTheme.darkOpaque,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
