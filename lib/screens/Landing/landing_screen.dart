import 'package:arc_app/screens/Landing/landing_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/size_config.dart';

class LandingScreen extends StatelessWidget {
  static String routeName = "/landing";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LandingScreenBody(),
    );
  }
}
