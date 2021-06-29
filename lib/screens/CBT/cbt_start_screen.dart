import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/screens/CBT/cbt_emotions.dart';

import '../../size_config.dart';

class CBTStartScreen extends StatelessWidget {
  static String routeName = "/cbt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cognitive Behavioral Therapy',
            style: TextStyle(fontSize: getProportionateScreenWidth(20))),
        backgroundColor: darkestBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment(0, -0.5),
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(16),
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(16)), //make proportional
        child: SafeArea(
          child: Column(children: [
            Text(
                'Sample[Cognitive behavioral therapy (CBT) is a type of psychotherapeutic treatment that helps people learn how to identify and change destructive or disturbing thought patterns that have a negative influence on behavior and emotions.'
                '\n\nCognitive behavioral therapy focuses on changing the automatic negative thoughts that can contribute to and worsen emotional difficulties, depression, and anxiety. These spontaneous negative thoughts have a detrimental influence on mood.'
                '\n\nThrough CBT, these thoughts are identified, challenged, and replaced with more objective, realistic thoughts.]',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: pureWhite,
                    fontSize: getProportionateScreenWidth(14))),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(16)),
                    child: Image.asset('assets/images/CBTDiagram.png',
                        width: getProportionateScreenWidth(250),
                        height: getProportionateScreenHeight(250)))),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CBTEmotions()));
              },
              child: Text(
                  'START',
                  style: TextStyle(fontSize: getProportionateScreenWidth(20.0)),
                ),
              style: TextButton.styleFrom(
                  primary: darkestBlue,
                  backgroundColor: pureWhite,
                  shape: StadiumBorder(),
                  fixedSize: Size(
                      getProportionateScreenWidth(150), getProportionateScreenHeight(50)),),
            ),
            Container(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
              child: Text(
                  '**Disclaimer: these data are not actively being monitored. If you’re feeling like you need help, please reach out [provider]',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: Colors.grey)),
            )
          ]),
        ),
      ),
      backgroundColor: darkestBlue,
    );
  }
}
