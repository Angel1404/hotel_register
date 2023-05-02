import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_r/translation/app_text_translation.dart';
import 'package:hotel_r/ui/global_widgets/dialogs.dart';
import 'package:hotel_r/ui/global_widgets/inputs.dart';

import '../../../routes/app_pages.dart';
import '../../global_widgets/buttons.dart';

class PasswordRequest extends StatefulWidget {
  const PasswordRequest({super.key});

  @override
  State<PasswordRequest> createState() => _PasswordRequestState();
}

class _PasswordRequestState extends State<PasswordRequest> {
  final passWordController = TextEditingController();

  validPasswordRequest() {
    if (passWordController.text != "AdminHotel") {
      doneDialodOk(message: AppTextTranslation.errorConfirmPasswordText.tr);
      return;
    }

    Get.back();
    Get.toNamed(Routes.PANEL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputGenery(
              obscureText: true,
              controller: passWordController,
              hintText: AppTextTranslation.passwordLoginText.tr,
              suixIcon: true,
            ),
            SizedBox(height: Get.height * .02),
            ButtonGenery(
              titleBtn: 'Entrar',
              onPressed: validPasswordRequest,
            ),
          ],
        ),
      ),
    );
  }
}
