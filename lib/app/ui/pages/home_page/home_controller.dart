import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/data/models/remote/indicadores_globales.dart';
import 'package:siente_app/app/data/models/remote/vista_lista.dart';
import 'package:siente_app/app/data/models/sample_data.dart';
import 'package:siente_app/app/data/services/configuracion_app_service.dart';
import 'package:siente_app/app/data/services/datos_proyecto_service.dart';
import 'package:siente_app/app/data/services/indicadores_globales_service.dart';
import 'package:siente_app/app/data/services/vista_lista_service.dart';
import 'package:siente_app/app/routes/app_routes.dart';
import 'package:siente_app/app/ui/global_widgets/customed_toast.dart';
import 'package:siente_app/app/ui/global_widgets/logout_confirmation.dart';
import 'package:siente_app/app/ui/pages/mapview_page/mapview_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';
import 'package:siente_app/app/ui/utils/map_helper.dart';
import 'package:siente_app/app/ui/utils/map_marker.dart';
import 'package:siente_app/main.dart';

class HomeController extends GetxController {
  final ConfiguracionService _configuracionService =
      Get.find<ConfiguracionService>();
  final IndicadoresGlobalesService _indiGlobService =
      Get.find<IndicadoresGlobalesService>();
  final VistaListaConsultaService _vLConsService =
      Get.find<VistaListaConsultaService>();

  final DatosProyectoService _datoProService = Get.find<DatosProyectoService>();

  final List<IndicadoresGlobales> indicadoresGlobales = [];

  // ignore: always_specify_types
  static Completer<GoogleMapController> gmapController = Completer();

  VistaListaConsulta? proyectoMapa;
  List<VistaListaConsulta> listaProyectos = <VistaListaConsulta>[];
  List<VistaListaConsulta> listaProyectosAux = <VistaListaConsulta>[];
  RxList<CategoryData> initialCategories = <CategoryData>[].obs;

  bool type = true;

  RxBool loading = true.obs;

  CategoryData? get selectedCategory =>
      initialCategories.firstWhereOrNull((element) => element.isSelected);

  late DatosProyecto? datoProyecto;

  TextEditingController searchCtrl = TextEditingController();
  FocusNode searchFocus = FocusNode();

  int currentPageViewIndex = 1;
  double currentZoom = 15;

  int currentCategory = 0;
  late Position currentUserLocation;

  final Set<Marker> markers = <Marker>{};
  final List<LatLng> _markerLocations = <LatLng>[];
  final List<String> imageCategory = <String>[];
  Fluster<MapMarker>? _clusterManager;
  //initialize on Colombia's bounds
  LatLngBounds bounds = LatLngBounds(
    northeast: const LatLng(12.4373031682, -66.8763258531),
    southwest: const LatLng(-4.29818694419, -78.9909352282),
  );

  final Color _clusterTextColor = Colors.white;
  final Color _clusterColor = ColorTheme.primaryTint;

  bool isMarkerOpened = false;
  @override
  void onReady() {
    super.onReady();
    loadConfigurationApp();
  }

  Future<void> onSearch() async {
    String text;
    text = searchCtrl.text.toLowerCase().trimRight().trimLeft();

    Get.focusScope!.unfocus();
    listaProyectos = listaProyectosAux.where((VistaListaConsulta element) {
      final String nombre = element.nombreproyecto!.toLowerCase();
      int codigo = element.codigocategoria!;
      if (currentCategory == 0) codigo = currentCategory;

      return nombre.contains(text) && currentCategory == codigo;
    }).toList();
    // await getListaProyectos();
    getMarkers();

    update(<Object>['search_field']);
    updateMostly();
    if (searchCtrl.text.trim().isEmpty || currentPageViewIndex == 0) return;
    final int n = listaProyectos.length;
    final String palabra = searchCtrl.text;
    final String resultado = n == 1 ? 'resultado' : 'resultados';
    final String encontraron = n == 1 ? 'encontró' : 'encontraron';
    buildCustomedToast(
      // ignore: avoid_escaping_inner_quotes
      message: 'Se $encontraron $n $resultado para la palabra \'$palabra\'',
      snackPosition: SnackPosition.BOTTOM,
      bottom: 10,
    );
  }

  void onChangePageView(int i) {
    currentPageViewIndex = i;
    // type = i == 0;
    isMarkerOpened = false;
    update(<Object>['pageview_controller', 'page_view', 'categories']);
    try {
      getMarkers();
    } catch (e) {}
  }

  Future<void> onChangeCategory(int index) async {
    if (initialCategories[index].indicadoresGlobales != null &&
        currentCategory ==
            initialCategories[index].indicadoresGlobales?.codigocategoria) {
      return;
    }

    searchCtrl.text = '';
    for (int i = 0; i < initialCategories.length; i++) {
      initialCategories[i].isSelected = false;
    }
    initialCategories[index].isSelected = true;

    currentCategory =
        initialCategories[index].indicadoresGlobales!.codigocategoria;

    onChangeIndicators(index);
    listaProyectos = listaProyectosAux;
    if (currentCategory != 0) {
      listaProyectos = listaProyectosAux.where((VistaListaConsulta element) {
        final int? categoria = element.codigocategoria;
        return categoria == currentCategory;
      }).toList();
    }

    getMarkers();
    update(<Object>['categories', 'indicators', 'lista_proyectos']);
  }

