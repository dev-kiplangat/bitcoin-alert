import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: kTextMediumColor,
      ),
      colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kTextMediumColor,
          error: Colors.red));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark();
}
