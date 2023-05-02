import 'package:flutter/material.dart';
import 'package:get/get.dart';

void doneDialodOk({String message = 'Tu mensaje aquí', Function()? ontap, bool doneOK = true, String? iconLottie}) {
  Get.dialog(
    barrierDismissible: false,
    transitionCurve: Curves.bounceInOut,
    transitionDuration: const Duration(milliseconds: 400),
    SimpleDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              child: Icon(
                Icons.clear_outlined,
                size: 100,
                color: Colors.red,
              ),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
            Container(
              height: 1,
              color: Colors.grey,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
            ),
            InkWell(
              onTap: ontap ?? () => Get.back(),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void snackBarInfo({String bodyMessage = 'User', String messageTitle = 'Registro Exitoso', Color? backgroundColor, bool topSnack = false}) {
  Get.snackbar(
    messageTitle,
    bodyMessage,
    backgroundColor: backgroundColor ?? Colors.green,
    barBlur: 20,
    duration: const Duration(seconds: 3),
    colorText: Colors.white,
    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
    snackPosition: topSnack ? null : SnackPosition.BOTTOM,
  );
}
