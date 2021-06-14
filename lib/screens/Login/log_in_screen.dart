import 'package:arc_app/screens/Login/log_in_card.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  static String routeName = "/log_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: SafeArea(
          child: Center(
              child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(30.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(100.0),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(20.0)),
                  child: Text("Log in to your account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(getProportionateScreenWidth(0),
                                  getProportionateScreenHeight(4)),
                              blurRadius: getProportionateScreenWidth(35.0),
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ])),
                )),
            LogInCard()
          ],
        ),
      ))),
    ));
  }
}
