import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        text: text,
      ),
    );
  }
}
