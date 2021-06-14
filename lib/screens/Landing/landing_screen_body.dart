import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/screens/Sign up/sign_up_screen.dart';
import 'package:arc_app/screens/Login/log_in_screen.dart';

class LandingScreenBody extends StatefulWidget {
  @override
  _LandingScreenBodyState createState() => _LandingScreenBodyState();
}

class _LandingScreenBodyState extends State<LandingScreenBody> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: brightYellow,
        minimumSize: Size(
            getProportionateScreenWidth(235), getProportionateScreenHeight(70)),
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: pureWhite),
        shadowColor: Colors.black,
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(30))));
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: getProportionateScreenHeight(150),
                        ),
                        Spacer(),
                        Text("ARC",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(80),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                                color: pureWhite,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 35.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  )
                                ])),
                        Spacer(),
                        Column(
                          children: <Widget>[
                            ElevatedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, LogInScreen.routeName);
                                },
                                child: const Text("LOG IN")),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            ElevatedButton(
                                style: style,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                },
                                child: const Text("SIGN UP"))
                          ],
                        ),
                        Spacer()
                      ]))
                ]))));
  }
}
