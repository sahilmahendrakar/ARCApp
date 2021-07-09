import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/CBT/cbt_thoughts.dart';
import 'package:arc_app/screens/CBT/cbt_emotions.dart';

class CBTOutcome extends StatelessWidget {
  final List<String> thoughts;
  CBTOutcome(this.thoughts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OutcomeBody(thoughts));
  }
}

class OutcomeBody extends StatefulWidget {
  final List<String> thoughts;

  const OutcomeBody(this.thoughts, {Key? key}) : super(key: key);

  @override
  _OutcomeBodyState createState() => _OutcomeBodyState(thoughts);
}

class _OutcomeBodyState extends State<OutcomeBody> {
  final List<String> thoughtText;
   final List<Thought> thoughts = [];
  final List<String> emotionNames = [
    'Fear',
    'Sadness',
    'Anger',
    'Guilt',
    'Irritation',
    'Disgust',
    'Embarrassment',
    'Other:    '
  ];
  String error = '';
  Set<Emotion> checkedEmotions = {};
  Set<Emotion> emotions = {};
  final TextEditingController otherController = TextEditingController();

  _OutcomeBodyState(this.thoughtText) {
    for (String name in emotionNames) emotions.add(Emotion(name));
    for (String t in thoughtText) thoughts.add(Thought(t));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(16)),
        child: ListView(
          children: [
            Container(
              child: Text(
                'On a scale of 0-10, how much do you now believe each thought?',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.w600,
                    color: darkestBlue),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(16),
                  0, getProportionateScreenHeight(16)),
            ),
            Column(children: buildThoughtSliders()),
            Container(
                child: Text(
                  'What emotion(s) do you feel now?',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w600,
                      color: darkestBlue),
                  textAlign: TextAlign.center,
                ),
                padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(16))),
            Column(children: buildEmotions()),
            Container(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(8)),
              child: Text(error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.red)),
            ),
            Container(
              child: sliderInstructions(),
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(8),
                  0, getProportionateScreenHeight(16)),
            ),
            Column(children: buildEmotionSliders()),
            Container(height: getProportionateScreenHeight(64)),
            submitButton(),
          ],
          shrinkWrap: true,
        ),
      ),
      navigationArrows(),
    ]));
  }

  List<Widget> buildEmotions() {
    List<Widget> emotionCheckboxes = [];
    for (Emotion e in emotions) {
      emotionCheckboxes.add(CheckboxListTile(
        title: checkboxText(e),
        value: e.isChecked,
        dense: true,
        onChanged: (bool? value) {
          setState(() {
            e.isChecked = value!;
            if (e.isChecked)
              checkedEmotions.add(e);
            else
              checkedEmotions.remove(e);
            error = '';
          });
        },
      ));
    }
    return emotionCheckboxes;
  }

  List<Widget> buildEmotionSliders() {
    List<Widget> sliders = [];
    for (Emotion e in checkedEmotions) {
      sliders.add(Column(children: [
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
          child: Text(
            sliderText(e),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(0),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(8)),
            child: EmotionSlider(e)),
      ]));
    }

    return sliders;
  }

  List<Widget> buildThoughtSliders() {
    List<Widget> sliders = [];
    for (Thought t in thoughts) {
      sliders.add(Column(children: [
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
          child: Text(
            t.thought!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                0,
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(8)),
            child: ThoughtSlider(t)),
      ]));
    }

    return sliders;
  }

  Widget checkboxText(Emotion e) {
    if (e.name == 'Other:    ')
      return Row(children: [
        Text('Other:    ',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: primary,
                fontWeight: FontWeight.w600)),
        Expanded(
            child: Theme(
          data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                  selectionColor: tertiary, selectionHandleColor: secondary)),
          child: TextField(
            controller: otherController,
            onTap: () {
              setState(() {
                e.isChecked = true;
                checkedEmotions.add(e);
              });
            },
            onChanged: (String value) {
              setState(() {});
            },
            enableInteractiveSelection: true,
            cursorColor: secondary,
            style: TextStyle(color: darkestBlue),
          ),
        ))
      ]);
    return Text(e.name,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: primary,
            fontWeight: FontWeight.w600));
  }

  Widget sliderInstructions() {
    if (checkedEmotions.isEmpty) return Text('');
    return Text(
      'On a scale of 0-10, how intense is each emotion?',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
      textAlign: TextAlign.center,
    );
  }

  String sliderText(Emotion e) {
    if (e.name == 'Other:    ' && otherController.text != '')
      return otherController.text;
    else if (e.name == 'Other:    ') return 'Other';
    return e.name;
  }

  Widget navigationArrows() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Column(children: [
        Spacer(),
        Row(children: [
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: tertiary),
        ])
      ]),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(100)),
      child: ElevatedButton(
        onPressed: () {
          if (checkedEmotions.isEmpty) {
            error = 'Please select an emotion';
            setState(() {});
            return;
          }

          //store emotion info to database here

          //probably also need some communication with the rest of the app that cbt
          //was completed for timeline

          Navigator.popUntil(context,ModalRoute.withName(Dashboard.routeName));
        },
        child: Text(
          'FINISH',
          style: TextStyle(fontSize: getProportionateScreenWidth(20.0)),
        ),
        style: TextButton.styleFrom(
            primary: pureWhite,
            backgroundColor: darkestBlue,
            shape: StadiumBorder(),
            minimumSize: Size(getProportionateScreenWidth(150),
                getProportionateScreenHeight(50))),
      ),
    );
  }
}
