import 'package:flutter/widgets.dart';
import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/size_config.dart';

class LogInCard extends StatefulWidget {
  @override
  _LogInCardState createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
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
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12.withAlpha(15),
                        labelText: "Username or Study ID"),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.all(getProportionateScreenHeight(15.0))),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12.withAlpha(15),
                        labelText: "Password"),
                  ),
                  Padding(padding: const EdgeInsets.all(15.0)),
                  TextButton(
                    onPressed: () {},
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
