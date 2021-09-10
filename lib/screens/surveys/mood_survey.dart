import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class MoodSurvey extends StatefulWidget {
  Function? setMoodValue;

  MoodSurvey(Function? setMoodValue) {
    this.setMoodValue = setMoodValue!;
  }

  @override
  _MoodSurveyState createState() => _MoodSurveyState();
}

class _MoodSurveyState extends State<MoodSurvey> {
  double _moodSliderValue = 5;

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
                "What is your overall mood today?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
              ),
              Text(
                "(0 = Very Poor, 10 = Very Good)",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Slider(
                  value: _moodSliderValue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: _moodSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _moodSliderValue = value;
                      widget.setMoodValue!(value.toInt());
                    });
                  }),
            ],
          ),
        ),
      ]),
    ))))));
  }
}
