import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/sizes.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      foregroundColor: sWhiteColor,
      backgroundColor: sSecondaryColor,
      side: const BorderSide(color: sSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      foregroundColor: sSecondaryColor,
      backgroundColor: sWhiteColor,
      side: const BorderSide(color: sWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );
}
