import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/CBT/cbt_start_screen.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Summary/summary_screen.dart';
import 'package:arc_app/screens/activities/activities_screen.dart';
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
            alignment: Alignment.centerLeft,
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
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "View Today's Data ",
                              style: TextStyle(
                                color: secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          WidgetSpan(
                            child: Icon(Icons.arrow_right_alt_sharp,
                                size: 20, color: secondary),
                          ),
                        ],
                      ),
                    ))
              ]))),
    );
  }
}


