import 'dart:io';
import 'dart:ui' as ui;
import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_r/ui/utils/share.dart';
import 'package:hotel_r/ui/utils/texts_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/clientes_model.dart';
import '../../translation/app_text_translation.dart';

Future<File> generatePdf({required ui.Image image, required ClienteModels client}) async {
  await permissionExternalStorager();

  final pdf = pw.Document();
  final date = DateTime.now().toUtc().second.toString();
  final imagenFm =
      pw.MemoryImage((await convertBytesToFile(image: image, nameImage: "${client.name.toString().capitalizeFirst}_$date")).readAsBytesSync());

  final bytes = (await rootBundle.load('assets/logo.jpeg')).buffer.asUint8List();
  final logoImage = pw.MemoryImage(bytes);
  const pageTheme = pw.PageTheme(
    margin: pw.EdgeInsets.all(5.0 * PdfPageFormat.mm),
  );

  pdf.addPage(
    pw.Page(
      pageTheme: pageTheme,
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: double.maxFinite,
            height: 80,
            alignment: pw.Alignment.centerLeft,
            child: pw.Image(logoImage),
          ),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            width: double.maxFinite,
            child: pw.Text(
              tarjetaDeRegistroHotelero,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Container(height: 10),
          pw.Table(
            border: pw.TableBorder.all(width: 1, color: PdfColors.black),
            children: [
              tablwContent(titles: [
                AppTextTranslation.nameFieldText.tr,
                AppTextTranslation.direccionFieldText.tr,
              ], values: [
                client.name,
                client.adress,
              ]),
              tablwContent(titles: [
                AppTextTranslation.cityFieldText.tr,
                AppTextTranslation.countryFieldText.tr,
              ], values: [
                client.city,
                client.country,
              ]),
              tablwContent(titles: [
                AppTextTranslation.phoneFieldText.tr,
                AppTextTranslation.emailLoginText.tr,
              ], values: [
                client.phone,
                client.email,
              ]),
            ],
          ),
          pw.Container(height: 10),
          pw.Container(
            width: double.maxFinite,
            child: pw.Text(
              textServiceClient,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Container(height: 20),
          pw.Container(
            width: double.maxFinite,
            child: pw.Text(
              derechosHotelPDF,
              style: const pw.TextStyle(fontSize: 10),
            ),
          ),
          pw.Container(
            width: 200,
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(15),
            margin: const pw.EdgeInsets.all(15),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Image(
                  imagenFm,
                  height: 150,
                  width: 100,
                ),
                pw.Divider(thickness: 2),
                pw.SizedBox(
                  child: pw.Text(
                    'Firma - Signature\nHotel',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        padding: const pw.EdgeInsets.all(5),
        decoration: const pw.BoxDecoration(
          color: PdfColors.grey,
          // border: pw.Border.all(width: 1.5),
        ),
        child: pw.Text(
          title,
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
      pw.Container(
        padding: const pw.EdgeInsets.all(5),
        decoration: const pw.BoxDecoration(
          color: PdfColors.white,
          // border: pw.Border.all(width: 1.5),
        ),
        child: pw.Text(
          value,
          style: const pw.TextStyle(
            color: PdfColors.black,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

tablwContent({required List<String> titles, required List<String> values}) {
  return pw.TableRow(
    decoration: pw.BoxDecoration(
      color: PdfColors.white,
      border: pw.Border.all(),
    ),
    children: List.generate(
      titles.length,
      (index) => pwContainer(
        title: titles[index],
        value: values[index],
      ),
    ),
  );
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
