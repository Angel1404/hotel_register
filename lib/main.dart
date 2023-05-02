import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_r/routes/app_pages.dart';

import 'data/config.dart';
import 'data/provider/db.dart';
import 'translation/app_translations.dart';
import 'ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBClientes.db.initDB();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: Config.data['title'].toString(),
    theme: ThemeInfo.getTheme(),
    defaultTransition: Transition.fade,
    translations: AppTranslations(),
    locale: Get.deviceLocale,

    // initialBinding: SplashBinding(),
    getPages: AppPages.pages,
    initialRoute: Routes.WELCOMEPAGE,
    // home: SplashPage(),
  ));
}
