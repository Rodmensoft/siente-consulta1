import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siente_app/app/ui/theme/text_style.dart';

import '../theme/color_theme.dart';

List<Widget> loadingButtonText({
  bool loading = false,
  @required String? text,
}) {
  if (!loading) return <Widget>[];
  return <Widget>[
    SizedBox(
      height: 15.sp,
      width: 15.sp,
      child: CircularProgressIndicator(
        strokeWidth: 3.sp,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white.withOpacity(0.5),
        ),
      ),
    ),
    SizedBox(width: 9.sp),
    Text(
      text ?? '',
      style: TextStyleTheme.textButtons,
    ),
  ];
}

class CustomedButton extends StatelessWidget {
  const CustomedButton({
    Key? key,
    this.onPressed,
    this.borderRadius,
    required this.height,
    required this.width,
    required this.loading,
    required this.text,
    required this.text2,
    this.bgColor,
    this.fontSize,
  }) : super(key: key);
  final Function()? onPressed;
  final bool loading;
  final double? borderRadius;
  final String? text;
  final String? text2;
  final double? width;
  final double? height;
  final Color? bgColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, backgroundColor: bgColor),
        onPressed: onPressed,
        child: Ink(
          height: height,
          width: width,
          decoration: bgColor != null
              ? null
              : const BoxDecoration(
                  gradient: ColorTheme.buttonGradient,
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...loadingButtonText(loading: loading, text: text2),
              if (loading)
                const SizedBox()
              else
                Text(
                  text ?? '',
                  style: TextStyleTheme.textButtons.copyWith(
                      fontSize: fontSize, fontWeight: FontWeight.w900),
                )
            ],
          ),
        ),
      ),
    );
  }
}
