import 'package:flutter/material.dart';

const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 = Color(0xFFFEDBD0);
const kShrinePink300 = Color(0xFFFBB8AC);
const kShrinePink400 = Color(0xFFEAA4A4);

const kShrineBrown900 = Color(0xFF442B2D);

const kShrineErrorRed = Color(0xFFC5032B);

const kShrineSurfaceWhite = Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

final ThemeData kShrineTheme = _buildShrineTheme();

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: kShrinePink100,
  primaryVariant: kShrineBrown900,
  secondary: kShrinePink50,
  secondaryVariant: kShrineBrown900,
  surface: kShrineSurfaceWhite,
  background: kShrineBackgroundWhite,
  error: kShrineErrorRed,
  onPrimary: kShrineBrown900,
  onSecondary: kShrineBrown900,
  onSurface: kShrineBrown900,
  onBackground: kShrineBrown900,
  onError: kShrineSurfaceWhite,
  brightness: Brightness.light,
);

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    primaryColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    errorColor: kShrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kShrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
