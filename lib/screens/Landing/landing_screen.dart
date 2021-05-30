import 'package:arc_app/components/body.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/size_config.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
