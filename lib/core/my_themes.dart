import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';

class MyThemes {
  static final defaultTheme = ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    primaryColor: kWhitePC,
    iconTheme: const IconThemeData(color: kFrenchGrey),
    colorScheme: const ColorScheme.dark(),
  );
}
