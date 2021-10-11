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

import '../../size_config.dart';

class TimelineBody extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}


class _TimelineState extends State<TimelineBody> {
  String activity = "None";
  String date = "None";
  String widgetName = "None";

  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;
    //Using on value instead of once() so it updates when value is changed
    ref
        .child(user.uid)
        .onValue
        .listen((event) {
      DataSnapshot data = event.snapshot;
      setState(() {
        //The ?? performs null checking
        activity = data.value["activities"] ?? 0;
        date = data.value["currentDate"] ?? "None";
        widgetName = data.value["widget.name"] ?? "None";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: false,
        title: Align(
        alignment: Alignment.topLeft,
        child: Container(
        color: pureWhite,
        child: Text("ARC",
        style: TextStyle(
        color: darkestBlue,
        fontSize: 20,
    )))),
    backgroundColor: pureWhite,
    brightness: Brightness.dark,
    ),
    bottomNavigationBar: Container(
    decoration: BoxDecoration(color: pureWhite,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(18),
    topRight: Radius.circular(18),
    ),
    boxShadow: [
    BoxShadow(color: pureBlack, spreadRadius: 0, blurRadius: 10),]),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    IconButton(
    icon: Icon(Icons.timeline), color: darkestBlue, onPressed: () {} ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            //height: size.height * 0.3,
            width: double.infinity,
            child: Image.asset("assets/images/background.jpeg",
                fit: BoxFit.fitWidth),
          ),
          Positioned(
            top: 40,
            left: 30,
            child: Row(children: <Widget>[
              Text("8"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Monday"),
                    Text("February 2015"),
                  ],
                ),
              ),
            ]),
          ),
          Positioned(
            bottom: -20,
            right: 15,
            child: FloatingActionButton(
              onPressed: null,
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: null,
                iconSize: 40.0,
              ),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            SizedBox(child: Text(date),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(activity),
                                  Text(
                                    widgetName,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: new Container(
                          width: 1.0,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
    ]),
    );
  }

}