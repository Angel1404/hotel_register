import 'package:get/get.dart';

import '../ui/pages/Admin/panel_controller.dart';
import '../ui/pages/Home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class PanelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanelController>(() => PanelController());
  }
}
