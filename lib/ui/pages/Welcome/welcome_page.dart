import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_r/routes/app_pages.dart';
import 'package:hotel_r/ui/global_widgets/buttons.dart';
import 'package:hotel_r/ui/theme/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Bienvenido(a)/Welcome - ${Config.data['title']}', textAlign: TextAlign.center, style: ThemeInfo.styleTitleApp),
                SizedBox(height: Get.height * .3),
                const Text('Seleccina el idioma/Select your language', textAlign: TextAlign.center, style: ThemeInfo.styleTitleApp),
                SizedBox(height: Get.height * .02),

                ButtonGenery(
                  titleBtn: 'Español',
                  onPressed: () async {
                    var locale = const Locale('es', 'ES');
                    await Get.updateLocale(locale);
                    Get.toNamed(Routes.HOME);
                  },
                ),
                SizedBox(height: Get.height * .02),
                ButtonGenery(
                  titleBtn: 'English',
                  onPressed: () async {
                    var locale = const Locale('en', 'EN');
                    await Get.updateLocale(locale);
                    Get.toNamed(Routes.HOME);
                  },
                ),
                const Spacer(),
                ButtonGenery(
                  titleBtn: 'Entrar como admin',
                  onPressed: () async {
                    if (kDebugMode) {
                      Get.toNamed(Routes.PANEL);
                    } else {
                      Get.toNamed(Routes.ACCESSADMIN);
                    }
                  },
                ),
                SizedBox(height: Get.height * .05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
