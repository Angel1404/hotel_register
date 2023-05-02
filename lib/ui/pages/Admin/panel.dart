import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_r/ui/global_widgets/auto_texts.dart';
import 'package:hotel_r/ui/global_widgets/buttons.dart';
import 'package:hotel_r/ui/pages/Admin/panel_controller.dart';
import 'package:hotel_r/ui/theme/theme.dart';
import 'package:hotel_r/ui/utils/share.dart';

import '../../../translation/app_text_translation.dart';

class PanelPage extends StatelessWidget {
  PanelPage({super.key});

  final controller = PanelController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30),
            physics: const BouncingScrollPhysics(),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.isError.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AutoSizeTextApp(
                      title: 'Error',
                      textStyle: ThemeInfo.styleTitleApp,
                    ),
                    ButtonGenery(
                      titleBtn: AppTextTranslation.intentarDeNuevoText.tr,
                      onPressed: controller.getRegisterClientes,
                    ),
                  ],
                );
              }

              if (controller.listClientes.isEmpty) {
                return Center(
                  child: Text(AppTextTranslation.noRegistersText.tr, style: ThemeInfo.styleTitleApp),
                );
              }
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                children: List.generate(controller.listClientes.length, (index) {
                  final cliente = controller.listClientes[index];
                  return Container(
                    width: Get.width / 2.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: ThemeInfo.backgroundColorButton01, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(offset: Offset(0, 1), blurRadius: 10, color: Colors.black12),
                      ],
                    ),
                    child: Column(
                      children: [
                        AutoSizeTextApp(
                          title: cliente.name,
                          maxLines: 2,
                          textStyle: ThemeInfo.styleTitleApp.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 8),
                        AutoSizeTextApp(
                          title: '${cliente.city} / ${cliente.country}',
                          maxLines: 2,
                          textStyle: ThemeInfo.styleTitleApp.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        AutoSizeTextApp(
                          title: 'Tel: ${cliente.phone}',
                          maxLines: 1,
                          textStyle: ThemeInfo.styleText.copyWith(color: Colors.black45, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        ButtonGenery(
                          titleBtn: AppTextTranslation.viewPdfText.tr,
                          minSizeH: 40,
                          minSizeW: 90,
                          onPressed: () {
                            openFileLocal(file: cliente.filePdf);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
