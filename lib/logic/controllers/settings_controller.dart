import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingController extends GetxController {
  var storage = GetStorage();
  var langLocal = ene;
  bool _isChanged = false;

  @override
  void onInit() async {
    super.onInit();

    if (_isChanged) {
      langLocal = await getLanguage;
    } else {
      saveLanguage(ene);
      langLocal = ene;
    }
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage {
    return storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    _isChanged = true;
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
