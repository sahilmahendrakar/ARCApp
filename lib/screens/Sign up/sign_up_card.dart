import 'package:arc_app/auth/authentication_service.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/widgets.dart';
import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController studyIdController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: getProportionateScreenHeight(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
        ),
        child: Form(
          key: signUpFormKey,
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
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withAlpha(15),
                            labelText: "Email"),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15.0))),
                      TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withAlpha(15),
                            labelText: "Username"),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15.0))),
                      TextFormField(
                        controller: studyIdController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a study ID';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withAlpha(15),
                            labelText: "Study ID"),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15.0))),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withAlpha(15),
                            labelText: "Create a Password"),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15.0))),
                      TextFormField(
                        controller:
                            confirmPasswordController, //TODO: add validation
                        obscureText: true,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withAlpha(15),
                            labelText: "Confirm Password"),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15.0))),
                      TextButton(
                        onPressed: () {
                          if (signUpFormKey.currentState!.validate()) {
                            context
                                .read<AuthenticationService>()
                                .signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: usernameController.text)
                                .then((success) {
                              if (success) {
                                Navigator.pop(context);
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(2.0),
                              horizontal: getProportionateScreenWidth(50.0)),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16.0)),
                          ),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: brightYellow,
                            shape: StadiumBorder()),
                      )
                    ])))
          ]),
        ));
  }
}
