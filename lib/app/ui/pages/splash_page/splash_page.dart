import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/assets/assets.dart';
import 'package:siente_app/app/ui/global_widgets/logo.dart';
import 'package:siente_app/app/ui/pages/splash_page/splash_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: ColorTheme.splashGradient,
            ),
            child: const Center(child: TopSlogan()),
          ),
        );
      },
    );
  }
}

class TopSlogan extends StatelessWidget {
  const TopSlogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'top_slogan',
      child: Material(
        color: Colors.transparent,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SimpleShadow(
                opacity: 0.6,
                color: Colors.black, // Default: Black
                offset: Offset(3.sp, 4.sp), // Default: Offset(2, 2)
                sigma: 12.r,
                child: LogoImage(
                  width: 104.24.sp,
                  height: 85.39.sp,
                ), // Default: 2
              ),
            ),
            SizedBox(height: 25.32.sp),
            SimpleShadow(
              opacity: 0.6,
              color: Colors.black, // Default: Black
              offset: Offset(3.sp, 4.sp), // Default: Offset(2, 2)
              sigma: 12.r,
              child: Image.asset(
                Assets.assetsNewSplashSiente,
                width: 189.66.sp,
                height: 50.05,
              ),
            ),
            SizedBox(height: 11.32.sp),
            Text(
              'Sistema de Informacion Estrategico\npara la Nacion y el Territorio',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13.08.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
