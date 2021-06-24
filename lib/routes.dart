import 'package:arc_app/auth/authentication_wrapper.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Landing/landing_screen.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:arc_app/screens/Login/log_in_screen.dart';
import 'package:arc_app/screens/Sign up/sign_up_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => LandingScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  Dashboard.routeName: (context) => Dashboard(),
  AuthenticationWrapper.routeName: (context) => AuthenticationWrapper(),
  SettingsScreen.routeName: (context) => SettingsScreen()
};
