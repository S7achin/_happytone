import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/color.dart';

class STextFormFieldTheme {
  STextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: sSecondaryColor,
          floatingLabelStyle: TextStyle(color: sSecondaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: sSecondaryColor)));

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: sPrimaryColor,
          floatingLabelStyle: TextStyle(color: sPrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: sPrimaryColor)));
}
