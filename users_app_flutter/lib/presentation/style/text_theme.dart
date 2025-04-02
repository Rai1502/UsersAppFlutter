import 'package:flutter/material.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';

String fontFamily = 'Formula1';

TextTheme theme = const TextTheme(
  displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
  displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
  displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
  bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: ColorPalette.primaryText),
  bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      color: ColorPalette.secondaryText),
  bodySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  ),
  labelLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
);

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}
