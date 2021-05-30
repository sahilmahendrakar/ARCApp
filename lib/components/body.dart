import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: brightYellow,
        minimumSize: Size(
            getProportionateScreenWidth(235), getProportionateScreenHeight(70)),
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold),
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
                                onPressed: () {},
                                child: const Text("LOG IN")),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            ElevatedButton(
                                style: style,
                                onPressed: () {},
                                child: const Text("SIGN UP"))
                          ],
                        ),
                        Spacer()
                      ]))
                ]))));
  }
}
