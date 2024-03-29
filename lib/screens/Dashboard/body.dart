import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/CBT/cbt_start_screen.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Summary/summary_screen.dart';
import 'package:arc_app/screens/activities/activities_screen.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:arc_app/screens/surveys/survey_screen.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardBody> {
  Container activities(String activityType, Color boxColor, Color textColor) {
    return Container(
      height: 135,
      width: 100,
      child: Align(
        alignment: Alignment.center,
        child: Text(activityType,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: textColor,
                fontWeight: FontWeight.bold)),
      ),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18)),
      ),
    );
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
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Activities",
                      style: TextStyle(
                        color: secondary,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    GestureDetector(
                      child: activities("Deep Breathing", primary, pureWhite),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen(name: "deep breathing"))),
                      ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: activities("Walk", primary, pureWhite),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen(name: "walk"))),
                      ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: activities("Meditate", primary, pureWhite),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen(name: "meditation"))),
                      ),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CBTStartScreen.routeName);
                        },
                        child: activities("CBT", primary, pureWhite))
                  ]),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Resources",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: secondary,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    activities("Call 911", quarternary, primary),
                    SizedBox(width: 10),
                    activities("Contact a Friend", quarternary, primary),
                    SizedBox(width: 10),
                    activities("Emergency Contact", quarternary, primary),
                    SizedBox(width: 10),
                    activities("Contact a Professional", quarternary, primary)
                  ]),
                ),
              ]))),
    );
  }
}


