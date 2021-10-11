import 'dart:core';

import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Summary/summary_screen.dart';
import 'package:arc_app/screens/Summary_Extended/anxiety_screen.dart';
import 'package:arc_app/screens/Summary_Extended/depression_screen.dart';
import 'package:arc_app/screens/Summary_Extended/mood_screen.dart';
import 'package:arc_app/screens/Summary_Extended/stress_screen.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:arc_app/screens/surveys/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:arc_app/screens/home.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../size_config.dart';

class TimelineBody extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}



class _TimelineState extends State<TimelineBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: pureWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(color: pureBlack, spreadRadius: 0, blurRadius: 10),
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: Icon(Icons.timeline), color: darkestBlue, onPressed: () {}),
          IconButton(
              icon: Icon(Icons.history), color: darkestBlue, onPressed: () {
            Navigator.pushNamed(context, SummaryScreen.routeName);
          }),
          Text(" "),
          IconButton(
              icon: Icon(Icons.assignment),
              color: darkestBlue,
              onPressed: () {
                Navigator.pushNamed(context, SurveyScreen.routeName);
              }),
          IconButton(
              icon: Icon(Icons.settings), color: darkestBlue, onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          }),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, Dashboard.routeName);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
    Colors.white, primary
    ],
    ),
    ),
    child: SafeArea(
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
    child: Column(
    children: <Widget>[
    const SizedBox(height: 16),
    const Text(
    'Activity Timeline',
    style: TextStyle(
    fontSize: 32,
    color: darkestBlue,
    ),
    ),
    const SizedBox(height: 16),
    Expanded(
    child: ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
    final example = "example";

    return TimelineTile(
    alignment: TimelineAlign.manual,
    lineXY: 0.1,
    isFirst: index == 0,
    isLast: index == 4,
    indicatorStyle: IndicatorStyle(
    width: 40,
    height: 40,
    indicator: _IndicatorExample(number: '${index + 1}'),
    drawGap: true,
    ),
    beforeLineStyle: LineStyle(
    color: darkestBlue,
    ),
    );
    },
    ),
    ),
    ]),
    )
    )
    )
    )
    );
    }
  }

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: darkestBlue,
            width: 4,
          ),
        ),
      ),
      );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key}) : super(key: key);

  //final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "example",
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}
