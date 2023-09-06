import 'package:flutter/material.dart';

///
class CustomColors {
  ///
  /// Text('hello',style: TextStyle(color:CustomColors.bgColor.of(context)));
  ///
  static ThemedColor bgColor =
      ThemedColor(darkColor: Colors.grey, lightColor: Colors.blueGrey);
}

///
/// This works fine with dark/light custom colors
///
///
class ThemedColor {
  ///
  Color darkColor;

  ///
  Color lightColor;

  ///
  ThemedColor({required this.darkColor, required this.lightColor});

  ///
  Color of(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark
        ? darkColor
        : lightColor;
  }
}
