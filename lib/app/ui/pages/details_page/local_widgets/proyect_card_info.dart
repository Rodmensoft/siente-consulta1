import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/assets/assets.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class ProjectInfoCard extends StatelessWidget {
  const ProjectInfoCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.budget,
    required this.status,
    required this.progress,
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? text;
  final String? budget;
  final String? status;
  final String? progress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromRGBO(16, 46, 120, 0.1),
            offset: Offset(3.52.sp, 3.52.sp),
            blurRadius: 17.05.sp,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10.sp,
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(color: Colors.transparent, height: 21.sp),
          Row(
            children: <Widget>[
              SizedBox(width: 22.sp),
              CircleAvatarImage(
                image: image!,
              ),
              SizedBox(width: 17.sp),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title!,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: ColorTheme.detailsText),
                      ),
                      SizedBox(height: 8.sp),
                      SizedBox(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                // ignore: lines_longer_than_80_chars
                                text!,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: ColorTheme.darkOpaque,
                                ),
                              ),
                            ),
                            SizedBox(width: 38.sp),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.sp),
                      Visibility(
                        visible: false,
                        child: Row(
                          children: <Widget>[
                            Text(
                              // ignore: lines_longer_than_80_chars
                              '4.0',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.58.sp,
                                color: ColorTheme.detailsRating,
                              ),
                            ),
                            SizedBox(width: 8.79.sp),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 17.58.sp,
                              initialRating: 4.0,
                              allowHalfRating: true,
                              itemBuilder: (BuildContext context, _) =>
                                  const Icon(
                                Icons.star,
                                color: ColorTheme.detailsRatingIcon,
                              ),
                              onRatingUpdate: (double rating) {},
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              // ignore: lines_longer_than_80_chars
                              '7 comentarios',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: ColorTheme.detailsText2,
                              ),
                            ),
                            SizedBox(width: 18.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(color: Colors.transparent, height: 9.sp),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 0.3.sp,
                  color: ColorTheme.detailsLine,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 12.sp),
                ProjectInfoCardFooter(
                  title: 'Presupuesto',
                  value: budget,
                ),
                Container(
                  height: double.infinity,
                  width: 0.3.sp,
                  color: ColorTheme.detailsLine,
                ),
                ProjectInfoCardFooter(
                  title: 'Estado',
                  value: status,
                ),
                Container(
                  height: double.infinity,
                  width: 0.3.sp,
                  color: ColorTheme.detailsLine,
                ),
                ProjectInfoCardFooter(
                  title: 'Avance',
                  value: progress,
                ),
                SizedBox(width: 49.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectInfoCardFooter extends StatelessWidget {
  const ProjectInfoCardFooter({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title!,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 11.sp,
            color: ColorTheme.darkOpaque,
          ),
        ),
        Text(
          value ?? '',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 11.sp,
            color: ColorTheme.detailsText,
          ),
        ),
      ],
    );
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
    final double size = 70.sp;
    final String fileType = image.substring(image.length - 3);

    return ClipRRect(
      borderRadius: BorderRadius.circular(100.sp),
      child: fileType == 'svg'
          ? SvgPicture.network(
              image,
              width: size,
              height: size,
            )
          : CachedNetworkImage(
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
              errorWidget: (BuildContext context, String url, dynamic error) =>
                  Container(
                color: Colors.transparent,
                width: size,
                height: size,
                child: Image.asset(
                  Assets.assetsNewLoginLoading2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }

  String buildProgress(DownloadProgress downloadProgress) {
    double progress;
    String value;
    if (downloadProgress.progress != null) {
      progress = (downloadProgress.progress!) * 100;
      value = '${progress.toStringAsFixed(0)}%';
    } else {
      progress = 0;
      value = '';
    }
    return value;
  }
}
