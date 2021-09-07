import 'dart:core';

import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Summary_Extended/anxiety_screen.dart';
import 'package:arc_app/screens/Summary_Extended/depression_screen.dart';
import 'package:arc_app/screens/Summary_Extended/mood_screen.dart';
import 'package:arc_app/screens/Summary_Extended/stress_screen.dart';
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
          stressItem(context, 5.2, 1.8),
          depressionItem(context, 0.6, 0),
          anxietyItem(context, 8.70, -1.60),
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
        if (title == 'Mood') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MoodScreen()));
        } else if (title == 'Stress') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StressScreen()));
        } else if (title == 'Depression') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DepressionScreen()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AnxietyScreen()));
        }
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

  return summaryItem(context, darkestBlue, 'Mood', valueString, status,
      changeString, direction, arrowColor);
}

GestureDetector stressItem(BuildContext context, double value, double change) {
  // Configure value
  // TODO: Change processing of stress data when more information is known
  String valueString = value.round().toStringAsPrecision(2) + "/12";

  // Set status
  String status;
  if (value < 4) {
    status = "Good";
  } else if (value < 8) {
    status = "Okay";
  } else {
    status = "Bad";
  }

  // Set change
  String changeString = change.abs().round().toStringAsPrecision(2);

  // Set direction and arrowColor
  int direction;
  Color arrowColor;

  if (change < 0) {
    direction = -1;
    arrowColor = tertiary;
  } else if (change > 0) {
    direction = 1;
    arrowColor = brightPink;
  } else {
    direction = 0;
    arrowColor = brightYellow;
  }

  return summaryItem(context, secondary, "Stress", valueString, status,
      changeString, direction, arrowColor);
}

GestureDetector depressionItem(context, double value, double change) {
  // Configure value
  String valueString = value.round().toStringAsPrecision(2) + "/12";

  // Set status
  String status;
  if (value < 4) {
    status = "Good";
  } else if (value < 8) {
    status = "Okay";
  } else {
    status = "Bad";
  }

  // Set change
  String changeString = change.abs().round().toStringAsPrecision(2);

  // Set direction and arrowColor
  int direction;
  Color arrowColor;

  if (change < 0) {
    direction = -1;
    arrowColor = tertiary;
  } else if (change > 0) {
    direction = 1;
    arrowColor = brightPink;
  } else {
    direction = 0;
    arrowColor = brightYellow;
  }

  return summaryItem(context, darkestBlue, "Depression", valueString, status,
      changeString, direction, arrowColor);
}

GestureDetector anxietyItem(context, double value, double change) {
  // Configure value
  String valueString = value.round().toStringAsPrecision(2) + "/12";

  // Set status
  String status;
  if (value < 4) {
    status = "Good";
  } else if (value < 8) {
    status = "Okay";
  } else {
    status = "Bad";
  }

  // Set change
  String changeString = change.abs().round().toStringAsPrecision(2);

  // Set direction and arrowColor
  int direction;
  Color arrowColor;

  if (change < 0) {
    direction = -1;
    arrowColor = tertiary;
  } else if (change > 0) {
    direction = 1;
    arrowColor = brightPink;
  } else {
    direction = 0;
    arrowColor = brightYellow;
  }

  return summaryItem(context, secondary, "Anxiety", valueString, status,
      changeString, direction, arrowColor);
}
