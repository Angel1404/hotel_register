import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_r/ui/global_widgets/buttons.dart';
import 'package:hotel_r/ui/global_widgets/dialogs.dart';
import 'package:hotel_r/ui/global_widgets/inputs.dart';
import 'package:hotel_r/ui/pages/Home/home_controller.dart';
import 'package:hotel_r/ui/theme/theme.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../translation/app_text_translation.dart';
import '../../global_widgets/auto_texts.dart';
import '../../utils/texts_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? nController, phoneController, emialController, countryController, stateController, cityController, addressController;

  @override
  void initState() {
    super.initState();
    nController = TextEditingController();
    phoneController = TextEditingController();
    emialController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();
    stateController = TextEditingController();
  }

  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  final controller = HomeController.to;

  saveDate() async {
    final image = await _signaturePadKey.currentState?.toImage();

    if (nController!.text.isEmpty ||
        phoneController!.text.isEmpty ||
        countryController!.text.isEmpty ||
        cityController!.text.isEmpty ||
        addressController!.text.isEmpty) {
      doneDialodOk(message: AppTextTranslation.errFieldText.tr);
      return;
    }

    if (!emialController!.text.isEmail || emialController!.text.isEmpty) {
      doneDialodOk(message: AppTextTranslation.emailErrorText.tr);
      return;
    }
    if (!controller.readRightsHotel.value) {
      doneDialodOk(message: AppTextTranslation.errReadRightsAndObligationsText.tr);
      return;
    }
    if (image == null) {
      doneDialodOk(message: AppTextTranslation.errImageFirmaText.tr);
      return;
    }
    await controller.saveData(
      image: image,
      adress: addressController!.text,
      city: cityController!.text,
      country: countryController!.text,
      email: emialController!.text,
      name: nController!.text,
      phone: phoneController!.text,
    );

    clearData();
    snackBarInfo(messageTitle: nController!.text, bodyMessage: AppTextTranslation.succefullText.tr);
  }

  clearData() {
    addressController!.clear();
    cityController!.clear();
    countryController!.clear();
    emialController!.clear();
    nController!.clear();
    phoneController!.clear();
    controller.readRightsHotel.value = false;
    _signaturePadKey.currentState!.clear();
  }

  String selectedCountry = "";
  String selectedState = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * .05),
                AutoSizeTextApp(title: '${AppTextTranslation.titleFormularioText.tr}*', textStyle: ThemeInfo.styleTitleApp, maxLines: 1),
                SizedBox(height: Get.height * .05),
                InputGenery(controller: nController, textInputType: TextInputType.name, hintText: '${AppTextTranslation.nameFieldText.tr}*'),
                SizedBox(height: Get.height * .03),
                InputGenery(
                    controller: addressController,
                    hintText: '${AppTextTranslation.direccionFieldText.tr}*',
                    textInputType: TextInputType.streetAddress),
                SizedBox(height: Get.height * .03),
                _SelectCountryAndCity(countryController: countryController, stateController: stateController, cityController: cityController),
                SizedBox(height: Get.height * .03),
                InputGenery(
                  controller: cityController,
                  hintText: cityController!.text.isEmpty ? '${AppTextTranslation.cityFieldText.tr}*' : cityController!.text,
                  enable: false,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                SizedBox(height: Get.height * .03),
                InputGenery(controller: phoneController, hintText: '${AppTextTranslation.phoneFieldText.tr}*', textInputType: TextInputType.number),
                SizedBox(height: Get.height * .03),
                InputGenery(controller: emialController, hintText: '${AppTextTranslation.emailLoginText.tr}*'),
                SizedBox(height: Get.height * .03),
                _RightsAndOligationsHotel(controller: controller),
                SizedBox(height: Get.height * .01),
                Obx(() {
                  if (!controller.readRightsHotel.value) {
                    return const SizedBox();
                  }
                  return _FirmaCard(signaturePadKey: _signaturePadKey);
                }),
                SizedBox(height: Get.height * .05),
                ButtonGenery(
                  titleBtn: AppTextTranslation.saveCountryCityText.tr,
                  onPressed: saveDate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectCountryAndCity extends StatelessWidget {
  const _SelectCountryAndCity({
    required this.countryController,
    required this.stateController,
    required this.cityController,
  });

  final TextEditingController? countryController;
  final TextEditingController? stateController;
  final TextEditingController? cityController;

  @override
  Widget build(BuildContext context) {
    return InputGenery(
      controller: countryController,
      hintText: countryController!.text.isEmpty ? '${AppTextTranslation.countryFieldText.tr}*' : countryController!.text,
      onTap: () {
        Get.dialog(
          SimpleDialog(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CountryStateCityPicker(
                      country: countryController!,
                      state: stateController!,
                      city: cityController!,
                      textFieldInputBorder: const UnderlineInputBorder(),
                    ),
                    const SizedBox(height: 20),
                    ButtonGenery(
                      titleBtn: AppTextTranslation.saveCountryCityText.tr,
                      onPressed: () {
                        // setState(() {});
                        Get.back();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RightsAndOligationsHotel extends StatelessWidget {
  const _RightsAndOligationsHotel({
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.defaultDialog(
          title: AppTextTranslation.leerDerechosHText.tr,
          onWillPop: () async => kDebugMode,
          barrierDismissible: kDebugMode,
          middleText: '',
          actions: [
            SizedBox(
              height: Get.height * .6,
              width: double.maxFinite,
              child: const Scrollbar(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(derechosHotel, textAlign: TextAlign.justify),
                ),
              ),
            ),
          ],
          confirmTextColor: Colors.white,
          onConfirm: () {
            controller.readRightsHotel.value = true;
            Get.back();
          },
        );
      },
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeTextApp(
                title: AppTextTranslation.leerDerechosHText.tr,
                textStyle: ThemeInfo.styleSubTitleApp1.copyWith(
                  fontSize: 18,
                  color: controller.readRightsHotel.value ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              Icon(Icons.arrow_forward_ios, size: 18, color: controller.readRightsHotel.value ? Colors.green : Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

class _FirmaCard extends StatelessWidget {
  const _FirmaCard({required this.signaturePadKey});
  final GlobalKey<SfSignaturePadState> signaturePadKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          SfSignaturePad(
            key: signaturePadKey,
            minimumStrokeWidth: 1,
            maximumStrokeWidth: 3,
            strokeColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                child: const Text('Limpiar'),
                onPressed: () {
                  signaturePadKey.currentState?.clear();
                  signaturePadKey.currentState?.toImage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
