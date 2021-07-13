import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/screens/CBT/cbt_emotions.dart';

import '../../size_config.dart';

class CBTExit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, -0.5),
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(16),
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(16)), //make proportional
        child: SafeArea(
          child: Column(children: [
            SizedBox(height: getProportionateScreenHeight(60)),
                Image.asset('assets/images/CBTDiagram.png',
                        width: getProportionateScreenWidth(250),
                        height: getProportionateScreenHeight(250)),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
                  'Thank you for completing the CBT module!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: pureWhite,
                      fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold)),
            
            SizedBox(height: getProportionateScreenHeight(40)),

            Text(
                  'Please feel free to return to this module anytime you are feeling stressed, depressed, or anxious.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: pureWhite,
                      fontSize: getProportionateScreenWidth(18))),
            
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context,ModalRoute.withName(Dashboard.routeName));
              },
              child: Text(
                'RETURN TO DASHBOARD',
                style: TextStyle(fontSize: getProportionateScreenWidth(18)),
              ),
              style: TextButton.styleFrom(
                  primary: darkestBlue,
                  backgroundColor: pureWhite,
                  shape: StadiumBorder(),
                  fixedSize: Size(
                      getProportionateScreenWidth(250), getProportionateScreenHeight(50))),
            ),

          ]),
        ),
      ),
      backgroundColor: darkestBlue,
    );
  }
}
