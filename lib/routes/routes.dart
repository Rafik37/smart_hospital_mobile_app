import 'package:demo_pfa/logic/bindings/main_binding.dart';
import 'package:get/get.dart';

import '../logic/bindings/auth_binding.dart';
import '../view/screens/add_patient_screen.dart';
import '../view/screens/auth/doctor_login_screen.dart';
import '../view/screens/auth/doctor_signup_screen.dart';
import '../view/screens/auth/nurse_login_screen.dart';
import '../view/screens/auth/nurse_signup_screen.dart';
import '../view/screens/auth/paramedical_login_screen.dart';
import '../view/screens/auth/paramedical_signup_screen.dart';
import '../view/screens/auth/patient_login_screen.dart';
import '../view/screens/auth/patient_signup_screen.dart';
import '../view/screens/auth/receptionist_login_screen.dart';
import '../view/screens/auth/receptionist_signup_screen.dart';
import '../view/screens/doctor_home_screen.dart';
import '../view/screens/approve_screen.dart';
import '../view/screens/nurse_home_screen.dart';
import '../view/screens/paramedical_home_screen.dart';
import '../view/screens/patient_home_screen.dart';
import '../view/screens/receptionist_home_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.approveScreen,
      page: () => ApproveScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.patientLoginScreen,
      page: () => PatientLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.patientSignUpScreen,
      page: () => PatientSignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.patientHomeScreen,
      page: () => PatientHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.doctorLoginScreen,
      page: () => DoctorLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.doctorSignUpScreen,
      page: () => DoctorSignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.doctorHomeScreen,
      page: () => DoctorHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.nurseLoginScreen,
      page: () => NurseLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.nurseSignUpScreen,
      page: () => NurseSignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.nurseHomeScreen,
      page: () => NurseHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.receptionistLoginScreen,
      page: () => ReceptionistLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.receptionistSignUpScreen,
      page: () => ReceptionistSignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.receptionistHomeScreen,
      page: () => ReceptionistHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.paramedicalLoginScreen,
      page: () => ParamedicalLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.paramedicalSignUpScreen,
      page: () => ParamedicalSignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.paramedicalHomeScreen,
      page: () => ParamedicalHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.addPatientScreen,
      page: () => AddPatientScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const approveScreen = '/approveScreen';
  static const doctorLoginScreen = '/doctorLoginScreen';
  static const doctorSignUpScreen = '/doctorSignUpScreen';
  static const doctorHomeScreen = '/doctorHomeScreen';
  static const patientLoginScreen = '/patientLoginScreen';
  static const patientSignUpScreen = '/patientSignUpScreen';
  static const patientHomeScreen = '/patientHomeScreen';
  static const nurseLoginScreen = '/nurseLoginScreen';
  static const nurseSignUpScreen = '/nurseSignUpScreen';
  static const nurseHomeScreen = '/nurseHomeScreen';
  static const receptionistLoginScreen = '/receptionistLoginScreen';
  static const receptionistSignUpScreen = '/receptionistSignUpScreen';
  static const receptionistHomeScreen = '/receptionistHomeScreen';
  static const paramedicalLoginScreen = '/paramedicalLoginScreen';
  static const paramedicalSignUpScreen = '/paramedicalSignUpScreen';
  static const paramedicalHomeScreen = '/paramedicalHomeScreen';
  static const addPatientScreen = '/addPatientScreen';
}
