import 'package:get/get.dart';
import 'package:voltsense2/utils/logging/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
