import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingGIF extends StatelessWidget {
  const LoadingGIF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              width: 86.sp,
              height: 86.sp,
              decoration: BoxDecoration(
                color: ColorTheme.primaryTint,
                borderRadius: BorderRadius.circular(20.73.r),
              ),
              padding: EdgeInsets.all(15.sp),
              child: Image.asset('assets/new/splash/logo.gif',
                  width: 142.sp, height: 142.sp),
            ),
          )),
    );
  }
}
