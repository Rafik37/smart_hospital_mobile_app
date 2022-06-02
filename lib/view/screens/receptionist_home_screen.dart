import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../widgets/logout_widget.dart';
import '../widgets/text_utils.dart';

class ReceptionistHomeScreen extends StatelessWidget {
  ReceptionistHomeScreen({Key? key}) : super(key: key);

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
              text:
                  'Hello Receptionist ${authController.displayUserFirstName.value} ${authController.displayUserLastName.value}',
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.addPatientScreen);
              },
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                minimumSize: const Size(360, 50),
              ),
              child: const TextUtils(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                text: 'Add a Patient',
              ),
            ),
            const SizedBox(
              height: 20,
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
