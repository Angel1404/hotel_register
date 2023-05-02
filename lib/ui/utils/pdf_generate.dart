import 'dart:io';
import 'dart:ui' as ui;
import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/clientes_model.dart';
import '../../translation/app_text_translation.dart';

Future<File> generatePdf({required ui.Image image, required ClienteModels client}) async {
  final pdf = pw.Document();
  final date = DateTime.now().toUtc().second.toString();
  final imagenFm =
      pw.MemoryImage((await convertBytesToFile(image: image, nameImage: "${client.name.toString().capitalizeFirst}_$date")).readAsBytesSync());

  final bytes = (await rootBundle.load('assets/logo.jpeg')).buffer.asUint8List();
  final logoImage = pw.MemoryImage(bytes);

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: double.maxFinite,
            height: 80,
            alignment: pw.Alignment.centerLeft,
            child: pw.Image(logoImage),
          ),
          pw.SizedBox(
            width: double.maxFinite,
            child: pw.Wrap(
              runSpacing: 5,
              spacing: 10,
              children: [
                pwContainer(title: AppTextTranslation.nameFieldText.tr, value: client.name),
                pwContainer(title: AppTextTranslation.direccionFieldText.tr, value: client.adress),
                pwContainer(title: AppTextTranslation.cityFieldText.tr, value: client.city),
                pwContainer(title: AppTextTranslation.countryFieldText.tr, value: client.country),
                pwContainer(title: AppTextTranslation.phoneFieldText.tr, value: client.phone),
                pwContainer(title: AppTextTranslation.emailLoginText.tr, value: client.email),
              ],
            ),
          ),
          pw.Container(
            height: 210,
            width: double.maxFinite,
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(15),
            margin: const pw.EdgeInsets.all(15),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1.5),
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Image(
              imagenFm,
              height: 200,
              width: 350,
            ),
          ),
        ],
      ),
    ),
  );
  final output = await _getSavedDir();
  final namefile = "${client.name.toString().capitalizeFirst}_$date";
  final file = File("$output/$namefile.pdf");
  return file.writeAsBytes(await pdf.save());
}

//Componer una especie de tablas para acomodar el formulario
pwContainer({required String title, required String value}) {
  return pw.Container(
    width: 150,
    color: PdfColors.red,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.maxFinite,
          padding: const pw.EdgeInsets.all(10),
          decoration: pw.BoxDecoration(
            color: PdfColors.grey,
            border: pw.Border.all(width: 1.5),
          ),
          child: pw.Text(
            title,
            style: pw.TextStyle(
              color: PdfColors.black,
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          width: double.maxFinite,
          padding: const pw.EdgeInsets.all(10),
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            border: pw.Border.all(width: 1.5),
          ),
          child: pw.Text(
            value,
            style: const pw.TextStyle(
              color: PdfColors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );

  // pw.Container(
  //   padding: const pw.EdgeInsets.all(10),
  //   decoration: pw.BoxDecoration(
  //     border: pw.Border.all(),
  //   ),
  //   child: pw.Text(
  //     value,
  //     style: const pw.TextStyle(
  //       color: PdfColors.black,
  //       fontSize: 20,
  //     ),
  //   ),
  // ),
}

Future<File> convertBytesToFile({required ui.Image image, String? nameImage}) async {
  final output = await _getSavedDir();
  final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asInt8List();
  final filepath = nameImage ?? DateTime.now().toUtc().toString();
  File imgFile = File("$output/$filepath.png");
  return await imgFile.writeAsBytes(bytes);
}

Future<String?> _getSavedDir() async {
  String? externalStorageDirPath;

  if (Platform.isAndroid) {
    try {
      externalStorageDirPath = await AndroidPathProvider.downloadsPath;
    } catch (err) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    }
  } else if (Platform.isIOS) {
    externalStorageDirPath = (await getApplicationDocumentsDirectory()).absolute.path;
  }

  final savedDir = Directory(externalStorageDirPath!);
  if (!savedDir.existsSync()) {
    await savedDir.create();
  }
  return externalStorageDirPath;
}
