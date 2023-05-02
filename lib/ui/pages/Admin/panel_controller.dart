import 'package:get/get.dart';
import 'package:hotel_r/data/provider/db.dart';

import '../../../data/models/clientes_model.dart';

class PanelController extends GetxController {
  static PanelController get to => Get.find<PanelController>();

  @override
  void onInit() {
    super.onInit();
    getRegisterClientes();
  }

  final listClientes = RxList<ClienteModels>([]);
  final isLoading = false.obs;
  final isError = false.obs;
  getRegisterClientes() async {
    try {
      isLoading.value = true;
      listClientes.value = await DBClientes.db.obtenerAllResgistros();
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }
}
