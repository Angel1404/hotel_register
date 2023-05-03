import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:hotel_r/data/models/clientes_model.dart';
import 'package:hotel_r/ui/global_widgets/dialogs.dart';

import '../../../data/provider/db.dart';
import '../../utils/pdf_generate.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  final readRightsHotel = false.obs;

  Future saveData({
    required ui.Image image,
    required String name,
    required String adress,
    required String city,
    required String country,
    required String phone,
    required String email,
  }) async {
    try {
      final clienteModel = ClienteModels(filePdf: '', name: name, adress: adress, city: city, country: country, email: email, phone: phone);
      final pdfsave = await generatePdf(image: image, client: clienteModel);
      final clienteModelnew =
          ClienteModels(filePdf: pdfsave.path, name: name, adress: adress, city: city, country: country, email: email, phone: phone);

      // print('Printt Path PDf : ${pdfsave.path}');
      // openFileLocal(file: pdfsave.path);
      DBClientes.db.nuevoRegistro(clienteModelnew);
    } catch (e) {
      print('ERR $e');
      doneDialodOk(message: e.toString());
      return;
    }
  }
}
