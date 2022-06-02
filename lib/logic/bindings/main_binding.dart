import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}