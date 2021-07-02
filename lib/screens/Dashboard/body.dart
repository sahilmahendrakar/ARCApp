import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardBody> {
  Container Activities(String activity_type, Color box_color, Color text_color) {
    return Container(
      height: 150,
      width: 100,
      child: Align(
        alignment: Alignment.center,
        child: Text(
            activity_type,
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: text_color,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      decoration: BoxDecoration(
        color: box_color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)
        ),
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
              child: Text(
                "ARC",
                style: TextStyle(
                  color: darkestBlue,
                  fontSize: 20,
                )
              )
            )
          ),
          backgroundColor: pureWhite,
          brightness: Brightness.dark,
        ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: pureWhite,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18), topRight: Radius.circular(18),
          ),
        boxShadow: [
          BoxShadow(color: pureBlack, spreadRadius: 0, blurRadius: 10),
        ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.help), color: darkestBlue, onPressed: () {}),
            IconButton(icon: Icon(Icons.alarm), color: darkestBlue, onPressed: () {}),
            Text(
                " "
            ),
            IconButton(icon: Icon(Icons.assignment), color: darkestBlue, onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), color: darkestBlue, onPressed: () {})
          ]
        ),
      ),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.home), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Activities("Deep Breathing", primary, pureWhite),
              SizedBox(width: 10),
              Activities("Walk", primary, pureWhite),
              SizedBox(width: 10),
              Activities("Meditate", primary, pureWhite),
              SizedBox(width: 10),
              Activities("CBT", primary, pureWhite)

            ],
          ),
          )
        ),
    );
}
}

Card activitiesItem(String title, IconData icon) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.black,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}