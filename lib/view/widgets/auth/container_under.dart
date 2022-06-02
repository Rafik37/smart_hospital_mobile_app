import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;

  const ContainerUnder({
    Key? key,
    required this.text,
    required this.textType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            text: text,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: textType,
              underline: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
