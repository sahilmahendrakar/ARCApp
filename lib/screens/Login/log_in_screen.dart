import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Login/log_in_card.dart';
import 'package:arc_app/screens/Sign%20up/sign_up_card.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
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
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 20.0),
              child: Text("Log in to your account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 35.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ])),
            ),
            LogInCard()
          ],
        ),
      ))),
    ));
  }
}
