import 'dart:core';

import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Summary_Extended/anxiety_screen.dart';
import 'package:arc_app/screens/Summary_Extended/depression_screen.dart';
import 'package:arc_app/screens/Summary_Extended/mood_screen.dart';
import 'package:arc_app/screens/Summary_Extended/stress_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../size_config.dart';

class SummaryBody extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<SummaryBody> {
  final fb = FirebaseDatabase.instance;

  double moodAvg = 0;
  double moodLastAvg = 0;

  double stressAvg = 0;
  double stressLastAvg = 0;

  double depressionAvg = 0;
  double depressionLastAvg = 0;

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;

    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime end = DateTime.now();
    DateTime start = end.subtract(new Duration(days: 7));
    DateTime start2 = start.subtract(new Duration(days: 7));

    //mood data
    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(start))
        .endAt(format.format(end))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        moodAvg += v;
        counter++;
      });
      setState(() {
        moodAvg /= counter;
        print(moodAvg);
      });
    });

    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(start2))
        .endAt(format.format(start))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        moodLastAvg += v;
        counter++;
      });
      setState(() {
        moodLastAvg /= counter;
        print(moodLastAvg);
      });
    });

    //stress data
    ref
        .child(user.uid)
        .child("stress_data")
        .orderByKey()
        .startAt(format.format(start))
        .endAt(format.format(end))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        stressAvg += v;
        counter++;
      });
      setState(() {
        stressAvg /= counter;
        print(stressAvg);
      });
    });

    ref
        .child(user.uid)
        .child("stress_data")
        .orderByKey()
        .startAt(format.format(start2))
        .endAt(format.format(start))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        stressLastAvg += v;
        counter++;
      });
      setState(() {
        stressLastAvg /= counter;
        print(stressLastAvg);
      });
    });

    //depression data
    ref
        .child(user.uid)
        .child("depression_data")
        .orderByKey()
        .startAt(format.format(start))
        .endAt(format.format(end))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        depressionAvg += v;
        counter++;
      });
      setState(() {
        depressionAvg /= counter;
        print(depressionAvg);
      });
    });

    ref
        .child(user.uid)
        .child("depression_data")
        .orderByKey()
        .startAt(format.format(start2))
        .endAt(format.format(start))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      int counter = 0;

      print(data.value);
      data.value.forEach((k, v) {
        depressionLastAvg += v;
        counter++;
      });
      setState(() {
        depressionLastAvg /= counter;
        print(depressionLastAvg);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: pureWhite,
      child: ListView(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(10),
            getProportionateScreenHeight(45.0),
            getProportionateScreenWidth(10),
            getProportionateScreenHeight(0.0)),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(10),
                getProportionateScreenHeight(0),
                getProportionateScreenWidth(10),
                getProportionateScreenHeight(25.0)),
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
          moodItem(context, moodAvg, moodAvg - moodLastAvg),
          stressItem(context, stressAvg, stressAvg - stressLastAvg),
          depressionItem(
              context, depressionAvg, depressionAvg - depressionLastAvg),
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
            height: getProportionateScreenHeight(120),
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
                            getProportionateScreenHeight(0),
                            0,
                            getProportionateScreenHeight(10)),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: pureWhite,
                            fontSize: 30,
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
