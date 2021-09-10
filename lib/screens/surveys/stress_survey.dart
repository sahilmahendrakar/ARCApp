import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';

class StressSurvey extends StatefulWidget {
  Function? setStressValue;

  StressSurvey(Function? setStressValue) {
    this.setStressValue = setStressValue!;
  }

  @override
  _StressSurveyState createState() => _StressSurveyState();
}

class _StressSurveyState extends State<StressSurvey> {
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
                "How stressed do you feel today?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
              ),
              Text(
                "(0 = Not stressed, 10 = Very Stressed)",
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
                    });
                    widget.setStressValue!(value.toInt());
                  }),
            ],
          ),
        ),
      ]),
    ))))));
  }
}
