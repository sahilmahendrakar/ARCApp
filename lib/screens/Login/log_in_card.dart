import 'package:arc_app/auth/authentication_service.dart';
import 'package:flutter/widgets.dart';
import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/size_config.dart';
import 'package:provider/provider.dart';

class LogInCard extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: getProportionateScreenHeight(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(30),
                  getProportionateScreenHeight(40),
                  getProportionateScreenWidth(30),
                  getProportionateScreenHeight(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12.withAlpha(15),
                        labelText: "Email"),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.all(getProportionateScreenHeight(15.0))),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12.withAlpha(15),
                        labelText: "Password"),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.all(getProportionateScreenHeight(15.0))),
                  TextButton(
                    //check return value of signin to see if successful, and push route
                    onPressed: () {
                      context
                          .read<AuthenticationService>()
                          .signIn(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((success) {
                        if (success) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(2.0),
                          horizontal: getProportionateScreenWidth(50.0)),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16.0)),
                      ),
                    ),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: brightYellow,
                        shape: StadiumBorder()),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
