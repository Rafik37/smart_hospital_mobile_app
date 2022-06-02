import 'package:demo_pfa/model/user_grid.dart';
import 'package:demo_pfa/routes/routes.dart';
import 'package:flutter/material.dart';

List<UserGrid> users = [
  UserGrid(
    name: "Patient",
    icon: Icons.accessibility,
    screen: Routes.patientLoginScreen,
  ),
  UserGrid(
    name: "Doctor",
    icon: Icons.accessibility,
    screen: Routes.doctorLoginScreen,
  ),
  UserGrid(
    name: "Nurse",
    icon: Icons.accessibility,
    screen: Routes.nurseLoginScreen,
  ),
  UserGrid(
    name: "Reception",
    icon: Icons.accessibility,
    screen: Routes.receptionistLoginScreen,
  ),
  UserGrid(
    name: "Paramedical",
    icon: Icons.accessibility,
    screen: Routes.paramedicalLoginScreen,
  ),
  // UserGrid(
  //   name: "Pharmacist",
  //   icon: Icons.accessibility,
  //   screen: Routes.loginScreen,
  // ),
];
