import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';
import 'package:siente_app/app/ui/pages/home_page/local_widgets/rejected.dart';
import 'package:siente_app/app/ui/pages/mapview_page/mapview_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class MapViewPage extends GetView<StatelessWidget> {
  const MapViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'map_view',
      builder: (HomeController homeController) {
        return SizedBox(
          child: GetBuilder<MapViewController>(
            id: 'map',
            builder: (_) {
              return Stack(
                children: <Widget>[
                  GoogleMap(
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _.initGMapPosition,
                    onMapCreated: _.onMapCreated,
                    onCameraMove: (CameraPosition position) {
                      homeController
                          .updateMarkers(position.zoom.roundToDouble());
                    },
                    onCameraIdle: () {},
                    markers: homeController.markers,
                    padding: EdgeInsets.only(
                      top: homeController.isMarkerOpened ? 197.sp : 0,
                    ),
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                  ),
                  IgnorePointer(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: ColorTheme.mapGradient,
                      ),
                      height: 200.sp,
                      width: double.infinity,
                    ),
                  ),
                  if (homeController.proyectoMapa != null)
                    Visibility(
                      visible: homeController.isMarkerOpened,
                      child: ProyectContainerFigmaVersion(
                        image: homeController.proyectoMapa!.urlImageProyecto,
                        title: homeController.proyectoMapa!.nombreproyecto,
                        location:
                            homeController.proyectoMapa!.localidadproyecto,
                        color: homeController.proyectoMapa!.colorCategoria,
                        status: homeController.proyectoMapa!.estadoproyecto,
                        value: homeController.proyectoMapa!.valorproyecto,
                        progress: homeController.proyectoMapa!.avanceproyecto,
                        semaforo: homeController.proyectoMapa!.semaforoproyecto,
                        onTap: () => homeController.goToDetails(
                            homeController.proyectoMapa!.codigoproyecto),
                      ),
                    )
                  else
                    Container(),
                  Positioned(
                    bottom: 40.sp,
                    left: 20.sp,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: Material(
                        color: ColorTheme.primaryTint,
                        child: InkWell(
                          onTap: () {
                            _.goToCurrentPosition();
                          },
                          child: SizedBox(
                            height: 51.sp,
                            width: 51.sp,
                            child: Center(
                              child: Image.asset(
                                'assets/new/home/my_location.png',
                                height: 22.sp,
                                width: 22.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
