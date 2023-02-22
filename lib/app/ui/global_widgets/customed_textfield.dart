import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomedTextField extends StatelessWidget {
  const CustomedTextField({
    Key? key,
    this.width,
    this.height,
    this.fontSize,
    this.controller,
    this.keyboardType,
    this.obscureText,
    required this.imageIcon,
    required this.hintText,
    this.style,
    this.focusNode,
    this.onEditingComplete,
    this.onTap,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final String imageIcon;
  final String hintText;
  final void Function()? onEditingComplete;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350.sp,
      height: height ?? 50.sp,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            SizedBox(width: 13.92.sp),
            Image(
              image: AssetImage(imageIcon),
              width: 19.17.sp,
              height: 19.17.sp,
            ),
            SizedBox(width: 11.92.sp),
            Expanded(
              child: IgnorePointer(
                // ignoring: true,
                child: TextField(
                  focusNode: focusNode,
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  style: style ??
                      GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize ?? 13.sp,
                      ),
                  decoration: InputDecoration.collapsed(
                    hintText: focusNode!.hasFocus ? '' : hintText,
                    hintStyle: style ??
                        GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize ?? 13.sp,
                        ),
                  ),
                  onEditingComplete: onEditingComplete,
                ),
              ),
            ),
            SizedBox(width: 21.92.sp),
          ],
        ),
      ),
    );
  }
}
