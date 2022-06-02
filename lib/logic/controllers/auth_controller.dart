import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isChecked = false;
  bool isSignedIn = false;
  var displayUserFirstName = ''.obs;
  var displayUserLastName = ''.obs;
  var token = ''.obs;
  final GetStorage _authBox = GetStorage();

  @override
  void onInit() {
    super.onInit();

    displayUserFirstName.value = _authBox.read('userFirstName') ?? "";
    displayUserLastName.value = _authBox.read('userLastName') ?? "";
    token.value = _authBox.read('token') ?? "";
  }

  void visibility() {
    isVisible = !isVisible;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }

  void patientSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/patient_register");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "mobile": mobile,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        Get.offNamed(Routes.approveScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void addPatient({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/patient_add");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "mobile": mobile,
          "status": 1,
        }),
      );
      if (response.statusCode == 200) {
        update();
        Get.offNamed(Routes.receptionistHomeScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void patientLogIn({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/patient_login");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        if(responseData['status']) {
          Get.offNamed(Routes.patientHomeScreen);
        } else {
          Get.offNamed(Routes.approveScreen);
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void doctorSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
    required String department,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/doctor_register");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          // "identifier": identifier,
          // "date_of_birth": dateOfBirth,
          // "gender": gender,
          "address": address,
          "mobile": mobile,
          "department": department,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        Get.offNamed(Routes.approveScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void doctorLogIn({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/doctor_login");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        if(responseData['status']) {
          Get.offNamed(Routes.doctorHomeScreen);
        } else {
          Get.offNamed(Routes.approveScreen);
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void nurseSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/nurse_register");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "mobile": mobile,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        Get.offNamed(Routes.approveScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void nurseLogIn({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/nurse_login");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        if(responseData['status']) {
          Get.offNamed(Routes.nurseHomeScreen);
        } else {
          Get.offNamed(Routes.approveScreen);
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void receptionistSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/receptionist_register");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "mobile": mobile,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        Get.offNamed(Routes.approveScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void receptionistLogIn({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/receptionist_login");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        if(responseData['status']) {
          Get.offNamed(Routes.receptionistHomeScreen);
        } else {
          Get.offNamed(Routes.approveScreen);
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void paramedicalSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String identifier,
    required String dateOfBirth,
    required String address,
    required String mobile,
    required String gender,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/paramedical_register");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "mobile": mobile,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        Get.offNamed(Routes.approveScreen);
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void paramedicalLogIn({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/paramedical_login");
    try {
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          "username": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        displayUserFirstName.value = responseData['first_name'];
        displayUserLastName.value = responseData['last_name'];
        token.value = responseData['token'];
        isSignedIn = true;
        await _authBox.write('auth', isSignedIn);
        await _authBox.write('userFirstName', displayUserFirstName.value);
        await _authBox.write('userLastName', displayUserLastName.value);
        await _authBox.write('token', token.value);

        update();
        if(responseData['status']) {
          Get.offNamed(Routes.paramedicalHomeScreen);
        } else {
          Get.offNamed(Routes.approveScreen);
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    Uri url = Uri.parse("http://10.0.2.2:8000/api/logout");
    try {
      await http.post(
        url,
        headers: {'content-type': 'application/json', 'Authorization': 'Token ${token.value}'},
      );
      displayUserFirstName.value = '';
      displayUserFirstName.value = '';
      token.value = '';
      isSignedIn = false;
      await _authBox.remove('auth');
      await _authBox.remove('userFirstName');
      await _authBox.remove('userLastName');
      await _authBox.remove('token');

      update();
      Get.offAllNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
