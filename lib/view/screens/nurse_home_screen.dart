import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../utils/theme.dart';
import '../widgets/logout_widget.dart';
import '../widgets/text_utils.dart';

class NurseHomeScreen extends StatelessWidget {
  NurseHomeScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: 'Hello Nurse ${authController.displayUserFirstName.value} ${authController.displayUserLastName.value}',
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              text: "GENERAL".tr,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            const SizedBox(
              height: 20,
            ),
            LogOutWidget(),
          ],
        ),
      ),
    );
  }
}
