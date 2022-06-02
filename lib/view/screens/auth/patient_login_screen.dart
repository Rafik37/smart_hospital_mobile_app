import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class PatientLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  PatientLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 25,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              text: 'LOG'.tr,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextUtils(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'IN'.tr,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Enter a valid email'.tr;
                            }
                            return null;
                          },
                          prefIcon: Icon(
                            Icons.email,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            size: 30,
                          ),
                          hintText: 'Email'.tr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisible ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should contain at least 6 characters'.tr;
                              }
                              return null;
                            },
                            prefIcon: Icon(
                              Icons.lock,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: Icon(
                                controller.isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Password'.tr,
                          );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.patientLogIn(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                            text: 'LOG IN'.tr,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an account? ".tr,
                textType: "Sign Up".tr,
                onPressed: () {
                  Get.offNamed(Routes.patientSignUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}