import 'dart:core';
import 'dart:math';

import 'package:arc_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../size_config.dart';

// Mood page
class MoodExtendedBody extends StatefulWidget {
  @override
  _MoodExtendedState createState() => _MoodExtendedState();
}

class _MoodExtendedState extends State<MoodExtendedBody> {
  final fb = FirebaseDatabase.instance;

  List<FlSpot> weekData = [];
  List<FlSpot> monthData = [];
  List<FlSpot> yearData = [];

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;

    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime today = DateTime.now();
    String currentDay = DateFormat('EEEE').format(today);

    // weekData
    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(today
            .subtract(new Duration(days: weekProcess(currentDay).toInt()))))
        .endAt(format.format(today))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      print(data.value);
      data.value.forEach((k, v) {
        weekData.add(FlSpot(weekProcess(DateFormat('EEEE').format(k)), v));
      });
    });

    monthData = [];
    for (int i = 1; i < 30; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      monthData.add(FlSpot(i.toDouble(), random.toDouble()));
    }

    yearData = [];
    for (int i = 1; i < 13; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      yearData.add(FlSpot(i.toDouble(), random.toDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody(
        'Mood Summary', 10, weekData, monthData, yearData);
  }
}

// Stress page
class StressExtendedBody extends StatefulWidget {
  @override
  _StressExtendedState createState() => _StressExtendedState();
}

class _StressExtendedState extends State<StressExtendedBody> {
  final fb = FirebaseDatabase.instance;

  List<FlSpot> weekData = [];
  List<FlSpot> monthData = [];
  List<FlSpot> yearData = [];

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;

    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime today = DateTime.now();

    // weekData
    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(today.subtract(new Duration(days: 7))))
        .endAt(format.format(today))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      print(data.value);
      data.value.forEach((k, v) {
        weekData.add(FlSpot(weekProcess(DateFormat('EEEE').format(k)), v));
      });
    });

    monthData = [];
    for (int i = 1; i < 30; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      monthData.add(FlSpot(i.toDouble(), random.toDouble()));
    }

    yearData = [];
    for (int i = 1; i < 13; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      yearData.add(FlSpot(i.toDouble(), random.toDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody(
        'Stress Summary', 12, weekData, monthData, yearData);
  }
}

// Depression page
class DepressionExtendedBody extends StatefulWidget {
  @override
  _DepressionExtendedState createState() => _DepressionExtendedState();
}

class _DepressionExtendedState extends State<DepressionExtendedBody> {
  final fb = FirebaseDatabase.instance;

  List<FlSpot> weekData = [];
  List<FlSpot> monthData = [];
  List<FlSpot> yearData = [];

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;

    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime today = DateTime.now();

    // weekData
    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(today.subtract(new Duration(days: 7))))
        .endAt(format.format(today))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      print(data.value);
      data.value.forEach((k, v) {
        weekData.add(FlSpot(weekProcess(DateFormat('EEEE').format(k)), v));
      });
    });

    monthData = [];
    for (int i = 1; i < 30; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      monthData.add(FlSpot(i.toDouble(), random.toDouble()));
    }

    yearData = [];
    for (int i = 1; i < 13; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      yearData.add(FlSpot(i.toDouble(), random.toDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody(
        'Depression Summary', 12, weekData, monthData, yearData);
  }
}

// Anxiety page
class AnxietyExtendedBody extends StatefulWidget {
  @override
  _AnxietyExtendedState createState() => _AnxietyExtendedState();
}

class _AnxietyExtendedState extends State<AnxietyExtendedBody> {
  final fb = FirebaseDatabase.instance;

  List<FlSpot> weekData = [];
  List<FlSpot> monthData = [];
  List<FlSpot> yearData = [];

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;

    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime today = DateTime.now();

    // weekData
    ref
        .child(user.uid)
        .child("mood_data")
        .orderByKey()
        .startAt(format.format(today.subtract(new Duration(days: 7))))
        .endAt(format.format(today))
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      print(data.value);
      data.value.forEach((k, v) {
        weekData.add(FlSpot(weekProcess(DateFormat('EEEE').format(k)), v));
      });
    });

    monthData = [];
    for (int i = 1; i < 30; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      monthData.add(FlSpot(i.toDouble(), random.toDouble()));
    }

    yearData = [];
    for (int i = 1; i < 13; i++) {
      int random = Random().nextInt(10.toInt() - 1) + 2;
      yearData.add(FlSpot(i.toDouble(), random.toDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody(
        'Anxiety Summary', 12, weekData, monthData, yearData);
  }
}

Container summaryDetailedBody(String title, double maxY, List<FlSpot> weekData,
    List<FlSpot> monthData, List<FlSpot> yearData) {
  return Container(
      color: darkestBlue,
      child: Scaffold(
          backgroundColor: darkestBlue,
          appBar: new AppBar(
            backgroundColor: darkestBlue,
            elevation: 0,
          ),
          body: Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(30),
                  getProportionateScreenHeight(10.0),
                  getProportionateScreenWidth(30),
                  getProportionateScreenHeight(20.0)),
              child: pageView(title, maxY, weekData, monthData, yearData))));
}

