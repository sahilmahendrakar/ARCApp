import 'package:arc_app/size_config.dart';
import 'package:flutter/widgets.dart';
import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: getProportionateScreenHeight(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
        ),
        child: SingleChildScrollView(
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
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12.withAlpha(15),
                          labelText: "Study ID"),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15.0))),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12.withAlpha(15),
                          labelText: "Create a Password"),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15.0))),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12.withAlpha(15),
                          labelText: "Confirm Password"),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15.0))),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12.withAlpha(15),
                          labelText: "Username"),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15.0))),
                    TextButton(
                      onPressed: () {},
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
        ])));
  }
}
