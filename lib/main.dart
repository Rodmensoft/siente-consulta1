import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:siente_app/app/routes/app_pages.dart';
import 'package:siente_app/app/translation/localizations_delegates.dart';
import 'package:siente_app/app/translation/supported_locales.dart';
import 'package:siente_app/app/ui/pages/splash_page/splash_binding.dart';
import 'package:siente_app/app/ui/pages/splash_page/splash_page.dart';
import 'package:siente_app/app/ui/theme/app_theme.dart';
import 'package:siente_app/app/ui/utils/dependency_injection.dart';
import 'package:siente_app/app/ui/utils/user_preferences.dart';

final UserPreferences prefs = UserPreferences();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final UserPreferences prefs = UserPreferences();
  await prefs.initPrefs();
  // HttpOverrides.global = MyHttpOverrides();
  DependencyInjection.init();
  runApp(const MyApp());
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Siente',
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        theme: AppTheme.themeData,
        initialBinding: SplashBinding(),
        getPages: AppPages.pages,
        localizationsDelegates: LocalizationDelegates.delegates,
        supportedLocales: SupportedLocales.locale,
      ),
    );
  }
}
