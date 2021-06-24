import 'package:arc_app/screens/Dashboard/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DashboardBody();
  }
}
