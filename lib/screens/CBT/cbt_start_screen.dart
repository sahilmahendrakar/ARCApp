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
            getProportionateScreenHeight(0),
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(16)), //make proportional
        child: SafeArea(
          child: Column(children: [
            Text(
                'Everyone experiences stressful moments and difficult feelings. However, there are skills you can ' +
                'learn to deal with these experiences that can help you to take control and feel better, both in the ' +
                'present and in the future.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: pureWhite,
                    fontSize: getProportionateScreenWidth(14))),
            Row(
              children: [ Container(
                width: getProportionateScreenWidth(160),
                child: Text(
                        '\nCognitive Behavioral Therapy (CBT) is a form of therapy that can help you learn to manage ' +
                        'difficult experiences by focusing on how thoughts, feelings, and actions are connected. CBT can ' +
                        'help you change your thoughts in order to positively affect your feelings and actions.\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: pureWhite,
                        fontSize: getProportionateScreenWidth(14))),
              ),Expanded(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(8)),
                      child: Image.asset('assets/images/CBTDiagram.png',
                          width: getProportionateScreenWidth(208),
                          height: getProportionateScreenHeight(185)))),]
            ),
            Text('A lot of the negative, stressful thoughts that pop into our heads are not realistic. Thankfully, we ' +
                    'don’t have to believe everything these thoughts tell us! CBT will teach you that recognizing and ' +
                    'changing negative, unhelpful thought patterns can help you relax, decrease difficult feelings, and ' +
                    'take actions that will make life better.\n\n' +
                    'If you’re ready to get started, click the START button',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: pureWhite,
                    fontSize: getProportionateScreenWidth(14))),
            Spacer(),
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
                      getProportionateScreenWidth(150), getProportionateScreenHeight(50))),
            ),
            Container(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
              child: Text(
                  '**Disclaimer: these data are not actively being monitored. If you’re feeling like you need help, please reach out to your healthcare provider. You can also reach out 24 hours a day, 7 days a week to NYC Well for counseling and mental health support via phone, text, or call. Their services can be accessed at https://nycwell.cityofnewyork.us/en/',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(8),
                      color: Colors.grey)),
            )
          ]),
        ),
      ),
      backgroundColor: darkestBlue,
    );
  }
}
