import 'package:arc_app/screens/Summary/summary_body.dart';
import 'package:arc_app/screens/Timeline/timeline_body.dart';
import 'package:flutter/material.dart';


import '../../size_config.dart';

class TimelineScreen extends StatelessWidget {
  static String routeName = "/timeline";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TimelineBody();
  }
}
