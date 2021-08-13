import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/screens/CBT/cbt_thoughtdistortions.dart';

import '../../size_config.dart';

class CBTDistortionInfo extends StatelessWidget {
  final List<String> thoughts;
  final String dataKey;
  CBTDistortionInfo(this.thoughts, this.dataKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
        children: [Container(
          alignment: Alignment(0, -0.5),
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(16),
              getProportionateScreenHeight(16),
              getProportionateScreenWidth(16),
              getProportionateScreenHeight(16)), //make proportional
          child: Column(children: [
                Text('Cognitive Distortions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: pureWhite,
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text('Not all thoughts that automatically pop into our heads are true. '
                    'In fact, we don’t have to believe everything our worries tell us!\n\n'
                    'Instead, we can learn to identify negative, unhelpful thinking patterns '
                    'called cognitive distortions. A cognitive distortion is an inaccurate '
                    'thought that may lead  to you experiencing difficult feelings and/or taking unhelpful actions.\n\n'
                    'Identifying a cognitive distortion can help you decide which thoughts are worth listening to.\n\n'
                    'Take a look at the cognitive distortions listed  on the next page, '
                    'and see which one(s) might apply to your thoughts about the current situation.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: pureWhite,
                        fontSize: getProportionateScreenWidth(18))),
              ]),
        ),
              navigationArrows(context)
            ])
      ),
      backgroundColor: darkestBlue,
    );
  }

  Widget navigationArrows(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Column(children: [
        Spacer(),
        Row(children: [
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: tertiary),
          Spacer(),
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ThoughtDistortions(thoughts, dataKey)));
              },
              color: tertiary)
        ])
      ]),
    );
  }
}
