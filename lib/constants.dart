import 'package:flutter/material.dart';
import 'package:taxi_app/theme.dart';
import './size_config.dart';

const Color PRIMARYCOLOR = Color.fromARGB(255, 0, 86, 235);
const Color SECONDARYCOLOR = Color.fromARGB(255, 111, 111, 111);
const Color SECONDARYCOLOR_LIGHT = Colors.grey;
MaterialColor primarySwatchColor = MaterialColor(0xFF0384FC, _color);

const Map<int, Color> _color = {
  50: Color(0xFFE3F2FD),
  100: Color(0xFFBBDEFB),
  200: Color(0xFF90CAF9),
  300: Color(0xFF64B5F6),
  400: Color(0xFF42A5F5),
  500: Color.fromARGB(255, 0, 86, 235),
  600: Color(0xFF1E88E5),
  700: Color(0xFF1976D2),
  800: Color(0xFF1565C0),
  900: Color(0xFF0D47A1),
};

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}



class ApiKeys {
  static String googleMapkey = 'AIzaSyAbs0hgqNa7G6Chjooy0iC_YST4kq0bCwc';
}


const defaultDuration = Duration(milliseconds: 250);
