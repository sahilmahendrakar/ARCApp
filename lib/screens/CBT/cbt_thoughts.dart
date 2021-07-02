import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
//import 'CBTDistortions.dart';
import 'package:arc_app/constants.dart';

class CBTEmotions extends StatelessWidget {
  CBTEmotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EmotionBody());
  }
}

class EmotionBody extends StatefulWidget {
  const EmotionBody({Key? key}) : super(key: key);

  @override
  _EmotionBodyState createState() => _EmotionBodyState();
}

class _EmotionBodyState extends State<EmotionBody> {
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

  _EmotionBodyState() {
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
                      'What unpleasant emotion(s) are you feeling?',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w600,
                          color: darkestBlue),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(0))),
                Column(children: buildEmotions()),
                Container(
                  child: sliderInstructions(),
                  padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(32),
                      0, getProportionateScreenHeight(16)),
                ),
                Column(children: buildSliders()),
                Container(height: getProportionateScreenHeight(64))
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
            //updateSliders();
          });
        },
      ));
    }
    return emotionCheckboxes;
  }

  List<Widget> buildSliders() {
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
                getProportionateScreenWidth(16),
                0,
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
              iconSize: 36,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: tertiary),
          Expanded(
              child: Text(error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.red))),
          IconButton(
              iconSize: 36,
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                //potentially change to handle potential errors on this page, or use text form field for that
                if (checkedEmotions.isEmpty) {
                  error = 'Please select an emotion';
                  setState(() {});
                  return;
                }

                //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => CBTDistortions()));
              },
              color: tertiary)
        ])
      ]),
    );
  }
}

class Emotion {
  String name;
  bool isChecked = false;
  double currentEmotionValue = 5;

  Emotion(this.name);
}

class EmotionSlider extends StatefulWidget {
  final Emotion e;
  EmotionSlider(this.e, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmotionSliderState(e);
}

class _EmotionSliderState extends State<EmotionSlider> {
  Emotion e;
  _EmotionSliderState(this.e);

  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (double value) {
        setState(() {
          e.currentEmotionValue = value;
        });
      },
      value: e.currentEmotionValue,
      min: 0,
      max: 10,
      divisions: 10,
      label: e.currentEmotionValue.round().toString(),
      activeColor: secondary,
      inactiveColor: Colors.grey[350],
    );
  }
}
