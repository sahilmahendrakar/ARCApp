import 'dart:core';

import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

// Mood page
class MoodExtendedBody extends StatefulWidget {
  @override
  _MoodExtendedState createState() => _MoodExtendedState();
}

class _MoodExtendedState extends State<MoodExtendedBody> {
  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody('Mood Summary');
  }
}

// Stress page
class StressExtendedBody extends StatefulWidget {
  @override
  _StressExtendedState createState() => _StressExtendedState();
}

class _StressExtendedState extends State<StressExtendedBody> {
  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody('Stress Summary');
  }
}

// Depression page
class DepressionExtendedBody extends StatefulWidget {
  @override
  _DepressionExtendedState createState() => _DepressionExtendedState();
}

class _DepressionExtendedState extends State<DepressionExtendedBody> {
  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody('Depression Summary');
  }
}

// Anxiety page
class AnxietyExtendedBody extends StatefulWidget {
  @override
  _AnxietyExtendedState createState() => _AnxietyExtendedState();
}

class _AnxietyExtendedState extends State<AnxietyExtendedBody> {
  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody('Anxiety Summary');
  }
}

Container summaryDetailedBody(String title) {
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
              child: pageView(title))));
}

SingleChildScrollView pageView(String title) {
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
                height: getProportionateScreenHeight(350),
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
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
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
