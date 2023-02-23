import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

import '../../../../assets/assets.dart';

class ProyectContainerFigmaVersion extends StatelessWidget {
  const ProyectContainerFigmaVersion({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.status,
    required this.value,
    required this.color,
    required this.progress,
    required this.semaforo,
    required this.onTap,
  }) : super(key: key);
  final String? image;
  final String? title;
  final String? location;
  final String? status;
  final String? value;
  final String? progress;
  final String? semaforo;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 197.sp,
          margin: EdgeInsets.symmetric(vertical: 10.sp),
        ),
        Container(
          height: 170.sp,
          width: double.infinity,
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 22.sp),
              Row(
                children: <Widget>[
                  SizedBox(width: 31.sp),
                  CircleAvatarImage(
                    image: image!,
                  ),
                  SizedBox(width: 19.sp),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          location!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.sp),
              Row(
                children: <Widget>[
                  SizedBox(width: 31.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Avance',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Wrap(
                        children: <Widget>[
                          Container(
                            height: 15.sp,
                            width: 15.sp,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100.sp),
                              border: Border.all(
                                width: 0.5.sp,
                                color: Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 9.sp,
                                width: 9.sp,
                                decoration: BoxDecoration(
                                  color: semaforoColor,
                                  borderRadius: BorderRadius.circular(100.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            progress!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 31.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Estado',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        status!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 38.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Valor',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        value!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 142.sp,
          right: 34.sp,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.sp),
            child: Material(
              color: ColorTheme.rightArrowButton,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: 56.sp,
                  width: 56.sp,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color get semaforoColor {
    if (semaforo == 'semaforo_verde') return ColorTheme.rightArrowButton;
    if (semaforo == 'semaforo_rojo') return ColorTheme.danger2;

    return Colors.transparent;
  }
}

class CircleAvatarImage extends StatelessWidget {
  const CircleAvatarImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    var size = 61.sp;
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.sp),
      child: CachedNetworkImage(
        imageUrl: image,
        width: size,
        height: size,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (
          BuildContext context,
          String url,
          DownloadProgress downloadProgress,
        ) =>
            Container(
                color: Colors.transparent,
                width: size,
                height: size,
                child: Image.asset(
                  Assets.assetsNewLoginLoading2,
                  fit: BoxFit.cover,
                )),
        errorWidget: (BuildContext context, String url, dynamic error) => Icon(
          Icons.error,
          size: 32.sp,
        ),
      ),
    );
  }
}
