import 'dart:ffi';
import 'dart:core';

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
          moodItem(context, 8.5, 1.5),
          summaryItem(context, secondary, "Stress", "52 units", "Okay", "18", 1,
              brightPink),
          summaryItem(context, darkestBlue, "Heart", "79 bpm", "Good", "0", 0,
              brightYellow),
          summaryItem(context, secondary, "Sleep", "5h 41m", "Bad", "2h 31m",
              -1, brightPink)
        ],
      ),
    );
  }
}

GestureDetector summaryItem(
    BuildContext context,
    Color color,
    String title,
    String value,
    String status,
    String change,
    int direction,
    Color arrowColor) {
  // Set the status color
  Color statusColor;
  if (status == "Good") {
    statusColor = tertiary;
  } else if (status == "Okay") {
    statusColor = brightYellow;
  } else {
    statusColor = brightPink;
  }

  // Set the Details Text style
  TextStyle detailsStyle =
      TextStyle(color: pureWhite, fontSize: 20, fontWeight: FontWeight.bold);

  // Set the arrow
  Icon arrow;

  if (direction == 1) {
    arrow = Icon(Icons.arrow_upward_rounded,
        color: arrowColor, size: getProportionateScreenHeight(30));
  } else if (direction == -1) {
    arrow = Icon(Icons.arrow_downward_rounded,
        color: arrowColor, size: getProportionateScreenHeight(30));
  } else {
    arrow = Icon(Icons.horizontal_rule_rounded,
        color: arrowColor, size: getProportionateScreenWidth(25));
  }

  // Create the page
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            getProportionateScreenHeight(10),
                            0,
                            getProportionateScreenHeight(10)),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: pureWhite,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    value,
                                    style: detailsStyle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0,
                                          getProportionateScreenWidth(5), 0),
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: new BoxDecoration(
                                          color: statusColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Text(status, style: detailsStyle)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    arrow,
                                    Text(change, style: detailsStyle)
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ]))),
      ));
}

GestureDetector moodItem(BuildContext context, double value, double change) {
  // summaryItem(context, darkestBlue, "Mood", "6.5/10", "Good", "1.5", 1, tertiary),

  // Configure value
  String valueString = value.toStringAsFixed(1) + "/10";

  // Set status
  String status;
  if (value < 4.0) {
    status = "Bad";
  } else if (value < 7.0) {
    status = "Okay";
  } else {
    status = "Good";
  }

  // Set change
  String changeString = change.abs().toStringAsFixed(1);

  // Set direction and arrowColor
  int direction;
  Color arrowColor;

  if (change < 0) {
    direction = -1;
    arrowColor = brightPink;
  } else if (change > 0) {
    direction = 1;
    arrowColor = tertiary;
  } else {
    direction = 0;
    arrowColor = brightYellow;
  }

  return summaryItem(context, darkestBlue, "Mood", valueString, status,
      changeString, direction, arrowColor);
}
