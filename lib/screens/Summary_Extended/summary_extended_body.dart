import 'dart:core';

import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SummaryExtendedBody extends StatefulWidget {
  @override
  _SummaryExtendedState createState() => _SummaryExtendedState();
}

class _SummaryExtendedState extends State<SummaryExtendedBody> {
  @override
  Widget build(BuildContext context) {
    return summaryDetailedBody('Mood Summary');
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
                    getProportionateScreenHeight(0.0),
                    getProportionateScreenWidth(30),
                    getProportionateScreenHeight(20.0)),
                child: pageView(title))));
  }

  SingleChildScrollView pageView(String title) {
    // TextStyle detailsTextStyle =
    //     TextStyle(color: pureWhite, fontWeight: FontWeight.bold, fontSize: 20);
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Center(
        child: Text(title,
            style: TextStyle(
                color: pureWhite, fontSize: 40, fontWeight: FontWeight.bold)),
      ),
      Center(
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(50),
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(40.0)),
            child: Container(
                width: getProportionateScreenWidth(330),
                height: getProportionateScreenHeight(350),
                color: primary)),
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
}
