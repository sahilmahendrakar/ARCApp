import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class DepressionSurvey extends StatefulWidget {
  Function? setDepressionValue;

  DepressionSurvey(Function? setDepressionValue) {
    this.setDepressionValue = setDepressionValue!;
  }

  @override
  _DepressionSurveyState createState() => _DepressionSurveyState();
}

class _DepressionSurveyState extends State<DepressionSurvey> {
  int q1 = 0;
  int q2 = 0;
  int q3 = 0;
  int q4 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: Center(
                    child: SingleChildScrollView(
                        child: Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(30.0)),
      child: Column(children: [
        Center(
          child: Column(
            children: [
              Text(
                "In the past 24 hours, to what extent have you felt “on edge”?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('0 - Not at all'),
                      leading: Radio<int>(
                        value: 0,
                        groupValue: q1,
                        onChanged: (value) {
                          setState(() {
                            q1 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('1 - A little'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: q1,
                        onChanged: (value) {
                          setState(() {
                            q1 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('2 - Somewhat'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: q1,
                        onChanged: (value) {
                          setState(() {
                            q1 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('3 - Extremely'),
                      leading: Radio<int>(
                        value: 3,
                        groupValue: q1,
                        onChanged: (value) {
                          setState(() {
                            q1 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "In the past 24 hours, to what extent have you felt “uneasy”?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('0 - Not at all'),
                      leading: Radio<int>(
                        value: 0,
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('1 - A little'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('2 - Somewhat'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('3 - Extremely'),
                      leading: Radio<int>(
                        value: 3,
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "In the past 24 hours, to what extent have you felt “nervous”?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('0 - Not at all'),
                      leading: Radio<int>(
                        value: 0,
                        groupValue: q3,
                        onChanged: (value) {
                          setState(() {
                            q3 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('1 - A little'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: q3,
                        onChanged: (value) {
                          setState(() {
                            q3 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('2 - Somewhat'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: q3,
                        onChanged: (value) {
                          setState(() {
                            q3 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('3 - Extremely'),
                      leading: Radio<int>(
                        value: 3,
                        groupValue: q3,
                        onChanged: (value) {
                          setState(() {
                            q3 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "In the past 24 hours, to what extent have you felt “sad”?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('0 - Not at all'),
                      leading: Radio<int>(
                        value: 0,
                        groupValue: q4,
                        onChanged: (value) {
                          setState(() {
                            q4 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('1 - A little'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: q4,
                        onChanged: (value) {
                          setState(() {
                            q4 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('2 - Somewhat'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: q4,
                        onChanged: (value) {
                          setState(() {
                            q4 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text('3 - Extremely'),
                      leading: Radio<int>(
                        value: 3,
                        groupValue: q4,
                        onChanged: (value) {
                          setState(() {
                            q4 = value!;
                          });
                          widget.setDepressionValue!(q1 + q2 + q3 + q4);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    ))))));
  }
}
