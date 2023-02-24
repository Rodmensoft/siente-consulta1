import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

import '../../../../assets/assets.dart';
import '../../../../data/models/remote/vista_lista.dart';

class ProyectCard extends StatelessWidget {
  const ProyectCard({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final VistaListaConsulta data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        bottom: 8.sp,
        left: 11.sp,
        right: 11.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CardTitleDistance(
            color: data.colorCategoria,
            distance: data.distaciaproyecto.toString(),
            image: data.urlImageCategoria!,
            title: data.nombrecategoria!,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 14.sp),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CardText(text: data.nombreproyecto!),
                      SizedBox(height: 10.sp),
                      CardAdditionalInfo(
                        avance: data.avanceproyecto,
                        semaforo: data.semaforoproyecto,
                        valor: data.valorproyecto,
                      ),
                      SizedBox(height: 12.sp),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        100.sp,
                      ),
                      child: SizedBox(
                        height: 38.sp,
                        width: 40.sp,
                        child: Material(
                          color: data.colorCategoria,
                          child: GetBuilder<HomeController>(
                            builder: (_) {
                              return InkWell(
                                onTap: () {
                                  _.goToDetails(data.codigoproyecto);
                                },
                                child: SizedBox(
                                  height: 38.sp,
                                  width: 40.sp,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.sp),
            ],
          ),
        ],
      ),
    );
  }
}

class CardAdditionalInfo extends StatelessWidget {
  const CardAdditionalInfo({
    Key? key,
    required this.avance,
    required this.semaforo,
    required this.valor,
  }) : super(key: key);

  final String? valor;
  final String? avance;
  final String? semaforo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          valor!,
          textAlign: TextAlign.right,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 11.sp),
        Container(
          height: 12.sp,
          width: 1.sp,
          color: const Color(0xffAAAAAA),
        ),
        SizedBox(width: 9.sp),
        Text(
          avance!,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            letterSpacing: 0.09.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 9.sp),
        Container(
          height: 12.sp,
          width: 1.sp,
          color: const Color(0xffAAAAAA),
        ),
        SizedBox(width: 5.sp),
        Semaforo(semaforo: semaforo!),
        SizedBox(width: 20.sp),
      ],
    );
  }
}

class CardText extends StatelessWidget {
  const CardText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 30.sp,
      ),
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 12.5.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 20.sp),
        ],
      ),
    );
  }
}

class CardTitleDistance extends StatelessWidget {
  const CardTitleDistance({
    Key? key,
    required this.image,
    required this.title,
    required this.distance,
    required this.color,
  }) : super(key: key);
  final String image;
  final String title;
  final String distance;
  final Color color;
  @override
  Widget build(BuildContext context) {
    var size = 25.sp;
    return Container(
      color: color,
      height: 37.sp,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.sp),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
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
              errorWidget: (BuildContext context, String url, dynamic error) =>
                  Icon(
                Icons.error,
                size: 10.sp,
              ),
            ),
          ),
          SizedBox(width: 13.sp),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            distance,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 43.sp),
        ],
      ),
    );
  }
}

class Semaforo extends StatelessWidget {
  const Semaforo({
    Key? key,
    required this.semaforo,
  }) : super(key: key);
  final String semaforo;
  @override
  Widget build(BuildContext context) {
    Color semaforo1 = Colors.transparent;
    Color semaforo2 = Colors.transparent;
    Color semaforo3 = Colors.transparent;

    if (semaforo == 'semaforo_verde') {
      semaforo3 = ColorTheme.rightArrowButton;
    } else if (semaforo == 'semaforo_rojo') {
      semaforo1 = ColorTheme.danger2;
    } else {
      semaforo2 = Colors.yellow;
    }
    return Row(
      children: <Widget>[
        buildSemaforoLight(color: semaforo3),
        buildSemaforoLight(color: semaforo2),
        buildSemaforoLight(color: semaforo1),
      ],
    );
  }

  // ignore: avoid_positional_boolean_parameters
  Container buildSemaforoLight({required Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 1.sp,
      ),
      height: 12.sp,
      width: 12.sp,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          width: 1.sp,
          color: const Color(0xffC4C4C4),
        ),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
                // ignore: lines_longer_than_80_chars
                100.r),
          ),
        ),
      ),
    );
  }
}