SingleChildScrollView pageView(
    String title, double maxY, weekData, monthData, yearData) {
  TextStyle tabTextStyle =
      TextStyle(color: pureWhite, fontWeight: FontWeight.w500, fontSize: 22);

  return SingleChildScrollView(
      child: Column(children: <Widget>[
    Center(
      child: Text(title,
          style: TextStyle(
              color: pureWhite, fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(50),
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(40.0)),
          child: DefaultTabController(
            length: 3,
            child: Container(
                width: getProportionateScreenWidth(330),
                height: getProportionateScreenHeight(370),
                child: Scaffold(
                  backgroundColor: darkestBlue,
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight - 20),
                      child: new Container(
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: new SafeArea(
                              child: Column(children: <Widget>[
                            new Expanded(child: new Container()),
                            TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: tertiary),
                                tabs: <Widget>[
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Week',
                                        style: tabTextStyle,
                                      )),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Month',
                                        style: tabTextStyle,
                                      )),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Year',
                                        style: tabTextStyle,
                                      )),
                                ])
                          ])))),
                  body: TabBarView(
                    children: <Widget>[
                      Center(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenHeight(0),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(20)),
                              child: graph(weekData, 7, maxY, (value) {
                                switch (value.toInt()) {
                                  case 1:
                                    return 'mon';
                                  case 2:
                                    return 'tues';
                                  case 3:
                                    return 'wed';
                                  case 4:
                                    return 'thurs';
                                  case 5:
                                    return 'fri';
                                  case 6:
                                    return 'sat';
                                  case 7:
                                    return 'sun';
                                }
                                return '';
                              }))),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenHeight(0),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(20)),
                              child: graph(
                                monthData,
                                31,
                                maxY,
                                (value) {
                                  if (value % 5 == 0) {
                                    return value.toInt().toString();
                                  }
                                  return "";
                                },
                              ))),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenHeight(0),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(30),
                                  getProportionateScreenHeight(20)),
                              child: graph(yearData, 12, maxY, (value) {
                                switch (value.toInt()) {
                                  case 1:
                                    return 'j';
                                  case 2:
                                    return 'f';
                                  case 3:
                                    return 'm';
                                  case 4:
                                    return 'a';
                                  case 5:
                                    return 'm';
                                  case 6:
                                    return 'j';
                                  case 7:
                                    return 'j';
                                  case 8:
                                    return 'a';
                                  case 9:
                                    return 's';
                                  case 10:
                                    return 'o';
                                  case 11:
                                    return 'n';
                                  case 12:
                                    return 'd';
                                }
                                return '';
                              }))),
                    ],
                  ),
                )),
          )),
    ),
    Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(0),
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(20.0)),
          child: Text(
            'Most changed by:',
            style: TextStyle(
                color: pureWhite, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
    ),
    Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        tableRowDetailsItem('Going for a walk', 1, 4.5),
        tableRowDetailsItem('Meditating', 1, 3.2),
        tableRowDetailsItem('Deep Breathing', 1, 1.3),
      ],
    )
  ]));
}

tableRowDetailsItem(String activity, int direction, num change) {
  TextStyle detailsTextStyle =
      TextStyle(color: pureWhite, fontWeight: FontWeight.bold, fontSize: 20);

  Icon arrow;
  if (direction == 1) {
    arrow = Icon(Icons.arrow_upward_rounded,
        color: tertiary, size: getProportionateScreenHeight(30));
  } else if (direction == -1) {
    arrow = Icon(Icons.arrow_downward_rounded,
        color: brightPink, size: getProportionateScreenHeight(30));
  } else {
    arrow = Icon(Icons.horizontal_rule_rounded,
        color: brightYellow, size: getProportionateScreenWidth(25));
  }

  return TableRow(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(5.0),
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(5.0)),
          child: Text(
            activity,
            style: detailsTextStyle,
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(5.0),
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(5.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              arrow,
              Text(change.toStringAsPrecision(2), style: detailsTextStyle)
            ],
          )),
    ],
  );
}

LineChart graph(List<FlSpot> graphData, double maxX, double maxY,
    String Function(double) xAxis) {
  List<Color> gradientColors = [];

  for (FlSpot spot in graphData) {
    if (spot.y < 4) {
      gradientColors.add(brightPink);
    } else if (spot.y < 7) {
      gradientColors.add(brightYellow);
    } else {
      gradientColors.add(tertiary);
    }
  }

  return LineChart(LineChartData(
    gridData: FlGridData(show: false),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
            color: tertiary, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: xAxis,
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: tertiary,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          return value.toInt().toString();
        },
        reservedSize: 32,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: quarternary, width: 4),
        left: BorderSide(color: quarternary, width: 4),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ),
    ),
    minX: 1,
    maxX: maxX,
    minY: 0,
    maxY: maxY,
    lineBarsData: [
      LineChartBarData(spots: graphData, isCurved: true, colors: gradientColors)
    ],
  ));
}

double weekProcess(String day) {
  if (day == 'Monday') {
    return 1;
  } else if (day == 'Tuesday') {
    return 2;
  } else if (day == 'Wednesday') {
    return 3;
  } else if (day == 'Thursday') {
    return 4;
  } else if (day == 'Friday') {
    return 5;
  } else if (day == 'Saturday') {
    return 6;
  } else {
    return 7;
  }
}
