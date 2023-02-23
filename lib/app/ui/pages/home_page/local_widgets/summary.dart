import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color_theme.dart';

class GlobalIndicatorsWidget extends StatelessWidget {
  const GlobalIndicatorsWidget({
    Key? key,
    required this.image,
    required this.amount,
    required this.name,
  }) : super(key: key);

  final String image;
  final String amount;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13.sp, right: 13.sp),
      child: Row(
        children: <Widget>[
          Image.asset(
            image,
            width: 30.sp,
            height: 30.sp,
            color: ColorTheme.primary,
          ),
          SizedBox(width: 15.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                amount,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4d4d4d),
                    fontSize: 17.58.sp),
              ),
              Text(
                name,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4d4d4d),
                    fontSize: 11.4.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
