import 'package:get/get.dart';
import 'package:object_detection/core/routes/app_routes.dart';
import 'package:object_detection/presentation/home/controllers/ar_binding.dart';
import 'package:object_detection/presentation/home/controllers/home_binding.dart';
import 'package:object_detection/presentation/home/pages/ar_android_page.dart';
import 'package:object_detection/presentation/home/pages/ar_ios_page.dart';
import 'package:object_detection/presentation/home/pages/home_page.dart';
import 'package:object_detection/presentation/splash_page.dart';

/// The PagesManager class is responsible for managing the list of pages in a Dart application,
/// including their names, associated widgets, and bindings.
class PagesManager {
  PagesManager._();
  static final List<GetPage> pages = [
    GetPage(
      name: RoutesPaths.splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RoutesPaths.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesPaths.arAndroidPage,
      page: () => const ARPageAndroid(),
      binding: ARBinding(),
    ),
    GetPage(
      name: RoutesPaths.arIosPage,
      page: () => const ARPageIOS(),
      binding: ARBinding(),
    ),
  ];
}
