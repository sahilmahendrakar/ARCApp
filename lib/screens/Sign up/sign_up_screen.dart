import 'package:arc_app/screens/Sign%20up/sign_up_card.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover)),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenHeight(30.0)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(0),
                                getProportionateScreenHeight(100.0),
                                getProportionateScreenWidth(0),
                                getProportionateScreenHeight(20.0)),
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(
                                          getProportionateScreenWidth(0),
                                          getProportionateScreenHeight(4)),
                                      blurRadius:
                                          getProportionateScreenWidth(35.0),
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )
                                  ]),
                            ),
                          ))),
                  SignUpCard()
                ],
              ),
            ))));
  }
}
