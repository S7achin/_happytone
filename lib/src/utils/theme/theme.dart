import 'package:flutter/material.dart';
import 'package:_happytone/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:_happytone/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:_happytone/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:_happytone/src/utils/theme/widget_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: STextTheme.lightTextTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: STextTheme.darkTextTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme);
}
