// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:taxi_app/app_theme.dart';
import './theme.dart';
import 'package:taxi_app/fitness_app_theme.dart';

import 'package:taxi_app/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    fontFamily: "Kanit",
    colorScheme: colorScheme,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return AppTheme.textTheme;
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

const ColorScheme colorScheme = ColorScheme(
  primary: kPrimaryColor, // <---- I set white color here
  primaryVariant: Color(0xFF117378),
  secondary: Color(0xFFEFF3F3),
  secondaryVariant: Color(0xFFFAFBFB),
  background: Color(0xFF636363),
  surface: Color(0xFF808080),
  onBackground: Colors.white,
  error: Colors.redAccent,
  onError: Colors.redAccent,
  onPrimary: kPrimaryColor, //Colors.redAccent,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

const kPrimaryColor = FitnessAppTheme.nearlyDarkBlue;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
