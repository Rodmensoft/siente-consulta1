import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';
import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/routes/app_routes.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class Imagenes extends StatelessWidget {
  const Imagenes({
    Key? key,
    required this.borderRadius2,
    required this.detallesProyecto,
  }) : super(key: key);

  final BorderRadius borderRadius2;
  final DatosProyecto? detallesProyecto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 15.sp,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: detallesProyecto!.imagenesproyecto.length,
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        itemBuilder: (BuildContext context, int index) {
          final Imagenesproyecto imagen =
              detallesProyecto!.imagenesproyecto[index];
          return GestureDetector(
            onTap: () => Get.toNamed(
              AppRoutes.imageDetails,
              arguments: <dynamic>[imagen.image, index],
            ),
            child: Hero(
              tag: index.toString(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: borderRadius2,
                  color: Colors.black,
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: imagen.image,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (
                    BuildContext context,
                    String url,
                    DownloadProgress downloadProgress,
                  ) =>
                      Column(
                    children: <Widget>[
                      Container(
                        color: ColorTheme.primaryTint
                            .withOpacity(downloadProgress.progress ?? 1.0),
                      ),
                    ],
                  ),
                  errorWidget:
                      (BuildContext context, String url, dynamic error) =>
                          Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
