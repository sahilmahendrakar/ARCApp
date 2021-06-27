import 'package:arc_app/screens/Landing/landing_screen.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arc_app/screens/home.dart';

class AuthenticationWrapper extends StatelessWidget {
  static String routeName = "/auth";
  const AuthenticationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      print(firebaseUser.displayName);
      return Home();
    }

    return LandingScreen();
  }
}
