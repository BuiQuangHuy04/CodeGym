import 'package:flutter/material.dart';

class CustomTextStyle {


  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 40,
      color: Colors.white,
    );
  }

  static TextStyle? headline3(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: const Color(0xFF654AAA),
        );
  }

  static TextStyle? headline4(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: const Color(0xFF654AAA),
        );
  }

  static TextStyle? buttonContent(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
  }
}
