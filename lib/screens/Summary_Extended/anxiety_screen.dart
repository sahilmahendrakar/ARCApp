import 'package:arc_app/screens/Summary_Extended/summary_extended_body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class AnxietyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SummaryExtendedBody();
  }
}
