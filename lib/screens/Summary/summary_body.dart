import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SummaryBody extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<SummaryBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(10),
            getProportionateScreenHeight(100.0),
            getProportionateScreenWidth(10),
            getProportionateScreenHeight(20.0)),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(10),
                getProportionateScreenHeight(0),
                getProportionateScreenWidth(10),
                getProportionateScreenHeight(50.0)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Summaries",
                style: TextStyle(
                    color: secondary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          summaryItem(context, secondary, "Mood"),
          summaryItem(context, darkestBlue, "Stress"),
          summaryItem(context, secondary, "Heart"),
          summaryItem(context, darkestBlue, "Sleep")
        ],
      ),
    );
  }
}

GestureDetector summaryItem(BuildContext context, Color color, String title) {
  return GestureDetector(
      onTap: () {
        //TODO: Change the destination page
        Navigator.pushNamed(context, Dashboard.routeName);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(0),
            getProportionateScreenHeight(5),
            getProportionateScreenWidth(0),
            getProportionateScreenHeight(5)),
        child: SizedBox(
            width: getProportionateScreenWidth(350),
            height: getProportionateScreenHeight(130),
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenHeight(20))),
                color: color,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]))),
      ));
}
