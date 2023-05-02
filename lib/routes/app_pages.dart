import 'package:get/get.dart';

import '../bindings/bindings.dart';
import 'z_routes_app.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.WELCOMEPAGE,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.ACCESSADMIN,
      page: () => const PasswordRequest(),
    ),
    GetPage(
      name: Routes.PANEL,
      page: () => PanelPage(),
      binding: PanelBinding(),
    ),
    GetPage(
      name: Routes.DETAILCLIENT,
      page: () => DetailClient(filePath: Get.arguments['file']),
    ),
  ];
}
