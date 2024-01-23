import 'package:flutter/widgets.dart';
// import 'package:taxi_app/screens/cart/cart_screen.dart';
import 'package:taxi_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:taxi_app/screens/dashboard/new_dashboard.dart';
// import 'package:taxi_app/screens/details/details_screen.dart';
import 'package:taxi_app/screens/forgot_password/forgot_password_screen.dart';
// import 'package:taxi_app/screens/home/home_screen.dart';
import 'package:taxi_app/screens/login_success/login_success_screen.dart';
import 'package:taxi_app/screens/otp/otp_screen.dart';

import 'package:taxi_app/screens/profile/profile_screen.dart';
import 'package:taxi_app/screens/sign_in/sign_in_screen.dart';
import 'package:taxi_app/screens/splash_shop/splash_screen.dart';

import 'package:taxi_app/screens/ride/ridescreen.dart';
import 'package:taxi_app/screens/dashboard/dashboardscreen.dart';
// import 'package:taxi_app/screens/sign_in/sign_in_screen.dart';

import 'package:taxi_app/screens/Favplaces/favrouite_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  DashboardScreen.routeName: (context) => NavigationHomeScreen(),
  RideScreen.routeName: (ctx) => const RideScreen(),
  FavroiteScreen.routeName: (ctx) => const FavroiteScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
};
