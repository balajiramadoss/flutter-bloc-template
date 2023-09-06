import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

///
/// Global Theme
///
@singleton
class GlobalTheme {
  ///
  /// Get Appbar Theme
  /// locator<GlobalTheme>().getAppbarTheme(context)
  ///
  ///
  AppBarTheme getAppbarTheme(BuildContext context) {
    return Theme.of(context).appBarTheme;
  }

  ///
  /// Get Text Theme
  ///
  TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  ///
  /// Get Color Scheme
  ///
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}


