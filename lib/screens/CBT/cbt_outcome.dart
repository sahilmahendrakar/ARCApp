import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/CBT/cbt_thoughts.dart';
import 'package:arc_app/screens/CBT/cbt_emotions.dart';

import 'cbt_exit.dart';

class CBTOutcome extends StatelessWidget {
  final List<String> thoughts;
  final Map<String, double> emotionData;
  final List<String> distortions;
  final List<String> responses;
  CBTOutcome(this.thoughts, this.emotionData, this.distortions, this.responses,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OutcomeBody(thoughts, emotionData, distortions, responses));
  }
}

class OutcomeBody extends StatefulWidget {
  final List<String> thoughts;
  final Map<String, double> emotionData;
  final List<String> distortions;
  final List<String> responses;

  const OutcomeBody(
      this.thoughts, this.emotionData, this.distortions, this.responses,
      {Key? key})
      : super(key: key);

  @override
  _OutcomeBodyState createState() =>
      _OutcomeBodyState(thoughts, emotionData, distortions, responses);
}

class _OutcomeBodyState extends State<OutcomeBody> {
  final List<String> thoughts;
  final List<String> emotionNames = [
    'Fear',
    'Sadness',
    'Loneliness',
    'Anger',
    'Shame',
    'Jealousy',
    'Worthlessness',
    'Happy',
    'Calm',
    'Hopeful',
    'Grateful',
    'Other:    '
  ];

  String error = '';
  Set<Emotion> checkedEmotions = {};
  Set<Emotion> emotions = {};
  final TextEditingController otherController = TextEditingController();
  final ref = FirebaseDatabase.instance.reference();
  final Map<String, double> emotionData;
  final List<String> distortions;
  final List<String> responses;

  _OutcomeBodyState(
      this.thoughts, this.emotionData, this.distortions, this.responses) {
    for (String name in emotionNames) emotions.add(Emotion(name));
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
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(100)),
      child: ElevatedButton(
        onPressed: () {
          if (checkedEmotions.isEmpty) {
            error = 'Please select an emotion';
            setState(() {});
            return;
          }

          User user = FirebaseAuth.instance.currentUser!;
          Map<String, double> newEmotionData = new Map();
          for (Emotion e in checkedEmotions) {
            if (e.name == 'Other:    ' && otherController.text == '')
              newEmotionData['Other'] = e.currentEmotionValue;
            else if (e.name == 'Other:    ')
              newEmotionData[otherController.text] = e.currentEmotionValue;
            else
              newEmotionData[e.name] = e.currentEmotionValue;
          }
          String key = ref.push().key;
          try {
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('time')
                .set(DateTime.now().toString());
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('emotionsBefore')
                .set(emotionData);
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('emotionsAfter')
                .set(newEmotionData);
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('thoughts')
                .set(thoughts);
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('responses')
                .set(responses);
            ref
                .child(user.uid)
                .child("cbt-data:")
                .child(key)
                .child('distortions')
                .set(distortions);
          } catch (e) {}
          //probably also need some communication with the rest of the app that cbt
          //was completed for timeline
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CBTExit()));
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

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }
}