  Future<void> loadConfigurationApp() async {
    loading.value = true;

    await getIndicadoresGlobales();
    await getUserCurrentLocation();
    await _configuracionService.getService();
    await getListaProyectos();
    loading.value = false;
  }

  Future<void> getIndicadoresGlobales() async {
    final List<IndicadoresGlobales> indicadoresGlobales =
        await _indiGlobService.getIndicadoresGlobales();

    initialCategories.value = indicadoresGlobales
        .map(
          (e) => CategoryData(
            key: GlobalKey(),
            image: 'assets/new/home/${e.codigocategoria}.png',
            color: e.codigocategoria == 0
                ? ColorTheme.newButton1
                : e.colorCategoria,
            name: e.nombrecategoria,
            height: 20,
            width: 20,
            isSelected: e.codigocategoria == 0 ? true : e.isSelected,
            codigoCategoria: e.codigocategoria,
            indicadoresGlobales: e,
          ),
        )
        .toList();
    initialCategories
        .sort((a, b) => a.codigoCategoria!.compareTo(b.codigoCategoria!));

    await onChangeIndicators(0);
    update(<Object>['categories', 'indicators']);
  }

  Future<void> getListaProyectos() async {
    listaProyectos = await _vLConsService.getService(
      categoriaproyecto: currentCategory,
      nombreProyecto: searchCtrl.text,
      latitud: currentUserLocation.latitude,
      longitud: currentUserLocation.longitude,
    );
    listaProyectosAux = listaProyectos;
    if (currentCategory != 0) {
      listaProyectos = listaProyectosAux.where((VistaListaConsulta element) {
        final int? categoria = element.codigocategoria;
        return categoria == currentCategory;
      }).toList();
    }
    listaProyectos = listaProyectosAux.where((VistaListaConsulta element) {
      final double? latitude = element.latitudproyecto;
      final double? longitude = element.longitudproyecto;
      return latitude != 0.0 && longitude != 0.0;
    }).toList();

    for (final VistaListaConsulta item in listaProyectos) {
      _markerLocations.add(item.position);
      imageCategory.add(item.imagencategoria!);
    }
    await getMarkers();
    update(<Object>['lista_proyectos']);
  }

  Future<void>? onChangeIndicators(int index) async {
    final IndicadoresGlobales? data =
        initialCategories[index].indicadoresGlobales;

    SummaryData.sampleSummary[0].value = data!.poblacionBeneficiada;
    SummaryData.sampleSummary[1].value = data.totalDeProyectos;
    SummaryData.sampleSummary[2].value = data.totalEjecutado;
    SummaryData.sampleSummary[3].value = data.totalInvertido;
    SummaryData.sampleSummary[4].value = data.avanceGlobal;

    updateMostly();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: always_specify_types
      await Future.delayed(const Duration(seconds: 2));
      await Geolocator.openLocationSettings();

      if (await Geolocator.isLocationServiceEnabled()) {
        // ignore: always_specify_types
        return Future.error('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // ignore: always_specify_types
      return Future.error(
        'Los permisos de ubicación se negaron permanentemente.',
      );
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // ignore: always_specify_types
        return Future.error(
          'Los permisos de ubicación denegados (actual valor: $permission).',
        );
      }
    }

    return Geolocator.getCurrentPosition();
  }

