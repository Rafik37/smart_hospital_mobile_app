import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/consts.dart';
import '../../utils/theme.dart';
import '../widgets/auth/language_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              LanguageWidget(),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            users[index].icon,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            users[index].name.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(users[index].screen);
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
