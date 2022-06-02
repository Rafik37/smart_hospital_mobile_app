import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/text_utils.dart';
import '../../../utils/theme.dart';

class ReceptionistSignUpScreen extends StatefulWidget {
  ReceptionistSignUpScreen({Key? key}) : super(key: key);

  @override
  State<ReceptionistSignUpScreen> createState() => _ReceptionistSignUpScreenState();
}

class _ReceptionistSignUpScreenState extends State<ReceptionistSignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController identifierController = TextEditingController();

  final TextEditingController dateOfBirthController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  DateTime? dateOfBirth;

  String selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    TextUtils(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      text: 'SIGN'.tr,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    TextUtils(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      text: 'UP'.tr,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 300,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        2,
                                child: AuthTextFormField(
                                  controller: firstNameController,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value.toString().length < 2 ||
                                        !RegExp(validationName)
                                            .hasMatch(value)) {
                                      return 'Enter a valid first name'.tr;
                                    }
                                    return null;
                                  },
                                  prefIcon: Icon(
                                    Icons.person,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                    size: 30,
                                  ),
                                  hintText: 'First Name'.tr,
                                ),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        2,
                                child: AuthTextFormField(
                                  controller: lastNameController,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value.toString().length < 2 ||
                                        !RegExp(validationName)
                                            .hasMatch(value)) {
                                      return 'Enter a valid last name'.tr;
                                    }
                                    return null;
                                  },
                                  prefIcon: Icon(
                                    Icons.person,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                    size: 30,
                                  ),
                                  hintText: 'Last Name'.tr,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: dateOfBirthController,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Enter a valid date of birth'.tr;
                              }
                              return null;
                            },
                            onTap: () async {
                              dateOfBirth = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: mainColor,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: mainColor,
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (dateOfBirth == null) return;
                              dateOfBirthController.text =
                                  '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}';
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                size: 30,
                              ),
                              hintText: 'Date of Birth'.tr,
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtils(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                text: 'Gender'.tr,
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Radio<String>(
                                value: "Male",
                                groupValue: selectedGender,
                                activeColor: mainColor,
                                onChanged: (value) =>
                                    setState(() => selectedGender = value!),
                              ),
                              TextUtils(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                text: "Male".tr,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Radio<String>(
                                value: "Female",
                                groupValue: selectedGender,
                                activeColor: mainColor,
                                onChanged: (value) =>
                                    setState(() => selectedGender = value!),
                              ),
                              TextUtils(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                text: "Female".tr,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFormField(
                            controller: mobileController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().length < 4 ||
                                  !RegExp(validationDigits).hasMatch(value)) {
                                return 'Enter a valid phone number'.tr;
                              }
                              return null;
                            },
                            prefIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              size: 30,
                            ),
                            hintText: 'Phone Number'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFormField(
                            controller: identifierController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().length < 8 ||
                                  !RegExp(validationDigits).hasMatch(value)) {
                                return 'Enter a valid NIC or passport number'
                                    .tr;
                              }
                              return null;
                            },
                            prefIcon: Icon(
                              Icons.credit_card,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              size: 30,
                            ),
                            hintText: 'NIC or Passport'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFormField(
                            controller: addressController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Enter an address'.tr;
                              }
                              return null;
                            },
                            prefIcon: Icon(
                              Icons.location_on,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              size: 30,
                            ),
                            hintText: 'Address'.tr,
                          ),
                          const SizedBox(
                            height: 20,
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
                                  return 'Password should contain at least 6 characters'
                                      .tr;
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
                            height: 20,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthTextFormField(
                              controller: confirmPasswordController,
                              obscureText: controller.isVisible ? false : true,
                              validator: (value) {
                                if (value.toString() !=
                                    passwordController.text) {
                                  return 'The password confirmation doas not match'
                                      .tr;
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
                              hintText: 'Confirm Password'.tr,
                            );
                          }),
                          const SizedBox(
                            height: 50,
                          ),
                          CheckWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    onPressed: () {
                      if (controller.isChecked == false) {
                        Get.snackbar(
                          'Terms and conditions'.tr,
                          'Please, accept terms & conditions'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      } else if (formKey.currentState!.validate()) {
                        String firstName = firstNameController.text.trim();
                        String lastName = lastNameController.text.trim();
                        String email = emailController.text.trim();
                        String password = passwordController.text;
                        String dateOfBirth = dateOfBirthController.text;
                        String gender = selectedGender;
                        String mobile = mobileController.text;
                        String identifier = identifierController.text;
                        String address = addressController.text.trim();
                        controller.receptionistSignUp(
                          firstName: firstName,
                          lastName: lastName,
                          email: email,
                          password: password,
                          dateOfBirth: dateOfBirth,
                          gender: gender,
                          mobile: mobile,
                          identifier: identifier,
                          address: address,
                        );
                      }
                    },
                    text: 'SIGN UP'.tr,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
