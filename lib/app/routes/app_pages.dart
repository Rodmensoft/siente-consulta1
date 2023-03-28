import 'package:get/get.dart';
import 'package:siente_app/app/bindings/imagedetail_binding.dart';
import 'package:siente_app/app/routes/app_routes.dart';
import 'package:siente_app/app/ui/pages/details_page/details_binding.dart';
import 'package:siente_app/app/ui/pages/details_page/details_page.dart';
import 'package:siente_app/app/ui/pages/home_page/home_binding.dart';
import 'package:siente_app/app/ui/pages/home_page/home_page.dart';
import 'package:siente_app/app/ui/pages/imagedetail_page/imagedetail_page.dart';
import 'package:siente_app/app/ui/pages/listview_page/listview_binding.dart';
import 'package:siente_app/app/ui/pages/login_page/login_binding.dart';
import 'package:siente_app/app/ui/pages/login_page/login_page.dart';
import 'package:siente_app/app/ui/pages/mapview_page/mapview_binding.dart';
import 'package:siente_app/app/ui/pages/splash_page/splash_binding.dart';
import 'package:siente_app/app/ui/pages/splash_page/splash_page.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage<dynamic>(
      name: AppRoutes.home,
      page: () => const HomePage(),
      bindings: <Bindings>[
        HomeBinding(),
        MapViewBinding(),
        ListViewBinding(),
      ],
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage<dynamic>(
      name: AppRoutes.details,
      page: () => const DetailsPage(),
      binding: DetailsBinding(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage<dynamic>(
      name: AppRoutes.imageDetails,
      page: () => const ImageDetailPage(),
      binding: ImageDetailBinding(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 600),
    ),
  ];
}
