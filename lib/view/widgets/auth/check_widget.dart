import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();

  CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: controller.isChecked
                  ? const Icon(
                      Icons.done,
                      color: mainColor,
                      size: 30,
                    )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "I accept ".tr,
              ),
              TextUtils(
                underline: TextDecoration.underline,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'terms & conditions'.tr,
              ),
            ],
          ),
        ],
      );
    });
  }
}
