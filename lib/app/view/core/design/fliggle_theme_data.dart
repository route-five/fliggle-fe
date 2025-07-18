import 'package:flutter/material.dart';
import 'fliggle_colors.dart';

class FliggleThemeData {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Pretendard",
    brightness: Brightness.light,
    extensions: <ThemeExtension<dynamic>>[const FliggleLightColors()],
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Pretendard",
    brightness: Brightness.dark,
    extensions: <ThemeExtension<dynamic>>[const FliggleDarkColors()],
  );
}
