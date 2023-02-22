import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siente_app/app/assets/assets.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
    this.assetImageRoute,
    this.width,
    this.height,
    this.tag,
    this.color,
  }) : super(key: key);

  final String? assetImageRoute;
  final double? width;
  final double? height;
  final String? tag;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetImageRoute ?? Assets.assetsNewSplashLogo,
      width: width ?? 142.sp,
      height: height ?? 142.sp,
      color: color,
    );
  }
}

class FooterImage extends StatelessWidget {
  const FooterImage({
    Key? key,
    this.assetImageRoute,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String? assetImageRoute;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'footer',
      child: Image.asset(assetImageRoute ?? Assets.assetsNewLoginFooter,
          width: width ?? 142.sp, height: height ?? 142.sp),
    );
  }
}
