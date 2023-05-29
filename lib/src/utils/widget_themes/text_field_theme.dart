import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: secondaryColor),
    ),
    prefixIconColor: secondaryColor,
    floatingLabelStyle: TextStyle(color: secondaryColor),
  );

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: primaryColor),
    ),
    prefixIconColor: primaryColor,
    floatingLabelStyle: TextStyle(color: primaryColor),
  );
}
