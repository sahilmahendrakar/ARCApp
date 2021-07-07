import 'package:arc_app/constants.dart';
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: pureWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(color: pureBlack, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: Icon(Icons.help), color: darkestBlue, onPressed: () {}),
          IconButton(
              icon: Icon(Icons.alarm), color: darkestBlue, onPressed: () {}),
          Text(" "),
          IconButton(
              icon: Icon(Icons.assignment),
              color: darkestBlue,
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.settings), color: darkestBlue, onPressed: () {})
        ]),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.home), onPressed: () {}),
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
                    activities("Deep Breathing", primary, pureWhite),
                    SizedBox(width: 10),
                    activities("Walk", primary, pureWhite),
                    SizedBox(width: 10),
                    activities("Meditate", primary, pureWhite),
                    SizedBox(width: 10),
                    activities("CBT", primary, pureWhite)
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
