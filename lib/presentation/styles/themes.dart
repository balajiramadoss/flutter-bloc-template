import 'package:flutter/material.dart';

///
/// ColorSchemes are generated from this website
/// https://m3.material.io/theme-builder#/custom
///

///
/// if
///

const String defaultFontFamily = 'Oxygen';

///
TextTheme textTheme = const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(fontSize: 28, fontWeight: FontWeight.w700));

///
/// LightColorScheme
///
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006A61),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF73F8E8),
  onPrimaryContainer: Color(0xFF00201D),
  secondary: Color(0xFF4A635F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8E3),
  onSecondaryContainer: Color(0xFF05201C),
  tertiary: Color(0xFF46617A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCDE5FF),
  onTertiaryContainer: Color(0xFF001D32),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFB),
  onBackground: Color(0xFF191C1C),
  surface: Color(0xFFFAFDFB),
  onSurface: Color(0xFF191C1C),
  surfaceVariant: Color(0xFFDAE5E2),
  onSurfaceVariant: Color(0xFF3F4947),
  outline: Color(0xFF6F7977),
  onInverseSurface: Color(0xFFEFF1EF),
  inverseSurface: Color(0xFF2D3130),
  inversePrimary: Color(0xFF52DBCB),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006A61),
  outlineVariant: Color(0xFFBEC9C6),
  scrim: Color(0xFF000000),
);

///
/// Dark Color Scheme
///
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF52DBCB),
  onPrimary: Color(0xFF003732),
  primaryContainer: Color(0xFF005049),
  onPrimaryContainer: Color(0xFF73F8E8),
  secondary: Color(0xFFB1CCC7),
  onSecondary: Color(0xFF1C3531),
  secondaryContainer: Color(0xFF324B48),
  onSecondaryContainer: Color(0xFFCCE8E3),
  tertiary: Color(0xFFAEC9E6),
  onTertiary: Color(0xFF163349),
  tertiaryContainer: Color(0xFF2E4961),
  onTertiaryContainer: Color(0xFFCDE5FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1C),
  onBackground: Color(0xFFE0E3E1),
  surface: Color(0xFF191C1C),
  onSurface: Color(0xFFE0E3E1),
  surfaceVariant: Color(0xFF3F4947),
  onSurfaceVariant: Color(0xFFBEC9C6),
  outline: Color(0xFF899390),
  onInverseSurface: Color(0xFF191C1C),
  inverseSurface: Color(0xFFE0E3E1),
  inversePrimary: Color(0xFF006A61),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF52DBCB),
  outlineVariant: Color(0xFF3F4947),
  scrim: Color(0xFF000000),
);

///
/// Light Theme
/// The colors in [lightThemeData] MUST be used from [lightColorScheme]
///
ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: defaultFontFamily,
    textTheme: textTheme.apply(bodyColor: lightColorScheme.onBackground),
    scaffoldBackgroundColor: lightColorScheme.background,
    appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
        toolbarTextStyle: textTheme.titleLarge,
        titleTextStyle: textTheme.titleLarge
            ?.copyWith(color: lightColorScheme.background)));

///
/// DarkTheme Theme
/// The colors in [darkThemeData] MUST be used from [darkColorScheme]
///
ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    fontFamily: defaultFontFamily,
    scaffoldBackgroundColor: darkColorScheme.background,
    textTheme: textTheme.apply(bodyColor: darkColorScheme.onBackground),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      toolbarTextStyle: textTheme.titleLarge,
      titleTextStyle:
          textTheme.titleLarge?.copyWith(color: darkColorScheme.background),
    ));