  Future<void> getUserCurrentLocation() async {
    try {
      currentUserLocation = await determinePosition();
    } catch (e) {
      currentUserLocation = Position(
        longitude: -74.9904,
        latitude: -9.1952,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    }
  }

  Future<void> getMarkers() async {
    if (currentPageViewIndex != 0) {
      return;
    }

    // loading.value = true;

    final List<MapMarker> markers = [];
    markers.clear();
    if (listaProyectos.length > 25) {
      loading.value = true;
    }
    for (final VistaListaConsulta item in listaProyectos) {
      if (item.latitudproyecto != 0.0 && item.longitudproyecto != 0.0) {
        GlobalKey<State<StatefulWidget>> key = initialCategories
            .firstWhere(
                (element) => element.codigoCategoria == item.codigocategoria)
            .key;
        final LatLng position = item.position;
        try {
          markers.add(
            MapMarker(
              id: listaProyectos.indexOf(item).toString(),
              position: position,
              icon: await MarkerIcon.widgetToIcon(key),
              onTap: () {
                openProyectByMarker(item);
              },
            ),
          );
        } catch (e) {
          loading.value = false;
        }
      }
    }

    _clusterManager = await MapHelper.initClusterManager(
      markers,
      0,
      15,
    );

    await updateMarkers();

    // ignore: invariant_booleans
    if (currentPageViewIndex != 0) return;
    // bounds of Colombia
    const LatLng northeastColombia = LatLng(12.4373031682, -66.8763258531);
    const LatLng southwestColombia = LatLng(-4.29818694419, -78.9909352282);
    if (markers.isNotEmpty) {
      if (markers.first.position.latitude > markers.last.position.latitude &&
          markers.first.position.longitude > markers.last.position.longitude) {
        bounds = LatLngBounds(
          southwest: markers.last.position,
          northeast: markers.first.position,
        );
      } else if (markers.first.position.longitude >
          markers.last.position.longitude) {
        bounds = LatLngBounds(
          southwest: LatLng(
            markers.first.position.latitude,
            markers.last.position.longitude,
          ),
          northeast: LatLng(
            markers.last.position.latitude,
            markers.first.position.longitude,
          ),
        );
      } else if (markers.first.position.latitude >
          markers.last.position.latitude) {
        bounds = LatLngBounds(
          southwest: LatLng(
            markers.last.position.latitude,
            markers.first.position.longitude,
          ),
          northeast: LatLng(
            markers.first.position.latitude,
            markers.last.position.longitude,
          ),
        );
      } else {
        bounds = LatLngBounds(
          southwest: markers.first.position,
          northeast: markers.last.position,
        );
      }
    }
    if (listaProyectos.isEmpty) {
      bounds = LatLngBounds(
        southwest: southwestColombia,
        northeast: northeastColombia,
      );
    }

    // bounds = LatLngBounds(northeast: northeast, southwest: southwest);
    // ignore: invariant_booleans

    final MapViewController map = Get.find<MapViewController>();
    map.goToCurrentPosition();

    loading.value = false;
  }

  Future<void> updateMarkers([double? updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == currentZoom) return;

    if (updatedZoom != null) {
      currentZoom = updatedZoom;
    }

    final List<Marker> updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      currentZoom,
      _clusterColor,
      _clusterTextColor,
      80,
      () => 1,
    );

    updateMap();

    markers
      ..clear()
      ..addAll(updatedMarkers);
  }

  //no usado aun
  Future<void> getClusterMarkers(int clusterId) async {
    final List<MapMarker> markers = _clusterManager!.points(clusterId);

    if (markers.isNotEmpty) {
      if (markers.first.position.latitude > markers.last.position.latitude &&
          markers.first.position.longitude > markers.last.position.longitude) {
        bounds = LatLngBounds(
          southwest: markers.last.position,
          northeast: markers.first.position,
        );
      } else if (markers.first.position.longitude >
          markers.last.position.longitude) {
        bounds = LatLngBounds(
          southwest: LatLng(
            markers.first.position.latitude,
            markers.last.position.longitude,
          ),
          northeast: LatLng(
            markers.last.position.latitude,
            markers.first.position.longitude,
          ),
        );
      } else if (markers.first.position.latitude >
          markers.last.position.latitude) {
        bounds = LatLngBounds(
          southwest: LatLng(
            markers.last.position.latitude,
            markers.first.position.longitude,
          ),
          northeast: LatLng(
            markers.first.position.latitude,
            markers.last.position.longitude,
          ),
        );
      } else {
        bounds = LatLngBounds(
          southwest: markers.first.position,
          northeast: markers.last.position,
        );
      }
    }

    final MapViewController map = Get.find<MapViewController>();
    map.goToCurrentPosition();
    updateMarkers();
    map.update(<Object>['map']);
    update(<Object>['map_view']);
  }

  Future<void> updateMostly() async {
    update(<Object>['categories', 'indicators', 'lista_proyectos']);
    updateMap();
  }

  Future<void> updateMap() async {
    if (currentPageViewIndex != 0) {
      return;
    }
    final MapViewController map = Get.find<MapViewController>();
    map.update(<Object>['map']);
    update(<Object>['map_view']);
  }

  Future<void> goToDetails(int? codigoProyecto) async {
    loading.value = true;
    datoProyecto = await _datoProService.getService(
      codigoProyecto: codigoProyecto!,
      latitud: currentUserLocation.latitude,
      longitud: currentUserLocation.longitude,
    );

    if (datoProyecto == null) {
      loading.value = false;
      return;
    }
    await Get.toNamed(AppRoutes.details, arguments: datoProyecto);
    loading.value = false;
    return;
  }

  void openLogoutDialog() {
    Get.dialog(
      LogoutConfirmation(
        onConfirm: () => logout(),
        onCancel: () => Get.back(),
      ),
    );
  }

  Future<void> logout() async {
    await prefs.clear();

    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> openProyectByMarker(VistaListaConsulta item) async {
    proyectoMapa = item;
    isMarkerOpened = true;
    update(<Object>['map_view']);
  }

  void onSearchTap() {
    isMarkerOpened = false;

    searchFocus.requestFocus();
    update(<Object>['search_field']);
  }
}
