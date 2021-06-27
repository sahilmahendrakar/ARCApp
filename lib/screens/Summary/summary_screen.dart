import 'package:arc_app/screens/Summary/summary_body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SummaryScreen extends StatelessWidget {
  static String routeName = "/summary";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SummaryBody();
  }
}
